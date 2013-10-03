
$:.unshift File.join(File.dirname(__FILE__),'..','lib')

require 'test/unit'
require 'java_mapper'

class TestJavaMapper < Test::Unit::TestCase
  def test_map_file
    javamapper = JavaMapper.new()
		

  end
end
