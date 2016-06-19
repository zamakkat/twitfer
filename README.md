# twitfer

[![Build Status](https://travis-ci.com/zamakkat/twitfer.svg?token=bCR1V8MpYjHu4przYp1u&branch=master)](https://travis-ci.com/zamakkat/twitfer)

## Dependencies
- PostgreSQL
- Redis

## Setup
```
$ bin/setup
```

## Deployment
Required environment variables:
- `NUMBER_OF_WEB_DYNOS`
- `NUMBER_OF_WORKER_DYNOS`
- `MAX_REDIS_CONNECTION`

Good to have:
- `WEB_CONCURRENCY`
- `WEB_MAX_THREADS`

## Development
