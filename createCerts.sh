#!/bin/bash

echo createing ssh keys for CentOS7 remote-host,  This is not required for ACI, but you can test out Jenkins functionality to configure remote linux box
echo ...
ssh-keygen -t rsa -N "" -f remote-key
chmod 400 remote-key* 
cp remote-key* $PWD/myJenkinsData/Ansible/centos7/
mv remote-key* $PWD/jenkins-aci-docker-compose/centos7/
echo  "***********************************************************"
echo the path for this key is $PWD/myJenkinsData/Ansible/centos7/
echo you will need to copy the contents of the private key to Jenkins remote_user at a later time
cat $PWD/myJenkinsData/Ansible/centos7/remote-key

#

echo "******************************************************************************************"


echo creating ssl keys for APIC ansible user.  Please create a local user called ansible on APIC and copy and paste
echo the contents of the public certificate to the APIC user.  Please name the certificat ansible on APIC
openssl req -new -newkey rsa:2048 -days 35600 -nodes -x509 -keyout ansible.key -out ansible.crt -subj '/CN=aci/O=aci/C=US'
mv  ./ansible*  $PWD/myJenkinsData/Ansible/APIC/certs/

echo cut and paste the below certificate contents to ansible user on APIC
echo the path to this certificate is: $PWD/myJenkinsData/Ansible/APIC/certs/ansible.crt
cat $PWD/myJenkinsData/Ansible/APIC/certs/ansible.crt
