#!/bin/bash

##################################################################
# Name: Aishwarya K R
# Date: 25/12/2025
# Description: This script performs archival and deletion of files
##################################################################

# Directory on which archival and deletion operation needs to be performed
DIR="/Users/aishwaryakr/Documents/My Learnings/DevOps/Shell Scripts/Automation of Scripts/Files"

# Archival Directory
ARCH_DIR="/Users/aishwaryakr/Documents/My Learnings/DevOps/Shell Scripts/Automation of Scripts/Archived Files/archival-$(date +%Y-%m)"

# Logs Directory
LOGS="/Users/aishwaryakr/Documents/My Learnings/DevOps/Shell Scripts/Automation of Scripts/Logs"
LOG_FILE="$LOGS/cleanup-logs-$(date +%F).log"

# Input Mode: Archive/Delete
MODE=$1

# Number of days for archival and deletion
ARCH_DAYS=400
DEL_DAYS=30

# Enabling DRY_RUN to view the list of file names before performing file operations
DRY_RUN=false

# Creating the directories, if they aren't existing
mkdir -p "$ARCH_DIR"
mkdir -p "$LOGS"

function file_operation {
	echo "********** Cleanup started at $(date) **********" >> "$LOG_FILE"
	
	# Validating input mode
	if [[ -z "$MODE" || ( "$MODE" !=  0 && "$MODE" != 1 )  ]]; then
		echo "Invalid Mode!!!"
		exit 1
	fi

	# Archival Mode
	if [ "$MODE" == 0 ]; then
		echo "Archiving files older than $ARCH_DAYS days..." >> "$LOG_FILE"
		
		# Finding the regular files whose last modification time is more than 400 days
		find "$DIR" -type f -mtime +"$ARCH_DAYS" | while read -r file; do
			echo "ARCHIVE: $file ->  $ARCH_DIR" >> "$LOG_FILE"

			if [[ "$DRY_RUN" == false ]]; then
				mv "$file" "$ARCH_DIR"
			fi
		done
	fi

	# Deletion Mode
	if [ "$MODE" == 1 ]; then
		echo "Deleting archived files older than $DEL_DAYS..." >> "$LOG_FILE"
		
		# Finding the archived files older than 30 days in the archived folder for deletion
		find "$ARCH_DIR" -type f -mtime +"$DEL_DAYS" | while read -r file; do
			echo "DELETE: $file" >> "$LOG_FILE"

			if [[ "$DRY_RUN" == false ]]; then
				rm -f "$file"
			fi
		done
	fi
	
	echo "********** Cleanup finished at $(date) **********" >> "$LOG_FILE"
}

# Main Method Execution
file_operation 
