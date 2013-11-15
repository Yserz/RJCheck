#!/usr/bin/ruby

require 'bundler/setup'
Bundler.require(:default)
require_relative 'rjcheck/meta_model/java/class'
require_relative 'rjcheck/meta_model/java/interface'
require_relative 'rjcheck/meta_model/java/method'

require_relative 'rjcheck/crawler/crawler'
require_relative 'rjcheck/crawler/java/java_crawler'
require_relative 'rjcheck/mapper/java/java_mapper'
require_relative 'rjcheck/controller/main_controller'

puts "Please enter the folder of the project: "
folder = gets.chomp
folder = "/Users/MacYser/Documents/Workspaces/NetBeansWorkspace/JavaTestApp"

controller = MainController.new(folder)
controller.run

