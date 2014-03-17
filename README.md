# SizeArrays

A package for experimenting with arrays parametrised by their size. By using the size as parameters in the array, it is possible to have e.g. one(Matrix) working. It is also possible to check the sizes of array in the function headers. One drawback is that julia compiles new versions of a function for each array size. Maybe this is not a major problem because matrices tend to have the same size in applications. One benefit is that many size checks can be avoided.

[![Build Status](https://travis-ci.org/andreasnoackjensen/SizeArrays.jl.png)](https://travis-ci.org/andreasnoackjensen/SizeArrays.jl)
