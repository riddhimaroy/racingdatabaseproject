
-- Insert data for Season table
INSERT INTO Season (Year, Team_Winner, Individual_Winner) VALUES (2021, 'Mercedes', 'Max Verstappen');

-- Insert data for Circuit table
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Bahrain International Circuit', 5.412);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Imola Circuit', 4.909);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Portimão Circuit', 4.653);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Circuit de Barcelona-Catalunya', 4.655);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Circuit de Monaco', 3.337);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Baku City Circuit', 6.003);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Circuit Paul Ricard', 5.842);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Red Bull Ring', 4.318);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Silverstone Circuit', 5.891);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Hungaroring', 4.381);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Circuit de Spa-Francorchamps', 7.004);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Circuit Zandvoort', 4.259);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Autodromo Nazionale Monza', 5.793);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Sochi Autodrom', 5.848);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Istanbul Park', 5.338);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Circuit of the Americas', 5.513);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Autódromo Hermanos Rodríguez', 4.304);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Interlagos', 4.309);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Losail International Circuit', 5.380);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Jeddah Corniche Circuit', 6.174);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Yas Marina Circuit', 5.554);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Mugello Circuit', 5.245);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Nürburgring', 5.148);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Sakhir Outer Circuit', 3.543);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Albert Park Circuit', 5.303);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Shanghai International Circuit', 5.451);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Circuit Gilles Villeneuve', 4.361);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Marina Bay Street Circuit', 5.063);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Suzuka Circuit', 5.807);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Autódromo José Carlos Pace', 4.309);
INSERT INTO Circuit (Circuit_Name, Circuit_Length) VALUES ('Hockenheimring', 4.574);

-- Insert data for Location table
INSERT INTO Location (Country, State) VALUES ('Australia', 'Victoria');
INSERT INTO Location (Country, State) VALUES ('Bahrain', 'Sakhir');
INSERT INTO Location (Country, State) VALUES ('China', 'Shanghai');
INSERT INTO Location (Country, State) VALUES ('Azerbaijan', 'Baku');
INSERT INTO Location (Country, State) VALUES ('Spain', 'Catalonia');
INSERT INTO Location (Country, State) VALUES ('Monaco', 'Monte Carlo');
INSERT INTO Location (Country, State) VALUES ('Canada', 'Quebec');
INSERT INTO Location (Country, State) VALUES ('France', 'Provence-Alpes-Côte d''Azur');
INSERT INTO Location (Country, State) VALUES ('Austria', 'Styria');
INSERT INTO Location (Country, State) VALUES ('UK', 'Northamptonshire');
INSERT INTO Location (Country, State) VALUES ('Hungary', 'Mogyoród');
INSERT INTO Location (Country, State) VALUES ('Belgium', 'Stavelot');
INSERT INTO Location (Country, State) VALUES ('Italy', 'Monza');
INSERT INTO Location (Country, State) VALUES ('Singapore', 'Marina Bay');
INSERT INTO Location (Country, State) VALUES ('Russia', 'Sochi');
INSERT INTO Location (Country, State) VALUES ('Japan', 'Mie');
INSERT INTO Location (Country, State) VALUES ('Mexico', 'Mexico City');
INSERT INTO Location (Country, State) VALUES ('USA', 'Texas');
INSERT INTO Location (Country, State) VALUES ('Brazil', 'São Paulo');
INSERT INTO Location (Country, State) VALUES ('UAE', 'Abu Dhabi');
INSERT INTO Location (Country, State) VALUES ('Germany', 'Baden-Württemberg');
INSERT INTO Location (Country, State) VALUES ('Italy', 'Tuscany');
INSERT INTO Location (Country, State) VALUES ('Germany', 'Rhineland-Palatinate');
INSERT INTO Location (Country, State) VALUES ('Portugal', 'Algarve');
INSERT INTO Location (Country, State) VALUES ('Italy', 'Emilia-Romagna');
INSERT INTO Location (Country, State) VALUES ('Turkey', 'Istanbul');

-- Insert data for Team table
-- 2021 Teams
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Mercedes', 'Toto', 'Wolff', 613, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Red Bull Racing', 'Christian', 'Horner', 585, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Ferrari', 'Mattia', 'Binotto', 323, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('McLaren', 'Andreas', 'Seidl', 275, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Alpine', 'Davide', 'Brivio', 155, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('AlphaTauri', 'Franz', 'Tost', 142, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Aston Martin', 'Otmar', 'Szafnauer', 77, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Williams', 'Jost', 'Capito', 23, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Alfa Romeo', 'Frédéric', 'Vasseur', 13, 2021);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Haas F1 Team', 'Guenther', 'Steiner', 0, 2021);

