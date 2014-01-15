
class DSLObject
  attr_accessor :project_path

  attr_accessor :main_source_folder_path
	attr_accessor :source_folder_path
	attr_accessor :source_folder_type
	attr_accessor :source_resources_folder_path

	attr_accessor :main_test_folder_path
	attr_accessor :test_folder_path
	attr_accessor :test_folder_type
	attr_accessor :test_resources_folder_path

  def initialize(path)
    @project_path = path
  end

end