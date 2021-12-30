USE AdvBIStaging;

DROP TABLE IF EXISTS [dbo].[HealthInsuranceStagingTable] 
DROP TABLE IF EXISTS [dbo].[IncomeStagingTable] 
DROP TABLE IF EXISTS [dbo].[MedicareStagingTable] 
DROP TABLE IF EXISTS [dbo].[MedicaidStagingTable] 
DROP TABLE IF EXISTS [dbo].[PovertyStagingTable] 

CREATE TABLE [HealthInsuranceStagingTable] (
    [uid] varchar(50),
    [age] smallint,
    [state] varchar(50),
    [coverage] varchar(50),
    [year] smallint,
    [month] smallint
)

CREATE TABLE [IncomeStagingTable] (
    [State] varchar(50),
    [Personal Income (Milionsof Dollars)] decimal(38,0),
    [Per Capital Income (Dollars)] decimal(38,0),
    [Regional Price Parity (Base line is 100)] decimal(38,0),
    [Year] smallint,
    [Month] smallint
)

CREATE TABLE [MedicareStagingTable] (
    [State] varchar(50),
    [Year] smallint,
    [Age Group] nvarchar(5),
    [Gender] varchar(50),
    [Race] varchar(50),
    [Total Cost] decimal(38,0),
    [IP Actual Cost] decimal(38,0),
    [OP Actual Cost] decimal(38,0),
    [Prescribed Drugs] decimal(38,0),
    [Hospice Benefits] decimal(38,0),
    [Federally Qualified Health Center] decimal(38,0),
    [Rehabilative Services] decimal(38,0),
    [Home Health Services] decimal(38,0),
    [Month] smallint
)


CREATE TABLE [MedicaidStagingTable] (
    [State] varchar(50),
    [Year] smallint,
    [Age Group] nvarchar(5),
    [Gender] varchar(50),
    [Race] varchar(50),
    [Total Cost] decimal(38,0),
    [IP Actual Cost] decimal(38,0),
    [OP Actual Cost] decimal(38,0),
    [Prescribed Drugs] decimal(38,0),
    [Hospice Benefits] decimal(38,0),
    [Federally Qualified Health Center] decimal(38,0),
    [Rehabilative Services] decimal(38,0),
    [Home Health Services] decimal(38,0),
    [Month] smallint
)

CREATE TABLE [PovertyStagingTable] (
    [State] varchar(50),
    [Year] smallint,
    [Age Group] nvarchar(5),
    [Gender] varchar(50),
    [Race] varchar(50),
    [Poverty Rate] float,
    [Month] smallint
)

USE	AdvBI;

DROP TABLE IF EXISTS [dbo].[HealthInsuranceSourceTable] 
DROP TABLE IF EXISTS [dbo].[IncomeSourceTable] 
DROP TABLE IF EXISTS [dbo].[MedicaidSourceTable] 
DROP TABLE IF EXISTS [dbo].[MedicareSourceTable] 
DROP TABLE IF EXISTS [dbo].[PovertySourceTable] 
DROP TABLE IF EXISTS [dbo].[AgeGroupTable] 
DROP TABLE IF EXISTS [dbo].[CoverageTypeTable] 
DROP TABLE IF EXISTS [dbo].[GenderTable] 
DROP TABLE IF EXISTS [dbo].[RaceTable] 
DROP TABLE IF EXISTS [dbo].[StateTable] 
DROP TABLE IF EXISTS [dbo].[DateTimeTable] 


CREATE TABLE [dbo].[AgeGroupTable] (
	[ID] int PRIMARY KEY,
	[Age Group] nvarchar(5)
)

CREATE TABLE [dbo].[CoverageTypeTable] (
	[ID] int PRIMARY KEY,
	[Coverage Type] varchar(50)
)

CREATE TABLE [dbo].[GenderTable] (
	[ID] int PRIMARY KEY,
	[Gender] varchar(50)
)

CREATE TABLE [dbo].[RaceTable] (
	[ID] int PRIMARY KEY,
	[Race] varchar(50)
)

CREATE TABLE [dbo].[StateTable] (
	[State] varchar(50),
	[Abbreviation] varchar(2) PRIMARY KEY
)

