project = node['project1']['project_folder']

project['path'] = 'path/to/project_folder'

project['main_source_folder']['path']                               = project['path'] + 'src/main/'
project['main_source_folder']['source_folder']['path']              = project['main_source_folder']['path'] + 'java/'
project['main_source_folder']['source_folder']['type']              = 'java'
project['main_source_folder']['source_resources_folder']['path']    = project['main_source_folder']['path'] + 'resources/'

project['main_test_folder']['path']                                 = project['path'] + 'src/test/'
project['main_test_folder']['test_folder']['path']                  = project['main_test_folder']['path'] + 'java/'
project['main_test_folder']['test_folder']['type']                  = 'java'
project['main_test_folder']['test_resources_folder']['path']        = project['main_test_folder']['path'] + 'resources/'