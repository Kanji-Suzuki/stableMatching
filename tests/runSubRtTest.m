function tests = runSubRtTest
tests = functiontests(localfunctions);
end

function runSubRt1Test(testCase)
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

incNuWorst = [3 1 2 -1];
entNuWorst = [3 1 2];

incQ = [2 3 1 -1];
entQ = [2 3 1];

incStableMtch = [];
entStableMtch = [];

%[incNewQ, entNewQ, incStableMtch, entStableMtch]
[actReturn1, actReturn2, actReturn3, actReturn4] = runSubRt(incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incQ, entQ, incStableMtch, entStableMtch);
expReturn1 = [1 2 3 -1; 2 3 1 -1]; 
expReturn2 = [2 3 1; 1 2 3];
expReturn3 = [];
expReturn4 = [];

verifyEqual(testCase,actReturn1,expReturn1)
end


function runSubRt2Test(testCase)
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

incNuWorst = [3 1 2 -1];
entNuWorst = [3 1 2];

incQ = [1 2 3 -1];
entQ = [2 3 1];

incStableMtch = [];
entStableMtch = [];

%[incNewQ, entNewQ, incStableMtch, entStableMtch]
[actReturn1, actReturn2, actReturn3, actReturn4] = runSubRt(incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incQ, entQ, incStableMtch, entStableMtch);
expReturn1 = [];
expReturn2 = [];
expReturn3 = [3 1 2 -1; 1 2 3 -1];
expReturn4 = [2 3 1; 1 2 3];

% verifyEqual(testCase,actReturn2,expReturn1)
verifyEqual(testCase,actReturn1,expReturn1)
end

function runSubRt3Test(testCase)
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

incNuWorst = [3 1 2 -1];
entNuWorst = [3 1 2];

incQ = [2 3 1 -1];
entQ = [1 2 3];

incStableMtch = [];
entStableMtch = [];

%[incNewQ, entNewQ, incStableMtch, entStableMtch]
[actReturn1, actReturn2, actReturn3, actReturn4] = runSubRt(incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incQ, entQ, incStableMtch, entStableMtch);
expReturn1 = [];
expReturn2 = [];
expReturn3 = [2 3 1 -1; 1 2 3 -1];
expReturn4 = [3 1 2; 1 2 3];

% verifyEqual(testCase,actReturn2,expReturn1)
verifyEqual(testCase,actReturn1,expReturn1)
end
