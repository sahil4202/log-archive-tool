#!/bin/bash

# Check if the user provided a directory
if [ -z "$1" ]; then
    echo "Usage: $0 <log-directory>"
    exit 1
fi

LOG_DIR="$1"
ARCHIVE_DIR="/var/log/archive"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
ARCHIVE_NAME="logs_archive_${TIMESTAMP}.tar.gz"
LOG_FILE="${ARCHIVE_DIR}/archive_log.txt"

# Check if the specified log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Error: Directory '$LOG_DIR' does not exist."
    exit 1
fi

# Create the archive directory if it doesn't exist
mkdir -p "$ARCHIVE_DIR"

# Compress the logs
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" .

# Log the archive creation
echo "$(date +"%Y-%m-%d %H:%M:%S") - Archived $LOG_DIR to $ARCHIVE_DIR/$ARCHIVE_NAME" >> "$LOG_FILE"

echo "Logs archived successfully: $ARCHIVE_DIR/$ARCHIVE_NAME"
