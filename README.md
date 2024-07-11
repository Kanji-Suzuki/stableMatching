# stableMatching

This reposotory includes codes to calculate all stable matchings in the matching with contract setting.
The algorithm is based on 

“Echenique, F., & Yenmez, M. B. (2007). A solution to matching with preferences over colleagues. Games and Economic Behavior, 59(1), 46-71”.

The algorithm is modified to incorporate the external options and contracts.

## Functions
Functions are defined in `stableMatching/libs`. 
Each file includes an independent module to execute one functionality.
The main algorithm is defined in `stableMatching/libs/runAlgo.m`, and other functions complement this file.

## Test
All functions are tested in `tests`.
For example, five test cases for `stableMatching/libs/runAlgo.m` are validated in `tests/runAlgoTest.m`.

## Example
Execution of the algorithm for dummy data are done in `stableMatching/stableMtchDummy.mlx`

