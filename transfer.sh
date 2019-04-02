#!/bin/bash

cd $INFRA_ROOT
cp build/quotes.jar ansible_scripts/roles/quotes/files/
cp build/newsfeed.jar ansible_scripts/roles/newsfeed/files/
cp build/front-end.jar ansible_scripts/roles/front-end/files/

scp -i $3 $INFRA_ROOT/ansible_scripts $1@$2:~/

ssh -i $3 $1@$2 'ansible-playbook quotesPlaybook.yml --ask-vault-pass'