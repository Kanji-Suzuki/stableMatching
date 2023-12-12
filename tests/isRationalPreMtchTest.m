function tests = isRationalPreMtchTest
tests = functiontests(localfunctions);
end

function isPreMtch1Test(testCase)
% case: isn't premathing

incIndList = [-1 1 2 3 4];
entIndList = [-1 1 2 3];

incPreMtch = [3 2 2 1]; % indices of most prefered ents
entPreMtch = [1 1 3]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    3 1 2 -1;
    2 1 3 -1;
    2 3 1 -1;
    1 3 -1 2
];

entPrefs = [
    1 2 3 4 -1;
    1 2 4 3 -1;
    3 2 4 -1 1
];


[actReturn1, actReturn2] = isRationalPreMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs);
expReturn1 = true;
verifyEqual(testCase,actReturn1,expReturn1)
end

function isPreMtch2Test(testCase)
% case: pass

incIndList = [-1 1 2 3 4];
entIndList = [-1 1 2 3];

incPreMtch = [3 2 2 1]; % indices of most prefered ents
entPreMtch = [1 1 5]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    3 1 2 -1;
    2 1 3 -1;
    2 3 1 -1;
    1 3 -1 2
];

entPrefs = [
    1 2 3 4 -1;
    1 2 4 3 -1;
    3 2 4 -1 1
];


[actReturn1, actReturn2] = isRationalPreMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs);
expReturn1 = false;
verifyEqual(testCase,actReturn1,expReturn1)
end

function isPreMtch3Test(testCase)
% case: fail cz 4-th inc match with "2" which is defered to the null set

incIndList = [-1 1 2 3 4];
entIndList = [-1 1 2 3];

incPreMtch = [3 2 2 2]; % indices of most prefered ents
entPreMtch = [1 1 3]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    3 1 2 -1;
    2 1 3 -1;
    2 3 1 -1;
    1 3 -1 2
];

entPrefs = [
    1 2 3 4 -1;
    1 2 4 3 -1;
    3 2 4 -1 1
];


[actReturn1, actReturn2] = isRationalPreMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs);
expReturn1 = false;
verifyEqual(testCase,actReturn1,expReturn1)
end

function isPreMtch4Test(testCase)
% case: fail cz 3rd inc match with "2" which is defered to the null set

incIndList = [-1 1 2 3 4];
entIndList = [-1 1 2 3];

incPreMtch = [3 2 2 1]; % indices of most prefered ents
entPreMtch = [1 2 1]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    3 1 2 -1;
    2 1 3 -1;
    2 3 1 -1;
    1 3 -1 2
];

entPrefs = [
    1 2 3 4 -1;
    1 2 4 3 -1;
    3 2 4 -1 1
];


[actReturn1, actReturn2] = isRationalPreMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs);
expReturn2 = false;
verifyEqual(testCase,actReturn2,expReturn2)
end