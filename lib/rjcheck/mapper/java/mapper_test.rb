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

		#puts "\n\n\n *** Crawl everything ***"
		#crawler = Crawler.new(folder)
		#crawler.crawl {|file| puts "InData: #{file}"}

		#file_list = crawl
		#file_list.each { |key,value|  puts "\n\nLOG: key: #{key}\nvalue: #{value}"}
		
		puts "start test"
		
		map("package de.fhb.autobday.manager;

import de.fhb.autobday.dao.*;
import de.fhb.autobday.data.*;
import de.fhb.autobday.manager.group.GroupManager;


/**
 * Test
 */
@RunWith(PowerMockRunner.class)
public class ABDManagerTest extends Superclass implements TestClass{

}")
		
	end

	def crawl
		puts "\n\n\n *** Crawl Java ***"
		file_list = Hash.new()
		@crawler.crawl {|path,file| file_list[path]=file}
		file_list
	end

	def map(file_text)
		@mapper.map_file("ABDManagerTest",file_text)
	end
end



