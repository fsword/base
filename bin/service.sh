#!/bin/bash

if [ -f ./config/sidekiq.yml ]
then
  exec bundle exec sidekiq -r ./config/boot.rb -C ./config/sidekiq.yml
else
  exec bundle exec sidekiq -r ./config/boot.rb
fi
