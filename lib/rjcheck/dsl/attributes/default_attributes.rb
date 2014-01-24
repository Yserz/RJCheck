DEFAULT = {}
DEFAULT['main_source_folder'] = Hash.new
DEFAULT['main_source_folder']['source_folder'] = Hash.new
DEFAULT['main_source_folder']['source_resources_folder'] = Hash.new
DEFAULT['main_test_folder'] = Hash.new
DEFAULT['main_test_folder']['test_folder'] = Hash.new
DEFAULT['main_test_folder']['test_resources_folder'] = Hash.new

DEFAULT['path']																											= 'path/to/project_folder/'
DEFAULT['main_source_folder']['path']                               = 'src/main/'
DEFAULT['main_source_folder']['source_folder']['path']              = 'java/'
DEFAULT['main_source_folder']['source_folder']['type']              = 'java'
DEFAULT['main_source_folder']['source_resources_folder']['path']    = 'resources/'

DEFAULT['main_test_folder']['path']                                 = 'src/test/'
DEFAULT['main_test_folder']['test_folder']['path']                  = 'java/'
DEFAULT['main_test_folder']['test_folder']['type']                  = 'java'
DEFAULT['main_test_folder']['test_resources_folder']['path']        = 'resources/'

DEFAULT['entities_package']																					= ''
DEFAULT['repositories_package']																			= ''
DEFAULT['manager_package']																					= ''

DEFAULT['generate_test_classes']																		= false
