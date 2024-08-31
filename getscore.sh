#!/bin/bash

# Download the latest version of the scorebot script
curl -o scorebot.sh #!!! !!! !!! !!!INSERT YOUR RAW GITHUB LINK HERE!!! !!! !!! !!!

# Ensure the download was successful
if [ $? -ne 0 ]; then
  echo "Failed to download scorebot.sh"
  exit 1
fi

# Make the scorebot script executable
chmod +x scorebot.sh

# Run the scorebot script
./scorebot.sh

# No evidence
rm -rf scorebot.sh
