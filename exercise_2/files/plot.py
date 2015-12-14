from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
import re
import sys
conn = psycopg2.connect(database="tcount", user="postgres", password="", host="localhost", port="5432")

cur = conn.cursor()
cur.execute("SELECT word,word_count from tweetwordcount where length(word) > 1 ORDER BY word_count desc LIMIT 20;")
records = cur.fetchall()

import codecs
target = codecs.open('/root/files/top20.txt','w','utf-8')

import numpy as np

ind = np.arange(20)
words = []
counts = []

for rec in records:
    target.write('\t'.join(map(str,rec))+'\n')
    words.append(rec[0])
    counts.append(rec[1])
    
import matplotlib.pyplot as plt

plt.bar(ind,counts,width=0.35)
plt.xticks(ind,words)
plt.title("Top 20 Words")
plt.xlabel("Word")
plt.ylabel("Frequency")

plt.savefig("/root/files/plot.png")
    


        