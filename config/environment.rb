require "bundler/setup"
require 'csv'

Bundler.require

Dir[File.join(File.dirname(__FILE__), "../lib", "*.rb")].each {|f| require f}