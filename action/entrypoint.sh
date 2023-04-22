#!/bin/bash

# Run PSR-4 Linter
vendor/bin/phpcs --standard=PSR4 ./app

# Check for errors
ERROR_COUNT=$(vendor/bin/phpcs --standard=PSR4 --report=summary ./app | grep -oP '(?<=Errors: )\d+')
if [ $ERROR_COUNT -gt 0 ]; then
  echo "Found $ERROR_COUNT errors in the code. Merging to the development branch is not allowed."
  exit 1
fi

echo "PSR-4 Linting checks passed. Merging to the development branch is allowed."
