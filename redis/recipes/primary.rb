directory "/home/ec2-user/redis"

node['redis']['stores'].each do |store|
    # create directorie
    directory "/home/ec2-user/redis/#{store[:title]}"

    # compile template into docker-compose file
    template '/home/ec2-user/redis/docker-compose.yml' do
        source 'redis-primary-compose.yml.erb'
        variables store
    end

    # run primary instances
    script "redis-#{store[:title]}-primary" do
        interpreter 'bash'
        cwd '/home/ec2-user/redis'
        code <<-EOH
            docker-compose up -d --no-recreate
        EOH
    end
end
