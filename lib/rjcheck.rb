#!/usr/bin/ruby
$:.unshift('.')
require 'bundler/setup'
Bundler.require(:default)
require 'imports'


# RJCheck Doku
class RJCheck
	include Imports

	def initialize
		controller = MainController.new()
		controller.run
	end
	RJCheck.new()
end


