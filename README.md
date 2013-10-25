# ToWkt

Quickly and easily convert arrays to [Well-Known Text (WKT)] format.  Which are
commonly used in GIS Databases such as [PostGIS].

## Installation

Add this line to your application's Gemfile:

    gem 'to_wkt_'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install to_wkt_

## Usage

ToWkt automatically exposes the following methods on any instance of `Array`:

- `#to_wkt_point`
  - converts an array to a WKT POINT 
  - e.g.

        ```ruby
        [0,0].to_wkt_point # "POINT(0 0)"
        ```

- `#to_wkt_line_string`
  - converts an array to a WKT LINESTRING 
  - e.g.

        ```ruby
        [ [0,0], [1,1], [1,2] ].to_wkt_line_string # "LINESTRING(0 0,1 1,1 2)"
        ```

- `#to_wkt_polygon`
  - converts an array to a WKT POLYGON
  - e.g.

        ```ruby 
        polygon_array = [ [ [0,0], [4,0], [4,4], [0,4], [0,0] ], [ [1,1], [2,1], [2,2], [1,2], [1,1] ] ]
        polygon_array.to_wkt_polygon # "POLYGON((0 0,4 0,4 4,0 4,0 0),(1 1,2 1,2 2,1 2,1 1))"
        ```

- `#to_wkt_multi_point`
  - converts an array to a WKT MULTIPOINT 
  - e.g.

        ```ruby
        [ [0,0], [1,2] ].to_wkt_multi_point # "MULTIPOINT(0 0,1 2)"
        ```

- `#to_wkt_multi_line_string`
  - converts an array to a WKT MULTILINESTRING 
  - e.g.

        ```ruby
        multi_line_array = [ [ [0,0], [1,1], [1,2] ], [ [2,3], [3,2], [5,4] ] ]
        multi_line_array.to_wkt_multi_line_string # "MULTILINESTRING((0 0,1 1,1 2),(2 3,3 2,5 4))"
        ```

- `#to_wkt_multi_polygon`
  - converts an array to a WKT MULTIPOLYGON 
  - e.g.

        ```ruby
        multi_polygon_array = [ 
          [ [[0,0], [4,0], [4,4], [0,4], [0,0]], [[1,1], [2,1], [2,2], [1,2], [1,1]] ], 
          [ [[-1,-1], [-1,-2], [-2,-2], [-2,-1], [-1,-1]] ] 
        ]
        multi_polygon_array.to_wkt_multi_polygon= "MULTIPOLYGON(((0 0,4 0,4 4,0 4,0 0),(1 1,2 1,2 2,1 2,1 1)),((-1 -1,-1 -2,-2 -2,-2 -1,-1 -1)))" 
        ```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[Well-Known Text (WKT)]: http://en.wikipedia.org/wiki/Well-known_text
[PostGIS]: http://postgis.refractions.net/documentation/manual-1.3SVN/ch04.html#id2726203
