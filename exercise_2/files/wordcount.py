from __future__ import absolute_import, print_function, unicode_literals

from collections import Counter
from streamparse.bolt import Bolt

import psycopg2
import re
conn = psycopg2.connect(database="tcount", user="postgres", password="", host="localhost", port="5432")

class WordCounter(Bolt):

    def initialize(self, conf, ctx):
        self.counts = Counter()
       

    def process(self, tup):
        word = re.sub(r'[^a-zA-Z0-9]','', tup.values[0])
        # Write codes to increment the word count in Postgres
        # Use psycopg to interact with Postgres
        # Database name: Tcount 
        # Table name: Tweetwordcount 
        # you need to create both the database and the table in advance.
        uCount = self.get_counts(word)
        
        # Increment the local count
        uCount += 1
        self.emit([word, self.counts[word]])
        
        self.update_counts(word,uCount)
        
        # Log the count - just to see the topology running
        self.log('%s: %d' % (word, uCount))

    def update_counts(self,uWord,uCount):
        cur = conn.cursor()
        if uCount == 1:
            #Insert
            #cur.execute("INSERT INTO tweetwordcount (word,word_count) VALUES (%s, 1) WHERE NOT EXISTS (SELECT word from tweetwordcount where word = %s)", (uWord, uWord));
            cur.execute("INSERT INTO tweetwordcount (word,word_count) VALUES ('%s', 1);" % uWord);
        else:
            #Update
            cur.execute("UPDATE tweetwordcount SET word_count=%s WHERE word=%s", (uCount, uWord))
        
        conn.commit()
    
    def get_counts(self,uWord):
        cur = conn.cursor()
        #Select
        cur.execute("SELECT word_count from Tweetwordcount WHERE word='%s';" % uWord)
        records = cur.fetchall()
        conn.commit()
        if(len(records)==0):
            return(0)
        else:
            return(records[0][0])

        