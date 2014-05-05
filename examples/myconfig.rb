#!/usr/bin/env ruby
#config file

class MyConfig
  attr_accessor :attrs

  def initialize
    @attrs = {
      :username     => '',
      :password     => '',
      :path         => ''
      :project_path => ''
    }
  end

end

