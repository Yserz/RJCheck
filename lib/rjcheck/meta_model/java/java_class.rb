
require_relative('java_with_generic')
require 'erb'
class JavaClass < JavaWithGeneric

  # boolean
	attr_accessor :abstract
  # boolean
  attr_accessor :final
  # List<JavaInterface>
	attr_accessor :implements
  # JavaClass
	attr_accessor :extends

  def initialize(package, visibility, imports, identifier, annotations, abstract, final, implements, extends, generics)
    super(package, visibility, imports, identifier, annotations, generics)
    @abstract = abstract
    @final = final
    @implements = implements
    @extends = extends
  end


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

	def template_binding
		binding
	end

end
