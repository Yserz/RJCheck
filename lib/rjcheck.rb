#!/usr/bin/ruby

require 'bundler/setup'
Bundler.require(:default)
require_relative 'imports'



class Main
	include Imports
	def initialize
		puts "Please enter the folder of the project: "
		folder = gets.chomp
		folder = "/Users/MacYser/Documents/Workspaces/NetBeansWorkspace/JavaTestApp"

		controller = MainController.new(folder)
		controller.run
	end
end

Main.new()


