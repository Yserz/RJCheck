
class JavaCrawler
	attr_accessor :path
  def initialize(path)
		@path = path
  end

	def crawl
		chdir

		puts "Folder to crawl through: #{@path}"

		Dir.glob('**/*.java') do |absolute_file_path|
			puts @path
			puts File.basename(absolute_file_path)
			puts absolute_file_path
			next if File.directory? absolute_file_path
			data = IO.read(absolute_file_path)
			yield absolute_file_path, data
		end
	end
	private
	def chdir
		begin
			Dir.chdir(@path)
		rescue
			warn 'could not find the folder!'
		end
	end
end