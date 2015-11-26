default[:redis] = []
default[:redis][:stores] = []
default[:redis][:stores][:data] = {title: 'data', port: 6379}
default[:redis][:stores][:media] = {title: 'media', port: 6389}
default[:redis][:stores][:cache] = {title: 'cache', port: 6399}

