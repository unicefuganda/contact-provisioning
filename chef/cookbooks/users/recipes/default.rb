user "contact" do
  action :create
  home "/home/contact"
  system true
  #remove this.
  password "$1$.WsplVWP$vZGPs6vxS0FmQ0dh83M541"
end

user "contact" do
  action :modify
  home "/home/contact"
  supports :manage_home=>true
end

directory "/home/contact" do   
  owner "contact"
  group "contact"
  mode "0755"
  action :create
end