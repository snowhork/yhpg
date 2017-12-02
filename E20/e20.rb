class Point
  attr_reader :name, :next_points

  def initialize(name)
    @name = name
    @next_points = []
  end

  def add_next_point(point)
    @next_points << point
  end
end

def set_next_point(points, from, tos)
  tos.each_char do |to|
    points[from].add_next_point(points[to])
  end
end

def fetch_min_char(distances, q)
  q.each_char.min_by { |c| distances[c] || 100000000000000 }
end

def execute(points, start, termination)
  distances = {start => 0}
  q = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ"

  until q.empty?
    u = fetch_min_char(distances, q)
    q.delete!(u)

    points[u].next_points.each do |point|
      if distances[point.name].nil? || distances[point.name] > distances[u] + 1
        distances[point.name] = distances[u] + 1 
        return distances[point.name] if point.name == termination
      end
    end
  end
end


def construct_points
  points = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ".each_char.with_object({}) do |c, sum|
    sum[c] = Point.new(c)
  end

  set_next_point(points, "0", "16")
  set_next_point(points, "1", "07")
  set_next_point(points, "2", "3")
  set_next_point(points, "3", "249")	
  set_next_point(points, "4", "35")
  set_next_point(points, "5", "4B")
  set_next_point(points, "6", "0C")
  set_next_point(points, "7", "18")
  set_next_point(points, "8", "79")
  set_next_point(points, "9", "38AF")
  set_next_point(points, "A", "9")
  set_next_point(points, "B", "5")
  set_next_point(points, "C", "6DI")
  set_next_point(points, "D", "C")
  set_next_point(points, "E", "K")
  set_next_point(points, "F", "9G")
  set_next_point(points, "G", "FM")
  set_next_point(points, "H", "N")
  set_next_point(points, "I", "CO")
  set_next_point(points, "J", "KP")
  set_next_point(points, "K", "EJL")
  set_next_point(points, "L", "KM")
  set_next_point(points, "M", "GLS")
  set_next_point(points, "N", "HT")
  set_next_point(points, "O", "I")
  set_next_point(points, "P", "JQV")
  set_next_point(points, "Q", "PR")
  set_next_point(points, "R", "QX")
  set_next_point(points, "S", "MYT")
  set_next_point(points, "T", "NS")
  set_next_point(points, "U", "V")
  set_next_point(points, "V", "UPW")
  set_next_point(points, "W", "V")
  set_next_point(points, "X", "R")
  set_next_point(points, "Y", "SZ")
  set_next_point(points, "Z", "Y")

  points
end

def test(input, step)
  start = input[0]
  termination = input[1]
  points = construct_points

  result = execute(points, start, termination)
  if result == step
    print "success #{input}, result: #{result} expected: #{step}\n"
  else
    print "fail #{input}, result: #{result} expected: #{step}\n"
  end
end


test( "DE", 13 )
test( "EK", 1 )
test( "01", 1 )
test( "LG", 2)
test( "A1", 4)
test( "GJ", 4)
test( "FK", 4)
test( "LV", 4)
test( "27", 4)
test( "0O", 4)
test( "G1", 5)
test( "ZH", 5)
test( "AB", 5)
test( "KX", 5)
test( "1G", 5)
test( "WX", 5)
test( "3L", 5)
test( "9Y", 5)
test( "EX", 6)
test( "BG", 6)
test( "7K", 7)
test( "E3", 7)
test( "SW", 7)
test( "BM", 7)
test( "3C", 7)
test( "H9", 7)
test( "J3", 7)
test( "GX", 8)
test( "2Z", 8)
test( "8H", 8)
test( "Z7", 8)
test( "0B", 8)
test( "U9", 9)
test( "Z0", 10)
test( "0N", 10)
test( "U8", 10)
test( "XZ", 10)
test( "H0", 11)
test( "CH", 13)
test( "WB", 13)
test( "0R", 13)
test( "DZ", 13)
test( "NI", 13)
test( "QC", 14)
test( "6U", 14)
test( "PO", 15)
test( "RI", 16)
test( "UO", 17)
test( "WO", 17)
test( "OX", 18)
