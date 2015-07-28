#!/bin/bash
if [ -f setup.sh ]
then
  chmod +x setup.sh
  sleep 1
  sh setup.sh
fi
exec bundle exec unicorn -c ./config/unicorn.rb
