
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
    
    if @package != nil
      puts "Package: #{@package}"
    end
    
    if @visibility != nil
      puts "Visibility: #{@visibility}"
    end
    if @identifier != nil
      puts "Name: #{@identifier}"
    end
	
    if @imports != nil
      print "Imports: "
      @imports.each do |item|
        print "#{item.identifier}"
      end
			puts ""
    end

		if @annotations != nil
      puts "Annotations: \n"
			@annotations.each do |item|
				puts "#{item.identifier}"
			end
    end

  end
end