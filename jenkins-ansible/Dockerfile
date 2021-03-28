FROM soumukhe/jenkins-aci-ansible

USER root   

RUN echo "root:cisco" |chpasswd

RUN apt-get -y update
Run apt-get -y upgrade
RUN apt-get install -y python3

COPY requirements.txt /tmp/requirements.txt

RUN apt -y install python3-pip
RUN pip3 install --no-cache-dir -r /tmp/requirements.txt

RUN ansible-galaxy collection install cisco.mso --force
RUN ansible-galaxy collection install cisco.aci --force


USER jenkins
