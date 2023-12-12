function tests = entGetBetterSetTest
tests = functiontests(localfunctions);
end

function entGetBetterSet1Test(testCase)
% case: pass

incIndList = [-1 -2 1 2 3 4];
entIndList = [-1 -2 1 2 3];

incPreMtch = [3 3 2 3]; % indices of most prefered ents
entPreMtch = [1 4 4]; % indices of most prefered incs. 5 is not icluded in entIndList

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

entIdx = 1;
actReturn = entGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, entIdx);
expReturn = [2 4 -1 -2];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end

function entGetBetterSet2Test(testCase)
% case: pass

incIndList = [-2 -1 1 2 3 4];
entIndList = [-2 -1 1 2 3];

incPreMtch = [1 1 1 1]; 
entPreMtch = [1 1 1]; 

incPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

entPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

entIdx = 3;
actReturn = entGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, entIdx);
expReturn = [-1 -2];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end

function entGetBetterSet3Test(testCase)
% case: pass

incIndList = [-2 -1 1 2 3 4];
entIndList = [-2 -1 1 2 3];

incPreMtch = [3 3 3 3]; 
entPreMtch = [1 1 1]; 

incPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

entPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

entIdx = 1;
actReturn = entGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, entIdx);
expReturn = [-1 -2 1 2 3 4];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end

function entGetBetterSet4Test(testCase)
% case: pass

incIndList = [-2 -1 1 2 3 4];
entIndList = [-2 -1 1 2 3];

incPreMtch = [1 1 1 3]; 
entPreMtch = [1 1 1]; 

incPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

entPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

entIdx = 2;
actReturn = entGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, entIdx);
expReturn = [-1 -2 4];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end


