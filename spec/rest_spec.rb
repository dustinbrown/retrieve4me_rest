require_relative '../rest.rb'
require_relative '../myconfig.rb'
require 'rack/test'
require 'json'


#load config files
config = MyConfig.new

set :environment, :test

def app
  Sinatra::Application
end

describe "reverse service" do
  #enables get, post, etc..
  include Rack::Test::Methods

  before :each do
    #login to sinatra with http basic
    basic_authorize config.attrs[:username], config.attrs[:password]
  end
  
  #it ' should reverse the string you provide it' do
  #  reverse('dustin').should == 'nitsud'
  #end

  it 'should load the complete page' do
    get '/complete'
    last_response.should be_ok
  end
  
  it 'should return a json object which parses to an array' do
    get '/complete/names'
    body = JSON.parse(last_response.body)
    body.class.should == Array
  end
  
  it 'should return a json object which parses to an array of hashes' do
    get '/complete/names'
    body = JSON.parse(last_response.body)
    body[0].class.should == Hash
  end
  
  
  #it 'should only expect a valid api key when loading restricted page' do
  #  get '/api=sIJb2djfqXkxEmctlG5aXD7ktnyZFtZL'
  #  las
  #  last_response.should be_ok
  #end
  
end
