#!/usr/bin/env bash

echo test Playbook is executing and recording results to log.txt

ansible-playbook tests/role.yml > tests/log.txt

echo Passing Tests....

grep TEST_PASSED tests/log.txt

echo Failing Tests....

grep TEST_FAILED tests/log.txt

echo Serious Failures...

grep fatal tests/log.txt
