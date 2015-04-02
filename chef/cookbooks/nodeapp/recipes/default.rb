directory "/var/www" do
  owner "www-data"
  group "www-data"
  mode "0755"
  action :create
end

git "/var/www/" do
  user "www-data"
  repository "https://github.com/unicefuganda/contacts.git"
  reference "master"
  revision "HEAD"
  action "sync"
end

execute "Install npm dependencies" do
  cwd "/home/contact"
  command "npm install"
end

directory "/var/log/contacts" do
  recursive true
  action :delete
end

directory "/var/log/contacts" do
  recursive true
  action :create
end
