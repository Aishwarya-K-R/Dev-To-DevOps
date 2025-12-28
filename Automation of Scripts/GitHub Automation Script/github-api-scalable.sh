#!/bin/bash

#########################################################################################################
# Name: Aishwarya K R
# Date: 24/12/25
# Description: This script retrieves the list of users having read access to multiple Github Repositories
#########################################################################################################

# Github API URL
URL="https://api.github.com"

# Valid username and password of the provided Github Repo
USERNAME=$username
TOKEN=$token

# Command-line arguments specifying the file containing owner and repo
INPUT_FILE=$1

# Function to display error message
function error_display {
	echo "Invalid Input!!!"
        exit 1
}


# Displaying error message, if input file is valid
if [[ -z "$INPUT_FILE"  ||  ! -f "$INPUT_FILE"  ]]; then
	error_display
fi

# To make a GET request to the provided Github Repository
function github_api {

	local owner="$1"
	local repo="$2"
	
	# Preparing the URL to send the GET request
	local url="${URL}/repos/${owner}/${repo}/collaborators"

	# Sending a GET request to Github API with valid user creds, ensuring Authentication and modifying the response to filter only the users with read access
	collaborators=$(curl -s -u "${USERNAME}:${TOKEN}" "$url" | jq -r '.[] | select(.permissions.pull==true) | .login')

	# Display the collaborators, if any
	if [[ -z "$collaborators" ]]; then
		echo "No users with the read access found for ${owner}/${repo}"
	else
		echo "Users with the read access to ${owner}/${repo}:"
		echo "$collaborators"
	fi
}
	
# Main method execution
# Reading the file line by line
while read -r owner repos; do
	for repo in $repos; do
		github_api "$owner" "$repo"
	done
done < "$INPUT_FILE"
