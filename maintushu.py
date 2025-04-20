import tkinter as tk
from tkinter import ttk, messagebox, simpledialog
import cx_Oracle
import threading
from flask import Flask, jsonify, request
from datetime import datetime
import sys

# Flask app initialization
app = Flask(__name__)
flask_thread = None

# Database connection parameters - UPDATE THESE TO MATCH YOUR ORACLE SETUP
DB_USER = "system"  # Replace with your Oracle username (e.g., 'raceadmin')
DB_PASSWORD = "pass"  # Replace with your Oracle password (e.g., 'mypassword123')
DB_DSN = "localhost:1521/XE"  # Replace with your Oracle DSN (e.g., 'localhost:1521/XE' or 'localhost:1521/ORCLPDB')

# Helper functions for database operations
def get_db_connection():
    try:
        return cx_Oracle.connect(DB_USER, DB_PASSWORD, DB_DSN)
    except cx_Oracle.Error as error:
        print(f"Database connection error: {error}")
        raise

def execute_query(query, params=None, fetch=True):
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        if params:
            cursor.execute(query, params)
        else:
            cursor.execute(query)
        
        if fetch:
            return cursor.fetchall()
        else:
            conn.commit()
            return cursor.rowcount
    except cx_Oracle.Error as error:
        if conn:
            conn.rollback()
        print(f"Database error: {error}")
        raise
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

# Complex Queries for the application
def get_team_standings(year=None):
    """Get team standings with total points for a specific year or current year"""
    if not year:
        year = get_current_season()
    
    query = """
    SELECT t.Team_Name, t.Team_Score, t.Principal_First_Name || ' ' || t.Principal_Last_Name as Principal,
           COUNT(DISTINCT d.Driver_ID) AS Drivers_Count
    FROM Team t
    LEFT JOIN Driver d ON t.Team_Name = d.Team_Name AND t.Year = d.Year
    WHERE t.Year = :year
    GROUP BY t.Team_Name, t.Team_Score, t.Principal_First_Name, t.Principal_Last_Name
    ORDER BY t.Team_Score DESC
    """
    return execute_query(query, {'year': year})

def get_driver_standings(year=None):
    """Get driver standings with total points for a specific year or current year"""
    if not year:
        year = get_current_season()
    
    query = """
    SELECT d.Driver_ID, d.First_Name || ' ' || d.Last_Name AS Driver_Name, 
           d.Total_Ind_Score, d.Team_Name, d.Nationality
    FROM Driver d
    WHERE d.Year = :year
    ORDER BY d.Total_Ind_Score DESC
    """
    return execute_query(query, {'year': year})

def get_race_schedule(year=None):
    """Get race schedule for a specific year or current year"""
    if not year:
        year = get_current_season()
    
    query = """
    SELECT r.Race_Name, TO_CHAR(r.Race_Date, 'YYYY-MM-DD') as Race_Date, 
           r.Country, r.State, r.Circuit_Name,
           c.Circuit_Length
    FROM Race r
    JOIN Circuit c ON r.Circuit_Name = c.Circuit_Name
    WHERE r.Year = :year
    ORDER BY r.Race_Date
    """
    return execute_query(query, {'year': year})

def get_championship_history(limit=5):
    """Get championship history for the past seasons"""
    query = """
    SELECT s.Year, s.Team_Winner, s.Individual_Winner,
           (SELECT MAX(Team_Score) FROM Team WHERE Year = s.Year) AS Winning_Team_Score,
           (SELECT MAX(Total_Ind_Score) FROM Driver WHERE Year = s.Year) AS Winning_Driver_Score
    FROM Season s
    ORDER BY s.Year DESC
    """
    if limit:
        query += f" FETCH FIRST {limit} ROWS ONLY"
    
    return execute_query(query)

def get_driver_details(driver_id):
    """Get detailed information about a specific driver"""
    query = """
    SELECT d.Driver_ID, d.First_Name, d.Last_Name, d.Nationality, 
           d.Total_Ind_Score, d.Team_Name, d.Year,
           (SELECT COUNT(*) FROM Result r WHERE r.Driver_ID = d.Driver_ID AND r.Position = 1) AS Wins,
           (SELECT COUNT(*) FROM Result r WHERE r.Driver_ID = d.Driver_ID AND r.Position <= 3) AS Podiums
    FROM Driver d
    WHERE d.Driver_ID = :driver_id
    """
    return execute_query(query, {'driver_id': driver_id})

def get_team_details(team_name, year=None):
    """Get detailed information about a specific team"""
    if not year:
        year = get_current_season()
    
    query = """
    SELECT t.Team_Name, t.Principal_First_Name, t.Principal_Last_Name, 
           t.Team_Score, t.Year,
           (SELECT COUNT(*) FROM Driver d WHERE d.Team_Name = t.Team_Name AND d.Year = t.Year) AS Driver_Count,
           (SELECT COUNT(*) FROM Result r WHERE r.Team_Name = t.Team_Name AND r.Year = t.Year AND r.Position = 1) AS Team_Wins
    FROM Team t
    WHERE t.Team_Name = :team_name AND t.Year = :year
    """
    return execute_query(query, {'team_name': team_name, 'year': year})

def get_circuit_races(circuit_name):
    """Get all races held at a specific circuit"""
    query = """
    SELECT r.Race_Name, TO_CHAR(r.Race_Date, 'YYYY-MM-DD') as Race_Date, r.Year,
           (SELECT s.Team_Winner FROM Season s WHERE s.Year = r.Year) AS Season_Winner
    FROM Race r
    WHERE r.Circuit_Name = :circuit_name
    ORDER BY r.Year DESC, r.Race_Date DESC
    """
    return execute_query(query, {'circuit_name': circuit_name})

def get_driver_results(driver_id, year=None):
    """Get all results for a specific driver in a year"""
    if not year:
        year = get_current_season()
    
    query = """
    SELECT res.Result_ID, res.Position, res.Points,
           r.Race_Name, TO_CHAR(r.Race_Date, 'YYYY-MM-DD') as Race_Date
    FROM Result res
    JOIN Race r ON res.Result_ID LIKE '%' || r.Race_Name || '%' AND r.Year = res.Year
    WHERE res.Driver_ID = :driver_id AND res.Year = :year
    ORDER BY r.Race_Date
    """
    return execute_query(query, {'driver_id': driver_id, 'year': year})

def get_top_performing_drivers_by_nationality(nationality=None, limit=10):
    """Get top performing drivers by nationality across all seasons"""
    query = """
    SELECT d.First_Name || ' ' || d.Last_Name AS Driver_Name, 
           d.Nationality, SUM(d.Total_Ind_Score) AS Total_Career_Points,
           COUNT(DISTINCT d.Year) AS Seasons_Competed
    FROM Driver d
    """
    
    if nationality:
        query += " WHERE d.Nationality = :nationality"
        params = {'nationality': nationality}
    else:
        params = None
    
    query += """
    GROUP BY d.First_Name, d.Last_Name, d.Nationality
    ORDER BY Total_Career_Points DESC
    """
    
    if limit:
        query += f" FETCH FIRST {limit} ROWS ONLY"
    
    return execute_query(query, params)

def get_race_sessions_for_race(race_name):
    """Get all sessions for a specific race"""
    query = """
    SELECT rs.Race_SessionID, rs.Duration, rs.Changed_Duration
    FROM RaceSession rs
    WHERE rs.Race_Name = :race_name
    """
    return execute_query(query, {'race_name': race_name})

