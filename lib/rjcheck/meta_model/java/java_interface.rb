require_relative('java_with_generic')
# Represents the structure of a java interface
class JavaInterface < JavaWithGeneric

	# a list of java interfaces which are extended
	attr_accessor :extends

	# All args constructor
	def initialize(package, visibility, imports, identifier, annotations, generic, extends)
		super(package, visibility, imports, identifier, annotations, generic)
		@extends = extends
	end

	# Prints the actual fields of the class
	def output
		super
		if @extends != nil
			if @extends.respond_to?('each')
				@extends.each do |item|
				puts "Extends: #{@extends.identifier}"
				end
			else
				puts "Extends: #{@extends.identifier}"
			end
		end
	end

end