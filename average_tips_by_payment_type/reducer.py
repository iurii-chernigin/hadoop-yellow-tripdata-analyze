#!/usr/bin/env python
"""
    Processing the data from https://registry.opendata.aws/nyc-tlc-trip-records-pds/ 
    The source of payment types dictionary: https://www1.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf
"""
from multiprocessing.sharedctypes import Value
import sys

def perform_reduce():
    
    file_in = open('./output/map-result.txt')
    data = file_in.readlines()
    data.sort()

    previous_date = None
    previous_payment_type = None
    current_tips_sum = 0

    for line in data:

        line = line.strip()
        values = line.split(';')

        current_date = values[0]
        current_payment_type = values[1]
        try:
            current_tips = float(values[2])
        except ValueError:
            continue

        if previous_date and previous_date == current_date and previous_payment_type == current_payment_type:
            current_tips_sum += current_tips
        else:
            if previous_date:
                print("{};{};{}".format(previous_payment_type, previous_date, round(current_tips_sum, 2)))
            current_tips_sum = current_tips
            previous_date = current_date
            previous_payment_type = current_payment_type
    
    print("{};{};{}".format(previous_payment_type, previous_date, round(current_tips_sum, 2)))

if __name__ == '__main__':
    perform_reduce()