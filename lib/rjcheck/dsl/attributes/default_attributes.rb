
node = Hash.new

node['project1'] = Hash.new
node['project1']['project_folder'] = Hash.new

node['project1']['project_folder']['path'] = 'path/to/project_folder'

DEFAULT = node['project1']['project_folder']

#DEFAULT['path'] = 'path/to/project_folder'
DEFAULT['main_source_folder'] = Hash.new
DEFAULT['main_source_folder']['path']                               = DEFAULT['path'].to_s + 'src/main/'
DEFAULT['main_source_folder']['source_folder'] = Hash.new
DEFAULT['main_source_folder']['source_folder']['path']              = DEFAULT['main_source_folder']['path'].to_s + 'java/'
DEFAULT['main_source_folder']['source_folder']['type']              = 'java'
DEFAULT['main_source_folder']['source_resources_folder'] = Hash.new
DEFAULT['main_source_folder']['source_resources_folder']['path']    = DEFAULT['main_source_folder']['path'].to_s + 'resources/'

DEFAULT['main_test_folder'] = Hash.new
DEFAULT['main_test_folder']['path']                                 = DEFAULT['path'] + 'src/test/'
DEFAULT['main_test_folder']['test_folder'] = Hash.new
DEFAULT['main_test_folder']['test_folder']['path']                  = DEFAULT['main_test_folder']['path'].to_s + 'java/'
DEFAULT['main_test_folder']['test_folder']['type']                  = 'java'
DEFAULT['main_test_folder']['test_resources_folder'] = Hash.new
DEFAULT['main_test_folder']['test_resources_folder']['path']        = DEFAULT['main_test_folder']['path'].to_s + 'resources/'

DEFAULT['entities_package']																					= ""
DEFAULT['repositories_package']																			= ""
DEFAULT['manager_package']																					= ""

DEFAULT['generate_test_classes']																		= false
