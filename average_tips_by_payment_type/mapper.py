#!/usr/bin/env python
"""
    Processing the data from https://registry.opendata.aws/nyc-tlc-trip-records-pds/ 
    The source of payment types dictionary: https://www1.nyc.gov/assets/tlc/downloads/pdf/data_dictionary_trip_records_yellow.pdf
"""
import sys
from datetime import datetime

PAYMENT_TYPE_D = {
    1: 'Credit card',
    2: 'Cash',
    3: 'No charge',
    4: 'Dispute',
    5: 'Unknown',
    6: 'Voided trip'
}

def perform_map():

    file = open('./samples/yellow_tripdata_2020-05.csv', 'r')
    data = file.readlines()

    for line in data:
        line = line.strip()
        values = line.split(',')

        if len(values) == 18 and 'VendorID' not in values:
            
            try:
                #TODO: Add check for a correct year
                tpep_pickup_date = datetime.strftime(datetime.strptime(values[1], '%Y-%m-%d %H:%M:%S'), '%Y-%m')
                tip_amount = float(values[13])
                payment_type_id = int(values[9])
                if payment_type_id in PAYMENT_TYPE_D:
                    payment_type = PAYMENT_TYPE_D[payment_type_id] 
                else:
                    continue
            except ValueError:
                continue 

            
            print("{}.{}\t{}".format(tpep_pickup_date, payment_type, tip_amount))


if __name__ == '__main__':
    perform_map()