node = Hash.new
node['project1'] = Hash.new
node['project1']['project_folder'] = Hash.new
node['project1']['project_folder']['path']                                = 'my/path/to/project_folder'
project = Hash.new
project['main_source_folder'] = Hash.new
project['main_source_folder']['source_folder'] = Hash.new
project['main_source_folder']['source_folder']['path']                    = project['main_source_folder']['path'].to_s + 'java/tmp/'