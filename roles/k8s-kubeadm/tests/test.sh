#!/bin/bash

if [ $# -ne 0 ]; then
  echo "Error of number of arguments"
  echo "CMD: ./test.sh"
fi

echo "Setup Vagrant machines"
vagrant up

if [ $? -ne 0 ]; then
  vagrant destroy -f
  exit $1
fi

#echo "Execute playbook test.yml"
#ansible-playbook -vvvvv \
                #-i ${PWD}/.vagrant/provisioners/ansible/inventory/vagrant_ansible_inventory \
                #test.yml
#ret=$?

#echo "Destroy Vagrant machines"
#vagrant destroy -f

exit $ret


