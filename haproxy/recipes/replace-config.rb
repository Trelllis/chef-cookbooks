#API replace request

http_request '' do
    
    url "http://#{node[:haproxyapi]['private_ip']}:8001/api/reload"

end
