NODE = {}
NODE['main_source_folder'] = Hash.new
NODE['main_source_folder']['source_folder'] = Hash.new
NODE['main_source_folder']['source_resources_folder'] = Hash.new
NODE['main_test_folder'] = Hash.new
NODE['main_test_folder']['test_folder'] = Hash.new
NODE['main_test_folder']['test_resources_folder'] = Hash.new

NODE['path']																											= "/Users/MacYser/Documents/Workspaces/NetBeansWorkspace/RJCheckExample/"
#NODE['path']																											= 'path/to/project_folder'
#NODE['main_source_folder']['path']																= NODE['path'].to_s + 'src/main/'
#NODE['main_source_folder']['source_folder']['path']								= NODE['main_source_folder']['path'].to_s + 'java/'
#NODE['main_source_folder']['source_folder']['type']								= 'java'
#NODE['main_source_folder']['source_resources_folder']['path']			= NODE['main_source_folder']['path'].to_s + 'resources/'
#
#NODE['main_test_folder']['path']																	= NODE['path'] + 'src/test/'
#NODE['main_test_folder']['test_folder']['path']										= NODE['main_test_folder']['path'].to_s + 'java/'
#NODE['main_test_folder']['test_folder']['type']										= 'java'
#NODE['main_test_folder']['test_resources_folder']['path']					= NODE['main_test_folder']['path'].to_s + 'resources/'


NODE['entities_package']										= 'de.fhb.rjcheckexample.entity'
NODE['repositories_package']									= 'de.fhb.rjcheckexample.repositoryfail'
NODE['manager_package']											= 'de.fhb.rjcheckexample.manager'

NODE['generate_test_classes']									= true
