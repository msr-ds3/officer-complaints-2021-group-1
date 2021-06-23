#!/bin/bash
#
# downloads movielens rating data
#
# see http://grouplens.org/datasets/movielens/ for more info
#
# 1. Download the Philadelphia data file
wget https://raw.githubusercontent.com/sdl60660/philly_police_complaints/master/raw_data/ppd_complaint_complainants_7-18_corrected.csv
wget https://raw.githubusercontent.com/sdl60660/philly_police_complaints/master/raw_data/ppd_complaint_disciplines_7-18.csv
wget https://raw.githubusercontent.com/sdl60660/philly_police_complaints/master/raw_data/ppd_complaints_7-18.csv
curl 'https://raw.githubusercontent.com/sdl60660/philly_police_complaints/master/raw_data/ppd_complaint_disciplines.csv' --output ppd_findings.csv
curl 'https://phl.carto.com/api/v2/sql?q=SELECT+*+FROM+ppd_complaint_disciplines&filename=ppd_complaint_disciplines&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator' --output 'open_philly_ppd_complaint_findings.csv'
curl 'https://phl.carto.com/api/v2/sql?q=SELECT+*+FROM+ppd_complaints&filename=ppd_complaints&format=csv&skipfields=cartodb_id,the_geom,the_geom_webmercator' --output 'open_philly_ppd_complaint.csv'

# 2. Keep each one
touch ppd_complaint_complainants_7-18_corrected.csv
touch ppd_complaint_disciplines_7-18.csv
touch ppd_complaints_7-18.csv
touch ppd_findings.csv
touch open_philly_ppd_complaint_findings.csv
touch open_philly_ppd_complaint.csv