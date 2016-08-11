#!/usr/bin/env bash

echo "test Playbook is executing and recording results to log.txt"

ansible-playbook tests/role.yml > tests/log.txt

echo "Passing Tests...."

grep "TEST_PASSED" tests/log.txt

varPassed="$(echo $?)"

echo "Serious Failures..."

grep "fatal" tests/log.txt

echo $?

echo "Failing Tests...."

grep "TEST_FAILED" tests/log.txt

varFailed="$(echo $?)"


echo "Exit Code from Passed Tests: $varPassed"
echo "Exit Code from Failed Tests: $varFailed"

varResultCode="$varPassed$varFailed"
varExpected="00"

echo "Exit Code Result of Tests:$varResultCode:"

if [ "$varResultCode" == "$varExpected" ]; then
   exit 0
else
   exit 1
fi
