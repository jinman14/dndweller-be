#!/usr/bin/env bash

# Exit on error
set -o errexit

bundle install

# If you have a paid instance type, we recommend moving
# database migrations like this one from the build command
# to the pre-deploy command:
bin/rails db:{migrate,seed}