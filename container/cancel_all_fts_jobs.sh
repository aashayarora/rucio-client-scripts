#!/bin/bash

FTS=$1
json_output=$(fts-rest-transfer-list -s $FTS --json ACTIVE,SUBMITTED 2>/dev/null)

if [ $? -eq 0 ]; then
    if [ -n "$json_output" ]; then
        job_ids=($(echo "$json_output" | grep -oP '"job_id": "\K[^"]+'))

        if [ ${#job_ids[@]} -eq 0 ]; then
            echo "No active jobs found."
        else
            for job_id in "${job_ids[@]}"; do
                echo "Canceling job: $job_id"
                fts-rest-transfer-cancel -s $FTS "$job_id"
            done
        fi
    else
        echo "JSON output is empty or invalid."
    fi
else
    echo "Error running fts-transfer-list command."
fi
