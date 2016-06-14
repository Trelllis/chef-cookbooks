#API Request to remove instance from Load Balancer

http_request 'API Request' do
    
    url "http://#{node[:haproxy]['stage_ip']}:8001/api/remove/?instance_id=#{node[:instance]['id']}&port_numb=80&private_ip=#{node[:instance]['private_ip']}"

end
