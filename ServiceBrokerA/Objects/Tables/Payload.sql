CREATE TABLE [dbo].[Payload]
(
	[Id] INT NOT NULL PRIMARY KEY, 
    [Content] NVARCHAR(MAX) NOT NULL, 
    [ReceiverAcknowledged] BIT NOT NULL DEFAULT 0
)
