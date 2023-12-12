function tests = getNewMtchTest
tests = functiontests(localfunctions);
end

function getNewMtch1Test(testCase)
% case: pass

incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1 2];

incPreMtch = [2 1]; % indices of most prefered ents
entPreMtch = [1 2]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    1 2 -1 -2;
    1 2 -1 -2
];

entPrefs = [
    1 2 -1 -2;
    1 2 -1 -2
];

% contractN = 1;
incN = 4;
entN = 4;

[actReturn1 actReturn2] = getNewMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN);
expReturn1 = [1 2];

verifyEqual(testCase, actReturn1, expReturn1)
end


function getNewMtch2Test(testCase)
% case: pass

incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1 2];

incPreMtch = [4 3]; % indices of most prefered ents
entPreMtch = [2 4]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    1 2 3 4 -1 -2;
    3 2 4 1 -1 -2
];

entPrefs = [
    1 3 2 4 -1 -2;
    4 1 2 3 -1 -2
];

contractN = 2;
incN = 4;
entN = 4;

[actReturn1 actReturn2] = getNewMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);
expReturn1 = [1 4];

verifyEqual(testCase,actReturn1,expReturn1)
end

