drop table if exists `patients`;

CREATE TABLE patients (
    UHID int NOT NULL AUTO_INCREMENT,
    FirstName varchar(255) NOT NULL,
    MiddleName varchar(255),
    LastName varchar(255) NOT NULL,
    DOB Date NOT NULL,
    Gender varchar(255) NOT NULL,
    ContactNumber BIGINT NOT NULL,
    EmailId varchar(255),
    Aadhar varchar(20),
    RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UHID)
);

ALTER TABLE patients ADD Aadhar varchar(20);

--alter table patients drop index UC_Patient;

ALTER TABLE patients
ADD CONSTRAINT UC_Patient UNIQUE (FirstName, LastName, DOB, ContactNumber, Aadhar);

drop table if exists `patient_address`;

CREATE TABLE patient_address (
    UHID int NOT NULL UNIQUE,
    AddressLine1 varchar(255) NOT NULL,
    AddressLine2 varchar(255),
    Landmark varchar(255),
    Area varchar(255),
    City varchar(255),
    District varchar(255),
    State varchar(255),
    PINCode BIGINT,
    EmergencyContactNumber BIGINT,
    RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (UHID) references patients(UHID)
);

drop table if exists `appointments`;

CREATE TABLE appointments (
    UHID int NOT NULL,
    FirstName varchar(255) NOT NULL,
    MiddleName varchar(255),
    LastName varchar(255) NOT NULL,
    DOB Date NOT NULL,
    Gender varchar(255) NOT NULL,
    Consultant varchar(255) NOT NULL,
    DateOfAppointment Date NOT NULL,
    TimeOfAppointment Time NOT NULL,
    ContactNumber BIGINT NOT NULL,
    EmailId varchar(255),
    ReferredBy varchar(255),
    ComingFromCity varchar(255),
    ComingFromArea varchar(255),
    PatientRelativeName varchar(255),
    RelationWithPatient varchar(255),
    RelativeContactNumber BIGINT,
    RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (UHID, DateOfAppointment),
    FOREIGN KEY (UHID) references patients(UHID)
);


drop table if exists `patient_medical_facts`;

CREATE TABLE patient_medical_facts (
  UHID int NOT NULL,
  FirstName varchar(255) NOT NULL,
  LastName varchar(255) NOT NULL,
  BloodGroup varchar(255) NOT NULL,
  BloodPressureSystolic varchar(255),
  BloodPressureDiastolic varchar(255),
  KnownMedicalCondition1 varchar(300),
  KnownMedicalCondition2 varchar(300),
  KnownMedicalCondition3 varchar(300),
  DrugAllergy1 varchar(300),
  DrugAllergy2 varchar(300),
  PreviousSystemicTreatment1 varchar(300),
  PreviousSystemicTreatment2 varchar(300),
  PreviousSystemicTreatment3 varchar(300),
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (UHID) references patients(UHID)
);

drop table if exists `patient_occular_history`;
CREATE TABLE patient_occular_history (
  UHID int NOT NULL,
  FirstName varchar(255) NOT NULL,
  LastName varchar(255) NOT NULL,
  KnownOccularCondition1 varchar(300),
  KnownOccularCondition2 varchar(300),
  KnownOccularCondition3 varchar(300),
  OpticalSurgeryHistory1 varchar(300),
  OpticalSurgeryHistory2 varchar(300),
  OpticalSurgeryHistory3 varchar(300),
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (UHID) references patients(UHID)
);

drop table if exists `patient_occular_facts`;
CREATE TABLE patient_occular_facts (
  UHID int NOT NULL,
  UsingSpectacles ENUM('YES', 'NO'),
  UsingContacts ENUM('YES', 'NO'),
  RightGlassPrescription varchar(100),
  LeftGlassPrescription varchar(100),
  EyeColor varchar(100),
  PreviousTreatment1 varchar(300),
  PreviousTreatment2 varchar(300),
  PreviousTreatment3 varchar(300),
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (UHID) references patients(UHID)
);

drop table if exists `optometary_results`;

CREATE TABLE optometary_results (
  UHID int NOT NULL,
  AutorefactrometerReadingRight varchar(100),
  AutorefactrometerReadingLeft varchar(100),
  KeratometryReadingRight varchar(100),
  KeratometryReadingLeft varchar(100),
  UnaidedVisionRight varchar(100),
  UnaidedVisionLeft varchar(100),
  VisionWithPinhole varchar(100),
  Retinoscopy varchar(100),
  Acceptance varchar(100),
  IntraOccularPressure ENUM('SCHIOTZ', 'NCT', 'APPLANATION', 'DIGITALLY'),
  SAC varchar(100),
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (UHID) references patients(UHID)
);

drop table if exists `optical_investigation`;

