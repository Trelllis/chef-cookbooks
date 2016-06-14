#API Request to remove instance from Load Balancer

http_request do
    
    url "http://#{node[:haproxy]['production_ip']}:8001/api/remove/?instance_id=#{node[:instance]['id']}&backend=trellis&port_numb=80&private_ip=#{node[:instance]['private_ip']}"

end
