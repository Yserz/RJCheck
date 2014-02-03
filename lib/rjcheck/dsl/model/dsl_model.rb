
# This class represents the attributes that are given from the DSL.
# It discribes the structure of the project which will be analysed.
class DSLModel
  attr_accessor :project_path

	# Sources
  attr_accessor :main_source_folder_path
	attr_accessor :source_folder_path
	attr_accessor :source_folder_type
	attr_accessor :source_resources_folder_path

	# Tests
	attr_accessor :main_test_folder_path
	attr_accessor :test_folder_path
	attr_accessor :test_folder_type
	attr_accessor :test_resources_folder_path

	# Layer packages
	attr_accessor :entities_package
	attr_accessor :repositories_package
	attr_accessor :manager_package

	# Flags
	attr_accessor :generate_test_classes

  def initialize()
  end

	def to_s
		self.instance_variables.map do |var|
			puts [var, self.instance_variable_get(var)].join(':')
		end
	end

end
