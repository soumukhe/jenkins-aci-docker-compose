#/bin/bash
openssl req -new -newkey rsa:2048 -days 35600 -nodes -x509 -keyout ansible.key -out ansible.crt -subj '/CN=aci/O=aci/C=US'
mv  ./ansible* ./certs/
