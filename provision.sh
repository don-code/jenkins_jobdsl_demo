#!/bin/sh

rm -rf berks-cookbooks
berks vendor

if [ $(vagrant status | grep -c 'not created') -gt 0 ]; then
  vagrant up
else
  vagrant provision
fi
