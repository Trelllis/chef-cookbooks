default[:redis] = {}
default[:redis][:stores] = []
default[:redis][:stores].push({title: 'data', port: 6379})
default[:redis][:stores].push({title: 'media', port: 6389})
default[:redis][:stores].push({title: 'cache', port: 6399})

