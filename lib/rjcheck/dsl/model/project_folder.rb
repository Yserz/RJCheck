# To change this template, choose Tools | Templates
# and open the template in the editor.

class ProjectFolder
  attr_accessor :path
  attr_accessor :main_source_folder
  attr_accessor :main_test_folder

  def initialize(path)
    @path = path
  end

end