﻿IF EXISTS(SELECT 0 FROM SYS.ROUTES WHERE NAME = 'Route$(REMOTE_SERVICE_NAME_)_Out')
BEGIN
	DROP ROUTE ['Route$(REMOTE_SERVICE_NAME_)_Out]
END

CREATE ROUTE [Route$(REMOTE_SERVICE_NAME_)_Out]
	AUTHORIZATION [USER_$(SERVICE_BROKER_REMOTE)]
	WITH
		SERVICE_NAME = N'$(REMOTE_SERVICE_NAME_)_Out',
		ADDRESS = N'$(REMOTE_SERVICE_ADDRESS)',
		BROKER_INSTANCE = N'$(REMOTE_BROKER_ID)';