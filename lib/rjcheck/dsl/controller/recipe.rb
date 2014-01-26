require 'rjcheck/dsl/attributes/user_attributes.rb'

$RJ = DSLController.new()

$RJ.define_sources NODE['path'] do
	main_source_folder_path				NODE['main_source_folder']['path']
	source_folder_path						NODE['main_source_folder']['source_folder']['path']
	source_folder_type						NODE['main_source_folder']['source_folder']['type']
	source_resources_folder_path	NODE['main_source_folder']['source_resources_folder']['path']
end

$RJ.define_tests NODE['path'] do
	generate_test_classes					NODE['generate_test_classes']
	main_test_folder_path					NODE['main_test_folder']['path']
	test_folder_path							NODE['main_test_folder']['test_folder']['path']
	test_folder_type							NODE['main_test_folder']['test_folder']['type']
	test_resources_folder_path		NODE['main_test_folder']['test_resources_folder']['path']
end

$RJ.define_layers do
	entities_package							NODE['entities_package']
	repositories_package					NODE['repositories_package']
	manager_package								NODE['manager_package']
end