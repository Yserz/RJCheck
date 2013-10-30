require_relative('java_file')
class JavaEnum < JavaFile

  def initialize(package, visibility, imports, identifier, annotations)
    super(package, visibility, imports, identifier, annotations)
  end
end