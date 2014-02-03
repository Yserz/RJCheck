require_relative('java_with_generic')
require 'erb'
# Represents the structure of a java class
class JavaClass < JavaWithGeneric

	# represents the state of the class whether it is abstract or not
	attr_accessor :abstract
	# represents the state of the class whether it is final or not
	attr_accessor :final
	# the list of interfaces which are implemented in the class
	attr_accessor :implements
	# the JavaClass which is extended
	attr_accessor :extends

	# All args constructor
	def initialize(package, visibility, imports, identifier, annotations, abstract, final, implements, extends, generics)
		super(package, visibility, imports, identifier, annotations, generics)
		@abstract = abstract
		@final = final
		@implements = implements
		@extends = extends
	end

	# Prints the actual fields of the class
	def output
		super

		if @extends != nil
			puts "Extends: #{@extends}"
		end

		if @final != nil
			puts "Final: #{@final}"
		end

		if @abstract != nil
			puts "Abstract: #{@abstract}"
		end

		if @implements != nil
			@implements.each do |item|
				puts "#{item.identifier}"
			end
		end
	end

	# Returns a Binding object, describing the variable and method bindings at the point of call.
	def template_binding
		binding
	end

end
