
class Crawler
	attr_accessor :path
  def initialize(path)
		@path = path
  end

	def crawl
		self.chdir

		Dir.glob("**/*") do |absolute_file_path|
			puts File.basename(absolute_file_path)
			puts absolute_file_path
			next if File.directory? absolute_file_path
			begin
				f = File.open(absolute_file_path, "r")
				yield f.read
			rescue
				warn "could not read file!"
			ensure
				# ensure is kind of finally in java
			end
		end
	end

	
	def chdir
		begin
			Dir.chdir(@path)
		rescue
			warn "could not find the folder!"
		end
	end
end
