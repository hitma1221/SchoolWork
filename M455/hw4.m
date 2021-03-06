1a)
  =================================
  f = @(x) (x .* log (x))

  Interval: [1.000000,2.000000]
  n =  4
  h =  0.250000000000000

  Midpoint:      0.63449280811591
  Trapezoid:     0.63990047768799
  Simpson:       0.63630982979695
  =================================
  
 1c.)
  =================================
  f = @(x) (2 ./ (x .^ 2 + 4))

  Interval: [0.000000,2.000000]
  n =  6
  h =  0.333333333333333

  Midpoint:      0.78597685680561
  Trapezoid:     0.78424076661782
  Simpson:       0.78539794523401
  =================================
  
 1e.)
 =================================
  f = @(x) (e .^ (2 .* x) .* sin (3 .* x))

  Interval: [0.000000,2.000000]
  n =  8
  h =  0.250000000000000

  Midpoint:    -14.53048269794640
  Trapezoid:   -13.57597939179939
  Simpson:     -14.18334156144669
  =================================
  
12)
  =================================
  f = @(x) (sqrt (((-3 .* sin (x)) .^ 2) + ((2 .* cos (x)) .^ 2)))

  Interval: [0.000000,6.283185]
  n =  20
  h =  0.314159265358979

  Midpoint:     15.86543961860356
  Trapezoid:    15.86543955997761
  Simpson:      15.86552980433978
  =================================
  
Section 4.4

  1a.)
  >> ROMBRG42
    A =  1
    B =  1.50000000000000
    F =

    @(x) (x .^ 2 .* log (x))

    N =  3
    Initial Data:
    Limits of integration = (  1.00000000,   1.50000000)
    Number of rows =   3

    Romberg Integration Table:

      0.22807412

      0.20120251  0.19224531

      0.19449447  0.19225846  0.19225934
    
   1b.)
   >> ROMBRG42
    A = 0
    B =  1
    F =

    @(x) (x .^ 2 .* e .^ (-x))

    N =  3
    Initial Data:
    Limits of integration = (  0.00000000,   1.00000000)
    Number of rows =   3

    Romberg Integration Table:

      0.18393972

      0.16778619  0.16240168

      0.16248841  0.16072248  0.16061053
  
    1c.)
    >> ROMBRG42
      A = 0
      B =  0.350000000000000
      F =

      @(x) (2 / (x ^ 2 - 4))

      N =  3
      Initial Data:
      Limits of integration = (  0.00000000,   0.35000000)
      Number of rows =   3

      Romberg Integration Table:

       -0.17776435

       -0.17705726 -0.17682157

       -0.17687941 -0.17682012 -0.17682002
  
  
  