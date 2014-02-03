require 'rjcheck/dsl/attributes/default_attributes.rb'
require 'rjcheck/dsl/model/dsl_model'
require 'rjcheck/util/os'
require 'rjcheck/controller/main_controller'

# This class is responsible for controlling all DSL-related actions.
# E.g. reading the DSL and overwriting the default-attributes with the user-attributes.
class DSLController

	attr_accessor :dsl_model

	# generate setter methods to access attributes without @ (neccessary for the recipe)
	def self.setter(*method_names)
    method_names.each do |name|
			attr_reader name
      send :define_method, name do |data|
				instance_variable_set "@#{name}".to_sym, data if data
      end
    end
  end


	setter :project_path
	setter :main_source_folder_path, :source_folder_path, :source_folder_type, :source_resources_folder_path
	setter :main_test_folder_path, :test_folder_path, :test_folder_type, :test_resources_folder_path
	setter :entities_package, :repositories_package, :manager_package
	setter :generate_test_classes

	# The Default-Constructor initializes the DSL-values with the default-attributes.
	# The default-values will may be overwritten by the user-attributes.
	def initialize
		main_source_folder_path				DEFAULT['main_source_folder']['path']
		source_folder_path						DEFAULT['main_source_folder']['source_folder']['path']
		source_folder_type						DEFAULT['main_source_folder']['source_folder']['type']
		source_resources_folder_path	DEFAULT['main_source_folder']['source_resources_folder']['path']

		main_test_folder_path					DEFAULT['main_test_folder']['path']
		test_folder_path							DEFAULT['main_test_folder']['test_folder']['path']
		test_folder_type							DEFAULT['main_test_folder']['test_folder']['type']
		test_resources_folder_path		DEFAULT['main_test_folder']['test_resources_folder']['path']

		entities_package							DEFAULT['entities_package']
		repositories_package					DEFAULT['repositories_package']
		manager_package								DEFAULT['manager_package']

		generate_test_classes					DEFAULT['generate_test_classes']

		@dsl_model = DSLModel.new()
	end

	# This method defines the path to the project and the source-structure of the project to analyse.
	# It recives a block of code from the DSL which will be executed to overwrite the default-attributes.
	def define_sources(path, &block)
		if not path
			raise Exception.new("Definition of projectpath is missing!")
		end
		instance_eval(&block)
		@dsl_model.project_path											= OS.replace_separator path
		@dsl_model.main_source_folder_path					= OS.replace_separator(path + @main_source_folder_path)
		@dsl_model.source_folder_path								= OS.replace_separator(path + @main_source_folder_path + @source_folder_path)
		@dsl_model.source_folder_type								= @source_folder_type
		@dsl_model.source_resources_folder_path			= OS.replace_separator(path + @main_source_folder_path + @source_resources_folder_path)

		#		puts "#{@dsl_model.to_s}"

	end

	# This method defines the test-structure of the project to analyse.
	# It recives a block of code from the DSL which will be executed to overwrite the default-attributes.
	def define_tests(path, &block)
		instance_eval(&block)
		@dsl_model.generate_test_classes						= @generate_test_classes
		@dsl_model.main_test_folder_path						= OS.replace_separator(path + @main_test_folder_path)
		@dsl_model.test_folder_path									= OS.replace_separator(path + @main_test_folder_path + @test_folder_path)
		@dsl_model.test_folder_type									= @test_folder_type
		@dsl_model.test_resources_folder_path				= OS.replace_separator(path + @main_test_folder_path + @test_resources_folder_path)

	end

	# This method defines the layers of the project to analyse.
	# It recives a block of code from the DSL which will be executed to overwrite the default-attributes.
	def define_layers(&block)
		instance_eval(&block)
		@dsl_model.entities_package									= @entities_package
		@dsl_model.repositories_package							= @repositories_package
		@dsl_model.manager_package									= @manager_package
	end
end

# Loads the DSL and executes the methods to set the values of the DSL.
require 'rjcheck/dsl/controller/recipe.rb'

