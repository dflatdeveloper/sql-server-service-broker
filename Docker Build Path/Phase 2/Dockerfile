#*****************************************************************************************
#/external-resources
FROM service.broker-v0.1:latest AS sb_build  

EXPOSE 1433
EXPOSE 4022

USER 0

RUN apt update

RUN apt install -y python3

RUN apt install -y wget

RUN apt install -y gpg
        
RUN apt install -y apt-transport-https

RUN wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg 

RUN install -D -o root -g root -m 644 packages.microsoft.gpg /etc/apt/keyrings/packages.microsoft.gpg

RUN sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/ubuntu/$(lsb_release -rs) main" > /etc/apt/sources.list.d/dotnet-dev.list'

#RUN echo "deb [arch=amd64,arm64,armhf signed-by=/etc/apt/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/code stable main" | tee /etc/apt/sources.list.d/vscode.list > /dev/null

RUN rm -f packages.microsoft.gpg

RUN gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg



#RUN apt update


#RUN apt-get update && apt-get install -y dotnet-sdk-9.0

#VOLUME /var/opt/mssql/service-broker/package


#USER 0

#INSTALL .NET

#RUN apt-get update && apt-get install -y dotnet-sdk-8.0

#INSTALL SQLPACKAGE

#RUN dotnet tool install -g microsoft.sqlpackage

#DEPLOY OUR SCRIPT

#RUN  -rm -v {$CERTIFICATES} /var/opt/mssql/service-broker/package ormico/sqlpackage sqlpackage /a:export /scs:"Server:localhost;Database=ServiceBrokerA;User Id=sa;{$MSSQL_SA_PASSWORD}" /tf:/package/service-broker.bacpac












