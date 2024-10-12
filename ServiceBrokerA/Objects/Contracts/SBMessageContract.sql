USE ServiceBrokerA

CREATE CONTRACT [SBMessageContract]
(
	[SenderMessageType] SENT BY INITIATOR,
	[ReceiverMessageType] SENT BY TARGET
)
