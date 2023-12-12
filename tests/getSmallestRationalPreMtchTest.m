function tests = getSmallestRationalPreMtchTest
tests = functiontests(localfunctions);
end

function getSmallestRationalPreMtch1Test(testCase)
% case: pass

incIndList = [-1 -2 1 2 3 4];
entIndList = [-1 -2 1 2 3];

incN = length(incIndList);
entN = length(entIndList);

incPrefs = [
    1 2 3 -1 -2;
    1 2 3 -1 -2;
    1 2 3 -1 -2;
    1 2 3 -1 -2
];

entPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];


[actReturn1, actReturn2] = getSmallestRationalPreMtch(incPrefs, entPrefs, incIndList, entIndList, incN, entN);
expReturn = [-1 -1 -1 -1];

verifyEqual(testCase,actReturn1,expReturn)
end

function getSmallestRationalPreMtch2Test(testCase)
% case: pass

incIndList = [-1 -2 1 2 3 4];
entIndList = [-1 -2 1 2 3];

incN = length(incIndList);
entN = length(entIndList);

incPrefs = [
    1 2 3 -1 -2;
    1 2 -2 3 -1;
    1 3 -1 2 -2;
    1 2 3 -2 -1
];

entPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];


[actReturn1, actReturn2] = getSmallestRationalPreMtch(incPrefs, entPrefs, incIndList, entIndList, incN, entN);
expReturn = [-1 -2 -1 -2];

verifyEqual(testCase,actReturn1,expReturn)
end