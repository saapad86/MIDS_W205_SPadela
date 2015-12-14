
# Create new streamparse project
sparse quickstart EX2Tweetwordcount

cd ~/EX2Tweetwordcount/

# Remove extra topology
rm topologies/wordcount.clj

# Copy all github files
cp /root/files/finalresults.py finalresults.py
cp /root/files/histogram/py histogram.py
cp /root/files/parse.py src/bolts/parse.py
cp /root/files/wordcount.py src/bolts/wordcount.py
cp /root/files/tweets.py src/spouts/tweets.py
cp /root/files/tweetwordcount.clj topologies/tweetwordcount.clj
cp /root/files/Twittercredentials.py Twittercredentials.py

sparse run