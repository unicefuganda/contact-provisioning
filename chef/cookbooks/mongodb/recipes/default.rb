
execute "Import the public key" do
	command "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
end

execute "Create a list file for mongodb" do
	command "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list"
end

execute "update apt-get" do
	command "apt-get -y update"
end

execute "install mongodb" do
	command "apt-get install -y mongodb-org=2.6.4"
end

service "mongod" do
  action :restart
end