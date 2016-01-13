template '/home/ec2-user/code/docker-compose.yml' do
    source 'trellis-compose.yml.erb'
    variables(
        redis: redis
    )
end

# run docker compose
script 'trellis' do
    interpreter 'bash'
    cwd "/home/ec2-user/code"
    code <<-EOH
        docker-compose up -d --no-recreate
    EOH
end
