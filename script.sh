#!/bin/bash

az login --service-principal --username $(USERNAME) --password $(PASSWORD) --tenant $(TENANT)

az devops configure --defaults organization=https://dev.azure.com/ymadrigal2/

az devops configure --defaults project=test


while IFS=, read -r repo name
do
    echo "$repo $name"
    az repos create --name $name
    az repos import create --git-source-url $repo --repository $name
done < ./repos.txt





