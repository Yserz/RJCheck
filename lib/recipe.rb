#puts 'deine umuduasdasd'
#project_folder node['project1']['project_folder']['path'] do
#  main_source_folder          node['project1']['project_folder']['main_source_folder']['path']
#  main_test_folder            node['project1']['project_folder']['main_test_folder']['path']
#end
#
## Sources
#main_source_folder node['project1']['project_folder']['main_source_folder']['path'] do
#  sources_folder              node['project1']['project_folder']['main_source_folder']['source_folder']['path']
#  sources_resources_folder    node['project1']['project_folder']['main_source_folder']['source_resources_folder']['path']
#end
## Test
#main_test_folder node['project1']['project_folder']['main_test_folder']['path'] do
#  test_folder                 node['project1']['project_folder']['main_test_folder']['test_folder']['path']
#  test_resources_folder       node['project1']['project_folder']['main_test_folder']['test_resources_folder']['path']
#end
#
#source_folder node['project1']['project_folder']['source_folder']['path'] do
#  type                        node['project1']['project_folder']['main_source_folder']['source_folder']['type']
#end
#sources_resources_folder node['project1']['project_folder']['main_source_folder']['source_folder']['source_resources_folder']['path'] do
#end
#
#test_folder node['project1']['project_folder']['main_test_folder']['test_folder']['path'] do
#  type                        node['project1']['project_folder']['main_test_folder']['test_folder']['type']
#end
#test_resources_folder node['project1']['project_folder']['main_test_folder']['test_folder']['test_resources_folder']['path'] do
#end
#
#load '../dsl/attributes/default_attributes.rb'
#load 'user_attributes.rb'