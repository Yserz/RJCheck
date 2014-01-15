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
	
	def analyse_file(this_full_qualifier, java_file)

		this_is_entity = false
		this_is_repository = false
		this_is_manager = false
		
		entities_package = @dsl_object.entities_package
		repositories_package = @dsl_object.repositories_package
		manager_package = @dsl_object.manager_package
	
		#analyse this file package
		if this_full_qualifier.include? entities_package
			this_is_entity = true
		elsif this_full_qualifier.include? repositories_package
			this_is_repository = true
		elsif this_full_qualifier.include? manager_package
			this_is_manager = true
		end
	
		#analyse import files package
		java_file.imports.each { |import_file|  
			if this_is_entity
				#entity is not allowed to use manager and repository
				if java_file.package.include? repositories_package
					puts "Fail: "+ this_full_qualifier + " uses: "+ import_file.package
				elsif java_file.package.include? manager_package
					puts "Fail: "+ this_full_qualifier + " uses: "+ import_file.package
				end
			elsif this_is_repository
				#repository is not allowed to use manager
				if java_file.package.include? manager_package
					puts "Fail: "+ this_full_qualifier + " uses: "+ import_file.package
				end
			end
			#manager is allowed to use everything
		}
	end
	
end
