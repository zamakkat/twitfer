# Introduction
This Rails app does indexing of tweets from Twitter shared as part of referrals by customers. It enables retailers to monitor these referrals and gain actionable insights from the stats

# Basic structure

### Twitter indexing
The indexing is done using the help of the Twitter Streaming API and the `twitter` gem inside a unique background job which is run at start up. A background job is used to avoid heavy load on the web app while still allows indexing tweets on the fly.

For filtering, we use the keywords `twitfer`, `production` and `code` since the URL of the site is currently https://twitfer-production.herokuapp.com/ AND there is an assumption that there will be 1 URL in the shared tweet with the format of `https://twitfer-production.herokuapp.com/?code=bba271a5` where `bba271a5` is the unique customer referral code. This can easily be changed or moved to an ENV variable.

### Data modelling
The main functionality is from the 2 models `Customer` and `Tweet`. They are linked with a `has_many` relationship with a counter cache.
