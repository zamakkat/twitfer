## Introduction
This Rails app does indexing of tweets from Twitter shared as part of referrals by customers. It enables retailers to monitor these referrals and gain actionable insights from the stats

## Basic structure

### Twitter indexing
The indexing is done using the help of the Twitter Streaming API and the `twitter` gem inside a unique background job which is run at start up. A background job is used to avoid heavy load on the web app while still allows indexing tweets on the fly.

For filtering, we use the keywords `twitfer`, `production` and `code` since the URL of the site is currently https://twitfer-production.herokuapp.com/ AND there is an assumption that there will be 1 URL in the shared tweet with the format of `https://twitfer-production.herokuapp.com/?code=bba271a5` where `bba271a5` is the unique customer referral code. This can easily be changed or moved to an ENV variable.

### Data modelling
The main functionality is from the 2 models `Customer` and `Tweet`. They are linked with a `has_many` relationship with a counter cache.

## Front end
The front end is just basic Rails views with Slim as the templating language, Bootstrap as styling framework along with the theme SB Admin 2 (used to speed up development). A number of JS libraries are used:

- `DataTables`: Sortable and searchable tables
- `morris.js`: Used for plotting graphs
- `raphael.js`: dependency for `morris.js`

## Development and Build pipeline
To make a change to the code-base, just issue a pull request to the `master` branch. An optional `staging` environment with Heroku's review apps feature can be set up at later stages. TravisCI is used for continuous integration to run all specs to make sure new changes don't break anything.

The app is currently deployed to Heroku at `https://twitfer-production.herokuapp.com/`. There is currently no auto-deploy so the `master` branch is manually deployed on need.

