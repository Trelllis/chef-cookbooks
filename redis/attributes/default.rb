default[:redis] = {}
default[:redis][:stores] = []
default[:redis][:stores].push({title: 'data', port: '6379', ip: '10.0.3.60'})
default[:redis][:stores].push({title: 'media', port: '6389', ip: '10.0.3.60'})
default[:redis][:stores].push({title: 'cache', port: '6399', ip: '10.0.3.60'})

