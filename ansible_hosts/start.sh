#!/bin/bash

install_single_node(){
    ansible-playbook -i inventory/hosts single.yml --tags=single
}


install_master(){
    ansible-playbook -i inventory/hosts main.yml -l master --tags=master
}

install_backup(){
    ansible-playbook -i inventory/hosts main.yml - l backup --tags=backup
}

install_ha(){
    ansible-playbook -i inventory/hosts ha.yml -l master
    ansible-playbook -i inventory/hosts ha.yml -l backup
    install_master
    install_backup
}

select sel in "install single" "install ha" "quit"
do 
    case $sel in
        "install single")
	    echo 1
	    exit 0
	    ;;
	"install ha")
            echo 2
	    exit 0
	    ;;
        "quit")
            exit 0
	    ;;
    esac
done
