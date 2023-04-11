#!/bin/bash

az login --service-principal --username 5f5f9336-dfce-46cc-8acd-81e6eb9c8a8e --password bie8Q~vS2h9JsgbZbmFKoTOsqcXInf_xND2BIaTj --tenant f524efae-c921-4e8b-851e-b002089d974d
az devops configure --defaults organization=https://dev.azure.com/ymadrigal2/

az devops configure --defaults project=test


while IFS=, read -r repo name
do
    echo "$repo $name"
    az repos create --name $name
    az repos import create --git-source-url $repo --repository $name
done < ./repos.txt





