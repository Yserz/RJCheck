
require_relative('java_file')
class JavaClass < JavaFile
  # boolean
	attr_accessor :abstract
  # boolean
  attr_accessor :final
  # List<JavaInterface>
	attr_accessor :implements
  # JavaClass
	attr_accessor :extends

  def initialize(package, visibility, imports, identifier, annotations, abstract, final, implements, extends)
    super(package, visibility, imports, identifier, annotations)
    @abstract = abstract
    @final = final
    @implements = implements
    @extends = extends
  end
end
