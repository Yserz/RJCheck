require_relative('java_file')
class JavaWithGeneric < JavaFile
  # String
  attr_accessor :generic

  def initialize(package, visibility, imports, identifier, annotations, generic)
    super(package, visibility, imports, identifier, annotations)
    @generic = generic
  end
end