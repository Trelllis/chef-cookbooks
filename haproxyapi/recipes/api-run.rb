script 'install_pip' do
    interpreter 'bash'
    code <<-EOH
    sudo pip install django
EOH

end

script 'install_django' do
    interpreter 'bash'
    code <<-EOH
    sudo pip install django
EOH

end

script 'install_djangorestframework' do
    interpreter 'bash'
    code <<-EOH
sudo pip install djangorestframework
EOH

end


script 'install_slackcommunicator' do
    interpreter 'bash'
    code <<-EOH
    sudo pip install slackweb
EOH

end

script 'install_uwsgi' do
    interpreter 'bash'
    code <<-EOH
    sudo pip install uwsgi
EOH

end

script 'clone_code' do
    interpreter 'bash'
    cwd "/"
    code <<-EOH
    sudo git clone https://github.com/Vinelab/haproxy-config-manager
EOH

end

script 'prepare_log_directory' do
    interpreter 'bash'
    code <<-EOH
    sudo mkdir /var/log/uwsgi/
EOH

end

script 'launch_deamon' do
    interpreter 'bash'
    cwd "/haproxy-config-manager"
    code <<-EOH
    sudo uwsgi --http :8001 --wsgi-file ProxyAPI/wsgi.py --enable-threads --daemonize=/var/log/uwsgi/api.log
EOH

end
