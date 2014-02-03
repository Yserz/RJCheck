# This is the recipe-file. Its a DSL which describes the structure of an EJB-project.

require 'rjcheck/dsl/attributes/user_attributes.rb'

$RJ = DSLController.new()

# This is a method call of the method define_sources. It sends a ruby block as parameter which will overwrite the default-attributes.
$RJ.define_sources NODE['path'] do
	main_source_folder_path				NODE['main_source_folder']['path']
	source_folder_path						NODE['main_source_folder']['source_folder']['path']
	source_folder_type						NODE['main_source_folder']['source_folder']['type']
	source_resources_folder_path	NODE['main_source_folder']['source_resources_folder']['path']
end

# This is a method call of the method define_tests. It sends a ruby block as parameter which will overwrite the default-attributes.
$RJ.define_tests NODE['path'] do
	generate_test_classes					NODE['generate_test_classes']
	main_test_folder_path					NODE['main_test_folder']['path']
	test_folder_path							NODE['main_test_folder']['test_folder']['path']
	test_folder_type							NODE['main_test_folder']['test_folder']['type']
	test_resources_folder_path		NODE['main_test_folder']['test_resources_folder']['path']
end

# This is a method call of the method define_layers. It sends a ruby block as parameter which will overwrite the default-attributes.
$RJ.define_layers do
	entities_package							NODE['entities_package']
	repositories_package					NODE['repositories_package']
	manager_package								NODE['manager_package']
end