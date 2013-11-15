
require_relative '../file'
class Clazz < File
	attr_accessor :visability
	attr_accessor :name
	attr_accessor :abstract
	attr_accessor :body
	attr_accessor :implements
	attr_accessor :extends
	attr_accessor :annotations
	attr_accessor :attributes
	attr_accessor :methods
	attr_accessor :classes

  def initialize(path)
		super(path)
  end
end
