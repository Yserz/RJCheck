# Represents the structure which have all java constructs in common
class JavaFile
	# field which contains the visibility of the JavaFile (e.g. public, protected, private)
	attr_accessor :visibility
	# the package name of the file
	attr_accessor :package
	# List<java_file>
	# the list of imports which are present in the file
	attr_accessor :imports
	# the name of the file
	attr_accessor :identifier
	# the list of annotations which are present in the file
	attr_accessor :annotations

	# All args constructor
	def initialize(package, visibility, imports, identifier, annotations)
		@package = package
		@imports = imports
		@visibility = visibility
		@annotations = annotations
		@identifier = identifier
	end

	# Prints the actual fields of the class
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