-- Insert data for Driver table
-- 2021 Drivers
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (44, 'British', 'Hamilton', 'Lewis', 387, 2021, 'Mercedes');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (77, 'Finnish', 'Bottas', 'Valtteri', 226, 2021, 'Mercedes');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (33, 'Dutch', 'Verstappen', 'Max', 395, 2021, 'Red Bull Racing');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (11, 'Mexican', 'Perez', 'Sergio', 190, 2021, 'Red Bull Racing');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (16, 'Monegasque', 'Leclerc', 'Charles', 159, 2021, 'Ferrari');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (55, 'Spanish', 'Sainz', 'Carlos', 164, 2021, 'Ferrari');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (4, 'British', 'Norris', 'Lando', 160, 2021, 'McLaren');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (3, 'Australian', 'Ricciardo', 'Daniel', 115, 2021, 'McLaren');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (14, 'Spanish', 'Alonso', 'Fernando', 81, 2021, 'Alpine');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (31, 'French', 'Ocon', 'Esteban', 74, 2021, 'Alpine');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (10, 'French', 'Gasly', 'Pierre', 110, 2021, 'AlphaTauri');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (22, 'Japanese', 'Tsunoda', 'Yuki', 32, 2021, 'AlphaTauri');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (5, 'German', 'Vettel', 'Sebastian', 43, 2021, 'Aston Martin');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (18, 'Canadian', 'Stroll', 'Lance', 34, 2021, 'Aston Martin');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (63, 'British', 'Russell', 'George', 16, 2021, 'Williams');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (6, 'Canadian', 'Latifi', 'Nicholas', 7, 2021, 'Williams');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (7, 'Finnish', 'Raikkonen', 'Kimi', 10, 2021, 'Alfa Romeo');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (99, 'Italian', 'Giovinazzi', 'Antonio', 3, 2021, 'Alfa Romeo');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (47, 'German', 'Schumacher', 'Mick', 0, 2021, 'Haas F1 Team');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (9, 'Russian', 'Mazepin', 'Nikita', 0, 2021, 'Haas F1 Team');



