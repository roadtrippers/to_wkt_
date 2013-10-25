module ToWkt

  class Adapter

    WKT_TYPES = [:point, :line_string, :polygon, :multi_point, :multi_line_string, :multi_polygon]

    def array_to_wkt(array, type)
      raise "invalid WKT type" unless WKT_TYPES.include?(type)
      make_prefix(type) + make_suffix(array, type)
    end

    private

    def make_prefix(type)
      type.to_s.tr('_', '').upcase
    end

    def make_suffix(array, type)
      output = '('
      output += case type.to_sym
      when :point
        point_string(array)
      when :line_string, :multi_point
        line_string(array)
      when :polygon, :multi_line_string
        multi_line_string(array)
      when :multi_polygon
        multi_polygon_string(array)
      else
        raise "invalid WKT type"
      end
      output += ')'     
    end

    def point_string(tuple)
      "#{tuple[0]} #{tuple[1]}"
    end

    def line_string(point_list)
      output = ""
      point_list.each{ |p| output += "#{point_string( p )}," }
      output.chomp ',' 
    end

    def multi_line_string(line_list)
      output = ""
      line_list.each{ |l| output += "(#{ line_string( l ) })," }
      output.chomp ','
    end

    def multi_polygon_string(polygon_list)
      output = ""
      polygon_list.each{ |p| output += "(#{ multi_line_string( p ) })," }
      output.chomp ','
    end

  end

end


    
