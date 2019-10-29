#!/bin/sh -e

# Input file
#config_file=$1
config_file=$ENV_CONFIG_FILE

echo "Start initializing environment variables from file $config_file"

if [[ -f "$config_file" ]]
then
    echo "Parse file: $config_file"
	while IFS='=' read -r key value
    do
        echo "Export environment variable: $key=$value"
        export $key=$value
    done < "$config_file"
fi

echo "End initializing environment variables"

echo ""
echo "============================="
echo ""
echo "List environment variables"
# List environment variables
env

# Start flask
flask run