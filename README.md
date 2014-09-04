# ZkUtils

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

    gem 'zk_utils'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install zk_utils

## Usage

    require 'zk_utils'
    
    z = ZkUtils.new("localhost:2181")
    
    z.ls("/", :r => true).each do | node |
        p node
    end
    
    z.delete("/test", :r => true)


## Contributing

1. Fork it ( http://github.com/<my-github-username>/zk_utils/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
