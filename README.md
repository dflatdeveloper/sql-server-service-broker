# sql-server-service-broker

SQL Server Service Broker Example Version:^1^ 

## SETUP Components

### Certificate Repository

- [ ] Create Key Repository DB Script Path^2^
- [ ] Create Certificates
- [ ] Backup Certificates
- [ ] Create BROKER Databases: A and C on Server A, B on Server B

### Service Broker Databases
- A 
- B 
- C is created after A

#### Master DB SCRIPTS
- [ ] Create DB
- [ ] Create Master Key
- [ ] Create Certificates
- [ ] Create Endpoint

#### Broker DB Scripts
- [ ] Create Master Key
- [ ] Create Certificates

#### Object DDL for each Broker DB
- [ ] Schema Collection Validation
- [ ] Message Types 
- [ ] Contracts
- [ ] Queue Activation Stored Procedure
- [ ] Queues
- [ ] Services
- [ ] Remote Service Binding
- [ ] Route

## Sending Data
> [!NOTE]
> This is the payload sample for the validating message types for this example.
```

 <payload name="11-11-11">
    <set id="11">
        <meta auth="11"><ss>ss</ss></meta>
        <body>asd</body>
    </set>
    <note id="12">
        <reference_old id="123">mm</reference_old>
    </note>
</payload>
```



- Table-valued parameter [spec](https://learn.microsoft.com/en-us/dotnet/framework/data/adonet/sql/table-valued-parameters) from C# 
- Passing a table-valued to a stored procedure backed by service broker
- Kicks off a Send Method to send to a Remote Broker (or a different one on local)  
- The Send Method Arguments can have an xml payload validated by a schema, extracted strings (either xml, json, encoded binaries from VARBINARY), or data that the BROKER DB leave as unvalidated

### Security Model
-	I used Certificates to allow to disparate systems function together
	- Bonus here is the two systems do not need the same backbone authentication (Active Directory)

- Service Broker Routes operate with FQDNs only.  Add Server A and Server B to an internal DNS

^1^ Microsoft SQL Server 2022 (RTM-GDR) (KB5046057) - 16.0.1130.5 (X64)   Sep 25 2024 11:10:10   Copyright (C) 2022 Microsoft Corporation  Developer Edition (64-bit) on Windows 10 Pro 10.0 <X64> (Build 22631: ) (Hypervisor)

^2^ Solution dir/Key Repository/