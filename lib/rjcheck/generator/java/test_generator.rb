require 'rjcheck/util/os'

# This class is responsible for generating test classes if the user has set the <generate_test_classes>
# value to true in the user_attributes
class TestGenerator
	# all mapped java_files
	attr_accessor :java_map
	# the dsl model which contains the paths for the test classes
	attr_accessor :dsl_model

	def initialize(java_map, dsl_model)
		@java_map = java_map
		@dsl_model = dsl_model
	end

	# Generates all test classes if the requirements are satisfied
	def generate
		puts '####### Generation of TestClasses begins'
		@java_map.each { |key, value|
			if @java_map.has_key?(key +'Test') || key.end_with?('Test')
				puts key + ' already has a Test (Test will not be generated)'
			elsif value.is_a? JavaClass
				if value.abstract
					puts key + ' is abstract (Test will not be generated)'
				else
					generate_test_class value
				end
			end
		}
	end

	private
	# Generates a test class depending on the class_object
	def generate_test_class(class_object)
		puts '####### generate Test for: ' +class_object.identifier

		path_to_class = class_object.package.gsub('.', '/')
		path_to_class = OS.replace_separator path_to_class
		system_separator = OS.get_system_separator

		path_to_class = "#{@dsl_model.test_folder_path}#{path_to_class}"
		FileUtils.mkdir_p path_to_class
		path_to_class = "#{path_to_class}#{system_separator}#{class_object.identifier}Test.java"
		puts "write to: #{path_to_class}"

		template = File.read(File.join(File.dirname(__FILE__), '../../resources/test_class_template.erb'))

		File.open(path_to_class, 'w+') do |file|
			file << ERB.new(template).result(class_object.template_binding)
		end
	end
end
