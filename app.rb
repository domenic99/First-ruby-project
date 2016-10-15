# ** Config **
require 'bundler'
require 'date'
Bundler.require()


# ** CONNECTION **

#ActiveRecord::Base.establish_connection({
#	:adapter => 'postgresql',
#	:username => 'postgres',
#	:password => '2035211',
#	:database => 'all_the_messages'
#})


ActiveRecord::Base.establish_connection({
	:adapter => 'postgresql',
	:host => "ec2-54-75-230-132.eu-west-1.compute.amazonaws.com",
	:username => 'ssoixcbbzghphf',
	:password => 'J_LgMv4oUc-bsCoZjGGReM20Rm',
	:database => 'd80vn642746m7p'
})


# ** MODELS **

require './models/messages'


# ** ROUTES **

# - FORM FOR CREATION -
get '/' do
	erb :'pages/index'
end

# - ADD TO DB -
post '/' do
	_data = params[:msg]
	
	#generates safe link

	o = [('a'..'z'), ('A'..'Z')].map { |i| i.to_a }.flatten
	string = (0...50).map { o[rand(o.length)] }.join

	_data['message'] = AESCrypt.encrypt(_data['message'], "p4ssw0rd")
	_data['link'] = string

	message = Messages.create(_data)

	erb :'/pages/success'
end

# - READ MESSAGE by:link -
get '/message/:link' do
	@message = Messages.find_by_link("#{params[:link]}")

	if @message != nil
		if @message.delete_type == 0
			@result = "1"
			erb :'pages/message'
		elsif Time.now.to_i - @message.time.to_i <= 3600
			erb :'pages/message'
		else
			@result = "0"
			Messages.delete(@message.id)
			erb :'pages/message'
		end	
	else
		@result = "0"
		erb :'pages/message'
	end
end

















