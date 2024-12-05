#!/bin/bash

# SQLite3, grep and awk need to be present on the system executing the  tests.
# Bash should also be installed for proper execution, only using sh might lead to issues.

# Tests are each written in a function as unit test style and called for execution below. Tests are heavily utilizing bash scripting and no jayvee functionality in terms of testing.

# Test 1: pipeline output files should be present.
testExpectedOutputFilesArePresent() {
    local WEATHER_DB_PATH="../data/weather_event_damages.sqlite"
    local POLITICAL_DB_PATH="../data/political_opinion.sqlite"

    if ./pipeline.sh; then
        echo "pipeline.sh executed successfully."
    else
        echo "pipeline.sh execution failed."
        exit 1
    fi

    if [[ -f "$WEATHER_DB_PATH" && -f "$POLITICAL_DB_PATH" ]]; then
        echo "Required files are present."
        return 0
    else
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
    shift 2 # Discard first two params to read all column arguments with dynamic amount of arguments.
    local expected_columns=("$@") 
    actual_columns=$(sqlite3 "$db_file" "PRAGMA table_info($table_name);" | awk -F'|' '{print $2}')

    for column in "${expected_columns[@]}"; do
        if ! echo "$actual_columns" | grep -q "$column"; then
            echo "Column '$column' is missing."
            return 1
        fi
    done
    return 0
}

# Test 2: Outputfile should be present and contain expected columns.
testCorrectColumnsArePresent() {
    local WEATHER_DB_PATH="../data/weather_event_damages.sqlite"
    local POLITICAL_DB_PATH="../data/political_opinion.sqlite"

    local WEATHER_TABLE="weather_event_damages"
    local WEATHER_COLUMNS=("STATE" "INJURIES_DIRECT" "INJURIES_INDIRECT" "DEATHS_DIRECT" "DEATHS_INDIRECT")
    local POLITICAL_TABLE="political_opinion"
    local POLITICAL_COLUMNS=("GeoType" "GeoName" "fundrenewables" "fundrenewablesOppose" "regulate" "regulateOppose" "CO2limits" "CO2limitsOppose" "reducetax" "reducetaxOppose" "supportRPS" "supportRPSOppose" "rebates" "rebatesOppose" "drillANWR" "drillANWROppose" "drilloffshore" "drilloffshoreOppose" "teachGW" "teachGWOppose" "corporations" "corporationsOppose" "president" "presidentOppose" "congress" "congressOppose" "governor" "governorOppose" "localofficials" "localofficialsOppose" "citizens" "citizensOppose" "gwvoteimp" "gwvoteimpOppose" "priority" "priorityOppose")

    ./pipeline.sh

    if [[ -f "$WEATHER_DB_PATH" ]]; then
        check_columns "$WEATHER_DB_PATH" "$WEATHER_TABLE" "${WEATHER_COLUMNS[@]}"
        WEATHER_CHECK=$?
    else
        WEATHER_CHECK=1
    fi

    if [[ -f "$POLITICAL_DB_PATH" ]]; then
        check_columns "$POLITICAL_DB_PATH" "$POLITICAL_TABLE" "${POLITICAL_COLUMNS[@]}"
        POLITICAL_CHECK=$?
    else
        POLITICAL_CHECK=1
    fi

    if [[ $WEATHER_CHECK -eq 0 && $POLITICAL_CHECK -eq 0 ]]; then
        echo "All columns are present."
        return 0
    else
        echo "Not all columns are present."
        exit 1
    fi
}

# Test execution
testExpectedOutputFilesArePresent
testCorrectColumnsArePresent