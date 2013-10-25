require 'spec_helper'

describe Array do
  it { should respond_to(:to_wkt) }

  it 'should be able to convert to a WKT POINT' do
    expect( [0,0].to_wkt_point ).to eq("POINT(0 0)")
  end

  it 'should be able to convert to a WKT LINESTRING' do
    expect( [ [0,0], [1,1], [1,2] ].to_wkt_line_string ).to eq("LINESTRING(0 0,1 1,1 2)")
  end

  it 'should be able to convert to a WKT POLYGON' do
    polygon_array = [ [ [0,0], [4,0], [4,4], [0,4], [0,0] ], [ [1,1], [2,1], [2,2], [1,2], [1,1] ] ]
    expect( polygon_array.to_wkt_polygon ).to eq("POLYGON((0 0,4 0,4 4,0 4,0 0),(1 1,2 1,2 2,1 2,1 1))")
  end

  it 'should be able to convert to a WKT MULTIPOINT' do
    expect( [ [0,0], [1,2] ].to_wkt_multi_point ).to eq("MULTIPOINT(0 0,1 2)")
  end

  it 'should be able to convert to a WKT MULTILINESTRING' do
    multi_line_array = [ [ [0,0], [1,1], [1,2] ], [ [2,3], [3,2], [5,4] ] ]
    expect(multi_line_array.to_wkt_multi_line_string).to eq("MULTILINESTRING((0 0,1 1,1 2),(2 3,3 2,5 4))")
  end

  it 'should be able to convert to a WKT MULTIPOLYGON' do
    multi_polygon_array = [ 
      [ [[0,0], [4,0], [4,4], [0,4], [0,0]], [[1,1], [2,1], [2,2], [1,2], [1,1]] ], 
      [ [[-1,-1], [-1,-2], [-2,-2], [-2,-1], [-1,-1]] ] 
    ]
    wkt_equivalent = "MULTIPOLYGON(((0 0,4 0,4 4,0 4,0 0),(1 1,2 1,2 2,1 2,1 1)),((-1 -1,-1 -2,-2 -2,-2 -1,-1 -1)))" 
    expect( multi_polygon_array.to_wkt_multi_polygon ).to eq(wkt_equivalent)
  end

  pending 'should be able to convert to a WKT GEOMETRYCOLLECTION'
end
