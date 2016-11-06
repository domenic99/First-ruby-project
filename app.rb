# ** Config **
require 'bundler'
require 'date'
require 'securerandom'
Bundler.require()


# ** CONNECTION **
require './models/connection'


# ** MODELS **
require './models/link_generator'
require './models/data_collector'
require './models/messages'
require './models/check_record'

# ** ROUTES **

# - FORM FOR CREATION -
get '/' do
  erb :'pages/index'
end

# - ADD TO DB -
post '/' do
  @collection = CollectToDB.new(params[:msg]).data
  Messages.create(@collection)

  erb :'/pages/success'
end

# - READ MESSAGE by:link -
get '/message/:link' do
  message = Messages.find_by_link("#{params[:link]}")
  @result = CheckRecord.new(message).result
  erb :'pages/message'
end
