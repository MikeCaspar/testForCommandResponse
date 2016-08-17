#!/usr/bin/env bash

echo "test Playbook is executing and recording results to log.txt"

ansible-playbook tests/role.yml > tests/log.txt

echo "Passing Tests...."

#grep "TEST_PASSED" tests/log.txt | tee /dev/tty | wc -l

varPassed="$(grep 'TEST_PASSED' tests/log.txt | tee /dev/tty | wc -l)"

#varPassed="$(echo $?)"

echo "Serious Failures..."

grep "fatal" tests/log.txt

echo $?

echo "Failing Tests...."

#grep "TEST_FAILED" tests/log.txt

varFailed="$(grep 'TEST_FAILED' tests/log.txt | tee /dev/tty | wc -l)"

#varFailed="$(echo $?)"

echo "Number of Passed Tests: $varPassed"
echo "Number of Failed Tests: $varFailed"

varResultCode="$varPassed$varFailed"

varExpected="23"

echo "Results of Tests:$varResultCode:"

if [ "$varResultCode" == "$varExpected" ]; then
   echo "correct number of pass and fail - exit 0"
   exit 0
else
    echo "wrong number of pass and fail - exit 1"
   exit 1
fi
