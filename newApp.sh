#!/bin/bash

# Creates a new empty canister 

helpFunction()
{
   echo ""
   echo "Usage: $0 app_name"   
   exit 1 # Exit script after printing help
}


# Print helpFunction in case parameters are empty
if [ -z "$1" ] 
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

#app name from the param
app_name="$1"

#get dfx_version
dfx_version=`dfx --version | awk '{$1=""; print $0}' | sed 's/ $*//g'`

echo "Creating $app_name..."

# create directories
mkdir $app_name
cd $app_name
mkdir src
mkdir src/$app_name


#write dfc.json
echo '{
  "canisters": {
    "'$app_name'": {
      "main": "src/'$app_name'/Main.mo"
    }  
  },
  "dfx": "'$dfx_version'"
}' > dfx.json

echo "actor {}" > src/$app_name/Main.mo

echo Done