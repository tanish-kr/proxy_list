# ProxyList

Get Free Proxy List

## Environment  

・[phantomjs](http://phantomjs.org/)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'proxy_list'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install proxy_list

## Usage

The country of proxy you can get by specifying the ISO country code  

```ruby
require 'proxy_list'  
#default US free proxy  
proxy_list = ProxyList.get_lists  
#useage country code
proxy_list = ProxyList.get_lists('GB')
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/proxy_list/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
