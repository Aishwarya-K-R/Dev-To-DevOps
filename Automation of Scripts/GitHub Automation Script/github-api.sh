#!/bin/bash

#########################################################################################################
# Name: Aishwarya K R
# Date: 24/12/25
# Description: This script retrieves the list of users having read access to the provided Github Repository
#########################################################################################################

# Github API URL
URL="https://api.github.com"

# Valid username and password of the provided Github Repo
USERNAME=$username
TOKEN=$token

# Command-line arguments specifying the owner and repo name
OWNER=$1
REPO=$2

# Function to display error message
function error_display {
	echo "Please enter the required command-line arguments"
        exit 1
}

# Expected number of arguments
arg=2

# Displaying error message, if inadequated command-line arguments are entered by the user
if [ $# -ne $arg ]; then
	error_display
fi

# To make a GET request to the provided Github Repository
function github_api {
	
	# Preparing the URL to send the GET request
	local url="${URL}/repos/${OWNER}/${REPO}/collaborators"

	# Sending a GET request to Github API with valid user creds, ensuring Authentication and modifying the response to filter only the users with read access
	collaborators=$(curl -s -u "${USERNAME}:${TOKEN}" "$url" | jq -r '.[] | select(.permissions.pull==true) | .login')

	# Display the collaborators, if any
	if [[ -z "$collaborators" ]]; then
		echo "No users with the read access found for ${OWNER}/${REPO}"
	else
		echo "Users with the read access to ${OWNER}/${REPO}:"
		echo "$collaborators"
	fi
}
	
# Main method execution
github_api

