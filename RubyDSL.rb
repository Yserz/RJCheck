

## DOMAIN_FILE ######################################################################

class ProjectFolder
  attr_accessor :path
  attr_accessor :main_source_folder
  attr_accessor :main_test_folder
  
  def initialize(path)
    @path = path
  end
  
end

#####################################################################################

## LOGIC_FILE #######################################################################

class DSLController

  attr_accessor :project_folder

  def project_folder(path)
    yield path
    @project_folder = ProjectFolder.new(path)
  end
end

load 'DSL_FILE'

#####################################################################################

## DSL_FILE #########################################################################

project_folder node['project1']['project_folder']['path'] do
  main_source_folder          node['project1']['project_folder']['main_source_folder']['path']
  main_test_folder            node['project1']['project_folder']['main_test_folder']['path']
end

# Sources
main_source_folder node['project1']['project_folder']['main_source_folder']['path'] do
  sources_folder              node['project1']['project_folder']['main_source_folder']['source_folder']['path']
  sources_resources_folder    node['project1']['project_folder']['main_source_folder']['source_resources_folder']['path']
end
# Test
main_test_folder node['project1']['project_folder']['main_test_folder']['path'] do
 	test_folder                 node['project1']['project_folder']['main_test_folder']['test_folder']['path']
  test_resources_folder       node['project1']['project_folder']['main_test_folder']['test_resources_folder']['path']
end



source_folder node['project1']['project_folder']['source_folder']['path'] do
  type                        node['project1']['project_folder']['main_source_folder']['source_folder']['type']
end
sources_resources_folder node['project1']['project_folder']['main_source_folder']['source_folder']['source_resources_folder']['path'] do
end
  


test_folder node['project1']['project_folder']['main_test_folder']['test_folder']['path'] do
	type                        node['project1']['project_folder']['main_test_folder']['test_folder']['type']
end
test_resources_folder node['project1']['project_folder']['main_test_folder']['test_folder']['test_resources_folder']['path'] do
end

load 'DEFAULT_ATTRIBUTES_FILE.rb'
load 'USER_FILE.rb'

#####################################################################################

## DEFAULT_ATTRIBUTES_FILE ##########################################################

project = node['project1']['project_folder']

project['path'] = 'path/to/project_folder'

  project['main_source_folder']['path']                                   = project['path'] + 'src/main/'
    project['main_source_folder']['source_folder']['path']                = project['main_source_folder']['path'] + 'java/'
      project['main_source_folder']['source_folder']['type']              = 'java'
    project['main_source_folder']['source_resources_folder']['path']      = project['main_source_folder']['path'] + 'resources/'
    
  project['main_test_folder']['path']                                     = project['path'] + 'src/test/'
    project['main_test_folder']['test_folder']['path']                    = project['main_test_folder']['path'] + 'java/'
      project['main_test_folder']['test_folder']['type']                  = 'java'
    project['main_test_folder']['test_resources_folder']['path']          = project['main_test_folder']['path'] + 'resources/'
    
#####################################################################################
    
## USER_FILE ########################################################################

node['project1']['project_folder']['path']                                = 'my/path/to/project_folder'
project['main_source_folder']['source_folder']['path']                    = project['main_source_folder']['path'] + 'java/tmp/'



