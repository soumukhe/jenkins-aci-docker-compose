#!/bin/bash
ssh-keygen -t rsa -N "" -f remote-key
chmod 400 my.key* 
cp remote-key ~/jenkinsACI/jenkins-aci-docker-compose/myJenkinsData/Ansible/centos7
