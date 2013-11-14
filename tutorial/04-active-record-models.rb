#!/usr/bin/env ruby
#
# TODO:
#   - model
#   - how to perform an import
#   - allow_actions
#   - find_by
#   - preprocess and postprocess

require 'importu'


# model 'Books'

# allow_actions :create
# allow_actions :create, :update

# find_by :id # match against a single field, :id (default)
# find_by [:name, :date] # match against multiple fields
# find_by :id, [:name, :date] # try name/date combo if no id match
# find_by nil # never try to look up records, assume :create
# find_by do |record|
#   scoped.where(:foo => record[:name].downcase)
# end



##### Playground #####

# this tutorial is a fully functioning program; you can try out any of
# the above commands yourself or explore using tools available to you in
# the pry console.  for more info about pry: https://github.com/pry/pry

# to start this program, cd into the tutorials directory and run:
# $> bundle exec ./01-getting-started.rb

require 'pry'
binding.pry # type '!!!' or <CTRL>+D to quit
