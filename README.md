# RubiksCube
Interactive Rubik's cube built in Java Processing

This is the initial working Rubiks cube using keys 1-6 to rotate each face clockwise and SHIFT 1-6 to rotate the same face anticlockwise (currently only supports 1-6 = !"£$%^).
Future plans (in order of action):
1. Currently the cube renders all inner cubes. i.e 4 extra for a 4x4x4, 9 extra for a 5x5x5, so remove those extra cubes to increase rendering speed.
2. Additionally each cube renders all 6 faces when they only need to render 1, 2, or 3.
3. Add a scramble button, maybe allow text inputs for a scramble - potentially hook up to cube scramble API.
4. Look into making it be able to self solve using a variety of methods: Reverse Scramble, beginner's method, CFOP.
