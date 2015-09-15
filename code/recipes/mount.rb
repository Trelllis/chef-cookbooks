node[:deploy].each do |application, deploy|
  script "mount" do
    interpreter "bash"
    code <<-EOH
    sudo mount -o bind #{deploy[:deploy_to]}/current /home/ec2-user/#{application}
    EOH
  end
end
