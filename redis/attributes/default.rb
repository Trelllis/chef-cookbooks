node[:redis][:stores] = []
node[:redis][:stores].push({title: 'data', port: 6379})
node[:redis][:stores].push({title: 'media', port: 6389})
node[:redis][:stores].push({title: 'cache', port: 6399})

