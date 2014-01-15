require_relative('java_with_generic')
class JavaInterface < JavaWithGeneric

  # List<JavaInterface>
  attr_accessor :extends

  def initialize(package, visibility, imports, identifier, annotations, generic, extends)
    super(package, visibility, imports, identifier, annotations, generic)
    @extends = extends
  end

	def output

		super
		if @extends != nil
				@extends.each do |item|
				puts "Extends: #{@extends.identifier}"
			end
		end
	end

end