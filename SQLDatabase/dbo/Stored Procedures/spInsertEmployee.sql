CREATE PROCEDURE [dbo].[spInsertEmployee]
	@EmployeeName nvarchar(100) = NULL,
	@FirstName nvarchar(50) = NULL,
	@LastName nvarchar(50) = NULL,
	@CompanyName nvarchar(20),
	@Position nvarchar(30) = NULL,
	@Street nvarchar(50),
	@City nvarchar(20) = NULL,
	@State nvarchar(50) = NULL,
	@ZipCode nvarchar(50) = NULL
AS
IF (@EmployeeName IS NULL AND @FirstName IS NULL AND @LastName IS NULL) OR
	TRIM(ISNULL(@EmployeeName, '') + ISNULL(@FirstName, '') + ISNULL(@LastName, '')) = ''

BEGIN
	PRINT 'At least EmployeeName or FirstName or LastName is required.'
	RETURN
END

BEGIN
	DECLARE @AddressId INT;
	DECLARE @PersonId INT;

	INSERT INTO dbo.Person
	(
	FirstName,
	LastName
	)
	VALUES
	(
	ISNULL(@FirstName, ''),
	ISNULL(@LastName, '')
	);

	SELECT @PersonId = SCOPE_IDENTITY();

	INSERT INTO dbo.Address
	(
	Street,
	City,
	State,
	ZipCode
	)
	VALUES
	(
	@Street,
	@City,
	@State,
	@ZipCode
	);

	SELECT @AddressId = SCOPE_IDENTITY();

	INSERT INTO dbo.Employee
	(
	AddressId,
	PersonId,
	CompanyName,
	Position,
	EmployeeName
	)
	VALUES
	(
	@AddressId,
	@PersonId,
	@CompanyName,
	@Position,
	ISNULL(@EmployeeName, '')
	);
END