/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

if (select count(*) from dbo.Person) = 0
and (select count(*) from dbo.Address) = 0
and (select count(*) from dbo.Company) = 0
and (select count(*) from dbo.Employee) = 0

begin
insert into dbo.Person values ('Brad', 'Bailey');
insert into dbo.Person values ('John', 'Blakeley');
insert into dbo.Person values ('Linda', 'Hooks');
insert into dbo.Person values ('Erin', 'Rohrbaugh');
insert into dbo.Person values ('Floyd', 'Martinez');

insert into dbo.Address values ('4292 Irving Place', 'New York', 'NY', '10011');
insert into dbo.Address values ('734 Richland Avenue', 'Pinehurst', 'TX', '77362');
insert into dbo.Address values ('871 Ingram Street', 'Hamilton', 'OH', '45011');
insert into dbo.Address values ('2572 Pride Avenue', 'Bronx', 'NY', '10461');
insert into dbo.Address values ('3209 Renwick Drive', 'Newark', 'PA', '19714');
insert into dbo.Address values ('3575 Bee Street', 'Muskegon', 'MI', '49441');
insert into dbo.Address values ('086 Kooter Lane', 'Lattimore', 'NC', '28089');
insert into dbo.Address values ('175 Lost Creek Road', 'Bensalem', 'PA', '19020');

insert into dbo.Company values ('Gottschalks', 8);
insert into dbo.Company values ('Chief Auto Parts', 7);
insert into dbo.Company values ('Naturohair', 6);

insert into dbo.Employee values (2, 1, 'Gottschalks', 'Computer control programmer', 'Brad Bailey');
insert into dbo.Employee values (4, 3, 'Chief Auto Parts', 'Accountant', 'Linda Hooks');
insert into dbo.Employee (AddressId, PersonId, CompanyName, Position) values (1, 4, 'Chief Auto Parts', 'Sales manager');
insert into dbo.Employee values (3, 2, 'Gottschalks', 'Music arranger', 'John Blakeley');
insert into dbo.Employee (AddressId, PersonId, CompanyName, Position) values (5, 5, 'Naturohair', 'Project manager');
end