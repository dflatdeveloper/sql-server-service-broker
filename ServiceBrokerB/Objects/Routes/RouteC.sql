﻿USE ServiceBrokerB

CREATE ROUTE [RouteC]
	AUTHORIZATION [User_SERVICEBROKERC]
	WITH
		SERVICE_NAME = '[ServiceC]',
		ADDRESS = 'TCP://SB-A.home.local:4022',
		BROKER_INSTANCE = '165362eb-593b-41af-b7a1-b04ae00a1a0c'
