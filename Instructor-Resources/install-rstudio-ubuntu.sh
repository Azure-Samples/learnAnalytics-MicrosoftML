#!/bin/sh

## install rstudio

ARG1=${1:-1.0.136}
RSTUDIO_VERSION=$ARG1

# RSTUDIO_FILE=rstudio-server-rhel-"$RSTUDIO_VERSION"-x86_64.rpm
RSTUDIO_FILE=rstudio-server-"$RSTUDIO_VERSION"-amd64.deb

wget https://s3.amazonaws.com/rstudio-dailybuilds/"$RSTUDIO_FILE"

apt-get install -y gdebi-core 
gdebi --option=APT::Get::force-yes=1,APT::Get::Assume-Yes=1 -n "$RSTUDIO_FILE"


## remove old files
rm $RSTUDIO_FILE