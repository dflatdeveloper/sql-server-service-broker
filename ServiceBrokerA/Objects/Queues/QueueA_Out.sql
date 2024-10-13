﻿USE ServiceBrokerA

CREATE QUEUE [dbo].[QueueA_Out]
WITH STATUS = ON,
ACTIVATION (STATUS = ON, 
			PROCEDURE_NAME = [dbo].[QueueA_OutActivationSProc],
			EXECUTE AS SELF,
			MAX_QUEUE_READERS = 10);