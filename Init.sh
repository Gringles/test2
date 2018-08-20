sudo mkdir /Software
cd /Software

sudo yum install wget
sudo wget https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-18.03.1.ce-1.el7.centos.x86_64.rpm
sudo yum install docker-ce-18.03.1.ce-1.el7.centos.x86_64.rpm

sudo systemctl start docker
sudo docker version

sudo usermod -aG docker $USER
sudo systemctl enable docker

sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
sudo docker-compose --version

sudo docker ps -a
sudo docker rm nrac_ingest_zookeeper_1 nrac_ingest_kafka_1 

sudo mkdir /Testing
cd /Testing
sudo mkdir Sprint3
cd Sprint3

sudo mkdir Volumes
cd Volumes
sudo mkdir file-ingest
cd file-ingest
sudo mkdir ingested
sudo mkdir file_store
sudo mkdir cache
sudo mkdir error_log
sudo mkdir metropolitan_line_v1_0
cd ingested
sudo mkdir metropolitan_line_v1_0
cd ..
cd file_store
sudo mkdir metropolitan_line_v1_0
cd ..
cd error_log
sudo mkdir metropolitan_line_v1_0

cd /Testing
clear 
ls
cd Sprint3
sudo git clone https://github.com/Gringles/test3.git
cd test3
cd docker-compose-builds

sudo docker network create -d bridge nrac_ingest_default --attachable


cd /test2
sudo rm -r Testing


