=begin
  Detect Squares

  You are given a stream of points on the X-Y plane.
  Design an algorithm that:

  Adds new points from the stream into a data structure.
  Duplicate points are allowed and should be treated as different points.

  Given a query point, counts the number of ways to choose three points
  from the data structure such that the three points and the
  query point form an axis-aligned square with positive area.

  An axis-aligned square is a square whose edges are all the same length
  and are either parallel or perpendicular to the x-axis and y-axis.

  Implement the DetectSquares class:
  DetectSquares() Initializes the object with an empty data structure.
  void add(int[] point) Adds a new point point = [x, y] to the data structure.
  int count(int[] point) Counts the number of ways to form axis-aligned squares with point point = [x, y] as described above.
=end


class DetectSquares
  def initialize
    @hash = Hash.new(0)
    @points = []
  end

  def add(point)
    @hash[point] += 1
    @points << point
  end

  def count(point)
    px, py = point
    result = 0

    @points.each do |x, y|
      next if ((px - x).abs != (py - y).abs) || px == x || py == y

      result += @hash[[x, py]] * @hash[[px, y]]
    end
    result
  end
end

detectSquares = DetectSquares.new;
detectSquares.add([3, 10]);
detectSquares.add([11, 2]);
detectSquares.add([3, 2]);

p detectSquares.count([11, 10]);
p detectSquares.count([14, 8]);

detectSquares.add([11, 2]);
p detectSquares.count([11, 10]);



[[],[[419,351]],[[798,351]],[[798,730]],[[419,730]],[[998,1]],[[0,999]],[[998,999]],[[0,1]],[[226,561]],[[269,561]],[[226,604]],[[269,604]],[[200,274]],[[200,793]],[[719,793]],[[719,274]],[[995,99]],[[146,948]],[[146,99]],[[995,948]],[[420,16]],[[962,558]],[[420,558]],[[962,16]],[[217,833]],[[945,105]],[[217,105]],[[945,833]],[[26,977]],[[26,7]],[[996,7]],[[996,977]],[[96,38]],[[96,483]],[[541,483]],[[541,38]],[[38,924]],[[961,1]],[[961,924]],[[38,1]],[[438,609]],[[818,609]],[[818,229]],[[438,229]]]
