node[:redis] = []
node[:redis][:stores] = []
node[:redis][:stores][:data] = {title: 'data', port: 6379}
node[:redis][:stores][:media] = {title: 'media', port: 6389}
node[:redis][:stores][:cache] = {title: 'cache', port: 6399}