-- Insert data for Race table
-- 2021 Races
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Bahrain Grand Prix 2021', TO_DATE('2021-03-28', 'YYYY-MM-DD'), 'Bahrain', 'Sakhir', 'Bahrain International Circuit', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Emilia Romagna Grand Prix 2021', TO_DATE('2021-04-18', 'YYYY-MM-DD'), 'Italy', 'Emilia-Romagna', 'Imola Circuit', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Portuguese Grand Prix 2021', TO_DATE('2021-05-02', 'YYYY-MM-DD'), 'Portugal', 'Algarve', 'Portimão Circuit', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Spanish Grand Prix 2021', TO_DATE('2021-05-09', 'YYYY-MM-DD'), 'Spain', 'Catalonia', 'Circuit de Barcelona-Catalunya', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Monaco Grand Prix 2021', TO_DATE('2021-05-23', 'YYYY-MM-DD'), 'Monaco', 'Monte Carlo', 'Circuit de Monaco', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Azerbaijan Grand Prix 2021', TO_DATE('2021-06-06', 'YYYY-MM-DD'), 'Azerbaijan', 'Baku', 'Baku City Circuit', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('French Grand Prix 2021', TO_DATE('2021-06-20', 'YYYY-MM-DD'), 'France', 'Le Castellet', 'Circuit Paul Ricard', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Styrian Grand Prix 2021', TO_DATE('2021-06-27', 'YYYY-MM-DD'), 'Austria', 'Styria', 'Red Bull Ring', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Austrian Grand Prix 2021', TO_DATE('2021-07-04', 'YYYY-MM-DD'), 'Austria', 'Styria', 'Red Bull Ring', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('British Grand Prix 2021', TO_DATE('2021-07-18', 'YYYY-MM-DD'), 'UK', 'Northamptonshire', 'Silverstone Circuit', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Hungarian Grand Prix 2021', TO_DATE('2021-08-01', 'YYYY-MM-DD'), 'Hungary', 'Mogyoród', 'Hungaroring', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Belgian Grand Prix 2021', TO_DATE('2021-08-29', 'YYYY-MM-DD'), 'Belgium', 'Stavelot', 'Circuit de Spa-Francorchamps', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Dutch Grand Prix 2021', TO_DATE('2021-09-05', 'YYYY-MM-DD'), 'Netherlands', 'Zandvoort', 'Circuit Zandvoort', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Italian Grand Prix 2021', TO_DATE('2021-09-12', 'YYYY-MM-DD'), 'Italy', 'Monza', 'Autodromo Nazionale Monza', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Russian Grand Prix 2021', TO_DATE('2021-09-26', 'YYYY-MM-DD'), 'Russia', 'Sochi', 'Sochi Autodrom', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Turkish Grand Prix 2021', TO_DATE('2021-10-10', 'YYYY-MM-DD'), 'Turkey', 'Istanbul', 'Istanbul Park', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('United States Grand Prix 2021', TO_DATE('2021-10-24', 'YYYY-MM-DD'), 'USA', 'Texas', 'Circuit of the Americas', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Mexico City Grand Prix 2021', TO_DATE('2021-11-07', 'YYYY-MM-DD'), 'Mexico', 'Mexico City', 'Autódromo Hermanos Rodríguez', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('São Paulo Grand Prix 2021', TO_DATE('2021-11-14', 'YYYY-MM-DD'), 'Brazil', 'São Paulo', 'Interlagos', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Qatar Grand Prix 2021', TO_DATE('2021-11-21', 'YYYY-MM-DD'), 'Qatar', 'Lusail', 'Losail International Circuit', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Saudi Arabian Grand Prix 2021', TO_DATE('2021-12-05', 'YYYY-MM-DD'), 'Saudi Arabia', 'Jeddah', 'Jeddah Corniche Circuit', 2021);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Abu Dhabi Grand Prix 2021', TO_DATE('2021-12-12', 'YYYY-MM-DD'), 'UAE', 'Abu Dhabi', 'Yas Marina Circuit', 2021);

-- Insert data for RaceSession table
-- 2021 Race Sessions (only race sessions)
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-BAH-2021', 'Bahrain Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-EMI-2021', 'Emilia Romagna Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-POR-2021', 'Portuguese Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-SPA-2021', 'Spanish Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-MON-2021', 'Monaco Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-AZE-2021', 'Azerbaijan Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-FRA-2021', 'French Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-STY-2021', 'Styrian Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-AUT-2021', 'Austrian Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-GBR-2021', 'British Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-HUN-2021', 'Hungarian Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-BEL-2021', 'Belgian Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-NED-2021', 'Dutch Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-ITA-2021', 'Italian Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-RUS-2021', 'Russian Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-TUR-2021', 'Turkish Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-USA-2021', 'United States Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-MEX-2021', 'Mexico City Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-BRA-2021', 'São Paulo Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-QAT-2021', 'Qatar Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-SAU-2021', 'Saudi Arabian Grand Prix 2021', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-ABU-2021', 'Abu Dhabi Grand Prix 2021', NULL);










-- Insert data for Result table
-- 2021 Results
-- Bahrain Grand Prix (BAH21) - Provided
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH21-44', 1, 25, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH21-33', 2, 18, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH21-77', 3, 15, 77, 'Mercedes', 2021);

-- Emilia Romagna Grand Prix (EMI21) - Provided
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EMI21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EMI21-44', 2, 18, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EMI21-4', 3, 15, 4, 'McLaren', 2021);

