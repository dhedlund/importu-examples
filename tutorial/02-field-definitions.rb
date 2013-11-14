#!/usr/bin/env ruby
#
# TODO:
#   - 'field' vs. 'fields'
#   - how definitions override each other
#   - field lables
#   - required fields
#   - abstract fields
#   - one or two converter examples
#   - field blocks definitions
#   - calling other converters from within block definitions
#   - referncing other field values from within block definitions
#   - raising exceptions (invalid record, argument error)
#   - preventing changes during updates (:update => false)
#

require 'importu'



##### Playground #####

# this tutorial is a fully functioning program; you can try out any of
# the above commands yourself or explore using tools available to you in
# the pry console.  for more info about pry: https://github.com/pry/pry

# to start this program, cd into the tutorials directory and run:
# $> bundle exec ./01-getting-started.rb

require 'pry'
binding.pry # type '!!!' or <CTRL>+D to quit
