#!/usr/bin/env python
"""
    Reduce data from map stage, calculation of the tip average amount by month and pyment type
    Processing the data from https://registry.opendata.aws/nyc-tlc-trip-records-pds/ 
    The source of payment types dictionary: https://www1.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf
"""
from multiprocessing.sharedctypes import Value
import sys


def perform_reduce():
    
    previous_date = None
    previous_payment_type = None
    tip_sum = 0
    tip_devider = 1

    for line in sys.stdin:
        line = line.strip()
        values = line.split(';')

        current_date = values[0]
        current_payment_type = values[1]
        try:
            current_tip_amount = float(values[2])
        except ValueError:
            continue

        if previous_date and previous_date == current_date and previous_payment_type == current_payment_type:
            tip_sum += current_tip_amount
            tip_devider += 1
        else:
            if previous_date:
                tip_avg = round(tip_sum / tip_devider, 2)
                print("{};{};{}".format(previous_date, previous_payment_type, tip_avg))
                tip_devider = 1
            tip_sum = current_tip_amount
            previous_date = current_date
            previous_payment_type = current_payment_type
    
    tip_avg = round(tip_sum / tip_devider, 2)
    print("{};{};{}".format(previous_date, previous_payment_type, tip_avg))

if __name__ == '__main__':
    perform_reduce()