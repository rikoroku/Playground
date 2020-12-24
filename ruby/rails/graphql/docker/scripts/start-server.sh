#!/bin/bash
bundle install

# remove pid file
if [ -f tmp/pids/server.pid ]; then
  rm tmp/pids/server.pid
fi

bundle exec rails s -p 3000 -b '0.0.0.0'
