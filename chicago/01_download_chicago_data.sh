# download the chicago data
curl https://raw.githubusercontent.com/invinst/chicago-police-data/master/data/unified_data/complaints/complaints-complaints.csv.gz --output chicago_complaints.csv.gz
curl https://raw.githubusercontent.com/invinst/chicago-police-data/master/data/unified_data/complaints/complaints-accused.csv.gz --output chicago_accused.csv.gz

#unzip it into a csv files
gunzip chicago_complaints.csv.gz
gunzip chicago_accused.csv.gz

#touch csv files
touch chicago_accused.csv.gz
touch chicago_accused.csv.gz