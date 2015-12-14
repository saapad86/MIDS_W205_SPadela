from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
import re
import sys
conn = psycopg2.connect(database="tcount", user="postgres", password="", host="localhost", port="5432")

cur = conn.cursor()
if len(sys.argv) > 1:
    uWord = sys.argv[1]
    cur.execute("SELECT word,word_count from tweetwordcount WHERE word='%s';" % uWord)
    records = cur.fetchall()

    for rec in records:
        print('Total number of occurences of "%s": %d' % (uWord,rec[1]))
else:
    cur.execute("SELECT word,word_count from tweetwordcount ORDER BY word;")
    records = cur.fetchall()

    for rec in records:
        print("(%s, %d)" % (rec[0],rec[1]))
    


        