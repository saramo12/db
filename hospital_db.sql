


CREATE TABLE hospitals
(
  hospital_code VARCHAR(10) PRIMARY KEY,
  name VARCHAR(100),
  location VARCHAR(100)
);


CREATE TABLE users
(
  id INT PRIMARY KEY,
  username VARCHAR(100) UNIQUE NOT NULL,
  password VARCHAR(255) NOT NULL,
  full_name VARCHAR(100),
  role VARCHAR(50),
  -- admin, technician, viewer ...
  hospital_code VARCHAR(10),

  FOREIGN KEY (hospital_code) REFERENCES hospitals(hospital_code)
);

CREATE TABLE devices
(
  serial_number VARCHAR(100) PRIMARY KEY,
  hospital_code VARCHAR(10),
  bmd_code VARCHAR(50),
  floor VARCHAR(10),
  department VARCHAR(100),
  room VARCHAR(100),
  department_now VARCHAR(100),
  item VARCHAR(255),
  device_name VARCHAR(255),
  company VARCHAR(100),
  model VARCHAR(100),
  folder INT,
  delivery_date DATE,
  arrival_date DATE,
  installation_date DATE,
  manufacturer VARCHAR(100),
  inservice_date DATE,
  warranty_start DATE,
  warranty_end DATE,
  status VARCHAR(100),
  price VARCHAR(100),
  range_warranty INT,
  -- مدة الضمان بالسنين
  contact_number VARCHAR(100),
  contact_name VARCHAR(100),
  month_cal VARCHAR(10),
  assigned_user VARCHAR(100),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (hospital_code) REFERENCES hospitals(hospital_code),
  FOREIGN KEY (assigned_user) REFERENCES users(username)
);

CREATE TABLE workorders
(
  id int PRIMARY KEY,
  device_serial VARCHAR(100),
  issue_date DATE NOT NULL,
  -- تاريخ حدوث العطل
  fixed_by VARCHAR(100),
  -- من قام بالإصلاح
  issue_description TEXT,
  -- وصف المشكلة
  repair_description TEXT,
  -- ما تم إصلاحه
  used_spare_parts BOOLEAN,
  -- هل تم استخدام قطع غيار؟
  contacted_manufacturer BOOLEAN,
  -- هل تم التواصل مع المصنع؟
  downtime_duration INT,
  -- مدة العطل
  downtime_unit VARCHAR(10),
  -- وحدة الزمن (days, hours...)
  resolved_date DATE,
  -- تاريخ الإصلاح
  status VARCHAR(50) DEFAULT 'open',
  -- مفتوح، جاري، مغلق
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

  FOREIGN KEY (device_serial) REFERENCES devices(serial_number),
  FOREIGN KEY (fixed_by) REFERENCES users(username)
);

CREATE TABLE spare_parts_used
(
  part_id int PRIMARY KEY,
  workorder_id INT,
  part_name VARCHAR(255),
  quantity INT DEFAULT 1,
  note TEXT,

  FOREIGN KEY (workorder_id) REFERENCES workorders(id)
);


INSERT INTO hospitals
  ( hospital_code , name, location)
VALUES( '2024', 'wellCare', NULL);

INSERT INTO hospitals
  ( hospital_code , name, location)
VALUES( '2025', 'Alqatmya' , NULL);

INSERT INTO hospitals
  ( hospital_code , name, location)
VALUES( '2026', 'zahret_Almadaain' , NULL);

INSERT INTO users
  (id, username, password, full_name, role , hospital_code)
VALUES( 26, 'maryam', '1482', 'maryam Abdelmegeed', 'admin', NULL)

--2
INSERT INTO devices
  (bmd_code, device_name, model, serial_number, company, manufacturer, department_now, status ,hospital_code, assigned_user)
VALUES
  ('LB-129-02', 'SYSMEX CA-620', 'CA-620', '24449', 'SYSMEX EGYPT', 'SYSMEX EGYPT', 'LAB', 'working', '2025', 'maryam');
