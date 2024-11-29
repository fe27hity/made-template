#!/bin/bash


# Test 1 
WEATHER_DB_PATH="../data/weather_event_damages.sqlite"
POLITICAL_DB_PATH="../data/political_opinion.sqlite"

echo "Executing pipeline.sh..."
if ./pipeline.sh; then
    echo "pipeline.sh executed successfully."
else
    echo "pipeline.sh execution failed."
    exit 1
fi

echo "Validating generated files..."
if [[ -f "$WEATHER_DB" && -f "$POLITICAL_DB" ]]; then
    echo "Validation successful: Required files are present."
    exit 0
else
    echo "Validation failed: One or both required files are missing."
    if [[ ! -f "$WEATHER_DB" ]]; then
        echo "Missing file: $WEATHER_DB"
    fi
    if [[ ! -f "$POLITICAL_DB" ]]; then
        echo "Missing file: $POLITICAL_DB"
    fi
    exit 1
fi