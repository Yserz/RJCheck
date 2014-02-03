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
#NODE['path']																											= "D:/Eigene Dateien/Eigene Dokumente/NetBeansProjects/RubyTest"
NODE['path']																											= "/Users/MacYser/Documents/Workspaces/NetBeansWorkspace/RJCheckExample/"

NODE['entities_package']																					= 'de.fhb.rjcheckexample.entity'
NODE['repositories_package']																			= 'de.fhb.rjcheckexample.repositoryfail'
NODE['manager_package']																						= 'de.fhb.rjcheckexample.manager'

NODE['generate_test_classes']																			= false
