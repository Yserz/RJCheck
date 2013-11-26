#!/usr/bin/ruby
$:.unshift('.')
require 'bundler/setup'
Bundler.require(:default)
require 'imports'


# RJCheck Doku
class Main
	include Imports

	def initialize
		puts 'Please enter the folder of the project: '
		folder = gets.chomp
		folder = "/Users/MacYser/Documents/Workspaces/NetBeansWorkspace/JavaTestApp"

		DSLController.new()
		controller = MainController.new(folder)

		controller.run

	end

end

Main.new()


