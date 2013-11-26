puts 'tääääst'

### USER ATTRIBUTES

node = Hash.new
project = Hash.new

node['project1'] = Hash.new
node['project1']['project_folder'] = Hash.new

node['project1']['project_folder']['path'] = "path/to/user_defined/project/"

project = node['project1']['project_folder']

#project['path'] = 'path/to/project_folder'
project['main_source_folder'] = Hash.new
project['main_source_folder']['path']                               = project['path'].to_s + 'src/main/'
project['main_source_folder']['source_folder'] = Hash.new
project['main_source_folder']['source_folder']['path']              = project['main_source_folder']['path'].to_s + 'java/...'
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

project_folder project['path'] do
	{
		:main_source_folder			=> project['main_source_folder']['source_folder']['path'],
		:main_test_folder				=> project['main_test_folder']['test_folder']['path']
	}
end

## Sources
#main_source_folder node['project1']['project_folder']['main_source_folder']['path'] do
#	#  sources_folder              = node['project1']['project_folder']['main_source_folder']['source_folder']['path']
#	#  sources_resources_folder    = node['project1']['project_folder']['main_source_folder']['source_resources_folder']['path']
#	puts "+ main_source_folder"
#end
## Test
#main_test_folder node['project1']['project_folder']['main_test_folder']['path'] do
#	#  test_folder                 = node['project1']['project_folder']['main_test_folder']['test_folder']['path']
#	#  test_resources_folder       = node['project1']['project_folder']['main_test_folder']['test_resources_folder']['path']
#	puts "+ main_test_folder"
#end
#
#source_folder node['project1']['project_folder']['main_source_folder']['source_folder']['path'] do
#	#  type                        = node['project1']['project_folder']['main_source_folder']['source_folder']['type']
#	puts "+ source_folder"
#end
#sources_resources_folder node['project1']['project_folder']['main_source_folder']['source_resources_folder']['path'] do
#	puts "+ sources_resources_folder"
#end
#
#test_folder node['project1']['project_folder']['main_test_folder']['test_folder']['path'] do
#	#  type                        = node['project1']['project_folder']['main_test_folder']['test_folder']['type']
#	puts "+ test_folder"
#end
#test_resources_folder node['project1']['project_folder']['main_test_folder']['test_resources_folder']['path'] do
#	puts "+ test_resources_folder"
#end

