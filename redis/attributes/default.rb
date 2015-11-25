data = {title: 'data', port: 6379}
media = {title: 'media', port: 6389}
cache = {title: 'cache', port: 6399}

node['redis']['stores'] = [data, media, cache]

