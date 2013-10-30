require_relative('java_with_generic')
class JavaInterface < JavaWithGeneric
  # List<JavaInterface>
  attr_accessor :extends

  def initialize(package, visibility, imports, identifier, annotations, generic, extends)
    super(package, visibility, imports, identifier, annotations, generic)
    @extends = extends
  end
end