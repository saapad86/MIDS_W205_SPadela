# Install python-2.7
sudo yum install python27-devel –y
mv /usr/bin/python /usr/bin/python266
ln -s /usr/bin/python2.7 /usr/bin/python
/usr/bin/python --version
python --version

# Install Streamparse
sudo curl -o ez_setup.py https://bootstrap.pypa.io/ez_setup.py
sudo python ez_setup.py
sudo /usr/bin/easy_install-2.7 pip
sudo pip install virtualenv
wget --directory-prefix=/usr/bin/ https://raw.githubusercontent.com/technomancy/leiningen/stable/bin/lein
chmod a+x /usr/bin/lein
pip install streamparse

# Install Tweepy + psycopg2
pip install psycopg2
pip install tweepy

# Start Postgres Server & Configure
sudo service postgresql initdb

# Copy configuration file I have provided ... this will change ident to trust for local, ipv4, ipv6
mv /var/lib/pgsql/data/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf.bak
cp /root/files/pg_hba.conf /var/lib/pgsql/data/pg_hba.conf
sudo service postgresql start
psql -U postgres -f /root/files/db.sql