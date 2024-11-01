﻿CREATE QUEUE [dbo].[QueueA_In]
WITH STATUS = ON,
ACTIVATION (STATUS = ON, 
			PROCEDURE_NAME = [dbo].[usp_QueueA_Activation_In],
			EXECUTE AS SELF,
			MAX_QUEUE_READERS = 10);