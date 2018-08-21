sudo mkdir /Software
cd /Software
echo 
read -n1 -r -p "Install Docker?" input
if ["$input" = 'y']
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

