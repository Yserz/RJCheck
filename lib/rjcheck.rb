#!/usr/bin/ruby
$:.unshift('.')
require 'bundler/setup'
Bundler.require(:default)
require 'imports'


# RJCheck Doku
class Main
	include Imports

	def initialize
		controller = MainController.new()
		controller.run
	end
	Main.new()
end


