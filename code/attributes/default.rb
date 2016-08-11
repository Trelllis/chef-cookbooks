node[:deploy].each do |application, deploy|
    normal[:deploy][application][:user] = 'ec2-user'
    normal[:deploy][application][:group] = 'ec2-user'
    normal[:deploy][application][:deploy_to] = "/home/ec2-user/code/#{application}"
end
default[:deploy]['env']=node['env']
default[:deploy]['layer']=node['backend']