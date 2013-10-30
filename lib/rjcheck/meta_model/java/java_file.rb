
class JavaFile
  # Visibility
  attr_accessor :visibility
  # String
  attr_accessor :package
  # List<String>
  attr_accessor :imports
  # String
  attr_accessor :identifier
  # List<String>
  attr_accessor :annotations

  def initialize(package, visibility, imports, identifier, annotations)
		@package = package
    @imports = imports
    @identifier = identifier
    @annotations = annotations
    @identifier = identifier
  end
end