--3,4,5
INSERT INTO devices
  (device_name, department_now, status,hospital_code, assigned_user)
VALUES
  ('cuff for tourniquet', 'OR', 'working', '2025', 'maryam'),
  ('cuff big size for tourniquet', 'OR', 'working', '2025', 'maryam'),
  ('cuff big size for tourniquet', 'OR', 'working', '2025', 'maryam');
--6,7
INSERT INTO devices
  (bmd_code, device_name, model, serial_number, company, manufacturer, department_now, status, price, range_warranty, warranty_start, warranty_end,hospital_code, assigned_user)
VALUES
  ('IC-056-07', 'Infusion Pump', 'VP3', 'SK80304583', 'Mindray', 'TechnoWave', 'NICU', 'working', '500$', 4, '2019-01-04', '2023-03-31', '2025', 'maryam'),
  ('NC-056-01', 'Infusion Pump', 'VP3', 'SK80304646', 'Mindray', 'TechnoWave', 'NICU', 'working', '500$', 4, '2019-01-04', '2023-03-31', '2025', 'maryam');
--8,9
INSERT INTO devices
  (bmd_code, device_name, company, manufacturer, department_now, status,hospital_code, assigned_user)
VALUES
  ('CC-169-01', 'Tool table with safety box and basket', 'Alphamed', 'N.A', 'CCU', 'working', '2025', 'maryam'),
  ('CC-169-01', 'Tool table with safety box and basket', 'Alphamed', 'N.A', 'CCU', 'working', '2025', 'maryam');
--10,11,12,13,14,15
INSERT INTO devices
  (bmd_code, device_name, serial_number, manufacturer, department_now, status, warranty_start, warranty_end,hospital_code, assigned_user)
VALUES
  ('OR-165-01', 'Apron', '12378907', 'REEF', 'OR', 'working', '2021-01-12', '2022-01-12', '2025', 'maryam'),
  ('CC-165-01', 'Apron', '12378901', 'REEF', 'CCU', 'working', '2021-02-12', '2022-02-12', '2025', 'maryam'),
  ('CC-165-02', 'Apron', '12378902', 'REEF', 'CCU', 'working', '2021-03-12', '2022-03-12', '2025', 'maryam'),
  ('CC-165-03', 'Apron', '12378903', 'REEF', 'CCU', 'working', '2021-04-12', '2022-04-12', '2025', 'maryam'),
  ('CC-165-04', 'Apron', '12378904', 'REEF', 'CCU', 'working', '2021-05-12', '2022-05-12', '2025', 'maryam'),
  ('CC-165-05', 'Apron', '12378905', 'REEF', 'CCU', 'working', '2021-06-12', '2022-06-12', '2025', 'maryam');

INSERT INTO devices
  (bmd_code, device_name, serial_number, manufacturer, department_now, status, warranty_start, warranty_end,hospital_code, assigned_user)
VALUES
  ('CC-165-06', 'Apron', '12378906', 'REEF', 'CCU', 'working', '2021-07-12', '2022-07-12', '2025', 'maryam'),
  ('OR-165-02', 'Apron', '12378908', 'REEF', 'OR', 'working', '2021-08-12', '2022-08-12', '2025', 'maryam'),
  ('OR-165-03', 'Apron', '12378909', 'REEF', 'OR', 'working', '2021-09-12', '2022-09-12', '2025', 'maryam'),
  ('OR-165-04', 'Apron', '12378910', 'REEF', 'OR', 'working', '2021-10-12', '2022-10-12', '2025', 'maryam'),
  ('OR-165-05', 'Apron', '12378911', 'REEF', 'OR', 'working', '2021-11-12', '2022-11-12', '2025', 'maryam'),
  ('RD-165-01', 'Apron', '12378912', 'REEF', 'radiology', 'working', '2021-12-12', '2022-12-12', '2025', 'maryam'),
  ('RD-165-02', 'Apron', '12378913', 'REEF', 'radiology', 'working', '2021-12-13', '2022-12-13', '2025', 'maryam'),
  ('RD-165-03', 'Apron', '12378914', 'REEF', 'radiology', 'working', '2021-12-14', '2022-12-14', '2025', 'maryam'),
  ('RD-165-04', 'Apron', '12378915', 'REEF', 'radiology', 'working', '2021-12-15', '2022-12-15', '2025', 'maryam'),
  ('RD-165-05', 'Apron', '12378916', 'REEF', 'radiology', 'working', '2021-12-16', '2022-12-16', '2025', 'maryam');
