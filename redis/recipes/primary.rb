node['redis']['stores'].each do |store|
    # create data directorie
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
