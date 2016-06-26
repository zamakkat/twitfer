# twitfer

[![Build Status](https://travis-ci.com/zamakkat/twitfer.svg?token=bCR1V8MpYjHu4przYp1u&branch=master)](https://travis-ci.com/zamakkat/twitfer)

## Deployment
Required environment variables:
- `NUMBER_OF_WEB_DYNOS`
- `NUMBER_OF_WORKER_DYNOS`
- `MAX_REDIS_CONNECTION`
- `TWITTER_CONSUMER_KEY`
- `TWITTER_CONSUMER_SECRET`
- `TWITTER_ACCESS_TOKEN`
- `TWITTER_ACCESS_TOKEN_SECRET`

Good to have:
- `WEB_CONCURRENCY`
- `WEB_MAX_THREADS`

## Development
### 0. Dependencies
- PostgreSQL
- Redis
- Sidekiq

### 1. Setup
```
$ bin/setup
```

### 2. Run all the stuff
You first need to run PostgreSQL (database), Redis server (store for worker). Optional: Guard (helps you run RSpec on the fly and has livereload for better front end development).

Then you can run the Rails web server and the Sidekiq worker.

Or you can be lazy and use the [`foreman`](https://github.com/ddollar/foreman) gem and place the following in `Procfile.dev`:
```
web:       bundle exec puma -C config/puma.rb -q -p 3000
worker:    bundle exec sidekiq -e $RAILS_ENV
postgres:  postgres -D /usr/local/var/postgres
redis:     redis-server
log:       tail -f log/development.log
guard:     bundle exec guard -i
```
Then to run it all just use `$ foreman start --f Procfile.dev`

### 3. Read the (short) docs

[Here](https://github.com/zamakkat/twitfer/blob/master/docs.md)
