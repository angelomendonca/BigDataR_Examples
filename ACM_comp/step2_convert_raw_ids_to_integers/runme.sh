#!/bin/bash -e
(psql -f convert_raw_to_id.sql acm 2>&1) > /dev/null
 if [ $? -eq 0 ]; then echo "Converted RawIDs to IntegerIDs on train data"; else echo "Failed to convert IDs for train data, check if the table exists"; fi

(psql -f map_big_data_test.sql acm 2>&1) > /dev/null
if [ $? -eq 0 ]; then echo "Converted RawIDs to IntegerIDs on test data"; else echo "Failed to convert IDs for test data, check if the table exists"; fi

(psql -f copy_sku_mapping.sql acm 2>&1) > /dev/null
if [ $? -eq 0 ]; then echo "Created SKU mapping for predictions"; else echo "Failed to create sku mapping, check if the table exists"; fi