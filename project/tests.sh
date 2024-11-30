#!/bin/bash

# SQLite3 must be installed to execute the tests. Nessecary for reading the sqlite files and test for content.
#sudo apt-get install sqlite3

# Test 1: pipeline output files should be present
testExpectedOutputFilesArePresent() {
    local WEATHER_DB_PATH="../data/weather_event_damages.sqlite"
    local POLITICAL_DB_PATH="../data/political_opinion.sqlite"

    echo "Executing pipeline.sh..."
    if ./pipeline.sh; then
        echo "pipeline.sh executed successfully."
    else
        echo "pipeline.sh execution failed."
        exit 1
    fi

    echo "Validating generated files..."
    if [[ -f "$WEATHER_DB_PATH" && -f "$POLITICAL_DB_PATH" ]]; then
        echo "Validation successful: Required files are present."
        return 0
    else
        echo "Validation failed: One or both required files are missing."
        if [[ ! -f "$WEATHER_DB_PATH" ]]; then
            echo "Missing file: $WEATHER_DB_PATH"
        fi
        if [[ ! -f "$POLITICAL_DB_PATH" ]]; then
            echo "Missing file: $POLITICAL_DB_PATH"
        fi
        exit 1
    fi
}

# Helper function

check_columns() {
    local db_file=$1
    local table_name=$2
    shift 2
    local expected_columns=("$@")

    actual_columns=$(sqlite3 "$db_file" "PRAGMA table_info($table_name);" | awk -F'|' '{print $2}')

    for column in "${expected_columns[@]}"; do
        if ! echo "$actual_columns" | grep -q "$column"; then
            echo "Column '$column' is missing in table '$table_name' of database '$db_file'."
            return 1
        fi
    done
    echo "All expected columns are present in table '$table_name' of database '$db_file'."
    return 0
}

# Test 2: Outputfile should be present and contain expected columns
testCorrectColumnsArePresent() {
    local WEATHER_DB_PATH="../data/weather_event_damages.sqlite"
    local POLITICAL_DB_PATH="../data/political_opinion.sqlite"

    local WEATHER_TABLE="weather_event_damages"
    local WEATHER_COLUMNS=("STATE" "INJURIES_DIRECT" "INJURIES_INDIRECT" "DEATHS_DIRECT" "DEATHS_INDIRECT"
    )
    local POLITICAL_TABLE="political_opinion"
    local POLITICAL_COLUMNS=("GeoType" "GeoName" "fundrenewables" "fundrenewablesOppose" "regulate" "regulateOppose" "CO2limits" "CO2limitsOppose" "reducetax" "reducetaxOppose" "supportRPS" "supportRPSOppose" "rebates" "rebatesOppose" "drillANWR" "drillANWROppose" "drilloffshore" "drilloffshoreOppose" "teachGW" "teachGWOppose" "corporations" "corporationsOppose" "president" "presidentOppose" "congress" "congressOppose" "governor" "governorOppose" "localofficials" "localofficialsOppose" "citizens" "citizensOppose" "gwvoteimp" "gwvoteimpOppose" "priority" "priorityOppose"
)

    ./pipeline.sh

    echo "Checking $WEATHER_DB_PATH..."
    if [[ -f "$WEATHER_DB_PATH" ]]; then
        check_columns "$WEATHER_DB_PATH" "$WEATHER_TABLE" "${WEATHER_COLUMNS[@]}"
        WEATHER_CHECK=$?
    else
        echo "File $WEATHER_DB_PATH not found!"
        WEATHER_CHECK=1
    fi

    echo "Checking $POLITICAL_DB_PATH..."
    if [[ -f "$POLITICAL_DB_PATH" ]]; then
        check_columns "$POLITICAL_DB_PATH" "$POLITICAL_TABLE" "${POLITICAL_COLUMNS[@]}"
        POLITICAL_CHECK=$?
    else
        echo "File $POLITICAL_DB_PATH not found!"
        POLITICAL_CHECK=1
    fi

    if [[ $WEATHER_CHECK -eq 0 && $POLITICAL_CHECK -eq 0 ]]; then
        echo "All checks passed successfully."
        return 0
    else
        echo "Some checks failed."
        exit 1
    fi
}

# Test execution
testExpectedOutputFilesArePresent
testCorrectColumnsArePresent