# 1. Download the Philadelphia data file
curl https://raw.githubusercontent.com/sdl60660/philly_police_complaints/master/raw_data/ppd_complaint_complainants_7-18_corrected.csv
curl https://raw.githubusercontent.com/sdl60660/philly_police_complaints/master/raw_data/ppd_complaint_disciplines_7-18.csv
curl https://github.com/sdl60660/philly_police_complaints/blob/master/raw_data/ppd_complaints_7-18.csv?raw=true

# 2. Keep each one
touch ppd_complaint_complainants_7-18_corrected.csv
touch ppd_complaint_disciplines_7-18.csv
touch ppd_complaints_7-18.csv