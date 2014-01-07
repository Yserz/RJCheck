

class MapperTest
	attr_accessor :mapper
	
  def initialize()
		@mapper = JavaMapper.new()
		@java_file
  end

	def run		
		puts "start test"
		
		#map this hardcoded class
		map("package de.fhb.autobday.manager;

				import de.fhb.autobday.dao.GroupDAO;
				import de.fhb.autobday.data.GroupVO;
				import de.fhb.autobday.manager.group.GroupManager;

				/**
				 * Test
				 */
				@RunWith(PowerMockRunner.class)
				public class ABDManagerTest extends TestClass implements InterfaceIdentifier{

				}")
		
		# evalute mapping
		puts " "
		puts "mapper_test results:"
		puts "identifier "
		puts @java_file.identifier == "ABDManagerTest"
		puts "visibility "
		puts @java_file.visibility == "public"
		puts "package "
		puts @java_file.package == "de.fhb.autobday.manager"
		#puts @java_file.extends == "TestClass"
		#...
		
		imports = Array.new
		imports.push("de.fhb.autobday.dao.GroupDAO")
		imports.push("de.fhb.autobday.data.GroupVO")
		imports.push("de.fhb.autobday.manager.group.GroupManager")
		
		
		#	@java_file.imports.each do |i|
		#	for current in @java_file.imports
		#		puts @java_file.imports[i] == imports[i]
		#		puts "test"
		#end

		
	end

	def map(file_text)
		@mapper.pre_mapping(file_text)
		@java_file=@mapper.map_file("ABDManagerTest",file_text)
	end
end



