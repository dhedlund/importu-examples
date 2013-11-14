#!/usr/bin/env ruby
#
# This lesson will show you how to:
#   1. inherit definitions from a base importer
#   2. create and mix in definitions
#

require 'importu'


# an importer can inherit rules from another importer, or mix in a
# common set of rules used across multiple importers

module BookImporterMixin
  include Importu::Dsl

  # the DSL methods that define rules need to be evaluated from within
  # the context of the class using the mix-in; mixing in rules that have
  # already been evaluated will not apply the rules to the importer
  include do
    fields :pages, :release_date
  end
end

class BaseBookImporter < Importu::Importer::Csv
  fields :title, :author, :isbn10
end

class SubclassedBookImporter < BaseBookImporter
  include BookImporterMixin

  fields :pages, :release_date
end

BaseBookImporter.definitions.keys # => [:title, :author, :isbn10]

SubclassedBookImporter.definitions.keys
# ==> [:title, :author, :isbn10, :pages, :release_date]



##### Playground #####

# this tutorial is a fully functioning program; you can try out any of
# the above commands yourself or explore using tools available to you in
# the pry console.  for more info about pry: https://github.com/pry/pry

# to start this program, cd into the tutorials directory and run:
# $> bundle exec ./01-getting-started.rb

require 'pry'
binding.pry # type '!!!' or <CTRL>+D to quit
