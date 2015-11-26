package "docker"
include_recipe 'sysctl::default'

service "docker" do
    action :start
end

sysctl_param 'vm.swappiness' do
    value 0
end

sysctl_param 'vm.overcommit_memory' do
    value 1
end
