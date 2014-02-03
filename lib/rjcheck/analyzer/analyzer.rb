
class Analyzer

	attr_accessor :java_map
	attr_accessor :dsl_model

  def initialize(java_map, dsl_model)
    @java_map = java_map
		@dsl_model = dsl_model
  end

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
	private
	def analyze_file(this_full_qualifier, java_file)

		puts "\nanalyse file: " + this_full_qualifier

		this_is_entity = false
		this_is_repository = false
		this_is_manager = false

		entities_package = @dsl_model.entities_package
		repositories_package = @dsl_model.repositories_package
		manager_package = @dsl_model.manager_package

		#analyse this file package
		if this_full_qualifier.include? entities_package
			this_is_entity = true
			puts '  this is entity '
		elsif this_full_qualifier.include? repositories_package
			this_is_repository = true
			puts '  this is repository '
		elsif this_full_qualifier.include? manager_package
			this_is_manager = true
			puts '  this is manager '
		end

		#analyse imports
		if java_file.imports != nil
			java_file.imports.each { |import_file|
				
				puts '  import: '+ import_file.package
				if this_is_entity
					#entity is not allowed to use manager and repository
					if import_file.package.include? repositories_package
						fail_message(this_full_qualifier, import_file)
					elsif import_file.package.include? manager_package
						fail_message(this_full_qualifier, import_file)
					end
				elsif this_is_repository
					#repository is not allowed to use manager
					if import_file.package.include? manager_package
						fail_message(this_full_qualifier, import_file)
					end
				end
				#manager is allowed to use everything
			}
		else
			puts '  imports are NIL' ;
		end
	end


	def fail_message(this_full_qualifier, import_file)
		puts "LAYER FAIL!: \n  "+ this_full_qualifier + "\n  uses: "+ import_file.package + import_file.identifier
	end

end
