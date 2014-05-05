#!/usr/bin/env ruby
# AUTHOR:   deeje
# FILE:     unicorn.rb
# ROLE:     TODO (some explanation)
# CREATED:  2014-05-04 14:03:07
# MODIFIED: 2014-05-04 14:09:36
# set path to app that will be used to configure unicorn,
# note the trailing slash in this example
@dir = "/home/deeje/git/ruby/sinatra/retrieve4me_rest/"

worker_processes 2
working_directory @dir

timeout 30

# Specify path to socket unicorn listens to,
# we will use this in our nginx.conf later
listen "#{@dir}tmp/sockets/unicorn.sock", :backlog => 64

# Set process id path
pid "#{@dir}tmp/pids/unicorn.pid"

# Set log file paths
stderr_path "#{@dir}log/unicorn.stderr.log"
stdout_path "#{@dir}log/unicorn.stdout.log"
