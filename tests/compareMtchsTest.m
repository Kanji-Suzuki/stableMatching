function tests = compareMtchsTest
tests = functiontests(localfunctions);
end

function compareMtchs1Test(testCase)
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

incMtch1 = [3 2 2 1];
entMtch1 = [1 1 3];
incMtch2 = [3 2 2 3]; % the forth man block
entMtch2 = [1 1 3];

actReturn = compareMtchs(incMtch1, entMtch1, incMtch2, entMtch2, incIndList, entIndList, incPrefs, entPrefs, incN, entN);
expReturn = true;

verifyEqual(testCase,actReturn,expReturn)
end

function compareMtchs2Test(testCase)
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

% same match -> return false
incMtch1 = [3 2 2 1];
entMtch1 = [1 1 3];
incMtch2 = [3 2 2 1];
entMtch2 = [1 1 3];

actReturn = compareMtchs(incMtch1, entMtch1, incMtch2, entMtch2, incIndList, entIndList, incPrefs, entPrefs, incN, entN);
expReturn = false;

verifyEqual(testCase,actReturn,expReturn)
end

function compareMtchs3Test(testCase)
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

incMtch1 = [3 2 2 3];
entMtch1 = [1 1 3];
incMtch2 = [3 2 2 1]; % the forth man block
entMtch2 = [1 1 3];

actReturn = compareMtchs(incMtch1, entMtch1, incMtch2, entMtch2, incIndList, entIndList, incPrefs, entPrefs, incN, entN);
expReturn = false;

verifyEqual(testCase,actReturn,expReturn)
end