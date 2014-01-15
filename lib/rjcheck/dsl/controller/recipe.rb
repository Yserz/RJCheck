require 'rjcheck/dsl/attributes/user_attributes.rb'

RJ = DSLController.new()

RJ.read_dsl NODE['path'] do
	main_source_folder_path				NODE['main_source_folder']['path']
	source_folder_path						NODE['main_source_folder']['source_folder']['path']
	source_folder_type						NODE['main_source_folder']['source_folder']['type']
	source_resources_folder_path	NODE['main_source_folder']['source_resources_folder']['path']

	main_test_folder_path					NODE['main_test_folder']['path']
	test_folder_path							NODE['main_test_folder']['test_folder']['path']
	test_folder_type							NODE['main_test_folder']['test_folder']['type']
	test_resources_folder_path		NODE['main_test_folder']['test_resources_folder']['path']

	entities_package							NODE['entities_package']
	repositories_package					NODE['repositories_package']
	manager_package								NODE['manager_package']

	generate_test_classes					NODE['generate_test_classes']
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

