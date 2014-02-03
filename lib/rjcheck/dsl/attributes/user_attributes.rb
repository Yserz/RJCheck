# This file sets the user-attributes for every project which will be analysed by RJCheck.
# The default-attributes will be overwritten by the user-attributes attributes.

NODE = {}
NODE['main_source_folder'] = Hash.new
NODE['main_source_folder']['source_folder'] = Hash.new
NODE['main_source_folder']['source_resources_folder'] = Hash.new
NODE['main_test_folder'] = Hash.new
NODE['main_test_folder']['test_folder'] = Hash.new
NODE['main_test_folder']['test_resources_folder'] = Hash.new

# Defines the path to the project.
# Paths have to be expresses with '/'!
# Please note the '/' on the end of the path.
# For windows use e.g.: 'C:/Users/User/Desktop/Project/'
#NODE['path']																											= "C:/Users/Salaxy/Desktop/RJCheckExample/"
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
NODE['repositories_package']									= 'de.fhb.rjcheckexample.repository'
NODE['manager_package']											= 'de.fhb.rjcheckexample.manager'

NODE['generate_test_classes']									= true
