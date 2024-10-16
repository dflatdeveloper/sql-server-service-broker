﻿CREATE QUEUE [dbo].[QueueC_In]
WITH STATUS = ON,
ACTIVATION (STATUS = ON, 
			PROCEDURE_NAME = [dbo].[QueueC_InActivationSProc],
			EXECUTE AS SELF,
			MAX_QUEUE_READERS = 10);