def get_current_season():
    """Get the current/most recent season year"""
    query = "SELECT MAX(Year) FROM Season"
    result = execute_query(query)
    return result[0][0] if result else datetime.now().year

# PL/SQL Function: Get Driver Position
def get_driver_position_function(driver_id, race_name):
    """Call a PL/SQL function to get a driver's position in a specific race"""
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Check if the function exists
        check_function = """
        SELECT COUNT(*) FROM USER_OBJECTS 
        WHERE OBJECT_TYPE = 'FUNCTION' AND OBJECT_NAME = 'GET_DRIVER_POSITION'
        """
        cursor.execute(check_function)
        exists = cursor.fetchone()[0]
        
        # Create the function if it doesn't exist
        if not exists:
            create_function = """
            CREATE OR REPLACE FUNCTION get_driver_position(
                p_driver_id IN NUMBER,
                p_race_name IN VARCHAR2
            ) RETURN NUMBER IS
                v_position NUMBER;
            BEGIN
                SELECT r.Position INTO v_position
                FROM Result r
                WHERE r.Driver_ID = p_driver_id
                AND r.Result_ID LIKE '%' || p_race_name || '%';
                
                RETURN v_position;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RETURN NULL;
                WHEN OTHERS THEN
                    RETURN -1;
            END;
            """
            cursor.execute(create_function)
            conn.commit()
        
        # Call the function
        cursor.execute("SELECT get_driver_position(:driver_id, :race_name) FROM DUAL", 
                      {'driver_id': driver_id, 'race_name': race_name})
        result = cursor.fetchone()
        return result[0] if result else None
        
    except cx_Oracle.Error as error:
        print(f"PL/SQL Function Error: {error}")
        return None
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

# PL/SQL Procedure: Update Team Score
def update_team_score_procedure(team_name, year, additional_points):
    """Call a PL/SQL procedure to update a team's score"""
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Check if the procedure exists
        check_procedure = """
        SELECT COUNT(*) FROM USER_OBJECTS 
        WHERE OBJECT_TYPE = 'PROCEDURE' AND OBJECT_NAME = 'UPDATE_TEAM_SCORE'
        """
        cursor.execute(check_procedure)
        exists = cursor.fetchone()[0]
        
        # Create the procedure if it doesn't exist
        if not exists:
            create_procedure = """
            CREATE OR REPLACE PROCEDURE update_team_score(
                p_team_name IN VARCHAR2,
                p_year IN NUMBER,
                p_additional_points IN NUMBER
            ) IS
            BEGIN
                UPDATE Team
                SET Team_Score = Team_Score + p_additional_points
                WHERE Team_Name = p_team_name AND Year = p_year;
                
                COMMIT;
            EXCEPTION
                WHEN OTHERS THEN
                    ROLLBACK;
                    RAISE;
            END;
            """
            cursor.execute(create_procedure)
            conn.commit()
        
        # Call the procedure
        cursor.callproc("update_team_score", [team_name, year, additional_points])
        conn.commit()
        return True
        
    except cx_Oracle.Error as error:
        print(f"PL/SQL Procedure Error: {error}")
        return False
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

# PL/SQL Function: Get Race Session Count
def get_race_session_count_function(race_name):
    """Call a PL/SQL function to count sessions for a specific race"""
    conn = None
    cursor = None
    try:
        conn = get_db_connection()
        cursor = conn.cursor()
        
        # Check if the function exists
        check_function = """
        SELECT COUNT(*) FROM USER_OBJECTS 
        WHERE OBJECT_TYPE = 'FUNCTION' AND OBJECT_NAME = 'GET_RACE_SESSION_COUNT'
        """
        cursor.execute(check_function)
        exists = cursor.fetchone()[0]
        
        # Create the function if it doesn't exist
        if not exists:
            create_function = """
            CREATE OR REPLACE FUNCTION get_race_session_count(
                p_race_name IN VARCHAR2
            ) RETURN NUMBER IS
                v_count NUMBER;
            BEGIN
                SELECT COUNT(*) INTO v_count
                FROM RaceSession
                WHERE Race_Name = p_race_name;
                RETURN v_count;
            EXCEPTION
                WHEN NO_DATA_FOUND THEN
                    RETURN 0;
            END;
            """
            cursor.execute(create_function)
            conn.commit()
        
        # Call the function
        cursor.execute("SELECT get_race_session_count(:race_name) FROM DUAL", 
                      {'race_name': race_name})
        result = cursor.fetchone()
        return result[0] if result else 0
        
    except cx_Oracle.Error as error:
        print(f"PL/SQL Function Error: {error}")
        return None
    finally:
        if cursor:
            cursor.close()
        if conn:
            conn.close()

