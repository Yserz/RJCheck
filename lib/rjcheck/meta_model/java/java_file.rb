
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
		puts "\n######################################################"
    puts "Package: #{@package}"
    puts "Visibility: #{@visibility}"
		puts "Name: #{@identifier}"

		puts "Imports: \n"
    @imports.each do |item|
      puts "#{item}"
    end

		puts "Annotations: \n"
		if @annotations != nil
			@annotations.each do |item|
				puts "#{item}"
			end
    end

  end
end