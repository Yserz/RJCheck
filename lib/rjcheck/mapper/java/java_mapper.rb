class JavaMapper
	# matches \*package\*
	Package_signature = "package\s([a-zA-Z.]+);"
	# matches import
	Import_signature = "import\s([a-zA-Z.]+);"
	# matches <Object>
	Generic_signature = "(?:<[A-Z]{1}[a-zA-Z0-9]*>)?"
	# matches _static
	Static_signature = "(?:\sstatic)?"
	# matches _final
	Final_signature = "(?:\sfinal)?"
	# matches _abstract
	Abstract_signature = "(?:\sabstract)?"
	# matches public protected or private
	Visability_signature = "(?:public|protected|private)?"
	# matches _class_ArrayList<Object>
	Classname_signature = "[\s]?class\s([A-Z]{1}[a-zA-Z0-9]*#{Generic_signature})"
	# matches _extends_ArrayList<Object>
	Extends_signature = "\sextends\s([A-Z]{1}[a-zA-Z0-9]*#{Generic_signature})"
	# matches _implements_List<Object>,_List<Object>
	Implements_signature = "\simplements\s([A-Z]{1}[a-zA-Z0-9]*#{Generic_signature}[,\s?[A-Z]{1}[a-zA-Z0-9]*#{Generic_signature}]*)"
	# matches _extends_Object<>_implements_List<> or implements_List<>_extends_Object<>
	ExtendsOrImplements_signature = "(?:(?:#{Extends_signature})?(?:#{Implements_signature})?)?(?:(?:#{Extends_signature})?(?:#{Implements_signature})?)?"
	# matches \*{\*}
	Classbody_signature = ".*?(\{.*\})"
	# matches package\* public final static class Something extends Object<> implements List<> {...}
	# TODO final static could be reversed, should also process Annotations
	Class_signature = "((#{Visability_signature})#{Final_signature}#{Static_signature}#{Abstract_signature}#{Classname_signature}#{ExtendsOrImplements_signature})#{Classbody_signature}"

	def initialize

  end

	def map(file_list)
		# TODO scan list
    file_list.each { |key,value|  pre_mapping(value)}
		file_list.each { |key,value|  map_file(key,value)}
	end

  def pre_mapping(text)
    # auslesen package, name, typ
     
    package = ""
    class_regex = Regexp.new(Package_signature,Regexp::MULTILINE )
    if text.match(class_regex)
      match = class_regex.match(text)
      if match
        package = match[1]
      end
    end
    
  end  
    
	def map_file(path, text)
    
    
                
    class_regex = Regexp.new(Import_signature,Regexp::MULTILINE)
    import = Array.new
    if text.match(class_regex)
      match = text.scan(class_regex)
      if match
        match.each do |i|
          i.each do |j|
            import.push(j)
          end
        end
      end
    end
    
		class_regex = Regexp.new(Class_signature,Regexp::MULTILINE )


		name = ""
    abstract = false
    final = false
    visibility = ""
    if text.match(class_regex)
      match = class_regex.match(text)
      if match
        text = match[1]
        visibility = match[2]
        name = match[3]
        #puts "Class-Head: #{match[1]}"
        #puts "Class-Visability: #{match[2]}"
        #puts "Class-Name: #{match[3]}"
        #puts "Class-Extends: #{match[4]}"
        #puts "Class-Extends: #{match[5]}"
        #puts "Class-Implements: #{match[5]}"
        #puts "Class-Implements: #{match[6]}"
        #puts "Class-Body: #{match[8]}"
      end
           
                        
      if /\sfinal\s/.match(text)
        final = true
      end
                        
      if /\sabstract\s/.match(text)
        abstract = true
      end

			groups = text.scan(class_regex)
			#                        groups.each { |i| puts i }
			#                        puts groups.last
		elsif text.scan(/.*/)
			warn "Matches everything"
			warn "#{path} ==> \n#{text.match(class_regex)}"
		else
			warn "matches nothing"
		end
	end

	def map_class

	end
  
	def map_interface

	end
end
