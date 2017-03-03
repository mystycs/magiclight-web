## Magiclight-web

A Ruby on Rails app to control your magiclights (http://a.co/hQlBTQg)

Has the ability to turn on and off individually, as well as all together.
Also has the ability to change to any HEX RGB Color. ie: #00ff00 (green)

## Running Locally

```  
git clone git@github.com:mystycs/magiclight-web.git
cd magiclight-web
bundle install
rake db:migrate
```

You can find the IP of the lights by checking in the app, and add it to the app.

## How it Works

The lights communicate by TCP packets over port 5577. 

To turn on it's '71230fa3'
To turn off it's '71240fa4'

To change a color its `31 + (HEX Color Code) + 00F00F + checksum(sum of all bytes % 256)` ei: `3100FF0000F00F2E`

## Contribute

All and any kinds of contributions are always welcome!

## License

MIT. See [LICENSE.md](https://github.com/mystycs/project-manager/blob/master/LICENSE.md) for details.
