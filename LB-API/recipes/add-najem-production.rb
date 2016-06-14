#API Request to add instance to Load Balancer

http_request do
    
    url "http://#{node[:haproxy]['production_ip']}:8001/api/add/?instance_id=#{node[:instance]['id']}&backend=najem&port_numb=80&private_ip=#{node[:instance]['private_ip']}"

end
