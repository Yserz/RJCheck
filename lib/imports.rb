$:.unshift('.')
require 'rjcheck/meta_model/java/java_class'
require 'rjcheck/meta_model/java/java_enum'
require 'rjcheck/meta_model/java/java_file'
require 'rjcheck/meta_model/java/java_interface'
require 'rjcheck/meta_model/java/java_with_generic'
require 'rjcheck/meta_model/java/method'

require 'rjcheck/crawler/crawler'
require 'rjcheck/crawler/java/java_crawler'
require 'rjcheck/mapper/java/java_mapper'
require 'rjcheck/mapper/java/mapper_test'
require 'rjcheck/controller/main_controller'

require 'rjcheck/dsl/controller/dsl_controller'
#require 'rjcheck/dsl/model/project_folder'

# This is a module to aggregate all neccessary imports of the project
module Imports

end
