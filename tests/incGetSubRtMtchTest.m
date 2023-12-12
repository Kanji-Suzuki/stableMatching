function tests = incGetSubRtMtchTest
tests = functiontests(localfunctions);
end

function incGetSubRtMtch1Test(testCase)
% case: pass

incIndList = [-1 -2 1 2 3 4];
entIndList = [-1 -2 1 2 3];

incN = length(incIndList);
entN = length(entIndList);

incPrefs = [
    3 1 2 -1 -2;
    2 1 -2 3 -1;
    2 3 -2 1 -1;
    1 3 -1 2 -2
];

entPrefs = [
    1 2 3 4 -1 -2;
    1 2 4 3 -2 -1;
    3 2 -2 4 -1 1
];

incPreMtch = [3 3 2 3]; % indices of most prefered ents
entPreMtch = [2 1 4]; % indices of most prefered incs. 5 is not icluded in entIndList
incNuWorst = [2 2 3 3];
entNuWorst = [4 4 4];


incIdx = 1;
[actReturn1, actReturn2, actReturn3] = incGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incIdx);
expReturn = [1 3 2 3];

verifyEqual(testCase,actReturn1,expReturn)
end


function incGetSubRtMtch2Test(testCase)
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

incPreMtch = [1 1 1 1];
entPreMtch = [1 1 1];
incNuWorst = [3 3 3 3];
entNuWorst = [3 3 3];


incIdx = 1;
[actReturn1, actReturn2, actReturn3] = incGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incIdx);
expReturn = [2 1 1 1];

verifyEqual(testCase,actReturn1,expReturn)
end

function incGetSubRtMtch3Test(testCase)
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

incPreMtch = [1 1 1 1];
entPreMtch = [1 1 1];
incNuWorst = [3 2 3 3];
entNuWorst = [3 3 3];


incIdx = 2;
[actReturn1, actReturn2, actReturn3] = incGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incIdx);
expReturn = [1 2 1 1];

verifyEqual(testCase,actReturn1,expReturn)
end

function incGetSubRtMtch4Test(testCase)
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

incPreMtch = [1 1 1 1];
entPreMtch = [1 1 1];
incNuWorst = [3 3 1 3];
entNuWorst = [3 3 3];

incIdx = 3;
[actReturn1, actReturn2, actReturn3] = incGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incIdx);
expReturn = [];

verifyEqual(testCase,actReturn1,expReturn)
end

function incGetSubRtMtch5Test(testCase)
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

incPreMtch = [1 1 1 1];
entPreMtch = [1 1 1];
incNuWorst = [3 3 1 3];
entNuWorst = [3 3 3];


incIdx = 4;
[actReturn1, actReturn2, actReturn3] = incGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incIdx);
expReturn = [1 1 1 2];

verifyEqual(testCase,actReturn1,expReturn)
end

function incGetSubRtMtch6Test(testCase)
% case: pass

incIndList = [-1 -2 1 2 3 4];
entIndList = [-1 -2 1 2 3];

incN = length(incIndList);
entN = length(entIndList);

incPrefs = [
    2 1 3 -1 -2;
    3 2 1 -1 -2;
    1 3 2 -1 -2;
    1 2 3 -1 -2
];

entPrefs = [
    2 1 3 4 -1 -2;
    3 2 1 4 -1 -2;
    1 3 2 4 -1 -2
];

incPreMtch = [1 2 3 -1];
entPreMtch = [2 3 1];

incNuWorst = [3 1 2 -1];
entNuWorst = [3 1 2];

incIdx = 1;
[actReturn1, actReturn2, actReturn3] = incGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incIdx)
expReturn1 = [3 2 3 -1];
expReturn2 = [3 -1 -2 2 1; 2 1 -1 -2 3; 3 2 -1 -2 1; -1 -2 1 2 3];


verifyEqual(testCase,actReturn2,expReturn2)
end