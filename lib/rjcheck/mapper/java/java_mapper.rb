require 'imports'

# This class map java-files of the meta-model from rjcheck
class JavaMapper
	# matches \*package\*
	PACKAGE_SIGNATURE = "package\s([a-zA-Z0-9.]+);"
	# matches import
	IMPORT_SIGNATURE = "import\s([a-zA-Z.]+);"
	# matches <Object>
	GENERIC_SIGNATURE = "(?:<[A-Z]{1}[a-zA-Z0-9]*>)?"
	# matches _static
	STATIC_SIGNATURE = "(?:\sstatic)?"
	# matches _final
	FINAL_SIGNATURE = "(?:\sfinal)?"
	# matches _abstract
	ABSTRACT_SIGNATURE = "(?:\sabstract)?"
	# matches public protected or private
	VISIBILITY_SIGNATURE = "(?:public|protected|private)?"
  # match with types of java-files
  TYPE_SIGNATURE = "(class|interface|enum)"
	# matches _class_ArrayList<Object>
	CLASSNAME_SIGNATURE = "[\s]?#{TYPE_SIGNATURE}\s([A-Z]{1}[a-zA-Z0-9]*#{GENERIC_SIGNATURE})"
	# matches _extends_ArrayList<Object>
	EXTENDS_SIGNATURE = "\sextends\s([A-Z]{1}[a-zA-Z0-9]*#{GENERIC_SIGNATURE})"
	# matches _implements_List<Object>,_List<Object>
	IMPLEMENTS_SIGNATURE = "\simplements\s([A-Z]{1}[a-zA-Z0-9]*#{GENERIC_SIGNATURE}[,\s?[A-Z]{1}[a-zA-Z0-9]*#{GENERIC_SIGNATURE}]*)"
	# matches _extends_Object<>_implements_List<> or implements_List<>_extends_Object<>
	EXTENDS_OR_IMPLEMENTS_SIGNATURE = "(?:(?:#{EXTENDS_SIGNATURE})?(?:#{IMPLEMENTS_SIGNATURE})?)?(?:(?:#{EXTENDS_SIGNATURE})?(?:#{IMPLEMENTS_SIGNATURE})?)?"
	# matches \*{\*}
	CLASSBODY_SIGNATURE = ".*?(\{.*\})"
	# matches package\* public final static class Something extends Object<> implements List<> {...}
	# TODO final static could be reversed, should also process Annotations
	CLASS_SIGNATURE = "((#{VISIBILITY_SIGNATURE})#{FINAL_SIGNATURE}#{STATIC_SIGNATURE}#{ABSTRACT_SIGNATURE}#{CLASSNAME_SIGNATURE}#{EXTENDS_OR_IMPLEMENTS_SIGNATURE})#{CLASSBODY_SIGNATURE}"


	attr_accessor :java_map

	# contructor
	def initialize
    @java_map = Hash.new()
  end

	# this method map the java-file
	def map(file_list)
    file_list.each { |key,value|  pre_mapping(value)}
		file_list.each { |key,value|  map_file(key,value)}
	end
	
	private
	# creates basic-entries in @java_map for mapping method
  def pre_mapping(text)
    # read out package, name, typ

    package = ''
    class_regex = Regexp.new(PACKAGE_SIGNATURE,Regexp::MULTILINE )
    if text.match(class_regex)
      match = class_regex.match(text)
      if match
        package = match[1]
      end
    end

    class_regex = Regexp.new(CLASS_SIGNATURE,Regexp::MULTILINE )

    type=''
		name = ''
    abstract = false
    final = false
    visibility = ''
    if text.match(class_regex)
      match = class_regex.match(text)
      if match
        text = match[1]
        visibility = match[2]
        type = match[3]
        name = match[4]
      end

      if /\sfinal\s/.match(text)
        final = true
      end

      if /\sabstract\s/.match(text)
        abstract = true
      end
    end


		# create objects into java_map for class or interface
		if type=='class'
			java_class = JavaClass.new(package, visibility, nil, name, nil, abstract, final, nil, nil, nil)
			qual_name = package+'.'+name
			@java_map[qual_name] = java_class
		end

		if type=='interface'
			java_inter = JavaInterface.new(package, visibility, nil, name, nil, nil, nil)
			qual_name = package+'.'+name
			@java_map[qual_name] = java_inter
		end

	end

	#creates relations between objects of the meta-modell
	def map_file(path, text)	
		import=Array.new
		extends = nil

		#search for extends
		extends = mapextends(text)		

		#search for imports
		import = mapimports(text)

		#search for fullpathname
		fullname = getfullname(text)
		
		# get the object in array for current class
		object = @java_map[fullname]
		# save searched information into current class object
		if object != nil
			if object.imports == nil
				if import.size > 0
					object.imports = Array.new
				end
			end

			import.each do |i|
				help = @java_map[i]
				if help != nil
					object.imports.push(help)
				end
			end

			if object.imports != nil
				if object.imports.size == 0
					object.imports = nil
				end
			end
				
			# prints out the mapped paramter
			object.output

		elsif text.scan(/.*/)
			warn 'Matches everything'
			warn "#{path} ==> \n#{text.match(class_regex)}"
		else
			warn 'matches nothing'
		end
		object
	end

	# extract the extends
	def mapextends(content)
		class_regex = Regexp.new(EXTENDS_SIGNATURE,Regexp::MULTILINE)
		if content.match(class_regex)
			match = class_regex.match(content)
			if match
				extends = match[1]
				extends
			end
		end
	end
	
	# extract the imports
	def mapimports(content)
		class_regex = Regexp.new(IMPORT_SIGNATURE,Regexp::MULTILINE)
		import = Array.new()
		if content.match(class_regex)
			match = content.scan(class_regex)
			if match
				match.each do |i|
					i.each do |j|
						import.push(j)
					end
				end
			end
		end
		import
	end
	
	# get the fullpathname of the java-file
	def getfullname(text)
		#search for package
		package = ''
		class_regex = Regexp.new(PACKAGE_SIGNATURE,Regexp::MULTILINE )
		if text.match(class_regex)
			match = class_regex.match(text)
			if match
				package = match[1]
				#puts "Package-Name: #{package}"
			end
		end


		#search for class
		class_regex = Regexp.new(CLASS_SIGNATURE,Regexp::MULTILINE )
		name = ''
		if text.match(class_regex)
			match = class_regex.match(text)
			if match
				name = match[4]
				#puts "Class-Name: #{name}"
			end
		end
		return package+'.'+name
	end
	
	# find the java-file from the meta-model
	def find_java_file(ikey)
		@java_map[ikey]
	end

end