# GUI Class for the application
class RaceManagementApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Race Data Management System")
        self.root.geometry("1200x700")
        
        # Set up styles
        self.style = ttk.Style()
        self.style.configure('TFrame', background='#f0f0f0')
        self.style.configure('TLabel', background='#f0f0f0', font=('Arial', 10))
        self.style.configure('TButton', font=('Arial', 10))
        self.style.configure('Header.TLabel', font=('Arial', 16, 'bold'))
        
        # Create main container
        self.main_frame = ttk.Frame(self.root)
        self.main_frame.pack(fill=tk.BOTH, expand=True)
        
        # Create login frame first
        self.create_login_frame()
        
        # Initialize application state variables
        self.current_user = None
        self.is_admin = False
        
        # Start Flask API server in a separate thread
        self.start_flask_server()

    def start_flask_server(self):
        """Start Flask API server in a separate thread"""
        global flask_thread
        
        @app.route('/api/teams', methods=['GET'])
        def get_teams_api():
            year = request.args.get('year', default=get_current_season(), type=int)
            try:
                teams = get_team_standings(year)
                result = [
                    {
                        "team_name": team[0],
                        "team_score": team[1],
                        "principal": team[2],
                        "drivers_count": team[3]
                    }
                    for team in teams
                ]
                return jsonify({"success": True, "teams": result})
            except Exception as e:
                return jsonify({"success": False, "error": str(e)}), 500
        
        @app.route('/api/drivers', methods=['GET'])
        def get_drivers_api():
            year = request.args.get('year', default=get_current_season(), type=int)
            try:
                drivers = get_driver_standings(year)
                result = [
                    {
                        "driver_id": driver[0],
                        "driver_name": driver[1],
                        "total_score": driver[2],
                        "team_name": driver[3],
                        "nationality": driver[4]
                    }
                    for driver in drivers
                ]
                return jsonify({"success": True, "drivers": result})
            except Exception as e:
                return jsonify({"success": False, "error": str(e)}), 500
        
        @app.route('/api/races', methods=['GET'])
        def get_races_api():
            year = request.args.get('year', default=get_current_season(), type=int)
            try:
                races = get_race_schedule(year)
                result = [
                    {
                        "race_name": race[0],
                        "race_date": race[1],
                        "country": race[2],
                        "state": race[3],
                        "circuit_name": race[4],
                        "circuit_length": float(race[5])
                    }
                    for race in races
                ]
                return jsonify({"success": True, "races": result})
            except Exception as e:
                return jsonify({"success": False, "error": str(e)}), 500
        
        def run_flask():
            app.run(host='127.0.0.1', port=5000, debug=False)
        
        flask_thread = threading.Thread(target=run_flask)
        flask_thread.daemon = True
        flask_thread.start()

    def create_login_frame(self):
        """Create the login interface"""
        for widget in self.main_frame.winfo_children():
            widget.destroy()
        
        login_frame = ttk.Frame(self.main_frame, padding="30")
        login_frame.place(relx=0.5, rely=0.5, anchor="center")
        
        header_label = ttk.Label(login_frame, text="Race Data Management System", style='Header.TLabel')
        header_label.grid(row=0, column=0, columnspan=2, pady=(0, 20))
        
        guest_btn = ttk.Button(login_frame, text="Login as Guest", width=20,
                              command=lambda: self.login_user("Guest", False))
        guest_btn.grid(row=1, column=0, padx=10, pady=10)
        
        admin_btn = ttk.Button(login_frame, text="Login as Admin", width=20,
                              command=self.admin_login_dialog)
        admin_btn.grid(row=1, column=1, padx=10, pady=10)
        
        exit_btn = ttk.Button(login_frame, text="Exit", width=20,
                             command=self.exit_application)
        exit_btn.grid(row=2, column=0, columnspan=2, pady=(20, 0))

    def admin_login_dialog(self):
        """Show admin login dialog with password"""
        password = simpledialog.askstring("Admin Login", "Enter admin password:",
                                         show='*')
        if password == "admin123":  # Simple password for demo
            self.login_user("Admin", True)
        else:
            messagebox.showerror("Login Failed", "Incorrect admin password")

    def login_user(self, username, is_admin):
        """Process user login"""
        self.current_user = username
        self.is_admin = is_admin
        messagebox.showinfo("Login Successful", f"Welcome, {username}!")
        self.create_main_interface()

    def exit_application(self):
        """Exit the application"""
        if messagebox.askyesno("Exit", "Are you sure you want to exit?"):
            self.root.quit()

    def create_main_interface(self):
        """Create the main application interface after login"""
        for widget in self.main_frame.winfo_children():
            widget.destroy()
        
        top_frame = ttk.Frame(self.main_frame)
        top_frame.pack(fill=tk.X, padx=10, pady=5)
        
        header_text = f"Race Data Management System - Logged in as {self.current_user}"
        header_label = ttk.Label(top_frame, text=header_text, style='Header.TLabel')
        header_label.pack(side=tk.LEFT, padx=10)
        
        logout_btn = ttk.Button(top_frame, text="Logout", command=self.create_login_frame)
        logout_btn.pack(side=tk.RIGHT, padx=10)
        
        nav_frame = ttk.Frame(self.main_frame)
        nav_frame.pack(fill=tk.X, padx=10, pady=5)
        
        team_btn = ttk.Button(nav_frame, text="Team Standings", 
                             command=lambda: self.show_team_standings())
        team_btn.pack(side=tk.LEFT, padx=5)
        
        driver_btn = ttk.Button(nav_frame, text="Driver Standings", 
                               command=lambda: self.show_driver_standings())
        driver_btn.pack(side=tk.LEFT, padx=5)
        
        race_btn = ttk.Button(nav_frame, text="Race Schedule", 
                             command=lambda: self.show_race_schedule())
        race_btn.pack(side=tk.LEFT, padx=5)
        
        history_btn = ttk.Button(nav_frame, text="Championship History", 
                                command=lambda: self.show_championship_history())
        history_btn.pack(side=tk.LEFT, padx=5)
        
        if self.is_admin:
            admin_btn = ttk.Button(nav_frame, text="Run Complex Queries", 
                                  command=lambda: self.show_complex_queries())
            admin_btn.pack(side=tk.LEFT, padx=5)
        
        self.content_frame = ttk.Frame(self.main_frame)
        self.content_frame.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)
        
        self.show_team_standings()

    def clear_content_frame(self):
        """Clear the content frame before displaying new content"""
        for widget in self.content_frame.winfo_children():
            widget.destroy()

    def show_team_standings(self, year=None):
        """Display team standings in the content frame"""
        self.clear_content_frame()
        
        if not year:
            year = get_current_season()
        
        header_frame = ttk.Frame(self.content_frame)
        header_frame.pack(fill=tk.X, pady=(0, 10))
        
        header_label = ttk.Label(header_frame, text=f"Team Standings - {year}", style='Header.TLabel')
        header_label.pack(side=tk.LEFT)
        
        year_frame = ttk.Frame(header_frame)
        year_frame.pack(side=tk.RIGHT)
        
        ttk.Label(year_frame, text="Select Year:").pack(side=tk.LEFT, padx=(0, 5))
        
        years = execute_query("SELECT DISTINCT Year FROM Season ORDER BY Year DESC")
        year_var = tk.StringVar(value=str(year))
        year_combo = ttk.Combobox(year_frame, textvariable=year_var, 
                                 values=[str(y[0]) for y in years], width=6)
        year_combo.pack(side=tk.LEFT)
        
        year_btn = ttk.Button(year_frame, text="Go", 
                             command=lambda: self.show_team_standings(int(year_var.get())))
        year_btn.pack(side=tk.LEFT, padx=(5, 0))
        
        columns = ("Position", "Team", "Principal", "Points", "Drivers")
        tree = ttk.Treeview(self.content_frame, columns=columns, show="headings")
        
        for col in columns:
            tree.heading(col, text=col)
        
        tree.column("Position", width=80, anchor=tk.CENTER)
        tree.column("Team", width=200)
        tree.column("Principal", width=200)
        tree.column("Points", width=80, anchor=tk.CENTER)
        tree.column("Drivers", width=80, anchor=tk.CENTER)
        
        scrollbar = ttk.Scrollbar(self.content_frame, orient=tk.VERTICAL, command=tree.yview)
        tree.configure(yscroll=scrollbar.set)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        tree.pack(fill=tk.BOTH, expand=True)
        
        teams = get_team_standings(year)
        for position, team in enumerate(teams, 1):
            tree.insert("", "end", values=(position, team[0], team[2], team[1], team[3]))
        
        if self.is_admin:
            admin_frame = ttk.Frame(self.content_frame)
            admin_frame.pack(fill=tk.X, pady=(10, 0))
            
            add_btn = ttk.Button(admin_frame, text="Add Team", 
                               command=lambda: self.team_edit_dialog())
            add_btn.pack(side=tk.LEFT, padx=5)
            
            edit_btn = ttk.Button(admin_frame, text="Edit Team", 
                                command=lambda: self.team_edit_dialog(tree.item(tree.selection())["values"][1] if tree.selection() else None))
            edit_btn.pack(side=tk.LEFT, padx=5)
            
            delete_btn = ttk.Button(admin_frame, text="Delete Team", 
                                  command=lambda: self.delete_team(tree.item(tree.selection())["values"][1] if tree.selection() else None))
            delete_btn.pack(side=tk.LEFT, padx=5)

    def show_driver_standings(self, year=None):
        """Display driver standings in the content frame"""
        self.clear_content_frame()
        
        if not year:
            year = get_current_season()
        
        header_frame = ttk.Frame(self.content_frame)
        header_frame.pack(fill=tk.X, pady=(0, 10))
        
        header_label = ttk.Label(header_frame, text=f"Driver Standings - {year}", style='Header.TLabel')
        header_label.pack(side=tk.LEFT)
        
        year_frame = ttk.Frame(header_frame)
        year_frame.pack(side=tk.RIGHT)
        
        ttk.Label(year_frame, text="Select Year:").pack(side=tk.LEFT, padx=(0, 5))
        
        years = execute_query("SELECT DISTINCT Year FROM Season ORDER BY Year DESC")
        year_var = tk.StringVar(value=str(year))
        year_combo = ttk.Combobox(year_frame, textvariable=year_var, 
                                 values=[str(y[0]) for y in years], width=6)
        year_combo.pack(side=tk.LEFT)
        
        year_btn = ttk.Button(year_frame, text="Go", 
                             command=lambda: self.show_driver_standings(int(year_var.get())))
        year_btn.pack(side=tk.LEFT, padx=(5, 0))
        
        columns = ("Position", "Driver", "Team", "Nationality", "Points")
        tree = ttk.Treeview(self.content_frame, columns=columns, show="headings")
        
        for col in columns:
            tree.heading(col, text=col)
        
        tree.column("Position", width=80, anchor=tk.CENTER)
        tree.column("Driver", width=200)
        tree.column("Team", width=200)
        tree.column("Nationality", width=150)
        tree.column("Points", width=80, anchor=tk.CENTER)
        
        scrollbar = ttk.Scrollbar(self.content_frame, orient=tk.VERTICAL, command=tree.yview)
        tree.configure(yscroll=scrollbar.set)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        tree.pack(fill=tk.BOTH, expand=True)
        
        drivers = get_driver_standings(year)
        for position, driver in enumerate(drivers, 1):
            tree.insert("", "end", values=(position, driver[1], driver[3], driver[4], driver[2]))
        
        if self.is_admin:
            admin_frame = ttk.Frame(self.content_frame)
            admin_frame.pack(fill=tk.X, pady=(10, 0))
            
            add_btn = ttk.Button(admin_frame, text="Add Driver", 
                               command=lambda: self.driver_edit_dialog())
            add_btn.pack(side=tk.LEFT, padx=5)
            
            edit_btn = ttk.Button(admin_frame, text="Edit Driver", 
                                command=lambda: self.driver_edit_dialog(
                                    [d for d in drivers if d[1] == tree.item(tree.selection())["values"][1]][0][0] 
                                    if tree.selection() else None))
            edit_btn.pack(side=tk.LEFT, padx=5)
            
            delete_btn = ttk.Button(admin_frame, text="Delete Driver", 
                                  command=lambda: self.delete_driver(
                                      [d for d in drivers if d[1] == tree.item(tree.selection())["values"][1]][0][0] 
                                      if tree.selection() else None))
            delete_btn.pack(side=tk.LEFT, padx=5)

    def show_race_schedule(self, year=None):
        """Display race schedule in the content frame"""
        self.clear_content_frame()
        
        if not year:
            year = get_current_season()
        
        header_frame = ttk.Frame(self.content_frame)
        header_frame.pack(fill=tk.X, pady=(0, 10))
        
        header_label = ttk.Label(header_frame, text=f"Race Schedule - {year}", style='Header.TLabel')
        header_label.pack(side=tk.LEFT)
        
        year_frame = ttk.Frame(header_frame)
        year_frame.pack(side=tk.RIGHT)
        
        ttk.Label(year_frame, text="Select Year:").pack(side=tk.LEFT, padx=(0, 5))
        
        years = execute_query("SELECT DISTINCT Year FROM Season ORDER BY Year DESC")
        year_var = tk.StringVar(value=str(year))
        year_combo = ttk.Combobox(year_frame, textvariable=year_var, 
                                 values=[str(y[0]) for y in years], width=6)
        year_combo.pack(side=tk.LEFT)
        
        year_btn = ttk.Button(year_frame, text="Go", 
                             command=lambda: self.show_race_schedule(int(year_var.get())))
        year_btn.pack(side=tk.LEFT, padx=(5, 0))
        
        columns = ("Race", "Date", "Circuit", "Location", "Circuit Length")
        tree = ttk.Treeview(self.content_frame, columns=columns, show="headings")
        
        for col in columns:
            tree.heading(col, text=col)
        
        tree.column("Race", width=200)
        tree.column("Date", width=100)
        tree.column("Circuit", width=200)
        tree.column("Location", width=200)
        tree.column("Circuit Length", width=100, anchor=tk.CENTER)
        
        scrollbar = ttk.Scrollbar(self.content_frame, orient=tk.VERTICAL, command=tree.yview)
        tree.configure(yscroll=scrollbar.set)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        tree.pack(fill=tk.BOTH, expand=True)
        
        races = get_race_schedule(year)
        for race in races:
            location = f"{race[2]}, {race[3]}" if race[3] else race[2]
            tree.insert("", "end", values=(race[0], race[1], race[4], location, f"{race[5]} km"))
        
        if self.is_admin:
            admin_frame = ttk.Frame(self.content_frame)
            admin_frame.pack(fill=tk.X, pady=(10, 0))
            
            add_btn = ttk.Button(admin_frame, text="Add Race", 
                              command=lambda: self.race_edit_dialog())
            add_btn.pack(side=tk.LEFT, padx=5)
            
            edit_btn = ttk.Button(admin_frame, text="Edit Race", 
                                command=lambda: self.race_edit_dialog(
                                    tree.item(tree.selection())["values"][0] if tree.selection() else None))
            edit_btn.pack(side=tk.LEFT, padx=5)
            
            delete_btn = ttk.Button(admin_frame, text="Delete Race", 
                                  command=lambda: self.delete_race(
                                      tree.item(tree.selection())["values"][0] if tree.selection() else None))
            delete_btn.pack(side=tk.LEFT, padx=5)
            
            session_btn = ttk.Button(admin_frame, text="View Race Sessions", 
                                   command=lambda: self.show_race_sessions(
                                       tree.item(tree.selection())["values"][0] if tree.selection() else None))
            session_btn.pack(side=tk.LEFT, padx=5)

    def show_championship_history(self):
        """Display championship history in the content frame"""
        self.clear_content_frame()
        
        header_label = ttk.Label(self.content_frame, text="Championship History", style='Header.TLabel')
        header_label.pack(anchor=tk.W, pady=(0, 10))
        
        columns = ("Year", "Team Champion", "Driver Champion", "Team Points", "Driver Points")
        tree = ttk.Treeview(self.content_frame, columns=columns, show="headings")
        
        for col in columns:
            tree.heading(col, text=col)
        
        tree.column("Year", width=80, anchor=tk.CENTER)
        tree.column("Team Champion", width=200)
        tree.column("Driver Champion", width=200)
        tree.column("Team Points", width=100, anchor=tk.CENTER)
        tree.column("Driver Points", width=100, anchor=tk.CENTER)
        
        scrollbar = ttk.Scrollbar(self.content_frame, orient=tk.VERTICAL, command=tree.yview)
        tree.configure(yscroll=scrollbar.set)
        scrollbar.pack(side=tk.RIGHT, fill=tk.Y)
        tree.pack(fill=tk.BOTH, expand=True)
        
        championships = get_championship_history()
        for championship in championships:
            tree.insert("", "end", values=(championship[0], championship[1], championship[2], 
                                          championship[3], championship[4]))
        
        if self.is_admin:
            admin_frame = ttk.Frame(self.content_frame)
            admin_frame.pack(fill=tk.X, pady=(10, 0))
            
            add_btn = ttk.Button(admin_frame, text="Add Season", 
                               command=lambda: self.season_edit_dialog())
            add_btn.pack(side=tk.LEFT, padx=5)
            
            edit_btn = ttk.Button(admin_frame, text="Edit Season", 
                                command=lambda: self.season_edit_dialog(
                                    tree.item(tree.selection())["values"][0] if tree.selection() else None))
            edit_btn.pack(side=tk.LEFT, padx=5)
            
            delete_btn = ttk.Button(admin_frame, text="Delete Season", 
                                  command=lambda: self.delete_season(
                                      tree.item(tree.selection())["values"][0] if tree.selection() else None))
            delete_btn.pack(side=tk.LEFT, padx=5)

    def show_race_sessions(self, race_name):
        """Display race sessions for a selected race"""
        if not race_name:
            messagebox.showerror("Error", "No race selected")
            return
        count = get_race_session_count_function(race_name)
        sessions = get_race_sessions_for_race(race_name)
        dialog = tk.Toplevel(self.root)
        dialog.title(f"Sessions for {race_name}")
        dialog.geometry("400x300")
        dialog.transient(self.root)
        dialog.grab_set()
        ttk.Label(dialog, text=f"Total Sessions: {count}", font=('Arial', 12)).pack(pady=10)
        tree = ttk.Treeview(dialog, columns=("Session ID", "Duration", "Changed Duration"), show="headings")
        tree.heading("Session ID", text="Session ID")
        tree.heading("Duration", text="Duration")
        tree.heading("Changed Duration", text="Changed Duration")
        tree.pack(fill=tk.BOTH, expand=True)
        for session in sessions:
            tree.insert("", "end", values=(session[0], session[1], session[2]))
        ttk.Button(dialog, text="Close", command=dialog.destroy).pack(pady=10)

    def show_complex_queries(self):
        """Display interface for running complex queries"""
        self.clear_content_frame()
        
        header_label = ttk.Label(self.content_frame, text="Complex Queries", style='Header.TLabel')
        header_label.pack(anchor=tk.W, pady=(0, 10))
        
        queries = [
            ("Top Teams by Points", self.run_query_top_teams),
            ("Top Drivers by Points", self.run_query_top_drivers),
            ("Races with Most Points", self.run_query_race_points),
            ("Multiple Championships", self.run_query_multiple_champions),
            ("Popular Circuits", self.run_query_popular_circuits),
            ("Average Team Scores", self.run_query_avg_team_scores),
            ("Driver Improvements", self.run_query_driver_improvements),
            ("Longest Race Sessions", self.run_query_longest_sessions),
            ("Nationality Driver Count", self.run_query_nationality_count),
            ("Team Driver Changes", self.run_query_team_changes),
            ("PL/SQL: Driver Position", self.run_query_driver_position),
            ("PL/SQL: Update Team Score", self.run_query_update_team_score),
            ("PL/SQL: Race Session Count", self.run_query_race_session_count)
        ]
        
        for name, command in queries:
            ttk.Button(self.content_frame, text=name, command=command).pack(fill=tk.X, padx=50, pady=5)
        
        ttk.Button(self.content_frame, text="Back", command=self.create_main_interface).pack(pady=10)

    def run_query_top_teams(self):
        """Query: Top teams by points across all seasons"""
        query = """
        SELECT t.Team_Name, SUM(t.Team_Score) as total_points
        FROM Team t
        GROUP BY t.Team_Name
        ORDER BY total_points DESC
        FETCH FIRST 5 ROWS ONLY
        """
        self.display_query_results(execute_query(query), ["Team Name", "Total Points"])

    def run_query_top_drivers(self):
        """Query: Top drivers by points across all seasons"""
        query = """
        SELECT d.First_Name || ' ' || d.Last_Name as Driver_Name, SUM(d.Total_Ind_Score) as total_points
        FROM Driver d
        GROUP BY d.First_Name, d.Last_Name
        ORDER BY total_points DESC
        FETCH FIRST 5 ROWS ONLY
        """
        self.display_query_results(execute_query(query), ["Driver Name", "Total Points"])

    def run_query_race_points(self):
        """Query: Races with highest average points"""
        query = """
        SELECT r.Race_Name, AVG(res.Points) as avg_points
        FROM Race r
        JOIN Result res ON res.Year = r.Year
        GROUP BY r.Race_Name
        ORDER BY avg_points DESC
        FETCH FIRST 5 ROWS ONLY
        """
        self.display_query_results(execute_query(query), ["Race Name", "Average Points"])

    def run_query_multiple_champions(self):
        """Query: Drivers with multiple championships"""
        query = """
        SELECT s.Individual_Winner, COUNT(*) as championships
        FROM Season s
        GROUP BY s.Individual_Winner
        HAVING COUNT(*) > 1
        ORDER BY championships DESC
        """
        self.display_query_results(execute_query(query), ["Driver Name", "Championships"])

    def run_query_popular_circuits(self):
        """Query: Circuits hosting most races"""
        query = """
        SELECT c.Circuit_Name, COUNT(r.Race_Name) as race_count
        FROM Circuit c
        JOIN Race r ON r.Circuit_Name = c.Circuit_Name
        GROUP BY c.Circuit_Name
        ORDER BY race_count DESC
        FETCH FIRST 5 ROWS ONLY
        """
        self.display_query_results(execute_query(query), ["Circuit Name", "Race Count"])

    def run_query_avg_team_scores(self):
        """Query: Average team score by year"""
        query = """
        SELECT t.Year, AVG(t.Team_Score) as avg_score
        FROM Team t
        GROUP BY t.Year
        ORDER BY t.Year DESC
        """
        self.display_query_results(execute_query(query), ["Year", "Average Score"])

    def run_query_driver_improvements(self):
        """Query: Drivers with best year-over-year improvement"""
        query = """
        SELECT d.First_Name || ' ' || d.Last_Name as Driver_Name, 
               (d.Total_Ind_Score - LAG(d.Total_Ind_Score) OVER (PARTITION BY d.First_Name, d.Last_Name ORDER BY d.Year)) as score_diff
        FROM Driver d
        WHERE d.Year IN (SELECT Year FROM Season)
        ORDER BY score_diff DESC NULLS LAST
        FETCH FIRST 5 ROWS ONLY
        """
        self.display_query_results(execute_query(query), ["Driver Name", "Score Improvement"])

    def run_query_longest_sessions(self):
        """Query: Races with longest sessions"""
        query = """
        SELECT r.Race_Name, MAX(rs.Duration) as max_duration
        FROM Race r
        JOIN RaceSession rs ON rs.Race_Name = r.Race_Name
        GROUP BY r.Race_Name
        ORDER BY max_duration DESC
        FETCH FIRST 5 ROWS ONLY
        """
        self.display_query_results(execute_query(query), ["Race Name", "Max Duration"])

    def run_query_nationality_count(self):
        """Query: Nationalities with most drivers"""
        query = """
        SELECT d.Nationality, COUNT(*) as driver_count
        FROM Driver d
        GROUP BY d.Nationality
        ORDER BY driver_count DESC
        FETCH FIRST 5 ROWS ONLY
        """
        self.display_query_results(execute_query(query), ["Nationality", "Driver Count"])

    def run_query_team_changes(self):
        """Query: Teams with most driver changes"""
        query = """
        SELECT t.Team_Name, COUNT(DISTINCT d.Driver_ID) as driver_count
        FROM Team t
        JOIN Driver d ON d.Team_Name = t.Team_Name AND d.Year = t.Year
        GROUP BY t.Team_Name
        ORDER BY driver_count DESC
        FETCH FIRST 5 ROWS ONLY
        """
        self.display_query_results(execute_query(query), ["Team Name", "Driver Count"])

    def run_query_driver_position(self):
        """PL/SQL: Get driver position in a race"""
        driver_id = simpledialog.askinteger("Input", "Enter Driver ID:", minvalue=1)
        race_name = simpledialog.askstring("Input", "Enter Race Name:")
        if driver_id and race_name:
            position = get_driver_position_function(driver_id, race_name)
            result = [(f"Driver ID {driver_id} in {race_name}", position if position is not None else "Not found")]
            self.display_query_results(result, ["Query", "Position"])

    def run_query_update_team_score(self):
        """PL/SQL: Update team score"""
        team_name = simpledialog.askstring("Input", "Enter Team Name:")
        year = simpledialog.askinteger("Input", "Enter Year:", minvalue=2000)
        points = simpledialog.askinteger("Input", "Enter Additional Points:", minvalue=0)
        if team_name and year and points is not None:
            success = update_team_score_procedure(team_name, year, points)
            result = [(f"Update {team_name} ({year})", "Success" if success else "Failed")]
            self.display_query_results(result, ["Query", "Status"])

    def run_query_race_session_count(self):
        """PL/SQL: Count race sessions"""
        race_name = simpledialog.askstring("Input", "Enter Race Name:")
        if race_name:
            count = get_race_session_count_function(race_name)
            result = [(f"Sessions for {race_name}", count if count is not None else "Error")]
            self.display_query_results(result, ["Query", "Count"])

    def display_query_results(self, results, headers):
        """Display query results in a Treeview"""
        self.clear_content_frame()
        
        tree = ttk.Treeview(self.content_frame, columns=headers, show="headings")
        for header in headers:
            tree.heading(header, text=header)
        tree.pack(fill=tk.BOTH, expand=True)
        
        for result in results:
            tree.insert("", "end", values=result)
        
        ttk.Button(self.content_frame, text="Back", command=self.show_complex_queries).pack(pady=10)

    def team_edit_dialog(self, team_name=None):
        """Dialog for adding or editing a team"""
        is_edit = team_name is not None
        
        dialog = tk.Toplevel(self.root)
        dialog.title(f"{'Edit' if is_edit else 'Add'} Team")
        dialog.geometry("400x300")
        dialog.transient(self.root)
        dialog.grab_set()
        
        years = execute_query("SELECT DISTINCT Year FROM Season ORDER BY Year DESC")
        year_values = [str(y[0]) for y in years]
        
        form_frame = ttk.Frame(dialog, padding="20")
        form_frame.pack(fill=tk.BOTH, expand=True)
        
        ttk.Label(form_frame, text="Team Name:").grid(row=0, column=0, sticky=tk.W, pady=5)
        name_var = tk.StringVar()
        name_entry = ttk.Entry(form_frame, textvariable=name_var, width=30)
        name_entry.grid(row=0, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Principal First Name:").grid(row=1, column=0, sticky=tk.W, pady=5)
        first_name_var = tk.StringVar()
        first_name_entry = ttk.Entry(form_frame, textvariable=first_name_var, width=30)
        first_name_entry.grid(row=1, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Principal Last Name:").grid(row=2, column=0, sticky=tk.W, pady=5)
        last_name_var = tk.StringVar()
        last_name_entry = ttk.Entry(form_frame, textvariable=last_name_var, width=30)
        last_name_entry.grid(row=2, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Team Score:").grid(row=3, column=0, sticky=tk.W, pady=5)
        score_var = tk.StringVar()
        score_entry = ttk.Entry(form_frame, textvariable=score_var, width=30)
        score_entry.grid(row=3, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Year:").grid(row=4, column=0, sticky=tk.W, pady=5)
        year_var = tk.StringVar(value=str(get_current_season()))
        year_combo = ttk.Combobox(form_frame, textvariable=year_var, values=year_values, width=28)
        year_combo.grid(row=4, column=1, sticky=tk.W, pady=5)
        
        if is_edit:
            team_data = get_team_details(team_name)
            if team_data:
                name_var.set(team_data[0][0])
                first_name_var.set(team_data[0][1])
                last_name_var.set(team_data[0][2])
                score_var.set(str(team_data[0][3]))
                year_var.set(str(team_data[0][4]))
                name_entry.configure(state="disabled")
                year_combo.configure(state="disabled")
        
        btn_frame = ttk.Frame(form_frame)
        btn_frame.grid(row=5, column=0, columnspan=2, pady=(20, 0))
        
        save_btn = ttk.Button(btn_frame, text="Save", width=15,
                             command=lambda: self.save_team(
                                 name_var.get(), first_name_var.get(), last_name_var.get(),
                                 score_var.get(), year_var.get(), dialog, is_edit))
        save_btn.pack(side=tk.LEFT, padx=5)
        
        cancel_btn = ttk.Button(btn_frame, text="Cancel", width=15,
                               command=dialog.destroy)
        cancel_btn.pack(side=tk.LEFT, padx=5)

    def save_team(self, team_name, first_name, last_name, score, year, dialog, is_edit):
        """Save team data to database"""
        try:
            if not team_name or not first_name or not last_name or not score or not year:
                messagebox.showerror("Error", "All fields are required")
                return
            
            try:
                score = int(score)
                year = int(year)
            except ValueError:
                messagebox.showerror("Error", "Score and Year must be numbers")
                return
            
            if is_edit:
                query = """
                UPDATE Team 
                SET Principal_First_Name = :first_name, 
                    Principal_Last_Name = :last_name, 
                    Team_Score = :score
                WHERE Team_Name = :team_name AND Year = :year
                """
            else:
                query = """
                INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year)
                VALUES (:team_name, :first_name, :last_name, :score, :year)
                """
            
            execute_query(query, {
                'team_name': team_name, 
                'first_name': first_name, 
                'last_name': last_name, 
                'score': score, 
                'year': year
            }, fetch=False)
            
            messagebox.showinfo("Success", f"Team {team_name} {'updated' if is_edit else 'added'} successfully")
            dialog.destroy()
            self.show_team_standings(year)
            
        except cx_Oracle.Error as error:
            messagebox.showerror("Database Error", str(error))

    def delete_team(self, team_name):
        """Delete a team from the database"""
        if not team_name:
            messagebox.showerror("Error", "No team selected")
            return
        
        if not messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete team {team_name}?"):
            return
        
        try:
            year = get_current_season()
            query = "DELETE FROM Team WHERE Team_Name = :team_name AND Year = :year"
            execute_query(query, {'team_name': team_name, 'year': year}, fetch=False)
            messagebox.showinfo("Success", f"Team {team_name} deleted successfully")
            self.show_team_standings()
        except cx_Oracle.Error as error:
            messagebox.showerror("Database Error", str(error))

    def driver_edit_dialog(self, driver_id=None):
        """Dialog for adding or editing a driver"""
        is_edit = driver_id is not None
        
        dialog = tk.Toplevel(self.root)
        dialog.title(f"{'Edit' if is_edit else 'Add'} Driver")
        dialog.geometry("400x400")
        dialog.transient(self.root)
        dialog.grab_set()
        
        year = get_current_season()
        teams = execute_query("SELECT Team_Name FROM Team WHERE Year = :year", {'year': year})
        team_values = [t[0] for t in teams]
        
        form_frame = ttk.Frame(dialog, padding="20")
        form_frame.pack(fill=tk.BOTH, expand=True)
        
        if not is_edit:
            ttk.Label(form_frame, text="Driver ID:").grid(row=0, column=0, sticky=tk.W, pady=5)
            id_var = tk.StringVar()
            id_entry = ttk.Entry(form_frame, textvariable=id_var, width=30)
            id_entry.grid(row=0, column=1, sticky=tk.W, pady=5)
            row_offset = 0
        else:
            id_var = tk.StringVar(value=str(driver_id))
            row_offset = -1
            
        ttk.Label(form_frame, text="First Name:").grid(row=1+row_offset, column=0, sticky=tk.W, pady=5)
        first_name_var = tk.StringVar()
        first_name_entry = ttk.Entry(form_frame, textvariable=first_name_var, width=30)
        first_name_entry.grid(row=1+row_offset, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Last Name:").grid(row=2+row_offset, column=0, sticky=tk.W, pady=5)
        last_name_var = tk.StringVar()
        last_name_entry = ttk.Entry(form_frame, textvariable=last_name_var, width=30)
        last_name_entry.grid(row=2+row_offset, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Nationality:").grid(row=3+row_offset, column=0, sticky=tk.W, pady=5)
        nationality_var = tk.StringVar()
        nationality_entry = ttk.Entry(form_frame, textvariable=nationality_var, width=30)
        nationality_entry.grid(row=3+row_offset, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Total Score:").grid(row=4+row_offset, column=0, sticky=tk.W, pady=5)
        score_var = tk.StringVar(value="0")
        score_entry = ttk.Entry(form_frame, textvariable=score_var, width=30)
        score_entry.grid(row=4+row_offset, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Team:").grid(row=5+row_offset, column=0, sticky=tk.W, pady=5)
        team_var = tk.StringVar()
        team_combo = ttk.Combobox(form_frame, textvariable=team_var, values=team_values, width=28)
        team_combo.grid(row=5+row_offset, column=1, sticky=tk.W, pady=5)
        
        if is_edit:
            driver_data = get_driver_details(driver_id)
            if driver_data:
                first_name_var.set(driver_data[0][1])
                last_name_var.set(driver_data[0][2])
                nationality_var.set(driver_data[0][3])
                score_var.set(str(driver_data[0][4]))
                team_var.set(driver_data[0][5])
        
        btn_frame = ttk.Frame(form_frame)
        btn_frame.grid(row=6+row_offset, column=0, columnspan=2, pady=(20, 0))
        
        save_btn = ttk.Button(btn_frame, text="Save", width=15,
                             command=lambda: self.save_driver(
                                 id_var.get(), first_name_var.get(), last_name_var.get(),
                                 nationality_var.get(), score_var.get(), team_var.get(), 
                                 dialog, is_edit))
        save_btn.pack(side=tk.LEFT, padx=5)
        
        cancel_btn = ttk.Button(btn_frame, text="Cancel", width=15,
                               command=dialog.destroy)
        cancel_btn.pack(side=tk.LEFT, padx=5)

    def save_driver(self, driver_id, first_name, last_name, nationality, score, team, dialog, is_edit):
        """Save driver data to database"""
        try:
            if not driver_id or not first_name or not last_name or not nationality or not score or not team:
                messagebox.showerror("Error", "All fields are required")
                return
            
            try:
                driver_id = int(driver_id)
                score = int(score)
            except ValueError:
                messagebox.showerror("Error", "Driver ID and Score must be numbers")
                return
            
            year = get_current_season()
            
            if is_edit:
                query = """
                UPDATE Driver 
                SET First_Name = :first_name, 
                    Last_Name = :last_name, 
                    Nationality = :nationality,
                    Total_Ind_Score = :score,
                    Team_Name = :team
                WHERE Driver_ID = :driver_id
                """
            else:
                query = """
                INSERT INTO Driver (Driver_ID, First_Name, Last_Name, Nationality, Total_Ind_Score, Team_Name, Year)
                VALUES (:driver_id, :first_name, :last_name, :nationality, :score, :team, :year)
                """
            
            execute_query(query, {
                'driver_id': driver_id, 
                'first_name': first_name, 
                'last_name': last_name, 
                'nationality': nationality,
                'score': score, 
                'team': team,
                'year': year
            }, fetch=False)
            
            messagebox.showinfo("Success", f"Driver {first_name} {last_name} {'updated' if is_edit else 'added'} successfully")
            dialog.destroy()
            self.show_driver_standings()
            
        except cx_Oracle.Error as error:
            messagebox.showerror("Database Error", str(error))

    def delete_driver(self, driver_id):
        """Delete a driver from the database"""
        if not driver_id:
            messagebox.showerror("Error", "No driver selected")
            return
        
        if not messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete driver ID {driver_id}?"):
            return
        
        try:
            query = "DELETE FROM Driver WHERE Driver_ID = :driver_id"
            execute_query(query, {'driver_id': driver_id}, fetch=False)
            messagebox.showinfo("Success", f"Driver ID {driver_id} deleted successfully")
            self.show_driver_standings()
        except cx_Oracle.Error as error:
            messagebox.showerror("Database Error", str(error))

    def race_edit_dialog(self, race_name=None):
        """Dialog for adding or editing a race"""
        is_edit = race_name is not None
        
        dialog = tk.Toplevel(self.root)
        dialog.title(f"{'Edit' if is_edit else 'Add'} Race")
        dialog.geometry("400x400")
        dialog.transient(self.root)
        dialog.grab_set()
        
        countries = execute_query("SELECT DISTINCT Country FROM Location")
        country_values = [c[0] for c in countries]
        
        circuits = execute_query("SELECT Circuit_Name FROM Circuit")
        circuit_values = [c[0] for c in circuits]
        
        years = execute_query("SELECT DISTINCT Year FROM Season ORDER BY Year DESC")
        year_values = [str(y[0]) for y in years]
        
        form_frame = ttk.Frame(dialog, padding="20")
        form_frame.pack(fill=tk.BOTH, expand=True)
        
        ttk.Label(form_frame, text="Race Name:").grid(row=0, column=0, sticky=tk.W, pady=5)
        name_var = tk.StringVar()
        name_entry = ttk.Entry(form_frame, textvariable=name_var, width=30)
        name_entry.grid(row=0, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Race Date (YYYY-MM-DD):").grid(row=1, column=0, sticky=tk.W, pady=5)
        date_var = tk.StringVar()
        date_entry = ttk.Entry(form_frame, textvariable=date_var, width=30)
        date_entry.grid(row=1, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Country:").grid(row=2, column=0, sticky=tk.W, pady=5)
        country_var = tk.StringVar()
        country_combo = ttk.Combobox(form_frame, textvariable=country_var, values=country_values, width=28)
        country_combo.grid(row=2, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="State:").grid(row=3, column=0, sticky=tk.W, pady=5)
        state_var = tk.StringVar()
        state_entry = ttk.Entry(form_frame, textvariable=state_var, width=30)
        state_entry.grid(row=3, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Circuit:").grid(row=4, column=0, sticky=tk.W, pady=5)
        circuit_var = tk.StringVar()
        circuit_combo = ttk.Combobox(form_frame, textvariable=circuit_var, values=circuit_values, width=28)
        circuit_combo.grid(row=4, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Year:").grid(row=5, column=0, sticky=tk.W, pady=5)
        year_var = tk.StringVar(value=str(get_current_season()))
        year_combo = ttk.Combobox(form_frame, textvariable=year_var, values=year_values, width=28)
        year_combo.grid(row=5, column=1, sticky=tk.W, pady=5)
        
        if is_edit:
            race_data = execute_query("""
                SELECT Race_Name, TO_CHAR(Race_Date, 'YYYY-MM-DD'), Country, State, Circuit_Name, Year 
                FROM Race WHERE Race_Name = :race_name
            """, {'race_name': race_name})
            
            if race_data:
                name_var.set(race_data[0][0])
                date_var.set(race_data[0][1])
                country_var.set(race_data[0][2])
                state_var.set(race_data[0][3])
                circuit_var.set(race_data[0][4])
                year_var.set(str(race_data[0][5]))
                name_entry.configure(state="disabled")
        
        btn_frame = ttk.Frame(form_frame)
        btn_frame.grid(row=6, column=0, columnspan=2, pady=(20, 0))
        
        save_btn = ttk.Button(btn_frame, text="Save", width=15,
                             command=lambda: self.save_race(
                                 name_var.get(), date_var.get(), country_var.get(),
                                 state_var.get(), circuit_var.get(), year_var.get(), 
                                 dialog, is_edit))
        save_btn.pack(side=tk.LEFT, padx=5)
        
        cancel_btn = ttk.Button(btn_frame, text="Cancel", width=15,
                               command=dialog.destroy)
        cancel_btn.pack(side=tk.LEFT, padx=5)

    def save_race(self, race_name, race_date, country, state, circuit, year, dialog, is_edit):
        """Save race data to database"""
        try:
            if not race_name or not race_date or not country or not circuit or not year:
                messagebox.showerror("Error", "Required fields: Race Name, Date, Country, Circuit, Year")
                return
            
            try:
                year = int(year)
                datetime.strptime(race_date, '%Y-%m-%d')
            except ValueError:
                messagebox.showerror("Error", "Year must be a number and Date must be in YYYY-MM-DD format")
                return
            
            if is_edit:
                query = """
                UPDATE Race 
                SET Race_Date = TO_DATE(:race_date, 'YYYY-MM-DD'), 
                    Country = :country, 
                    State = :state,
                    Circuit_Name = :circuit,
                    Year = :year
                WHERE Race_Name = :race_name
                """
            else:
                query = """
                INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year)
                VALUES (:race_name, TO_DATE(:race_date, 'YYYY-MM-DD'), :country, :state, :circuit, :year)
                """
            
            execute_query(query, {
                'race_name': race_name, 
                'race_date': race_date, 
                'country': country, 
                'state': state,
                'circuit': circuit, 
                'year': year
            }, fetch=False)
            
            messagebox.showinfo("Success", f"Race {race_name} {'updated' if is_edit else 'added'} successfully")
            dialog.destroy()
            self.show_race_schedule(year)
            
        except cx_Oracle.Error as error:
            messagebox.showerror("Database Error", str(error))

    def delete_race(self, race_name):
        """Delete a race from the database"""
        if not race_name:
            messagebox.showerror("Error", "No race selected")
            return
        
        if not messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete race {race_name}?"):
            return
        
        try:
            query = "DELETE FROM Race WHERE Race_Name = :race_name"
            execute_query(query, {'race_name': race_name}, fetch=False)
            messagebox.showinfo("Success", f"Race {race_name} deleted successfully")
            self.show_race_schedule()
        except cx_Oracle.Error as error:
            messagebox.showerror("Database Error", str(error))

    def season_edit_dialog(self, year=None):
        """Dialog for adding or editing a season"""
        is_edit = year is not None
        
        dialog = tk.Toplevel(self.root)
        dialog.title(f"{'Edit' if is_edit else 'Add'} Season")
        dialog.geometry("400x250")
        dialog.transient(self.root)
        dialog.grab_set()
        
        form_frame = ttk.Frame(dialog, padding="20")
        form_frame.pack(fill=tk.BOTH, expand=True)
        
        ttk.Label(form_frame, text="Year:").grid(row=0, column=0, sticky=tk.W, pady=5)
        year_var = tk.StringVar()
        year_entry = ttk.Entry(form_frame, textvariable=year_var, width=30)
        year_entry.grid(row=0, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Team Winner:").grid(row=1, column=0, sticky=tk.W, pady=5)
        team_var = tk.StringVar()
        team_entry = ttk.Entry(form_frame, textvariable=team_var, width=30)
        team_entry.grid(row=1, column=1, sticky=tk.W, pady=5)
        
        ttk.Label(form_frame, text="Individual Winner:").grid(row=2, column=0, sticky=tk.W, pady=5)
        individual_var = tk.StringVar()
        individual_entry = ttk.Entry(form_frame, textvariable=individual_var, width=30)
        individual_entry.grid(row=2, column=1, sticky=tk.W, pady=5)
        
        if is_edit:
            season_data = execute_query("SELECT Year, Team_Winner, Individual_Winner FROM Season WHERE Year = :year", 
                                       {'year': year})
            
            if season_data:
                year_var.set(str(season_data[0][0]))
                team_var.set(season_data[0][1])
                individual_var.set(season_data[0][2])
                year_entry.configure(state="disabled")
        
        btn_frame = ttk.Frame(form_frame)
        btn_frame.grid(row=3, column=0, columnspan=2, pady=(20, 0))
        
        save_btn = ttk.Button(btn_frame, text="Save", width=15,
                             command=lambda: self.save_season(
                                 year_var.get(), team_var.get(), individual_var.get(), 
                                 dialog, is_edit))
        save_btn.pack(side=tk.LEFT, padx=5)
        
        cancel_btn = ttk.Button(btn_frame, text="Cancel", width=15,
                               command=dialog.destroy)
        cancel_btn.pack(side=tk.LEFT, padx=5)

    def save_season(self, year, team_winner, individual_winner, dialog, is_edit):
        """Save season data to database"""
        try:
            if not year or not team_winner or not individual_winner:
                messagebox.showerror("Error", "All fields are required")
                return
            
            try:
                year = int(year)
            except ValueError:
                messagebox.showerror("Error", "Year must be a number")
                return
            
            if is_edit:
                query = """
                UPDATE Season 
                SET Team_Winner = :team_winner, 
                    Individual_Winner = :individual_winner
                WHERE Year = :year
                """
            else:
                query = """
                INSERT INTO Season (Year, Team_Winner, Individual_Winner)
                VALUES (:year, :team_winner, :individual_winner)
                """
            
            execute_query(query, {
                'year': year, 
                'team_winner': team_winner, 
                'individual_winner': individual_winner
            }, fetch=False)
            
            messagebox.showinfo("Success", f"Season {year} {'updated' if is_edit else 'added'} successfully")
            dialog.destroy()
            self.show_championship_history()
            
        except cx_Oracle.Error as error:
            messagebox.showerror("Database Error", str(error))

    def delete_season(self, year):
        """Delete a season from the database"""
        if not year:
            messagebox.showerror("Error", "No season selected")
            return
        
        if not messagebox.askyesno("Confirm Delete", f"Are you sure you want to delete season {year}?"):
            return
        
        try:
            query = "DELETE FROM Season WHERE Year = :year"
            execute_query(query, {'year': year}, fetch=False)
            messagebox.showinfo("Success", f"Season {year} deleted successfully")
            self.show_championship_history()
        except cx_Oracle.Error as error:
            messagebox.showerror("Database Error", str(error))

if __name__ == "__main__":
    try:
        # Verify Oracle client setup
        try:
            cx_Oracle.version
        except cx_Oracle.DatabaseError as e:
            messagebox.showerror("Error", "Oracle client not properly configured. Please install Oracle Instant Client.")
            sys.exit(1)

        # Start Tkinter GUI
        root = tk.Tk()
        app = RaceManagementApp(root)
        root.mainloop()
    except Exception as e:
        messagebox.showerror("Startup Error", f"Failed to start application: {str(e)}")
        sys.exit(1)