directory "/home/contact" do	
	owner "contact"
	group "contact"
	mode "0755"
	action :create
end

git "/home/contact/" do
	user "contact"
	repository "https://github.com/unicefuganda/contacts.git"
	reference "master"
	revision "HEAD"
	action "sync"
end

execute "install npm dependencies" do
    cwd "/home/contact/"
    command "npm install"
    action :run
end

directory "/var/log/contact" do
        recursive true
        action :delete
end

directory "/var/log/contact" do
        recursive true
        action :create
end
