﻿USE ServiceBrokerA

CREATE ROUTE [RouteB]
	AUTHORIZATION [User_SERVICEBROKERB]
	WITH
		SERVICE_NAME = '[ServiceB]',
		ADDRESS = 'TCP://SB-B.home.local:4022',
		BROKER_INSTANCE = '2a0ccde4-9f72-4f51-997d-13df134cb55e'
