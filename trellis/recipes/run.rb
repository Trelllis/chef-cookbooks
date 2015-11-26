template '/home/ec2-user/code' do
    source 'trellis-compose.yml.erb'
end

# run docker compose
script 'trellis' do
    interpreter 'bash'
    cwd "/home/ec2-user/code"
    code <<-EOH
        docker-compose up -d --no-recreate
    EOH
end