CREATE TABLE [dbo].[DateTimeTable] (
	[ID] int PRIMARY KEY,
	[Month] smallint,
	[Year] smallint
)

CREATE TABLE [dbo].[HealthInsuranceSourceTable] (
    [State ID] varchar(2),
    [Age Group ID] int,
    [Coverage Type ID] int,
	[DateTime ID] int,
    [Total People] numeric(20,0),
	FOREIGN KEY ([State ID]) REFERENCES StateTable([Abbreviation]),
	FOREIGN KEY ([DateTime ID]) REFERENCES DateTimeTable([ID]),
	FOREIGN KEY ([Age Group ID]) REFERENCES AgeGroupTable([ID]),
	FOREIGN KEY ([Coverage Type ID]) REFERENCES CoverageTypeTable([ID])
)
	
CREATE TABLE [dbo].[IncomeSourceTable] (
    [State ID] varchar(2),
    [Personal Income (Milions of Dollars)] int,
    [Per Capital Income (Dollars)] int,
    [Regional Price Parity (Base line is 100)] decimal(38,0),
	[DateTime ID] int,
	FOREIGN KEY ([DateTime ID]) REFERENCES DateTimeTable([ID]),
	FOREIGN KEY ([State ID]) REFERENCES StateTable([Abbreviation])
)

CREATE TABLE [dbo].[MedicaidSourceTable] (
    [State ID] varchar(2),
	[Age Group ID] int,
    [Gender ID] int,
    [Race ID] int,
	[DateTime ID] int,
	[Total Cost] decimal(38,0),
	[IP Actual Cost] decimal(38,0),
	[OP Actual Cost] decimal(38,0),
	[Prescribed Drugs] decimal(38,0),
	[Hospice Benefits] decimal(38,0),
	[Federally Qualified Health Center] decimal(38,0),
	[Rehabilative Services] decimal(38,0),
	[Home Health Services] decimal(38,0),
	FOREIGN KEY ([State ID]) REFERENCES StateTable([Abbreviation]),
	FOREIGN KEY ([Age Group ID]) REFERENCES AgeGroupTable([ID]),
	FOREIGN KEY ([Gender ID]) REFERENCES GenderTable([ID]),
	FOREIGN KEY ([DateTime ID]) REFERENCES DateTimeTable([ID]),
	FOREIGN KEY ([Race ID]) REFERENCES RaceTable([ID])
)

CREATE TABLE [dbo].[MedicareSourceTable] (
    [State ID] varchar(2),
	[Age Group ID] int,
    [Gender ID] int,
    [Race ID] int,
	[DateTime ID] int,
	[Total Cost] decimal(38,0),
	[IP Actual Cost] decimal(38,0),
	[OP Actual Cost] decimal(38,0),
	[Prescribed Drugs] decimal(38,0),
	[Hospice Benefits] decimal(38,0),
	[Federally Qualified Health Center] decimal(38,0),
	[Rehabilative Services] decimal(38,0),
	[Home Health Services] decimal(38,0),
	FOREIGN KEY ([State ID]) REFERENCES StateTable([Abbreviation]),
	FOREIGN KEY ([Age Group ID]) REFERENCES AgeGroupTable([ID]),
	FOREIGN KEY ([Gender ID]) REFERENCES GenderTable([ID]),
	FOREIGN KEY ([DateTime ID]) REFERENCES DateTimeTable([ID]),
	FOREIGN KEY ([Race ID]) REFERENCES RaceTable([ID])
)

CREATE TABLE [dbo].[PovertySourceTable] (
    [State ID] varchar(2),
	[Age Group ID] int,
    [Gender ID] int,
    [Race ID] int,
	[DateTime ID] int,
	[Poverty Rate] float,
	FOREIGN KEY ([State ID]) REFERENCES StateTable([Abbreviation]),
	FOREIGN KEY ([Age Group ID]) REFERENCES AgeGroupTable([ID]),
	FOREIGN KEY ([Gender ID]) REFERENCES GenderTable([ID]),
	FOREIGN KEY ([DateTime ID]) REFERENCES DateTimeTable([ID]),
	FOREIGN KEY ([Race ID]) REFERENCES RaceTable([ID])
)

