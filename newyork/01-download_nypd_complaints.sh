#!/bin/bash
# Download NYPD compaints data
curl https://raw.githubusercontent.com/new-york-civil-liberties-union/NYPD-Misconduct-Complaint-Database-Updated/main/CCRB%20Complaint%20Database%20Raw%2004.20.2021.csv --output newyork_police_complaints.csv
touch newyork_police_complaints.csv