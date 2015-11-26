include_recipe 'docker-compose'

node['redis']['stores'].each do |store|
    # create data directories

    # run primary stores
    docker-compose 'redis-primary-instance' do
        action :up
        source 'redis-primary-compose.yml.erb'
    end
end
