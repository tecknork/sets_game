#! /bin/sh

./deployment/wait-for-services.sh
./deployment/prepare-db.sh
bundle exec puma -C config/puma.rb