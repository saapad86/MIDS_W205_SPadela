wget "https://data.medicare.gov/views/bg9k-emty/files/Ma46xU4I05xsIKuEqLLi-N-s7GoO2ZefzJ7SYyTIKjA?content_type=application%2Fzip%3B%20charset%3Dbinary&filename=Hospital_Revised_Flatfiles.zip" -O cms_data.zip
unzip cms_data.zip -d unzipped_files
mkdir cms_data
cd unzipped_files
tail -n+2 Hospital\ General\ Information.csv > ../cms_data/hospitals.csv
tail -n+2 Timely\ and\ Effective\ Care\ -\ Hospital.csv > ../cms_data/care.csv
tail -n+2 Readmissions\ and\ Deaths\ -\ Hospital.csv > ../cms_data/readmissions.csv
tail -n+2 Measure\ Dates.csv > ../cms_data/dates.csv
tail -n+2 hvbp_hcahps_08_06_2015.csv > ../cms_data/surveys.csv
hdfs dfs -mkdir /user/w205/hospital_compare/
hdfs dfs -mkdir /user/w205/hospital_compare/hospitals/
hdfs dfs -mkdir /user/w205/hospital_compare/care/
hdfs dfs -mkdir /user/w205/hospital_compare/dates/
hdfs dfs -mkdir /user/w205/hospital_compare/readmissions/
hdfs dfs -mkdir /user/w205/hospital_compare/surveys/
hdfs dfs -put /data/ex1/cms_data/hospitals.csv /user/w205/hospital_compare/hospitals/hospitals.csv
hdfs dfs -put /data/ex1/cms_data/care.csv /user/w205/hospital_compare/care/care.csv
hdfs dfs -put /data/ex1/cms_data/readmissions.csv /user/w205/hospital_compare/readmissions/readmissions.csv
hdfs dfs -put /data/ex1/cms_data/dates.csv /user/w205/hospital_compare/dates/dates.csv
hdfs dfs -put /data/ex1/cms_data/surveys.csv /user/w205/hospital_compare/surveys/surveys.csv