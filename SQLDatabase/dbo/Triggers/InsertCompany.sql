CREATE TRIGGER [dbo].[InsertCompany]
ON [dbo].[Employee]
AFTER INSERT
AS
BEGIN
	INSERT INTO dbo.Company (Name, AddressId)
	SELECT CompanyName, AddressId
	FROM INSERTED
END
