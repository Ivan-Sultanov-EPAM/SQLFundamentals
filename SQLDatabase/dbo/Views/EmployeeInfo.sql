CREATE VIEW [dbo].[EmployeeInfo]
	AS
	SELECT
	[e].[Id] AS EmployeeId,
	ISNULL([e].[EmployeeName], Concat([p].[FirstName], ' ', [p].[LastName])) AS EmployeeFullName,
	CONCAT([a].[ZipCode], '_', [a].[State], ', ', [a].[City], '-', [a].[Street]) AS EmployeeFullAddress,
	CONCAT([e].[CompanyName], ' (', [e].[Position], ')') AS EmployeeCompanyInfo
	FROM [Employee] e
	LEFT JOIN [Address] a ON [e].[AddressId] = [a].[Id]
	LEFT JOIN [Person] p ON [e].PersonId = [p].[Id]
	ORDER BY [e].[CompanyName], [a].[City] ASC OFFSET 0 ROWS;
