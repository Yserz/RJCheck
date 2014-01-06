#!/usr/bin/ruby
$:.unshift('.')
require 'bundler/setup'
Bundler.require(:default)
require 'imports'


# RJCheck Doku
class Main
	include Imports

	def initialize

		# switch here to execute the normal run method or test method
		#run_controller()
		run_test()

	end
	
	def run_controller
		puts 'Please enter the folder of the project: '
		folder = gets.chomp
		#folder = "D:\Eigene Dateien\Eigene Dokumente\NetBeansProjects\RubyTest"
		
		DSLController.new()
		controller = Main::MainController.new(folder)
		controller.run
	end
	
	#only for testing mapper at the moment
	def run_test
		test = MapperTest.new()
		test.run()
	end

end

Main.new()