--26
INSERT INTO devices
  (bmd_code, device_name, model, serial_number, manufacturer, company, department_now, status, price, range_warranty, warranty_start, warranty_end,hospital_code, assigned_user)
VALUES
  ('ST-145-01', 'bench top autocklve', 'vacuklav 23 B+', '201923-B1254', 'melga', 'safwan', 'Sterilization', 'working', '109440', 1, '2019-09-09', '2020-09-09', '2025', 'maryam');
--27
INSERT INTO devices
  (bmd_code, device_name, manufacturer, company, department_now, status, price, range_warranty, warranty_start, warranty_end,hospital_code, assigned_user)
VALUES
  ('ST-112-01', 'Shelves, Stainless steel', 'Local', 'Delta Medical', 'Sterilization', 'working', '#4', 5, '2019-04-15', '2024-04-15', '2025', 'maryam'),
  ('ST-112-02', 'Shelves, Stainless steel', 'Local', 'Delta Medical', 'Sterilization', 'working', '#4', 5, '2019-04-15', '2024-04-15', '2025', 'maryam'),
  ('ST-112-03', 'Shelves, Stainless steel', 'Local', 'Delta Medical', 'Sterilization', 'working', '#4', 5, '2019-04-01', '2024-04-15', '2025', 'maryam'),
  ('ST-112-04', 'Shelves, Stainless steel', 'Local', 'Delta Medical', 'Sterilization', 'working', '#4', 5, '2019-04-01', '2024-04-15', '2025', 'maryam');
--32 ,59
INSERT INTO devices
  (bmd_code, device_name, department_now, status,hospital_code, assigned_user)
VALUES
  ('AM-195-01', 'o2 cylinder', 'Ambulance', 'working', '2025', 'maryam'),
  ('AM-195-02', 'o2 cylinder', 'Ambulance', 'working', '2025', 'maryam'),
  ('AM-195-03', 'o2 cylinder . Portable', 'Ambulance', 'working', '2025', 'maryam'),
  ('OR-184-01', 'co2 cylinder', 'OR', 'working', '2025', 'maryam'),
  ('OR-184-02', 'co2 cylinder', 'OR', 'working', '2025', 'maryam'),
  ('OR-185-01', 'hellium cylinder', 'OR', 'working', '2025', 'maryam'),
  ('NC-079-03', 'O2 flowmeter', 'nicu', 'working', '2025', 'maryam'),
  ('NC-079-04', 'O2 flowmeter', 'nicu', 'working', '2025', 'maryam'),
  ('NC-079-05', 'O2 flowmeter', 'nicu', 'working', '2025', 'maryam'),
  ('NC-079-06', 'O2 flowmeter', 'nicu', 'working', '2025', 'maryam'),
  ('NC-079-07', 'O2 flowmeter', 'nicu', 'working', '2025', 'maryam');
--38
INSERT INTO devices
  (bmd_code, device_name, serial_number,manufacturer,company, department_now, price,range_warranty, warranty_start, warranty_end, status,hospital_code, assigned_user)
VALUES
  ('IC-079-01', 'O2 flowmeter', 'FMO151-A07370CH', 'Amico', 'oxygen house' , 'ICU', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IC-079-02', 'O2 flowmeter', 'FMO151-A07337CH', 'Amico', 'oxygen house' , 'ICU', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IC-079-03', 'O2 flowmeter', 'fmo151-A07379CH', 'Amico', 'oxygen house', 'ICU', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IC-079-04', 'O2 flowmeter', 'FMO151-A07215CH', 'Amico', 'oxygen house', 'ICU', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IC-079-05', 'O2 flowmeter', 'FMO151-A07360CH', 'Amico', 'oxygen house' , 'ICU', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IC-079-06', 'O2 flowmeter', 'FMO151-A07294CH', 'Amico', 'oxygen house', 'ICU', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam');
