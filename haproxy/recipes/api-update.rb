script 'clone_code' do
    interpreter 'bash'
    cwd "/home/haproxy-config-manager"
    code <<-EOH
    sudo git pull origin master
EOH

end

script 'install_requirements' do
    interpreter 'bash'
    cwd "/home/haproxy-config-manager"
    code <<-EOH
    sudo pip install -r requirements.txt
EOH

end

script 'kill_uwsgi' do
    interpreter 'bash'
    cwd "/home/haproxy-config-manager"
    code <<-EOH
    sudo pkill uwsgi
EOH

end

#script 'free_port' do
#    interpreter 'bash'
#    cwd "/home/haproxy-config-manager"
#    code <<-EOH
#    sudo fuser -k 8001/tcp
#EOH
#
#end

script 'launch_deamon' do
    interpreter 'bash'
    cwd "/home/haproxy-config-manager"
    code <<-EOH
    sudo uwsgi --http :8001 --wsgi-file ProxyAPI/wsgi.py --enable-threads --daemonize=/home/haproxy-config-manager/uwsgi-api.log
EOH

end
