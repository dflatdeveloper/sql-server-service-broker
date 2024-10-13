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

:r ".\Objects\Routes\RouteA.sql"
:r ".\Objects\Routes\RouteC.sql"
:r ".\Objects\Remote Service Binding\ServiceB_In.sql"
:r ".\Objects\Remote Service Binding\ServiceB_Out.sql"