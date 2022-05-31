#!/usr/bin/env python
"""
    Processing the data from https://registry.opendata.aws/nyc-tlc-trip-records-pds/ 
    The source of payment types dictionary: https://www1.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf
"""
import sys

PAYMENT_TYPE_D = {
    1: 'Credit card',
    2: 'Cash',
    3: 'No charge',
    4: 'Dispute',
    5: 'Unknown',
    6: 'Voided trip'
}

def perform_map():
    pass

if __name__ == '__main__':
    perform_map()