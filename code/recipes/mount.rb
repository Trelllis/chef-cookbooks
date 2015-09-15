node[:deploy].each do |application, deploy|

  directory "/home/ec2-user/#{application}" do
    owner deploy[:user]
    group deploy[:group]
    action :create
  end

  script "mount" do
    interpreter "bash"
    code <<-EOH
    sudo mount -o bind #{deploy[:deploy_to]}/current /home/ec2-user/#{application}
    EOH
  end

end
