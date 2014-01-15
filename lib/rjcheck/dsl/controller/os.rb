
module OS
  def OS.windows?
    (/cygwin|mswin|mingw|bccwin|wince|emx/ =~ RUBY_PLATFORM) != nil
  end

  def OS.mac?
		(/darwin/ =~ RUBY_PLATFORM) != nil
  end

  def OS.unix?
    !OS.windows?
  end

  def OS.linux?
    OS.unix? and not OS.mac?
	end

	def OS.replace_separator(text)
		if OS.windows?
			text.gsub("/", "\\")
		elsif OS.mac? | OS.unix? | OS.linux?
			#			text.gsub("/", "/")
			text
		end
	end
end
