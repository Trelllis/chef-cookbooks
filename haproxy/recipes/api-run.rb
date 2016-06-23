script 'clone_code' do
    interpreter 'bash'
    cwd "/home"
    code <<-EOH
    sudo git clone https://github.com/Vinelab/haproxy-config-manager
EOH

end

script 'install_requirements' do
    interpreter 'bash'
    cwd "/home/haproxy-config-manager"
    code <<-EOH
    sudo pip install -r requirements.txt
EOH

end

script 'launch_deamon' do
    interpreter 'bash'
    cwd "/home/haproxy-config-manager"
    code <<-EOH
    sudo uwsgi --http :8001 --wsgi-file ProxyAPI/wsgi.py --enable-threads --daemonize=/home/haproxy-config-manager/uwsgi-api.log
EOH

end
