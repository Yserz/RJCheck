require_relative('java_file')

# Represents a java enumeration
class JavaEnum < JavaFile

	# All args constructor
	def initialize(package, visibility, imports, identifier, annotations)
		super(package, visibility, imports, identifier, annotations)
	end
end