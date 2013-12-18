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
				#folder = "D:\Eigene Dateien\Eigene Dokumente\NetBeansProjects\RubyTest"
		
				DSLController.new()
				controller = MainController.new(folder)
		
				controller.run

	end

end

Main.new()


