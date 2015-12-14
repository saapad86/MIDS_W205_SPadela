import tweepy

consumer_key = "cXLbsgnmGb23wcWWafnrggThj";
#eg: consumer_key = "cXLbsgnmGb23wcWWafnrggThj";

consumer_secret = "jMHjAfBlxmJ40ZphkryOHzeJtpzxs4dflrlInKu4Cg5ioDlFPu";
#eg: consumer_secret = "jMHjAfBlxmJ40ZphkryOHzeJtpzxs4dflrlInKu4Cg5ioDlFPu";

access_token = "11956962-Gaxk0KCPqRcWx1WefRCtstiildyKG03hlP94U2VK8";
#eg: access_token = "11956962-Gaxk0KCPqRcWx1WefRCtstiildyKG03hlP94U2VK8";

access_token_secret = "lA9P21q8BQV3IQKiOB0PEoQcJq2B0amCmSCqHmtYJqTKJ";
#eg: access_token_secret = "lA9P21q8BQV3IQKiOB0PEoQcJq2B0amCmSCqHmtYJqTKJ";

auth = tweepy.OAuthHandler(consumer_key, consumer_secret)
auth.set_access_token(access_token, access_token_secret)

api = tweepy.API(auth)