CREATE TABLE optical_investigation (
  UHID int NOT NULL,
  Procedure1 varchar(100),
  Procedure2 varchar(100),
  Procedure3 varchar(100),
  InvestigationSummary varchar(300),
  XylocaineTest varchar(300),
  BloodPressureSystolic varchar(100),
  BloodPressureDiastolic varchar(100),
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (UHID) references patients(UHID)
);

drop table if exists `occular_prescription`;

CREATE TABLE occular_prescription (
  UHID int NOT NULL,
  OpticalPrescription1 varchar(300),
  OpticalPrescription2 varchar(300),
  OpticalPrescription3 varchar(300),
  Precaution1 varchar(300),
  Precaution2 varchar(300),
  Precaution3 varchar(300),
  SpecialistReferral ENUM('YES', 'NO'),
  ReferredSpecialist1 varchar(300),
  ReferredSpecialist2 varchar(300),
  ReferredSpecialist3 varchar(300),
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (UHID) references patients(UHID)
);

// to be imported from central medicine database
drop talbe if exists `medicine_master`;
CREATE TABLE medicine_master (
  MedicineID
  MedicineName
  ManufacturerName
  MedicineRemarks
);


drop table if exists `medical_prescription_templates` ;
CREATE TABLE medical_prescription_templates (
  TemplateID int NOT NULL,
  TemplateName varchar(300) NOT NULL,
  Description varchar(300) NOT NULL,
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
);

drop table if exists `template_medicines`;
CREATE TABLE template_medicines (
  TemplateID int NOT NULL,
  MedicineID varchar(100) NOT NULL,
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY(TemplateID, MedicineID) references medical_prescription_templates(TemplateID), medicine_master(MedicineID)
);


drop table if exists `patient_complaints`;

CREATE TABLE patient_complaints (
  UHID int NOT NULL,
  Complaint1 varchar(300),
  Complaint1DurationWeeks varchar(100),
  Complaint2 varchar(300),
  Complaint2DurationWeeks varchar(100),
  Complaint3 varchar(300),
  Complaint3DurationWeeks varchar(100),
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (UHID) references patients(UHID)
);

drop table if exists `stafflogin`;
CREATE TABLE stafflogin (
  username varchar(255) NOT NULL,
  FirstName varchar(255) NOT NULL,
  MiddleName varchar(255),
  LastName varchar(255) NOT NULL,
  DOB Date NOT NULL,
  Gender varchar(255) NOT NULL,
  ContactNumber BIGINT NOT NULL,
  EmailId varchar(255),
  password varchar(32) NOT NULL,
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (username)
);

INSERT INTO stafflogin values('pkul3003', 'Parag', null, 'kulkarni', '1981-03-02', 'male', '9922962322',
  'pkul3003@gmail.com', MD5('abcd1234'), DEFAULT);

INSERT INTO stafflogin VALUES ('pjoshi123', 'Prasad','Dattatray','Jpshi','1981-06-06','male', '9657564333',
  'joship@gmail.com', MD5('abcd1234)', DEFAULT);


drop table if exists `staffroles`;
CREATE TABLE staffroles (
  username varchar(255) NOT NULL,
  Admin ENUM('yes', 'no'),
  Receptionist ENUM('yes', 'no'),
  Consultant ENUM('yes', 'no'),
  Optometerist ENUM('yes', 'no'),
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (username) references stafflogin(username)
);

INSERT INTO staffroles VALUES ('pkul3003', 'yes', 'yes', 'no', 'no', DEFAULT);
INSERT INTO staffroles VALUES ('pkul3003', 'yes', 'yes', 'no', 'no', DEFAULT);


drop table if exists `staff_address`;

CREATE TABLE staff_address (
  username varchar(255) NOT NULL,
  FirstName varchar(255) NOT NULL,
  LastName varchar(255) NOT NULL,
  AddressLine1 varchar(255) NOT NULL,
  AddressLine2 varchar(255),
  Landmark varchar(255),
  City varchar(255),
  State varchar(255),
  PINCode BIGINT,
  EmergencyContactNumber BIGINT,
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (username) references stafflogin(username)
);

drop table if exists `consultants`;

CREATE TABLE consultants (
  username varchar(255) NOT NULL,
  FirstName varchar(255) NOT NULL,
  LastName varchar(255) NOT NULL,
  PrimarySpeciality varchar(300) NOT NULL,
  SecondarySpeciality varchar(300),
  HighestQualification varchar(300) NOT NULL,
  Physician ENUM('yes', 'no') NOT NULL,
  Surgeon ENUM('yes', 'no') NOT NULL,
  EmergencyContactNumber BIGINT,
  RecordTouchDate TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (username) references stafflogin(username)
);
