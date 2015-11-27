template '/home/ec2-user/code/trellis_backend/docker-compose.yml' do
    source 'najem-compose.yml.erb'
end

# run docker compose
script 'run-najem' do
    interpreter 'bash'
    cwd "/home/ec2-user/code/trellis_backend"
    code <<-EOH
        docker-compose up -d --no-recreate
    EOH
end
