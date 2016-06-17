package 'haproxy' do
  action :install
end

include_recipe 'haproxy-dev::service'

service 'haproxy' do
  action [:enable, :start]
end

include_recipe 'haproxy-dev::configure'
