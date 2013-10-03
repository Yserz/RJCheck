
require_relative '../file'
class Interface < File
	attr_accessor :visability
	attr_accessor :name
	attr_accessor :body
	attr_accessor :extends
	attr_accessor :annotations
	attr_accessor :methods
	
  def initialize(path)
		super(path)
  end
end