--44
INSERT INTO devices
  (bmd_code, device_name, serial_number, company, department_now, status,hospital_code, assigned_user)
VALUES
  ('IC-079-07', 'O2 flowmeter', '19012118', 'el eman', 'ICU', 'working', '2025', 'maryam'),
  ('IC-079-08', 'O2 flowmeter', '19011952', 'el eman', 'ICU', 'working', '2025', 'maryam'),
  ('IC-079-09', 'O2 flowmeter', '19012104', 'el eman', 'ICU', 'working', '2025', 'maryam'),
  ('IC-079-10', 'O2 flowmeter', NULL, 'el eman', 'ICU', 'working', '2025', 'maryam'),
  ('IC-079-11', 'O2 flowmeter', NULL, NULL, 'ICU', 'working', '2025', 'maryam'),
  ('IC-079-12', 'O2 flowmeter', NULL, NULL, 'ICU', 'working', '2025', 'maryam'),
  ('IC-079-13', 'O2 flowmeter', NULL, NULL, 'ICU', 'working', '2025', 'maryam');
--51
INSERT INTO devices
  (bmd_code, device_name, serial_number, manufacturer,company, department_now, price, warranty_start, warranty_end, status,hospital_code, assigned_user)
VALUES
  ('IN-079-01', 'O2 flowmeter', 'fmo151-A0735CH', 'Amico', 'oxygen house'  , 'in patient', 1114, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IN-079-02', 'O2 flowmeter', 'fmo151-A07206CH', 'Amico', 'oxygen house'  , 'in patient', 1114, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IN-079-03', 'O2 flowmeter', 'fmo151-A07236CH', 'Amico', 'oxygen house' , 'in patient', 1114, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IN-079-04', 'O2 flowmeter', 'fmo151-A07208CH', 'Amico', 'oxygen house'  , 'in patient', 1114, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IN-079-05', 'O2 flowmeter', 'fmo151-A07265CH', 'Amico', 'oxygen house' , 'in patient', 1114, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('IN-079-06', 'O2 flowmeter', 'FMO151-A07356CH', 'Amico', 'oxygen house'  , 'in patient', 1114, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam');
--57 ,65-69
INSERT INTO devices
  (bmd_code, device_name, serial_number,manufacturer, company, department_now,price, range_warranty, warranty_start, warranty_end, status,hospital_code, assigned_user)
VALUES
  ('NC-079-01', 'O2 flowmeter', 'FMO151-A07105CH', 'Amico', 'oxygen house' , 'nicu', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('NC-079-02', 'O2 flowmeter', 'FMO151-A07338CH', 'Amico', 'oxygen house', 'nicu', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('OR-079-01', 'O2 flowmeter', 'fmo151-A07333CH', 'Amico' , 'oxygen house', 'OR', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('OR-079-02', 'O2 flowmeter', 'fmo151-A07194CH', 'Amico' , 'oxygen house', 'OR', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('OR-079-03', 'O2 flowmeter', 'fmo151-A07267CH', 'Amico' , 'oxygen house', 'OR', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('OR-079-04', 'O2 flowmeter', 'fmo151-A07324CH', 'Amico' , 'oxygen house', 'OR', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('OR-079-05', 'O2 flowmeter', 'fmo151-A07192CH', 'Amico' , 'oxygen house', 'OR', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam'),
  ('OR-079-06', 'O2 flowmeter', 'fmo151-A07264CH', 'Amico' , 'oxygen house', 'OR', 1114, 1, '2019-06-25', '2020-06-25', 'working', '2025', 'maryam');


--70
INSERT INTO devices
  (bmd_code, device_name, serial_number, company, department_now, status,hospital_code, assigned_user)
VALUES
  ('ER-079-01', 'O2 flowmeter', '1901235', 'el eman', 'EMR', 'working', '2025', 'maryam'),
  ('ER-079-02', 'O2 flowmeter', '19012109', 'el eman', 'EMR', 'working', '2025', 'maryam'),
  ('ER-079-03', 'O2 flowmeter', '19012089', 'el eman', 'EMR', 'working', '2025', 'maryam'),
  ('ER-079-04', 'O2 flowmeter', '19012119', 'el eman', 'EMR', 'working', '2025', 'maryam'),
  ('ER-079-05', 'O2 flowmeter', '19012102', 'el eman', 'EMR', 'working', '2025', 'maryam'),
  ('ER-079-06', 'O2 flowmeter', '19012107', 'el eman', 'EMR', 'working', '2025', 'maryam'),
  ('CC-079-01', 'O2 flowmeter', '19012501', 'el eman', 'CCU', 'working', '2025', 'maryam'),
  ('rd-079-03', 'O2 flowmeter', '19012419', 'el eman', 'radiology', 'working', '2025', 'maryam'),
  ('rd-079-04', 'O2 flowmeter', '19012553', 'el eman', 'radiology', 'working', '2025', 'maryam'),
  ('EN-079-03', 'O2 flowmeter', 'N.A', 'el eman', 'day care', 'working', '2025', 'maryam'),
  ('EN-079-04', 'O2 flowmeter', 'N.A', 'el eman', 'day care', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'store', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', NULL, 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'in patient', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'in patient', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'GIT', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'day care', 'working', '2025', 'maryam'),
  (NULL, 'O2 flowmeter', 'N.A', 'el eman', 'day care', 'working', '2025', 'maryam');

--106
INSERT INTO devices
  (bmd_code, device_name, serial_number,manufacturer,company, department_now, status,hospital_code, assigned_user)
VALUES
  ('OR-079-01', 'O2 flowmeter', 'fmo151-A07333CH', 'Amico', 'oxygen house' , 'OR', 'working', '2025', 'maryam'),
  ('OR-079-02', 'O2 flowmeter', 'fmo151-A07194CH', 'Amico', 'oxygen house' , 'OR', 'working', '2025', 'maryam'),
  ('OR-079-03', 'O2 flowmeter', 'fmo151-A07267CH', 'Amico', 'oxygen house' , 'OR', 'working', '2025', 'maryam'),
  ('OR-079-04', 'O2 flowmeter', 'fmo151-A07324CH', 'Amico', 'oxygen house' , 'OR', 'working', '2025', 'maryam'),
  ('OR-079-05', 'O2 flowmeter', 'fmo151-A07192CH', 'Amico', 'oxygen house' , 'OR', 'working', '2025', 'maryam'),
  ('OR-079-06', 'O2 flowmeter', NULL, 'Amico', 'oxygen house' , 'OR', 'working', '2025', 'maryam');
('OR-079-07', 'O2 flowmeter',  NULL, 'Amico','oxygen house' ,'OR', 'working','2025','maryam');
('OR-079-08', 'O2 flowmeter',  NULL, 'Amico','oxygen house' ,'OR', 'working','2025','maryam');
('OR-079-09', 'O2 flowmeter',  NULL, 'Amico','oxygen house' ,'OR', 'working','2025','maryam');
('OR-079-10', 'O2 flowmeter',  NULL, 'Amico','oxygen house' ,'OR', 'working','2025','maryam');
('OR-079-11', 'O2 flowmeter',  NULL, 'Amico','oxygen house' ,'OR', 'working','2025','maryam');
('OR-079-12', 'O2 flowmeter',  NULL, 'Amico','oxygen house' ,'OR', 'working','2025','maryam');
(NULL, 'Harmonic',  '23010109', NULL,NULL ,'OR', 'working','2025','maryam');
('OR-085-01-05', 'rem adult universal patient return electrode',  NULL, 'covidien','ghaliongui' ,'OR', 'working','2025','maryam');
('OOR-085-02-05', 'rem adult universal patient return electrode',  NULL, 'covidien','ghaliongui' ,'OR', 'working','2025','maryam');
--118
INSERT INTO devices
  (bmd_code, device_name,model, serial_number,manufacturer, company, department_now,price, range_warranty, warranty_start, warranty_end, status,hospital_code, assigned_user)
VALUES
  ('IC-141-01', 'Ultrasonic nebulizer', 'ATOMSANILZER303' , '180900795', 'ATOM', 'Egyption industrial enginerinng office' , 'ICU', 23000, 5, '2019-03-07', '2024-03-7', 'working', '2025', 'maryam'),
  ('ER-080-01', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF198241', NULL, 'future medical', 'ICU', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),--HERE
  ('IC-080-01', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF1975095', NULL, 'future medical' , 'ICU', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  ('IC-080-02', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF198212', NULL, 'future medical' , 'CCU', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  ('IC-080-03', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF195072', NULL, 'future medical' , 'in patient', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  ('IN-080-01', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF197857', NULL, 'future medical' , 'day care', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  ('NC-080-01', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF198235', NULL, 'future medical' , 'EMR', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  ('MG-080-01', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF195507', NULL, 'future medical' , 'NICU', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  ('OR-080-01', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF195434', NULL, 'future medical' , 'OR', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  ('OR-080-02', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF197075', NULL, 'future medical' , 'OR', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  ('OR-080-03', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF197086', NULL, 'future medical' , 'day care', 3648, 1, '2019-07-03', '2020-07-03', 'working', '2025', 'maryam'),
  (NULL, 'Oxygen Cylinder - "E"SIZE', NULL, 'HF195499', NULL, 'future medical' , 'STORE BM', NULL, NULL, NULL, NULL, 'working', '2025', 'maryam'),
  ('OR-080-01', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF195434', NULL, 'future medical' , 'OR', NULL, NULL, NULL, NULL, 'working', '2025', 'maryam'),
  ('OR-080-02', 'Oxygen Cylinder - "E"SIZE', NULL, 'HF197075', NULL, 'future medical' , 'OR', NULL, NULL, NULL, NULL, 'working', '2025', 'maryam'),
  ('ER-166-01', 'automatic door stanlisteel', NULL, NULL, 'alphamed', 'falphamed' , 'EMR', NULL, NULL, NULL, NULL, 'working', '2025', 'maryam'),
  ('OR-004-01', 'OR Sliding Door', 'Lindo', '4669' , 'SHD', 'Delta Medical' , 'OR', NULL, 5, '2019-04-15', '2024-04-15', 'working', '2025', 'maryam'),
  ----------
  ('OR-004-02', 'OR Sliding Door', 'Lindo', '4670' , 'SHD', 'Delta Medical' , 'OR', NULL, 5, '2019-04-15', '2024-04-15', 'working', '2025', 'maryam'),


--500 sara----
('EN-129-01', 'video system',  'CV-160',  '7105071','OLYMPS' ,'External source','GIT', NULL, NULL,NULL, NULL, 'working','2025','sara');
('EN-129-02', 'video system',  'OLYMPUS CV-260SL',  '7823943',NULL ,'ENO EX','GIT', NULL, NULL,'3/7/2022', NULL, 'working','2025','sara');
('OR-O89-02', 'insuflator',  'ENDOFLATOR UI400',  'VP06229','STORZ' ,'Egyptien group','OR', NULL, '10/5/2021','3/7/2022', NULL, 'working','2025','sara');
('OR-O89-01', 'insuflator',  'ENDOFLATOR UI400',  'XS1955','STORZ' ,'Egyptien group','OR', NULL, '4/21/2019','4/21/2020', NULL, 'working','2025','sara');
('op-153-01', 'spirometry ',  NULL,  '200103712','spirostick' ,'Egyptien group','opd', NULL, '4/21/2019','4/21/2020', NULL, 'working','2025','sara');










