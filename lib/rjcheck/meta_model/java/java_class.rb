
require_relative('java_with_generic')
class JavaClass < JavaWithGeneric

	alias :super_output :output

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
		super_output()
		puts "Extends: #{@extends}"
    puts "Final: #{@final}"
		puts "Abstract: #{@abstract}"

    @implements.each do |item|
      puts "#{item.identifier}"
    end
	end

end
