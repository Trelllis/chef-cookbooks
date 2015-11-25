include_recipe 'sysctl::default'

sysctl_param 'vm.swappiness' do
    value 0
end

sysctl_param 'vm.overcommit_memory' do
    value 1
end
