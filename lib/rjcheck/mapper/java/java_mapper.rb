require 'imports'

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
	Visibility_signature = "(?:public|protected|private)?"
  # match with types of java-files
  Type_signature = "(class|interface|enum)"
	# matches _class_ArrayList<Object>
	Classname_signature = "[\s]?#{Type_signature}\s([A-Z]{1}[a-zA-Z0-9]*#{Generic_signature})"
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
	Class_signature = "((#{Visibility_signature})#{Final_signature}#{Static_signature}#{Abstract_signature}#{Classname_signature}#{ExtendsOrImplements_signature})#{Classbody_signature}"

  @java_map
  
	def initialize
    @java_map = Hash.new()
  end

	def map(file_list)
		# TODO scan list
    file_list.each { |key,value|  pre_mapping(value)}
		file_list.each { |key,value|  map_file(key,value)}
	end

	# creates entries in @java_map for mapping method 
  def pre_mapping(text)
    # read out package, name, typ
    
    package = ""
    class_regex = Regexp.new(Package_signature,Regexp::MULTILINE )
    if text.match(class_regex)
      match = class_regex.match(text)
      if match
        package = match[1]
      end
    end
    
    class_regex = Regexp.new(Class_signature,Regexp::MULTILINE )

    type=""
		name = ""
    abstract = false
    final = false
    visibility = ""
    if text.match(class_regex)
      match = class_regex.match(text)
      if match
        text = match[1]
        visibility = match[2]
        type = match[3]
        name = match[4]
				#puts "text: #{text}"
				#puts "visibility: #{visibility}"
				#puts "type: #{type}"
				#puts "name: #{name}"
      end
      
      if /\sfinal\s/.match(text)
        final = true
      end
                        
      if /\sabstract\s/.match(text)
        abstract = true
      end 
    end
		
		#initialze missing fields
		annotations = Array.new
		implements = Array.new
		extends=""
		generics=""
		imports=Array.new;
		
		# create objects into java_map for class or interface
		if type=="class"
			java_class = JavaClass.new(package, visibility, imports, name, annotations, abstract, final, implements, extends, generics)
			qual_name = package+"."+name
			@java_map[qual_name] = java_class
		end
    
		if type=="interface"
			java_inter = JavaInterface.new(package, visibility, Array.new, name, nil, nil, nil)
			qual_name = package+"."+name
			@java_map[qual_name] = java_inter
		end
    
	end  
    
	#before using map_file it is fundamental to use pre_mapping
	def map_file(path, text)
		
		annotations = Array.new
		implements = Array.new
		import=Array.new;
		extends = nil
		generics = ""
		
		#TODO annotations
		#TODO generics
		#TODO extends
		
		#search for extends
		class_regex = Regexp.new(Extends_signature,Regexp::MULTILINE)
		if text.match(class_regex)
			match = class_regex.match(text)
			if match
				extends = match[1]
				puts "extends: #{extends}"
				#TODO find object
			end
		end
     
		#search for implements
		class_regex = Regexp.new(Implements_signature,Regexp::MULTILINE)
		if text.match(class_regex)
			match = text.scan(class_regex)
			if match
				match.each do |i|
					i.each do |j|
						implements.push(j)
						#puts "Implements: #{implements}"
					end
				end
			end
		end
		
		#search for imports
		class_regex = Regexp.new(Import_signature,Regexp::MULTILINE)
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
    
		#search for package
		package = ""
		class_regex = Regexp.new(Package_signature,Regexp::MULTILINE )
		if text.match(class_regex)
			match = class_regex.match(text)
			if match
				package = match[1]
				#puts "Package-Name: #{package}"
			end
		end
    
		
		#search for class
		class_regex = Regexp.new(Class_signature,Regexp::MULTILINE )
		name = ""
		if text.match(class_regex)
			match = class_regex.match(text)
			if match
				name = match[4]
				#puts "Class-Name: #{name}"
			end

			# get the object in array for current class
			object = @java_map[package+"."+name]  
			# save searched iformations into current class object
			if object != nil
				#import.each do |item|
				#	object.imports.push(item)
				#end
				import.each do |i|
          help = @java_map[i]
          if help != nil
            object.imports.push(help)
          end
        end
					
				#implements.each do |item|
				#	object.implements.push(item)
				#end
				import.each do |i|
          help = @java_map[i]
          if help != nil
            object.implements.push(help)
          end
        end
			end
			
			# prints out the mapped paramter
			object.output;
      
			groups = text.scan(class_regex)
			#                        groups.each { |i| puts i }
			#                        puts groups.last
		elsif text.scan(/.*/)
			warn "Matches everything"
			warn "#{path} ==> \n#{text.match(class_regex)}"
		else
			warn "matches nothing"
		end
		object
	end

	def find_java_file(ikey)
		@java_map[ikey]
	end
		
end
