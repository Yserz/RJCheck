class TestGenerator
  attr_accessor :java_map
  attr_accessor :dsl

  def initialize(java_map, dsl)
    @java_map = java_map
    @dsl = dsl
  end

  def generate
    puts '####### Generation of TestClasses begins'
    keys = @java_map.keys
    keys.each { |x| puts x }
  end
end