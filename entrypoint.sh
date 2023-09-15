#!/bin/bash
set -e

bundle exec rails db:setup
bundle exec rails assets:precompile

exec "$@"