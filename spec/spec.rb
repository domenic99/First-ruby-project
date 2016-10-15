require '../app.rb'
require 'rspec'
require 'rack/test'

describe 'Server Service' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

	it "should return form" do
		get '/'
		expect(last_response).to be_ok
	end

	it "checking for bad link" do
		get '/message/bad'
		last_response.body.include? ("Something went wrong. Please, try again!")
	end
end