directory "#{ENV['HOME']}/neo4j"
directory "#{ENV['HOME']}/neo4j/data"

template "#{ENV['HOME']}/neo4j/docker-compose.yml" do
    source 'neo4j-compose.yml.erb'
end

# run docker compose
script 'neo4j' do
    interpreter 'bash'
    cwd "#{ENV['HOME']}/neo4j"
    code <<-EOH
        docker-compose up -d --no-recreate
    EOH
end
