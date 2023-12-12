function tests = incGetBetterSetContTest
tests = functiontests(localfunctions);
end

function incGetBetterSetCont1Test(testCase)
% case: pass

incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1 2];

incPreMtch = [4 3]; % indices of most prefered ents
entPreMtch = [2 4]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

entPrefs = [
    1 3 2 4 -1 -2;
    4 1 2 3 -1 -2
];

incIdx = 1;
contractN = 2;
incN = 4;
entN = 4;

actReturn = incGetBetterSetCont(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN, incIdx);
expReturn = [1 3 -1 -2];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end

function incGetBetterSetCont2Test(testCase)
% case: pass

incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1 2];

incPreMtch = [4 3]; % indices of most prefered ents
entPreMtch = [2 4]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

entPrefs = [
    1 3 2 4 -1 -2;
    1 4 2 3 -1 -2
];

incIdx = 1;
contractN = 2;
incN = 4;
entN = 4;

actReturn = incGetBetterSetCont(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN, incIdx);
expReturn = [1 3 2 -1 -2];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end
