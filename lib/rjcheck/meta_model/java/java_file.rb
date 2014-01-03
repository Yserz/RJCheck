
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
    @visibility = visibility
    @annotations = annotations
    @identifier = identifier
  end
  
  def output
    puts "Package:#{@package}"
    puts "Name:#{@identifier}"
    @imports.each do |item|
      puts "#{item.identifier}"
    end
  end
end