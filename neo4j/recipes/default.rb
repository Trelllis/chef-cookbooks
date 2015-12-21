directory "/home/ec2-user/neo4j"
directory "/home/ec2-user/neo4j/data"

template "/home/ec2-user/neo4j/docker-compose.yml" do
    source 'neo4j-compose.yml.erb'
end

# run docker compose
script 'neo4j' do
    interpreter 'bash'
    cwd "/home/ec2-user/neo4j"
    code <<-EOH
        docker-compose up -d --no-recreate
    EOH
end
