require "to_wkt_/version"
require "to_wkt_/adapter"

module ToWkt
  def to_wkt(type)
    adapter = Adapter.new
    adapter.array_to_wkt(self, type)
  end

  Adapter::WKT_TYPES.each do |type| 
    define_method( "to_wkt_#{type}".to_sym ) do 
      to_wkt(type)
    end
  end

end

Array.include( ToWkt )
