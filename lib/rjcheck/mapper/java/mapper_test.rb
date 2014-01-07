
class MapperTest
	attr_accessor :mapper
	
  def initialize()
		@mapper = JavaMapper.new()
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
		
	end

	def map(file_text)
		@mapper.pre_mapping(file_text)
		@mapper.map_file("ABDManagerTest",file_text)
	end
end



