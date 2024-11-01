--NOTE ABOUT ATTACHING SERVICE MASTER KEYS 
--IF A SERVICE MASTER KEY CHANGE HAPPENS,
--IT IS MY EXPERIENCE THAT THE MASTER KEY CHANGES TOO
--
--THIS SCENARIO WAS DURING A REMOTE MACHINE - CERTIFICATE AUTHENTICATION

IF EXISTS(SELECT 0 FROM SYS.SYMMETRIC_KEYS WHERE NAME = '##MS_DatabaseMasterKey##')
BEGIN
	PRINT 'DB MASTER MASTERKEY EXISTS'
	
	GOTO FINISHED_MASTER_MASTERKEY
END
	
CREATE MASTER KEY ENCRYPTION BY PASSWORD = '$(MASTER_KEY_PASSWORD)'

PRINT 'DB MASTER MASTERKEY CREATED'

FINISHED_MASTER_MASTERKEY: