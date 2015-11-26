directory "/home/ec2-user/redis"

node['redis']['stores'].each do |store|
    # create directorie
    directory "/home/ec2-user/redis/#{store[:title]}"

    # compile template into docker-compose file
    template '/home/ec2-user/redis/docker-compose.yml' do
        source 'redis-replica-compose.yml.erb'
        variables(
            store: store
        )
    end

    # run replica instances
    script "redis-#{store[:title]}-replica" do
        interpreter 'bash'
        cwd '/home/ec2-user/redis'
        code <<-EOH
            docker-compose up -d --no-recreate
        EOH
    end
end
