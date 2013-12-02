require 'rjcheck/dsl/attributes/default_attributes.rb'
#require '../user_attributes.rb'
require 'rjcheck/dsl/model/project_folder'

puts DEFAULT.inspect

class DSLController

	def self.setter(*method_names)
    method_names.each do |name|
			attr_reader name
      send :define_method, name do |data|
        instance_variable_set "@#{name}".to_sym, data
      end
    end
  end

	setter :main_source_folder, :main_test_folder

	def initialize
		main_source_folder DEFAULT['main_source_folder']['source_folder']['path']
		main_test_folder DEFAULT['main_test_folder']['test_folder']['path']
	end

	def project_folder(path, &block)
		instance_eval(&block)

		puts "  -- main_source_folder: #{@main_source_folder}"
		puts "  -- main_test_folder #{@main_test_folder}"

		puts self.methods.inspect

		@project_folder = ProjectFolder.new(path)
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

