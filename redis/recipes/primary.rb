include_recipe 'fig'

node['redis']['stores'].each do |store|
    # create data directories

    # run primary stores
    fig 'redis-primary-instance' do
        action :up
        source 'redis-primary-compose.yml.erb'
    end
end
