﻿USE ServiceBrokerB

CREATE REMOTE SERVICE BINDING ServiceBindingServiceA_In
	TO SERVICE 'SERVICEA_Out'
	WITH USER = USER_SERVICEBROKERA
GO


CREATE REMOTE SERVICE BINDING ServiceBindingServiceC_In
	TO SERVICE 'SERVICEC_Out'
	WITH USER = USER_SERVICEBROKERC
GO