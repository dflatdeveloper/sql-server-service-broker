USE MASTER

--Private Key
CREATE CERTIFICATE TRANSPORT_CERT_MACHINE
    AUTHORIZATION [dbo]
    FROM FILE  = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\TRANSPORT_CERT_MACHINE.cer'
    WITH PRIVATE KEY (FILE = 'C:\Users\dbms-\source\repos\sql-server-service-broker\Certificates\TRANSPORT_CERT_MACHINE.pfx',
        DECRYPTION BY PASSWORD = 'Password123!@#'
    );


