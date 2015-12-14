# Copy github files

Step #1: On AMI, create a directory: mkdir /root/files
Step #2: Copy all github files located in files/ to here
Step #3: Execute: sh setup.sh
Step #4: Execute: sh run.sh
Step #5: Execute: sh matplotlib.sh (this may take a while)
Step #6: To test finalresults, execute: python /root/files/finalresults.py
Step #7: To test histogram, execute: python /root/files/histogram.py 6,12
Step #7: To generate plot, execute: python /root/files/plot.py
NOTE: If you need to re-generate the plot, remove the old file first: rm /root/files/plot.png