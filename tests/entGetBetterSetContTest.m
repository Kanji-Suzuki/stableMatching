function tests = entGetBetterSetContTest
tests = functiontests(localfunctions);
end

function entGetBetterSetCont1Test(testCase)
% case: pass

incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1 2];

incPreMtch = [4 2]; % indices of most prefered ents
entPreMtch = [2 4]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    1 2 3 4 -1 -2;
    3 2 1 4 -1 -2
];

entPrefs = [
    1 3 2 4 -1 -2;
    4 1 2 3 -1 -2
];

entIdx = 1;
contractN = 2;
incN = 4;
entN = 4;

actReturn = entGetBetterSetCont(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN, entIdx);
expReturn = [1 3 4 -1 -2];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end
