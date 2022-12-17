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
insert into dbo.Person values
('Brad', 'Bailey'),
('John', 'Blakeley'),
('Linda', 'Hooks'),
('Erin', 'Rohrbaugh'),
('Floyd', 'Martinez');

insert into dbo.Address values
('4292 Irving Place', 'New York', 'NY', '10011'),
('734 Richland Avenue', 'Pinehurst', 'TX', '77362'),
('871 Ingram Street', 'Hamilton', 'OH', '45011'),
('2572 Pride Avenue', 'Bronx', 'NY', '10461'),
('3209 Renwick Drive', 'Newark', 'PA', '19714'),
('3575 Bee Street', 'Muskegon', 'MI', '49441'),
('086 Kooter Lane', 'Lattimore', 'NC', '28089'),
('175 Lost Creek Road', 'Bensalem', 'PA', '19020');

insert into dbo.Employee values 
(2, 1, 'Gottschalks', 'Computer control programmer', 'Brad Bailey'),
(4, 3, 'Chief Auto Parts', 'Accountant', 'Linda Hooks'),
(3, 2, 'Gottschalks', 'Music arranger', 'John Blakeley'),
(1, 4, 'Chief Auto Parts', 'Sales manager', null),
(5, 5, 'Naturohair', 'Project manager', null);
end