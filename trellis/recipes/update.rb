template '/home/ec2-user/code/trellis_backend/docker-compose.yml' do
    source 'trellis-compose.yml.erb'
end

# run docker compose
script 'trellis' do
    interpreter 'bash'
    cwd "/home/ec2-user/code/trellis_backend"
    code <<-EOH
        docker-compose pull
        docker-compose stop
        docker-compose rm --force
        docker-compose up -d --no-recreate
    EOH
end
