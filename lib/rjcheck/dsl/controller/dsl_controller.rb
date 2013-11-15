require 'rjcheck/dsl/attributes/default_attributes.rb'
require '../user_attributes.rb'
#class DSLController

#attr_accessor :project_folder
#attr_accessor :main_source_folder
#attr_accessor :main_test_folder

#def initialize
#
#end

def project_folder(path)
	main_source_folder = ""
	main_test_folder = ""
	yield path
	@project_folder = ProjectFolder.new(path)
end

def main_source_folder(path)
	sources_folder = ""
	sources_resources_folder = ""
	yield path
	@project_folder = ProjectFolder.new(path)
end

def main_test_folder(path)
	test_folder = ""
	test_resources_folder = ""
	yield path
	@project_folder = ProjectFolder.new(path)
end

def source_folder(path)
	type = ""
	yield path
	@project_folder = ProjectFolder.new(path)
end

def sources_resources_folder(path)
	yield path
	@project_folder = ProjectFolder.new(path)
end

def test_folder(path)
	type = ""
	yield path
	@project_folder = ProjectFolder.new(path)
end

def test_resources_folder(path)
	yield path
	@project_folder = ProjectFolder.new(path)
end


require 'rjcheck/dsl/controller/recipe.rb'
#end

