#!/usr/bin/env ruby

require 'sinatra/base'
require 'json'
require_relative 'myconfig.rb'


class Rest < Sinatra::Base

  #Enable external access on any ip configured.
  set :bind, '0.0.0.0'

  #load config files
  config = MyConfig.new

	path = config.attrs[:path]

	#use Rack::Auth::Basic do |username, password|
	#  username ==  config.attrs[:username] and password == config.attrs[:password]
	#end

	def reverse(name)
	  #code
	  name.reverse
	end

	get '/complete' do
	  'Hello World ' + Dir.exists?('tmp/rest/').to_s
	end

	get '/complete/names' do
	  name_array = []
	  Dir.foreach(path) do |item| #if File.directory? '/home/deeje/complete'
	    #skip . files
	    next if item =~ /^\./

	    #set full path for convienence
	    full_path = "#{path}/#{item}"

	    #set the type of file/dir
	    File.directory?(full_path) ? (type = 'dir') : (type = 'file')

	    #set ctime
	    ctime = File.stat(full_path).ctime

	    #Build the array for each item
	    name_array << {
	      'name'      => item,
	      'full_path' => full_path,
	      'type'      => type,
	      'ctime'     => ctime
	      }

	  end
	  name_array.to_json
	end
end
