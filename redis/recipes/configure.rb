package "docker"
include_recipe 'sysctl::default'

service "docker" do
    action :start
end

script "install docker-compose" do
    interpreter 'bash'
    code <<-EOH
        curl -L https://github.com/docker/compose/releases/download/1.5.1/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
        chmod +x /usr/local/bin/docker-compose
    EOH

    not_if do ::File.exists?('/usr/local/bin/docker-compose') end
end

sysctl_param 'vm.swappiness' do
    value 0
end

sysctl_param 'vm.overcommit_memory' do
    value 1
end
