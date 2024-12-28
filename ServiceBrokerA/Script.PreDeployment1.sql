USE MASTER

:r ".\master\security\CREATE Master Key.sql"
:r ".\master\security\CREATE Certificates.sql"
:r ".\master\CREATE Endpoint.sql"
:r ".\master\security\CREATE Login.sql"
:r ".\master\security\Grant Connect To Endpoint.sql"

GO

USE [$(DatabaseName)]

:r ".\user\security\CREATE Master Key.sql"
:r ".\user\security\Create Local Certificate.sql"
:r ".\user\security\Create Remote User.sql"    
:r ".\user\security\Create Remote Certificate.sql"   


