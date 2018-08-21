sudo mkdir /Software
cd /Software
echo 
read -n1 -r -p "Install Docker?" input
if ["$input" = '${input#[Yy]}']
then
	sudo yum install wget
	sudo wget https://download.docker.com/linux/centos/7/x86_64/stable/Packages/docker-ce-18.03.1.ce-1.el7.centos.x86_64.rpm
	sudo yum install docker-ce-18.03.1.ce-1.el7.centos.x86_64.rpm

	sudo systemctl start docker
	sudo docker version

	sudo usermod -aG docker $USER
	sudo systemctl enable docker
	clear 
	echo Docker Installed!!
fi

read -n1 -r -p "Install docker-compose?" input
if ["$input"='y']; then
	sudo curl -L https://github.com/docker/compose/releases/download/1.21.2/docker-compose-$(uname -s)-$(uname -m) -o /usr/local/bin/docker-compose
	sudo chmod +x /usr/local/bin/docker-compose
	ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
	docker-compose --version
	clear
	echo docker-compose Installed!!
fi

sudo docker ps -a
sudo docker rm --force nrac_ingest_zookeeper_1 nrac_ingest_kafka_1 nrac_ingest_minifi_1


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
cd Sprint3
read -n1 -r -p "Download Source?" input
if ["$input"='y']; then
	sudo git clone https://github.com/Gringles/test3.git
fi
cd test3
cd docker-compose-builds

sudo docker network create -d bridge nrac_ingest_default --attachable
cd nrac_ingest

read -n1 -r -p "Install Package?" input
if ["$input"='y']; then
	docker-compose up -d
fi


cd ../../../../..