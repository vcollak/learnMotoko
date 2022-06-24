#!/bin/bash

helpFunction()
{
   echo ""
   echo "Usage: $0 commit_message"   
   exit 1 # Exit script after printing help
}


# Print helpFunction in case parameters are empty
if [ -z "$1" ] 
then
   echo "Some or all of the parameters are empty";
   helpFunction
fi

# Begin script in case all parameters are correct
commitMsg="$1"

echo ":$commitMsg:"
 
#add all git files
git add .

#commit
git commit -m "$commitMsg"

#push to remote repository
git push


