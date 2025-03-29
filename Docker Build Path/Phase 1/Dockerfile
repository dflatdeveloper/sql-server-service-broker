#******************************************
#TEMPORARY CONTAINER FROM sql server 
# TO CREATE BASE IMAGE WITH CERTS
# TO COPY CERTS INTO 

# DEPLOYING TO SQL SERVER LOCALLY IS HARD STAYING SINK WITH PROD AND MAINTAINING PII RULES
#This should use a mount type of secret instead 
#Add to this sample once time allocated
ARG MY_SA_PWD_SHOULD_BE_MADE_INTO_SECRET_MOUNT_PASSWORD=abcd1234!

FROM mcr.microsoft.com/mssql/server:2022-latest AS sql2022   

ARG MY_SA_PWD_SHOULD_BE_MADE_INTO_SECRET_MOUNT_PASSWORD

#required variables to set up SQL SERVER on Linux
ENV ACCEPT_EULA=Y
ENV MSSQL_SA_PASSWORD=$MY_SA_PWD_SHOULD_BE_MADE_INTO_SECRET_MOUNT_PASSWORD

VOLUME /var/opt/mssql/data

WORKDIR /var/opt/mssql/service-broker/

# Files have to be copied into an container and then committed into an image

#*****************************************************************************************
