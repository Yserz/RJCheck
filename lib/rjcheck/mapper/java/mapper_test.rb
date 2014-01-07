# To change this template, choose Tools | Templates
# and open the template in the editor.
#
#
#
#

class MapperTest
	attr_accessor :mapper
	
  def initialize()
		@mapper = JavaMapper.new()
  end

	def run		
		puts "start test"
		
		#map this hardcoded class
		map("package de.fhb.autobday.manager;

				import de.fhb.autobday.dao.*;
				import de.fhb.autobday.data.*;
				import de.fhb.autobday.manager.group.GroupManager;

				/**
				 * Test
				 */
				@RunWith(PowerMockRunner.class)
				public class ABDManagerTest extends TestClass{

				}")
		
	end

	def crawl
		puts "\n\n\n *** Crawl Java ***"
		file_list = Hash.new()
		@crawler.crawl {|path,file| file_list[path]=file}
		file_list
	end

	def map(file_text)
		@mapper.pre_mapping(file_text)
		@mapper.map_file("ABDManagerTest",file_text)
	end
end



