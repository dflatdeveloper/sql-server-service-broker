﻿USE MASTER
GO

CREATE ENDPOINT ENDPOINT_MACHINE
STATE = STOPPED
AS TCP (
	LISTENER_PORT = 4022
)
FOR SERVICE_BROKER
	(AUTHENTICATION = CERTIFICATE TRANSPORT_CERT_MACHINE, ENCRYPTION = SUPPORTED)
GO

CREATE LOGIN MACHINE_LOGIN
	FROM CERTIFICATE TRANSPORT_CERT_MACHINE	C:\Users\dbms-\source\repos\sql-server-service-broker\ServiceBrokerA\master\Create Endpoint.sql
GO

GRANT CONNECT
	ON ENDPOINT::ENDPOINT_MACHINE
	TO MACHINE_LOGIN
GO