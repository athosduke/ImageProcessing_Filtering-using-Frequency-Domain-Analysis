# Filtering-using-Frequency-Domain-Analysis
Filter without matlab inbuild functions.

# Description
1. DFT\
SetF(0;0) of the DFT of f(x; y) to zero and compute the inverse DFT to give a new image g(x; y).\
Using only NxN operations, apply a Gaussian lowpass filter H(u; v) with sig= 15 to f and denote g(x; y) as the lowpass-filtered output image.\
Display the Fourier-transform magnitude figures.
2. Corrupted Images\
Let f(x; y) be the "lake" image and create the corrupted imagec(x; y).\
Design a suitable notch  filter H(u; v) that when applied to c(x; y) gives an image g(x; y) that nearly resembles the original image f(x; y). \
Give suitable pictures of:\
i.f(x; y),jF(u; v)j,c(x; y),jC(u; v)j\
ii.jH(u; v)j,g(x; y),jG(u; v)j\
iii. The image and Fourier-transform magnitude of the difference image (f(x; y)-g(x; y)).\
