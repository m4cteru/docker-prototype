#/bin/bash

trap 'kill `cat /var/app/unicorn.pid`' EXIT

bundle install --path vendor/bundle
bundle exec padrino rake ar:migrate
bundle exec unicorn -c ./config/unicorn.rb
