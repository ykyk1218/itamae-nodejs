execute "install nvm" do
  user "#{node["nodejs"]["user"]}"
  command "git clone https://github.com/creationix/nvm.git ~/.nvm"
  not_if "test -e ~/.nvm"
end

execute "nodejs install" do
  user "#{node["nodejs"]["user"]}"
  command "source ~/.nvm/nvm.sh && nvm install #{node["nodejs"]["version"]}"
end

execute "copy bashrc for backup" do
  user "#{node["nodejs"]["user"]}"
  command "cp -f ~/.bashrc ~/.bashrc.org"
end

remote_file "/home/#{node["nodejs"]["user"]}/.bashrc" do
  user "#{node["nodejs"]["user"]}"
  source "file/bashrc"
end
