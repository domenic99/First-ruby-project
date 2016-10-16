require 'bundler'
require 'date'
Bundler.require()

ActiveRecord::Base.establish_connection({
	:adapter => 'postgresql',
	:host => "ec2-54-75-230-132.eu-west-1.compute.amazonaws.com",
	:username => 'ssoixcbbzghphf',
	:password => 'J_LgMv4oUc-bsCoZjGGReM20Rm',
	:database => 'd80vn642746m7p'
})


require './models/messages'

Messages.find_each() do |message|
	if message.delete_type == 1 && Time.now.to_i - message.time.to_i >= 3600*message.count
    	message.delete
    end
end