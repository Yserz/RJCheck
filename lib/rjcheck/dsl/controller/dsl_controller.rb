require 'rjcheck/dsl/attributes/default_attributes.rb'
require 'rjcheck/dsl/model/dsl_object'
require 'rjcheck/dsl/controller/os'

#puts DEFAULT.inspect

class DSLController
	include OS

	attr_accessor :dsl_object

	# generate setter methods to access attributes without @ (neccessary for the recipe)
	def self.setter(*method_names)
    method_names.each do |name|
			attr_reader name
      send :define_method, name do |data|
        instance_variable_set "@#{name}".to_sym, data
      end
    end
  end

	setter :project_path
	setter :main_source_folder_path, :source_folder_path, :source_folder_type, :source_resources_folder_path
	setter :main_test_folder_path, :test_folder_path, :test_folder_type, :test_resources_folder_path
	setter :entities_package, :repositories_package, :manager_package
	setter :generate_test_classes

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
	end

	def define_project(path, &block)
		@dsl_object = DSLObject.new(replace_separator path)
		instance_eval(&block)

		@dsl_object.main_source_folder_path						= replace_separator @main_source_folder_path
		@dsl_object.source_folder_path								= replace_separator @source_folder_path
		@dsl_object.source_folder_type								= replace_separator @source_folder_type
		@dsl_object.source_resources_folder_path			= replace_separator @source_resources_folder_path

		@dsl_object.main_test_folder_path							= replace_separator @main_test_folder_path
		@dsl_object.test_folder_path									= replace_separator @test_folder_path
		@dsl_object.test_folder_type									= replace_separator @test_folder_type
		@dsl_object.test_resources_folder_path				= replace_separator @test_resources_folder_path

		@dsl_object.entities_package									= replace_separator @entities_package
		@dsl_object.repositories_package							= replace_separator @repositories_package
		@dsl_object.manager_package										= replace_separator @manager_package

		@dsl_object.generate_test_classes							= @generate_test_classes

		puts "#{@dsl_object.to_s}"

		#		puts self.methods.inspect

		controller = MainController.new(self)
		controller.run
	end

	def replace_separator(text)
		if OS.windows?
			text.gsub("/", "\\")
		elsif OS.mac? | OS.unix? | OS.linux?
			#			text.gsub("/", "/")
			text
		end
	end
end

require 'rjcheck/dsl/controller/recipe.rb'

