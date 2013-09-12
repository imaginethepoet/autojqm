(function() {
  var math;

  math = {
    root: Math.sqrt,
    square: square,
    cube: function(x) {
      return x * square(x);
    }
  };

  alert("Three cubed is " + (math.cube(3)));

  alert("DUCk");

}).call(this);

(function() {

  alert("Monkey");

}).call(this);
