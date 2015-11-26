include_recipe 'sysctl::default'

sysctl_param 'vm.swappiness' do
    value 0
end
