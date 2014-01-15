# To change this template, choose Tools | Templates
# and open the template in the editor.
#
#	author: Andy Klay <klay@fh-brandenburg.de>
#
#
# This class analyse the layer seperation of a mapped the project
#

class Analyzer
	
	attr_accessor :java_map
	attr_accessor :dsl_object
	
  def initialize
    
  end
	
  def analyse(java_map, dsl_object)
    @java_map=java_map
		@dsl_object=dsl_object
		
		# alle java klassen durch laufen
		# key = package + name, value = java_file
		file_list.each { |key,value|  analyse_file(key,value)}
  end	
	
	def analyse_file(key,value)

		is_entity = false
		is_repository = false
		is_manager = false
		
		entities_package = @dsl_object.entities_package
		repositories_package = @dsl_object.repositories_package
		manager_package = @dsl_object.manager_package
	
		if key.include? entities_package

		elsif key.include? repositories_package
   
		elsif key.include? manager_package
   
		else
			
		end
	
	end
	
end
