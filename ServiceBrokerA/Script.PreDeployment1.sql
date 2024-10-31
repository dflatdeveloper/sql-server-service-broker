USE MASTER

:r ".\master\security\CREATE Master Key.sql"
:r ".\master\security\CREATE Certificates.sql"
:r ".\master\CREATE Endpoint.sql"
:r ".\master\security\CREATE Login.sql"
:r ".\master\security\Grant Connect To Endpoint.sql"
:r ".\master\CREATE DB.sql"
GO

USE [$(DatabaseName)]

:r ".\user\security\CREATE Master Key.sql"
:r ".\user\security\Create Local Certificate.sql"

:setvar SERVICE_BROKER_REMOTE "SERVICEBROKERB"

IF EXISTS(SELECT 0 FROM SYS.CERTIFICATES WHERE NAME = N'DIALOG_CERT_$(SERVICE_BROKER_REMOTE)')
BEGIN

    PRINT 'SERVICE BROKER B SECURITY OBJECTS EXIST'
    GOTO SERVICE_BROKER_B_FINISHED
END

:r ".\user\security\Create Remote User.sql"    
:r ".\user\security\Create Remote Certificate.sql"
:r ".\user\security\Grant Connect To Service.sql"

PRINT 'SERVICE BROKER B SECURITY OBJECTS CREATED'

SERVICE_BROKER_B_FINISHED:
    PRINT ''

IF EXISTS(SELECT 0 FROM SYS.CERTIFICATES WHERE NAME = N'DIALOG_CERT_$(SERVICE_BROKER_REMOTE)')
BEGIN
    PRINT 'SERVICE BROKER C SECURITY OBJECTS EXIST'
    GOTO SERVICE_BROKER_C_FINISHED
END

:setvar SERVICE_BROKER_REMOTE "SERVICEBROKERC"
:r ".\user\security\Create Remote User.sql"    
:r ".\user\security\Create Remote Certificate.sql"
:r ".\user\security\Grant Connect To Service.sql"

PRINT 'SERVICE BROKER C SECURITY OBJECTS CREATED'

SERVICE_BROKER_C_FINISHED: