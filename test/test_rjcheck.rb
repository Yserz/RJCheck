$:.unshift File.join(File.dirname(__FILE__),'..','lib')
require 'test/unit'
require 'rubytest'

class MyUnitTests < Test::Unit::TestCase

  def setup
    puts "setup!"
  end

  def teardown
    puts "teardown!"
  end

  def test_basic
    puts "I RAN!"
  end

end