-- Portuguese Grand Prix (POR21) - Provided
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('POR21-44', 1, 25, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('POR21-33', 2, 18, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('POR21-77', 3, 15, 77, 'Mercedes', 2021);

-- Spanish Grand Prix (SPA21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA21-44', 1, 25, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA21-33', 2, 18, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA21-77', 3, 15, 77, 'Mercedes', 2021);

-- Monaco Grand Prix (MON21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MON21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MON21-55', 2, 18, 55, 'Ferrari', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MON21-4', 3, 15, 4, 'McLaren', 2021);

-- Azerbaijan Grand Prix (AZE21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AZE21-11', 1, 25, 11, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AZE21-5', 2, 18, 5, 'Aston Martin', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AZE21-10', 3, 15, 10, 'AlphaTauri', 2021);

-- French Grand Prix (FRA21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('FRA21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('FRA21-44', 2, 18, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('FRA21-11', 3, 15, 11, 'Red Bull Racing', 2021);

-- Styrian Grand Prix (STY21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('STY21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('STY21-44', 2, 18, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('STY21-77', 3, 15, 77, 'Mercedes', 2021);

-- Austrian Grand Prix (AUT21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT21-77', 2, 18, 77, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT21-4', 3, 15, 4, 'McLaren', 2021);

-- British Grand Prix (GBR21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR21-44', 1, 25, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR21-16', 2, 18, 16, 'Ferrari', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR21-77', 3, 15, 77, 'Mercedes', 2021);

-- Hungarian Grand Prix (HUN21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN21-31', 1, 25, 31, 'Alpine', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN21-44', 2, 18, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN21-55', 3, 15, 55, 'Ferrari', 2021);

-- Belgian Grand Prix (BEL21) - Half points
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL21-33', 1, 12.5, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL21-63', 2, 9, 63, 'Williams', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL21-44', 3, 7.5, 44, 'Mercedes', 2021);

-- Dutch Grand Prix (NED21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('NED21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('NED21-44', 2, 18, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('NED21-77', 3, 15, 77, 'Mercedes', 2021);

-- Italian Grand Prix (ITA21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA21-3', 1, 25, 3, 'McLaren', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA21-4', 2, 18, 4, 'McLaren', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA21-77', 3, 15, 77, 'Mercedes', 2021);

-- Russian Grand Prix (RUS21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS21-44', 1, 25, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS21-33', 2, 18, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS21-55', 3, 15, 55, 'Ferrari', 2021);

-- Turkish Grand Prix (TUR21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUR21-77', 1, 25, 77, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUR21-33', 2, 18, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUR21-11', 3, 15, 11, 'Red Bull Racing', 2021);

-- United States Grand Prix (USA21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('USA21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('USA21-44', 2, 18, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('USA21-11', 3, 15, 11, 'Red Bull Racing', 2021);

-- Mexican Grand Prix (MEX21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MEX21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MEX21-44', 2, 18, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MEX21-11', 3, 15, 11, 'Red Bull Racing', 2021);

-- Brazilian Grand Prix (BRA21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BRA21-44', 1, 25, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BRA21-33', 2, 18, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BRA21-77', 3, 15, 77, 'Mercedes', 2021);

-- Qatar Grand Prix (QAT21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('QAT21-44', 1, 25, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('QAT21-33', 2, 18, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('QAT21-14', 3, 15, 14, 'Alpine', 2021);

-- Saudi Arabian Grand Prix (SAU21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SAU21-44', 1, 25, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SAU21-33', 2, 18, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SAU21-77', 3, 15, 77, 'Mercedes', 2021);

-- Abu Dhabi Grand Prix (ABU21)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU21-33', 1, 25, 33, 'Red Bull Racing', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU21-44', 2, 18, 44, 'Mercedes', 2021);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU21-55', 3, 15, 55, 'Ferrari', 2021);

-- 2020 data

-- Insert data for Season table
INSERT INTO Season (Year, Team_Winner, Individual_Winner) VALUES (2020, 'Mercedes', 'Lewis Hamilton');

-- Insert data for Circuit table


-- Insert data for Location table


-- Insert data for Team table
-- 2020 Teams
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Mercedes', 'Toto', 'Wolff', 573, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Red Bull Racing', 'Christian', 'Horner', 319, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('McLaren', 'Andreas', 'Seidl', 202, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Racing Point', 'Otmar', 'Szafnauer', 195, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Renault', 'Cyril', 'Abiteboul', 181, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Ferrari', 'Mattia', 'Binotto', 131, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('AlphaTauri', 'Franz', 'Tost', 107, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Alfa Romeo', 'Frédéric', 'Vasseur', 8, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Haas F1 Team', 'Guenther', 'Steiner', 3, 2020);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Williams', 'Simon', 'Roberts', 0, 2020);

-- Insert data for Driver table
-- 2020 Drivers
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (44, 'British', 'Hamilton', 'Lewis', 347, 2020, 'Mercedes');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (77, 'Finnish', 'Bottas', 'Valtteri', 223, 2020, 'Mercedes');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (33, 'Dutch', 'Verstappen', 'Max', 214, 2020, 'Red Bull Racing');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (23, 'Thai', 'Albon', 'Alexander', 105, 2020, 'Red Bull Racing');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (55, 'Spanish', 'Sainz', 'Carlos', 105, 2020, 'McLaren');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (4, 'British', 'Norris', 'Lando', 97, 2020, 'McLaren');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (11, 'Mexican', 'Perez', 'Sergio', 125, 2020, 'Racing Point');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (18, 'Canadian', 'Stroll', 'Lance', 75, 2020, 'Racing Point');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (3, 'Australian', 'Ricciardo', 'Daniel', 119, 2020, 'Renault');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (31, 'French', 'Ocon', 'Esteban', 62, 2020, 'Renault');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (16, 'Monegasque', 'Leclerc', 'Charles', 98, 2020, 'Ferrari');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (5, 'German', 'Vettel', 'Sebastian', 33, 2020, 'Ferrari');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (10, 'French', 'Gasly', 'Pierre', 75, 2020, 'AlphaTauri');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (26, 'Russian', 'Kvyat', 'Daniil', 32, 2020, 'AlphaTauri');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (7, 'Finnish', 'Raikkonen', 'Kimi', 4, 2020, 'Alfa Romeo');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (99, 'Italian', 'Giovinazzi', 'Antonio', 4, 2020, 'Alfa Romeo');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (20, 'Danish', 'Magnussen', 'Kevin', 1, 2020, 'Haas F1 Team');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (8, 'French', 'Grosjean', 'Romain', 2, 2020, 'Haas F1 Team');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (63, 'British', 'Russell', 'George', 3, 2020, 'Williams');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (6, 'Canadian', 'Latifi', 'Nicholas', 0, 2020, 'Williams');

-- Insert data for Race table
-- 2020 Races
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Austrian Grand Prix 2020', TO_DATE('2020-07-05', 'YYYY-MM-DD'), 'Austria', 'Styria', 'Red Bull Ring', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Styrian Grand Prix 2020', TO_DATE('2020-07-12', 'YYYY-MM-DD'), 'Austria', 'Styria', 'Red Bull Ring', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Hungarian Grand Prix 2020', TO_DATE('2020-07-19', 'YYYY-MM-DD'), 'Hungary', 'Mogyoród', 'Hungaroring', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('British Grand Prix 2020', TO_DATE('2020-08-02', 'YYYY-MM-DD'), 'UK', 'Northamptonshire', 'Silverstone Circuit', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('70th Anniversary Grand Prix 2020', TO_DATE('2020-08-09', 'YYYY-MM-DD'), 'UK', 'Northamptonshire', 'Silverstone Circuit', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Spanish Grand Prix 2020', TO_DATE('2020-08-16', 'YYYY-MM-DD'), 'Spain', 'Catalonia', 'Circuit de Barcelona-Catalunya', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Belgian Grand Prix 2020', TO_DATE('2020-08-30', 'YYYY-MM-DD'), 'Belgium', 'Stavelot', 'Circuit de Spa-Francorchamps', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Italian Grand Prix 2020', TO_DATE('2020-09-06', 'YYYY-MM-DD'), 'Italy', 'Monza', 'Autodromo Nazionale Monza', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Tuscan Grand Prix 2020', TO_DATE('2020-09-13', 'YYYY-MM-DD'), 'Italy', 'Tuscany', 'Mugello Circuit', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Russian Grand Prix 2020', TO_DATE('2020-09-27', 'YYYY-MM-DD'), 'Russia', 'Sochi', 'Sochi Autodrom', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Eifel Grand Prix 2020', TO_DATE('2020-10-11', 'YYYY-MM-DD'), 'Germany', 'Rhineland-Palatinate', 'Nürburgring', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Portuguese Grand Prix 2020', TO_DATE('2020-10-25', 'YYYY-MM-DD'), 'Portugal', 'Algarve', 'Portimão Circuit', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Emilia Romagna Grand Prix 2020', TO_DATE('2020-11-01', 'YYYY-MM-DD'), 'Italy', 'Emilia-Romagna', 'Imola Circuit', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Turkish Grand Prix 2020', TO_DATE('2020-11-15', 'YYYY-MM-DD'), 'Turkey', 'Istanbul', 'Istanbul Park', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Bahrain Grand Prix 2020', TO_DATE('2020-11-29', 'YYYY-MM-DD'), 'Bahrain', 'Sakhir', 'Bahrain International Circuit', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Sakhir Grand Prix 2020', TO_DATE('2020-12-06', 'YYYY-MM-DD'), 'Bahrain', 'Sakhir', 'Sakhir Outer Circuit', 2020);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Abu Dhabi Grand Prix 2020', TO_DATE('2020-12-13', 'YYYY-MM-DD'), 'UAE', 'Abu Dhabi', 'Yas Marina Circuit', 2020);

-- Insert data for RaceSession table
-- 2020 Race Sessions (only race sessions)
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-AUT-2020', 'Austrian Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-STY-2020', 'Styrian Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-HUN-2020', 'Hungarian Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-GBR-2020', 'British Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-70A-2020', '70th Anniversary Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-SPA-2020', 'Spanish Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-BEL-2020', 'Belgian Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-ITA-2020', 'Italian Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-TUS-2020', 'Tuscan Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-RUS-2020', 'Russian Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-EIF-2020', 'Eifel Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-POR-2020', 'Portuguese Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-EMI-2020', 'Emilia Romagna Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-TUR-2020', 'Turkish Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-BAH-2020', 'Bahrain Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-SAK-2020', 'Sakhir Grand Prix 2020', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-ABU-2020', 'Abu Dhabi Grand Prix 2020', NULL);

-- Insert data for Result table
-- 2020 Results (Top 3 for each race)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT20-77', 1, 25, 77, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT20-44', 2, 18, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT20-4', 3, 15, 4, 'McLaren', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('STY20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('STY20-77', 2, 18, 77, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('STY20-33', 3, 15, 33, 'Red Bull Racing', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN20-33', 2, 18, 33, 'Red Bull Racing', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN20-77', 3, 15, 77, 'Mercedes', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR20-33', 2, 18, 33, 'Red Bull Racing', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR20-16', 3, 15, 16, 'Ferrari', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('70A20-33', 1, 25, 33, 'Red Bull Racing', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('70A20-44', 2, 18, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('70A20-77', 3, 15, 77, 'Mercedes', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA20-33', 2, 18, 33, 'Red Bull Racing', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA20-77', 3, 15, 77, 'Mercedes', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL20-77', 2, 18, 77, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL20-33', 3, 15, 33, 'Red Bull Racing', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA20-10', 1, 25, 10, 'AlphaTauri', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA20-55', 2, 18, 55, 'McLaren', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA20-18', 3, 15, 18, 'Racing Point', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUS20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUS20-77', 2, 18, 77, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUS20-23', 3, 15, 23, 'Red Bull Racing', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS20-77', 1, 25, 77, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS20-33', 2, 18, 33, 'Red Bull Racing', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS20-11', 3, 15, 11, 'Racing Point', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EIF20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EIF20-33', 2, 18, 33, 'Red Bull Racing', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EIF20-3', 3, 15, 3, 'Renault', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('POR20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('POR20-77', 2, 18, 77, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('POR20-33', 3, 15, 33, 'Red Bull Racing', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EMI20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EMI20-77', 2, 18, 77, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('EMI20-3', 3, 15, 3, 'Renault', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUR20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUR20-11', 2, 18, 11, 'Racing Point', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('TUR20-5', 3, 15, 5, 'Ferrari', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH20-44', 1, 25, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH20-33', 2, 18, 33, 'Red Bull Racing', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH20-23', 3, 15, 23, 'Red Bull Racing', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SAK20-11', 1, 25, 11, 'Racing Point', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SAK20-31', 2, 18, 31, 'Renault', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SAK20-55', 3, 15, 55, 'McLaren', 2020);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU20-33', 1, 25, 33, 'Red Bull Racing', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU20-44', 2, 18, 44, 'Mercedes', 2020);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU20-77', 3, 15, 77, 'Mercedes', 2020);


-- 2019 data

-- Insert data for Season table
INSERT INTO Season (Year, Team_Winner, Individual_Winner) VALUES (2019, 'Mercedes', 'Lewis Hamilton');

-- Insert data for Circuit table
-- 2019 Circuits


-- Insert data for Location table


-- Insert data for Team table
-- 2019 Teams
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Mercedes', 'Toto', 'Wolff', 739, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Ferrari', 'Mattia', 'Binotto', 504, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Red Bull Racing', 'Christian', 'Horner', 417, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('McLaren', 'Andreas', 'Seidl', 145, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Renault', 'Cyril', 'Abiteboul', 91, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Toro Rosso', 'Franz', 'Tost', 85, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Racing Point', 'Otmar', 'Szafnauer', 73, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Alfa Romeo', 'Frédéric', 'Vasseur', 57, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Haas F1 Team', 'Guenther', 'Steiner', 28, 2019);
INSERT INTO Team (Team_Name, Principal_First_Name, Principal_Last_Name, Team_Score, Year) VALUES ('Williams', 'Claire', 'Williams', 1, 2019);

-- Insert data for Driver table
-- 2019 Drivers
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (44, 'British', 'Hamilton', 'Lewis', 413, 2019, 'Mercedes');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (77, 'Finnish', 'Bottas', 'Valtteri', 326, 2019, 'Mercedes');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (16, 'Monegasque', 'Leclerc', 'Charles', 264, 2019, 'Ferrari');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (5, 'German', 'Vettel', 'Sebastian', 240, 2019, 'Ferrari');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (33, 'Dutch', 'Verstappen', 'Max', 278, 2019, 'Red Bull Racing');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (23, 'Thai', 'Albon', 'Alexander', 92, 2019, 'Red Bull Racing');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (55, 'Spanish', 'Sainz', 'Carlos', 96, 2019, 'McLaren');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (4, 'British', 'Norris', 'Lando', 49, 2019, 'McLaren');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (3, 'Australian', 'Ricciardo', 'Daniel', 54, 2019, 'Renault');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (27, 'German', 'Hulkenberg', 'Nico', 37, 2019, 'Renault');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (10, 'French', 'Gasly', 'Pierre', 95, 2019, 'Toro Rosso');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (26, 'Russian', 'Kvyat', 'Daniil', 37, 2019, 'Toro Rosso');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (11, 'Mexican', 'Perez', 'Sergio', 52, 2019, 'Racing Point');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (18, 'Canadian', 'Stroll', 'Lance', 21, 2019, 'Racing Point');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (7, 'Finnish', 'Raikkonen', 'Kimi', 43, 2019, 'Alfa Romeo');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (99, 'Italian', 'Giovinazzi', 'Antonio', 14, 2019, 'Alfa Romeo');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (20, 'Danish', 'Magnussen', 'Kevin', 20, 2019, 'Haas F1 Team');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (8, 'French', 'Grosjean', 'Romain', 8, 2019, 'Haas F1 Team');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (63, 'British', 'Russell', 'George', 0, 2019, 'Williams');
INSERT INTO Driver (Driver_ID, Nationality, Last_Name, First_Name, Total_Ind_Score, Year, Team_Name) VALUES (88, 'Polish', 'Kubica', 'Robert', 1, 2019, 'Williams');

-- Insert data for Race table
-- 2019 Races
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Australian Grand Prix 2019', TO_DATE('2019-03-17', 'YYYY-MM-DD'), 'Australia', 'Victoria', 'Albert Park Circuit', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Bahrain Grand Prix 2019', TO_DATE('2019-03-31', 'YYYY-MM-DD'), 'Bahrain', 'Sakhir', 'Bahrain International Circuit', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Chinese Grand Prix 2019', TO_DATE('2019-04-14', 'YYYY-MM-DD'), 'China', 'Shanghai', 'Shanghai International Circuit', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Azerbaijan Grand Prix 2019', TO_DATE('2019-04-28', 'YYYY-MM-DD'), 'Azerbaijan', 'Baku', 'Baku City Circuit', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Spanish Grand Prix 2019', TO_DATE('2019-05-12', 'YYYY-MM-DD'), 'Spain', 'Catalonia', 'Circuit de Barcelona-Catalunya', 2019 livro);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Monaco Grand Prix 2019', TO_DATE('2019-05-26', 'YYYY-MM-DD'), 'Monaco', 'Monte Carlo', 'Circuit de Monaco', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Canadian Grand Prix 2019', TO_DATE('2019-06-09', 'YYYY-MM-DD'), 'Canada', 'Quebec', 'Circuit Gilles Villeneuve', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('French Grand Prix 2019', TO_DATE('2019-06-23', 'YYYY-MM-DD'), 'France', 'Provence-Alpes-Côte d''Azur', 'Circuit Paul Ricard', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Austrian Grand Prix 2019', TO_DATE('2019-06-30', 'YYYY-MM-DD'), 'Austria', 'Styria', 'Red Bull Ring', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('British Grand Prix 2019', TO_DATE('2019-07-14', 'YYYY-MM-DD'), 'UK', 'Northamptonshire', 'Silverstone Circuit', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('German Grand Prix 2019', TO_DATE('2019-07-28', 'YYYY-MM-DD'), 'Germany', 'Baden-Württemberg', 'Hockenheimring', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Hungarian Grand Prix 2019', TO_DATE('2019-08-04', 'YYYY-MM-DD'), 'Hungary', 'Mogyoród', 'Hungaroring', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Belgian Grand Prix 2019', TO_DATE('2019-09-01', 'YYYY-MM-DD'), 'Belgium', 'Stavelot', 'Circuit de Spa-Francorchamps', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Italian Grand Prix 2019', TO_DATE('2019-09-08', 'YYYY-MM-DD'), 'Italy', 'Monza', 'Autodromo Nazionale Monza', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Singapore Grand Prix 2019', TO_DATE('2019-09-22', 'YYYY-MM-DD'), 'Singapore', 'Marina Bay', 'Marina Bay Street Circuit', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Russian Grand Prix 2019', TO_DATE('2019-09-29', 'YYYY-MM-DD'), 'Russia', 'Sochi', 'Sochi Autodrom', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Japanese Grand Prix 2019', TO_DATE('2019-10-13', 'YYYY-MM-DD'), 'Japan', 'Mie', 'Suzuka Circuit', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Mexican Grand Prix 2019', TO_DATE('2019-10-27', 'YYYY-MM-DD'), 'Mexico', 'Mexico City', 'Autódromo Hermanos Rodríguez', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('United States Grand Prix 2019', TO_DATE('2019-11-03', 'YYYY-MM-DD'), 'USA', 'Texas', 'Circuit of the Americas', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Brazilian Grand Prix 2019', TO_DATE('2019-11-17', 'YYYY-MM-DD'), 'Brazil', 'São Paulo', 'Autódromo José Carlos Pace', 2019);
INSERT INTO Race (Race_Name, Race_Date, Country, State, Circuit_Name, Year) VALUES ('Abu Dhabi Grand Prix 2019', TO_DATE('2019-12-01', 'YYYY-MM-DD'), 'UAE', 'Abu Dhabi', 'Yas Marina Circuit', 2019);

-- Insert data for RaceSession table
-- 2019 Race Sessions (only race sessions)
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-AUS-2019', 'Australian Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120-records, 'R-BAH-2019', 'Bahrain Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-CHN-2019', 'Chinese Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-AZE-2019', 'Azerbaijan Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-SPA-2019', 'Spanish Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-MON-2019', 'Monaco Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-CAN-2019', 'Canadian Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-FRA-2019', 'French Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-AUT-2019', 'Austrian Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-GBR-2019', 'British Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-GER-2019', 'German Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-HUN-2019', 'Hungarian Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-BEL-2019', 'Belgian Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-ITA-2019', 'Italian Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-SIN-2019', 'Singapore Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-RUS-2019', 'Russian Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-JPN-2019', 'Japanese Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-MEX-2019', 'Mexican Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-USA-2019', 'United States Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-BRA-2019', 'Brazilian Grand Prix 2019', NULL);
INSERT INTO RaceSession (Duration, Race_SessionID, Race_Name, Changed_Duration) VALUES (120, 'R-ABU-2019', 'Abu Dhabi Grand Prix 2019', NULL);

-- Insert data for Result table
-- 2019 Results (Top 3 for each race)
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUS19-77', 1, 25, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUS19-44', 2, 18, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUS19-33', 3, 15, 33, 'Red Bull Racing', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH19-77', 2, 18, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BAH19-16', 3, 15, 16, 'Ferrari', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('CHN19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('CHN19-77', 2, 18, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('CHN19-5', 3, 15, 5, 'Ferrari', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AZE19-77', 1, 25, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AZE19-44', 2, 18, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AZE19-5', 3, 15, 5, 'Ferrari', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA19-77', 2, 18, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SPA19-33', 3, 15, 33, 'Red Bull Racing', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MON19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MON19-5', 2, 18, 5, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MON19-77', 3, 15, 77, 'Mercedes', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('CAN19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('CAN19-5', 2, 18, 5, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('CAN19-3', 3, 15, 3, 'Renault', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('FRA19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('FRA19-77', 2, 18, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('FRA19-16', 3, 15, 16, 'Ferrari', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT19-33', 1, 25, 33, 'Red Bull Racing', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT19-16', 2, 18, 16, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('AUT19-77', 3, 15, 77, 'Mercedes', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR19-77', 2, 18, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GBR19-16', 3, 15, 16, 'Ferrari', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GER19-33', 1, 25, 33, 'Red Bull Racing', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GER19-5', 2, 18, 5, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('GER19-26', 3, 15, 26, 'Toro Rosso', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN19-33', 2, 18, 33, 'Red Bull Racing', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('HUN19-5', 3, 15, 5, 'Ferrari', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL19-16', 1, 25, 16, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL19-5', 2, 18, 5, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BEL19-44', 3, 15, 44, 'Mercedes', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA19-16', 1, 25, 16, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA19-77', 2, 18, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ITA19-3', 3, 15, 3, 'Renault', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SIN19-5', 1, 25, 5, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SIN19-16', 2, 18, 16, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('SIN19-33', 3, 15, 33, 'Red Bull Racing', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS19-16', 2, 18, 16, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('RUS19-77', 3, 15, 77, 'Mercedes', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('JPN19-77', 1, 25, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('JPN19-5', 2, 18, 5, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('JPN19-44', 3, 15, 44, 'Mercedes', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MEX19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MEX19-5', 2, 18, 5, 'Ferrari', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('MEX19-77', 3, 15, 77, 'Mercedes', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('USA19-77', 1, 25, 77, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('USA19-33', 2, 18, 33, 'Red Bull Racing', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('USA19-44', 3, 15, 44, 'Mercedes', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BRA19-33', 1, 25, 33, 'Red Bull Racing', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BRA19-10', 2, 18, 10, 'Toro Rosso', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('BRA19-55', 3, 15, 55, 'McLaren', 2019);

INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU19-44', 1, 25, 44, 'Mercedes', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU19-33', 2, 18, 33, 'Red Bull Racing', 2019);
INSERT INTO Result (Result_ID, Position, Points, Driver_ID, Team_Name, Year) VALUES ('ABU19-16', 3, 15, 16, 'Ferrari', 2019);


