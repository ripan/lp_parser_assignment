class Parser

  attr_accessor :data, :filename

  def initialize(filename)
    @data = {}
    @filename = filename
  end

  def parse
    File.open(filename, "r") do |infile|
      while (line = infile.gets)
        line.strip!
        unless line.empty?
          # chacking if line is a header
          if line[0] == '['

            # convert "[ meta data ]" to "meta data"
            section = line.gsub(/['\['\]]/,'').strip

          else

            # check if line is a key/value pair
            if line.include? ':'
              key_value = line.split(':')
              section = section
              key = key_value[0].strip
              value = key_value[1].strip
              add_data(section,key,value)
            else
              add_data(section,key,line)
            end

          end
        end
      end
    end
  end

  def add_data(section,key,value)
    # check if section exists?
    if @data.has_key?(section)
      # check if section with key exists then append the value
      if  @data[section].has_key?(key)
        value = "#{@data[section][key]} \r #{value}"
      end
      @data[section].merge!({key => value})
    else
      @data[section] = {key => value}
    end
  end

  def get_data(section,key)
    @data[section][key] if @data.has_key?(section)
  end

  def save_file(filename)
    file = File.open(filename, "w")
    @data.each do |section_name,section_values|
      file.write "[#{section_name}]\n"
      section_values.each do |k,v|
        file.write "#{k}:#{v}\n"
      end
      file.write "\n"
    end
  end


end


# parser = Parser.new("parser-test.txt")
# parser.parse
# parser.add_data('header','k1','k2')
# parser.add_data('header1','k1','k2')
# parser.get_data('header','k1')
# parser.data # display data hash
# parser.save_file('ripan.txt') #save data hash to file
