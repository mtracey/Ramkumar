IF NOT EXISTS(SELECT ProductID FROM ProductVersion WHERE VersionNumber = '9.2.0.7' And ProductID='00001')
Insert Into ProductVersion (ProductID, VersionNumber, VersionDate, ReleaseDate)
				Values     ('00001', '9.2.0.7', '05/16/2012', getdate())

IF NOT EXISTS(SELECT ProductID FROM ProductVersion WHERE VersionNumber = '9.2.0.6' And ProductID='00002')
Insert Into ProductVersion (ProductID, VersionNumber, VersionDate, ReleaseDate)
				Values     ('00002', '9.2.0.7', '05/16/2012', getdate())

Exec sp_DBMaintenance

--DBCC DROPCLEANBUFFERS
--DBCC FREEPROCCACHE
--DECLARE @TableName varchar(255) 
--DECLARE TableCursor CURSOR FOR 
--SELECT table_name FROM information_schema.tables 
--WHERE table_type = 'base table' 
--
--OPEN TableCursor 
--
--FETCH NEXT FROM TableCursor INTO @TableName 
--WHILE @@FETCH_STATUS = 0 
--BEGIN 
--PRINT @TableName 
--DBCC DBREINDEX(@TableName,' ',90) 
--FETCH NEXT FROM TableCursor INTO @TableName 
--END 
--
--CLOSE TableCursor 
--
--DEALLOCATE TableCursor
