node['redis']['stores'].each do |store|
    # create data directories

    # run primary stores
    docker_compose "redis-#{store[:title]}-primary" do
        action :up
        source 'redis-primary-compose.yml.erb'
    end
end
