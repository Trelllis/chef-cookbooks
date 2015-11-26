default[:redis] = {}
default[:redis][:stores] = []
default[:redis][:stores].push({title: 'data', port: 6379, ip: '52.30.8.129'})
default[:redis][:stores].push({title: 'media', port: 6389, ip: '52.30.8.129'})
default[:redis][:stores].push({title: 'cache', port: 6399, ip: '52.30.8.129'})

