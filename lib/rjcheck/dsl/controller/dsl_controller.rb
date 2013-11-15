class DSLController

  attr_accessor :project_folder

  def initialize

  end

  def project_folder(path)
    yield path
    @project_folder = ProjectFolder.new(path)
  end
  #load '../recipe.rb'
end

