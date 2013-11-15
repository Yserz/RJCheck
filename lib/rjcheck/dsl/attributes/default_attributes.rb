node = Hash.new
project = Hash.new

node['project1'] = Hash.new
node['project1']['project_folder'] = Hash.new

node['project1']['project_folder']['path'] = 'path/to/project_folder'

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