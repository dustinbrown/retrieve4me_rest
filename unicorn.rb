#!/usr/bin/env ruby
# AUTHOR:   deeje
# FILE:     unicorn.rb
# ROLE:     TODO (some explanation)
# CREATED:  2014-05-04 14:03:07
# MODIFIED: 2014-05-04 17:34:23

#Load my config value file
require File.expand_path '../myconfig.rb', __FILE__

#load config files
config = MyConfig.new

project_path = config.attrs[:project_path]

@dir = project_path

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
