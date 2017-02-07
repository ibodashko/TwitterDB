select tweet, count(*) as comments_tweet
from comments join tweets on comments.tweet = tweets.id
group by tweet;