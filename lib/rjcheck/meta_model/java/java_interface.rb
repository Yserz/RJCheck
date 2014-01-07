require_relative('java_with_generic')
class JavaInterface < JavaWithGeneric
	
	alias :super_output :output
	
  # List<JavaInterface>
  attr_accessor :extends

  def initialize(package, visibility, imports, identifier, annotations, generic, extends)
    super(package, visibility, imports, identifier, annotations, generic)
    @extends = extends
  end
	
	def output
		puts "Extends: #{@extends}"
		super_output()

	end
	
end