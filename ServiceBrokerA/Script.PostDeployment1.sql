/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			C:\Users\dbms-\source\repos\sql-server-service-broker\ServiceBrokerA\Script.PostDeployment1.sql
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
:r ".\Objects\Routes\RouteB.sql"
:r ".\Objects\Routes\RouteC.sql"
:r ".\Objects\Remote Service Binding\ServiceA_In.sql"
:r ".\Objects\Remote Service Binding\ServiceA_Out.sql"