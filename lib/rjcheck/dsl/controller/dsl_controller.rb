#require 'rjcheck/dsl/attributes/default_attributes.rb'
require '../user_attributes.rb'
require 'rjcheck/dsl/model/project_folder'
#class DSLController

#attr_accessor :project_folder
#attr_accessor :main_source_folder
#attr_accessor :main_test_folder

#def initialize
#
#end





def project_folder(path, &block)

	### DEFAULT ATTRIBUTES

	node = Hash.new
	project = Hash.new

	node['project1'] = Hash.new
	node['project1']['project_folder'] = Hash.new

	node['project1']['project_folder']['path'] = path

	project = node['project1']['project_folder']

	#project['path'] = 'path/to/project_folder'
	project['main_source_folder'] = Hash.new
	project['main_source_folder']['path']                               = project['path'].to_s + 'src/main/'
	project['main_source_folder']['source_folder'] = Hash.new
	project['main_source_folder']['source_folder']['path']              = project['main_source_folder']['path'].to_s + 'java/'
	project['main_source_folder']['source_folder']['type']              = 'java'
	project['main_source_folder']['source_resources_folder'] = Hash.new
	project['main_source_folder']['source_resources_folder']['path']    = project['main_source_folder']['path'].to_s + 'resources/'

	project['main_test_folder'] = Hash.new
	project['main_test_folder']['path']                                 = project['path'] + 'src/test/'
	project['main_test_folder']['test_folder'] = Hash.new
	project['main_test_folder']['test_folder']['path']                  = project['main_test_folder']['path'].to_s + 'java/'
	project['main_test_folder']['test_folder']['type']                  = 'java'
	project['main_test_folder']['test_resources_folder'] = Hash.new
	project['main_test_folder']['test_resources_folder']['path']        = project['main_test_folder']['path'].to_s + 'resources/'

	### DSL OVERWRITE

	main_source_folder = project['main_source_folder']['source_folder']['path']
	main_test_folder = project['main_test_folder']['test_folder']['path']


	data = block.call if block

	data[:main_source_folder] = main_source_folder if !data[:main_source_folder]
	data[:main_test_folder] = main_test_folder if !data[:main_test_folder]

	puts "  -- main_source_folder: #{data[:main_source_folder]}"
	puts "  -- main_test_folder #{data[:main_test_folder]}"
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


require 'rjcheck/dsl/controller/recipe.rb'
#end

