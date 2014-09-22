package "nginx" do
	action :install
end
execute "Add key server key" do
	user "root"
	command "sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7"
end

execute "Add https support" do
	command "sudo apt-get install -y apt-transport-https ca-certificates"
end

template "/etc/apt/sources.list.d/passenger.list" do
	source "passenger.list"
end

execute "Secure passenger list" do
	command "sudo chown root: /etc/apt/sources.list.d/passenger.list && sudo chmod 600 /etc/apt/sources.list.d/passenger.list && sudo apt-get update"
end

execute "Install passenger" do
	command "sudo apt-get -y install passenger"
end

execute "Install curl" do
	command "apt-get install -y libcurl4-openssl-dev"
end

execute "Install ruby" do
	command "apt-get install -y ruby-dev"
end

execute "Install passenger nginx module" do
	command "apt-get install -y nginx-extras passenger"
end

template "/etc/nginx/nginx.conf" do
  source "nginx.conf.erb"
end

template "/etc/nginx/conf.d/contact-server.conf" do
  source "contact-server.conf.erb"
end

service "nginx" do
  action :restart
end