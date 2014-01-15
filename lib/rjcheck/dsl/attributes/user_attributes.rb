node = {}
node['project1'] = Hash.new
node['project1']['project_folder'] = Hash.new

node['project1']['project_folder']['path'] = "/Users/MacYser/Documents/Workspaces/NetBeansWorkspace/JavaTestApp/"

NODE = node['project1']['project_folder']

#NODE['path'] = node['project1']['project_folder']['path']
NODE['main_source_folder'] = Hash.new
NODE['main_source_folder']['path']                               = NODE['path'].to_s + 'src/main/'
NODE['main_source_folder']['source_folder'] = Hash.new
NODE['main_source_folder']['source_folder']['path']              = NODE['main_source_folder']['path'].to_s + 'java/'
NODE['main_source_folder']['source_folder']['type']              = 'java'
NODE['main_source_folder']['source_resources_folder'] = Hash.new
NODE['main_source_folder']['source_resources_folder']['path']    = NODE['main_source_folder']['path'].to_s + 'resources/'

NODE['main_test_folder'] = Hash.new
NODE['main_test_folder']['path']                                 = NODE['path'] + 'src/test/'
NODE['main_test_folder']['test_folder'] = Hash.new
NODE['main_test_folder']['test_folder']['path']                  = NODE['main_test_folder']['path'].to_s + 'java/'
NODE['main_test_folder']['test_folder']['type']                  = 'java'
NODE['main_test_folder']['test_resources_folder'] = Hash.new
NODE['main_test_folder']['test_resources_folder']['path']					= NODE['main_test_folder']['path'].to_s + 'resources/'

NODE['entities_package']																					= ""
NODE['repositories_package']																			= ""
NODE['manager_package']																						= ""

NODE['generate_test_classes']																			= true

#node = {}
#node['project1'] = Hash.new
#node['project1']['project_folder'] = Hash.new
#
#node['project1']['project_folder']['path'] = "path/to/user_defined/project/"
#
#NODE = node['project1']['project_folder']
#
##NODE['path'] = 'path/to/project_folder'
#NODE['main_source_folder'] = Hash.new
#NODE['main_source_folder']['path']                               = NODE['path'].to_s + 'src/main/'
#NODE['main_source_folder']['source_folder'] = Hash.new
#NODE['main_source_folder']['source_folder']['path']              = NODE['main_source_folder']['path'].to_s + 'java/...'
#NODE['main_source_folder']['source_folder']['type']              = 'java'
#NODE['main_source_folder']['source_resources_folder'] = Hash.new
#NODE['main_source_folder']['source_resources_folder']['path']    = NODE['main_source_folder']['path'].to_s + 'resources/'
#
#NODE['main_test_folder'] = Hash.new
#NODE['main_test_folder']['path']                                 = NODE['path'] + 'src/test/'
#NODE['main_test_folder']['test_folder'] = Hash.new
#NODE['main_test_folder']['test_folder']['path']                  = NODE['main_test_folder']['path'].to_s + 'java/'
#NODE['main_test_folder']['test_folder']['type']                  = 'java'
#NODE['main_test_folder']['test_resources_folder'] = Hash.new
#NODE['main_test_folder']['test_resources_folder']['path']        = NODE['main_test_folder']['path'].to_s + 'resources/'