require_relative('java_file')
# Represents a JavaFile which has generics
class JavaWithGeneric < JavaFile
	# the generic as string
	attr_accessor :generic

	# All args constructor
	def initialize(package, visibility, imports, identifier, annotations, generic)
    super(package, visibility, imports, identifier, annotations)
    @generic = generic
  end
end