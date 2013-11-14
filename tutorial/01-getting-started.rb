#!/usr/bin/env ruby
#
# This lesson will show you how to:
#   1. define very basic CSV, YAML and XML importers
#   2. walk over records in a data file
#

require 'importu'


##### Basic Importer Definitions #####

# a minimal CSV importer consists of only a list of fields
class BookImporter < Importu::Importer::Csv
  # fields we expect to find in the CSV file; field order is not important
  fields :title, :author, :isbn10, :pages, :release_date
end


# importers for other file types look almost identical,
# only the class name we're inheriting from usually needs to change
class JsonBookImporter < Importu::Importer::Json # <- *::Csv to *::Json
  fields :title, :author, :isbn10, :pages, :release_date
end

class XmlBookImporter < Importu::Importer::Xml
  # some importers support additional configuration options.  in the case
  # of the XML importer, we can define an XPath that will be used to find
  # the records to import in an XML document; very useful if the data you
  # want to import is only a subset of a larger document
  records_xpath '//book'

  fields :title, :author, :isbn10, :pages, :release_date
end



##### General Usage #####

# to use an importer, you just instantiate a new instance of it,
# passing in a filename or IO handle of the data to parse
filename = File.expand_path('../../data/books1.csv', __FILE__)
importer = BookImporter.new(filename) # or BookImporter.new(STDIN)


# individual records are accessible via the `records` method, which
# is guaranteed to return an Enumerator of Importu::Record instances
importer.records # => #<Enumerator: ...>

# you can perform any Enumerator operations against records
importer.records.count # => 3
importer.records.select {|r| r[:author] =~ /Matsumoto/ }.count # => 1
importer.records.first[:isbn10] # => "0596516177"

# to access a hash of each record after rules have been applied
importer.records.map(&:to_hash)
# ==> [{:title=>"The Ruby Programming Language",
#       :author=>"David Flanagan and Yukihiro Matsumoto",
#       :isbn10=>"0596516177",
#       :pages=>"448",
#       :release_date=>"Feb 1, 2008"},
#      {:title=>"Computer Science Programming Basics in Ruby",
#       :author=>"Ophir Frieder, Gideon Frieder and David Grossman",
#       :isbn10=>"1449355978",
#       :pages=>"188",
#       :release_date=>"May 1, 2013"},
#      {:title=>"Ruby Cookbook",
#       :author=>"Lucas Carlson and Leonard Richardson",
#       :isbn10=>"0596523696",
#       :pages=>"910",
#       :release_date=>"Jul 26, 2006"}]

# to access each record before rules have been applied
importer.records.map(&:data)
# ==> [{"isbn10"=>"0596516177",
#       "title"=>"The Ruby Programming Language",
#       "author"=>"David Flanagan,Yukihiro Matsumoto",
#       "release_date"=>"Feb 1, 2008",
#       "pages"=>"448"},
#      {"isbn10"=>"1449355978",
#       "title"=>"Computer Science Programming Basics in Ruby",
#       "author"=>"Ophir Frieder,Gideon Frieder,David Grossman",
#       "release_date"=>"May 1, 2013",
#       "pages"=>"188"},
#      {"isbn10"=>"0596523696",
#       "title"=>"Ruby Cookbook",
#       "author"=>" Lucas Carlson,Leonard Richardson",
#       "release_date"=>"Jul 26, 2006",
#       "pages"=>"910"}]


##### Playground #####

# this tutorial is a fully functioning program; you can try out any of
# the above commands yourself or explore using tools available to you in
# the pry console.  for more info about pry: https://github.com/pry/pry

# to start this program, cd into the tutorials directory and run:
# $> bundle exec ./01-getting-started.rb

require 'pry'
binding.pry # type '!!!' or <CTRL>+D to quit
