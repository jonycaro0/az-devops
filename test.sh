#!/bin/bash
while IFS=, read -r repo name
do
  echo "$repo $name"
done < ./repos.txt