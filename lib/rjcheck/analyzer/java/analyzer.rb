
# This class is responsible for analyzing layer seperation in classes 
# only if the user has set the <entities_package>, <repositories_package>, <manager_package> values in the user_attributes
class Analyzer

	attr_accessor :java_map
	attr_accessor :dsl_model

	
  def initialize(java_map, dsl_model)
    @java_map = java_map
		@dsl_model = dsl_model
  end

	#analyze all classes in project, uses the java_map from mapper and dsl_model from user_attributes
  def analyze
		# iterate through all java classes
		# key = package + name, value = java_file
		puts " \n  *** Analyze Classes *** "
		if !@dsl_model.entities_package.eql?('') && !@dsl_model.repositories_package.eql?('') && !@dsl_model.manager_package.eql?('')
			@java_map.each { |key,value|  analyze_file(key,value)}
		else
			puts "Skipping analyse of layers because no layers are defined."
		end
  end
	
	
	#analyse one single java class and its imports for layer speration
	#with full name - this_full_qualifier(package.classname) and the mapped java_file
	private
	def analyze_file(this_full_qualifier, java_file)
		puts "\nanalyse file: " + this_full_qualifier

		this_is_entity = false
		this_is_repository = false
		#not required
		#this_is_manager = false

		entities_package = @dsl_model.entities_package + "."
		repositories_package = @dsl_model.repositories_package + "."
		manager_package = @dsl_model.manager_package + "."

		#analyse this file package
		if this_full_qualifier.include? entities_package
			this_is_entity = true
			puts '  this is entity '
		elsif this_full_qualifier.include? repositories_package
			this_is_repository = true
			puts '  this is repository '
		elsif this_full_qualifier.include? manager_package
			#not required
			#this_is_manager = true
			puts '  this is manager '
		end

		#analyse imports
		if java_file.imports != nil
			java_file.imports.each { |import_file|
				
				puts '  import: '+ import_file.package
				full_file_name = import_file.package + "." + import_file.identifier
				if this_is_entity
					#entity is not allowed to use manager and repository
					if full_file_name.include? repositories_package
						fail_message(this_full_qualifier, full_file_name)
					elsif full_file_name.include? manager_package
						fail_message(this_full_qualifier, full_file_name)
					end
				elsif this_is_repository
					#repository is not allowed to use manager
					if full_file_name.include? manager_package
						fail_message(this_full_qualifier, full_file_name)
					end
				end
				#manager is allowed to use everything
			}
		else
			puts '  imports are NIL' ;
		end
	end

	# get the failmessage of layer use fail
	private
	def fail_message(this_full_qualifier, full_file_name)
		puts "LAYER FAIL!: \n  "+ this_full_qualifier + "\n  uses: "+ full_file_name
	end

end
