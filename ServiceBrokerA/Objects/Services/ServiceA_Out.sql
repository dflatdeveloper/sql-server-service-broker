USE ServiceBrokerA

CREATE SERVICE [ServiceA_Out]
	ON QUEUE [dbo].[QueueA_Out]
	(
		[SBMessageContract]
	)

