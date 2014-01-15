require 'rjcheck/dsl/attributes/default_attributes.rb'
require 'rjcheck/dsl/model/dsl_object'

#puts DEFAULT.inspect

class DSLController

	attr_accessor :dsl_object

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
		main_source_folder_path DEFAULT['main_source_folder']['source_folder']['path']
		main_test_folder_path DEFAULT['main_test_folder']['test_folder']['path']
	end

	def read_dsl(path, &block)
		@dsl_object = DSLObject.new(path)
		instance_eval(&block)

		puts "  -- main_source_folder: #{@main_source_folder_path}"
		puts "  -- main_test_folder #{@main_test_folder_path}"

		#		puts self.methods.inspect

		controller = MainController.new(self)
		controller.run
	end

	#def main_source_folder(path, &block)
	#	sources_folder = ""
	#	sources_resources_folder = ""
	#	yield path
	#	block.call
	#	@project_folder = ProjectFolder.new(path)
	#end
	#
	#def main_test_folder(path, &block)
	#	test_folder = ""
	#	test_resources_folder = ""
	#	yield path
	#	block.call
	#	@project_folder = ProjectFolder.new(path)
	#end
	#
	#def source_folder(path, &block)
	#	type = ""
	#	yield path
	#	block.call
	#	@project_folder = ProjectFolder.new(path)
	#end
	#
	#def sources_resources_folder(path, &block)
	#	yield path
	#	block.call
	#	@project_folder = ProjectFolder.new(path)
	#end
	#
	#def test_folder(path, &block)
	#	type = ""
	#	yield path
	#	block.call
	#	@project_folder = ProjectFolder.new(path)
	#end
	#
	#def test_resources_folder(path, &block)
	#	yield path
	#	block.call
	#	@project_folder = ProjectFolder.new(path)
	#end


end


require 'rjcheck/dsl/controller/recipe.rb'

