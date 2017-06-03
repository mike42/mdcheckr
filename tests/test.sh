#!/bin/bash
# test.sh: Execute test cases over mdcheckr script.
# The test cases themselves are simply markdown files. Those ending in "good"
# are expected to validate, while "bad" examples are expected to be picked up.
set -e

# Functions to wrap test output
function green() {
  echo -e "\033[32m[ \e[1m$1\e[21m ]\e[0m"
}

function red() {
  echo -e "\033[31m[ \e[1m$1\e[21m ]\e[0m"
}

function explain {
  >&2 echo -e Warning:$1:$2
}

# Executable path
mdcheckr="../mdcheckr"

# Start at 0 failures
failures=0

# Confirm that good examples pass
find . -name '*_good.md' -print0 | tr '\0' '\n' | while read -r line; do
  echo -n "Expecting '$line' to pass without errors "
  if ! $mdcheckr "$line" > /dev/null 2> /dev/null; then
    red "FAIL"
    failures=$((failures+1))
  else
    green "OK"
  fi
done

# Confirm that bad examples fail
while read -r line; do
  echo -n "Expecting '$line' to raise errors "
  if $mdcheckr "$line" > /dev/null 2> $line.err.actual; then
    red "FAIL"
    failures=$((failures+1))
    explain "$line" "Expected to see errors from this file"
  else
    # TODO compare actual and expected failure output here
    green "OK"
  fi
  rm -f $line.err.actual
done < <(find . -name '*_bad.md' -print0 | tr '\0' '\n')

# Log number of failures
if [ "$failures" -gt 0 ]; then
  echo "Done, with $failures failed test(s)."
fi

# Use number of failures as exit code
exit $failures
