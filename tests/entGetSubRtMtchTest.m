function tests = entGetSubRtMtchTest
tests = functiontests(localfunctions);
end

function entGetSubRtMtch1Test(testCase)
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


entIdx = 1;
actReturn = entGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs,  incN, entN, incNuWorst, entNuWorst, entIdx);
expReturn = [3 1 4];

verifyEqual(testCase,actReturn,expReturn)
end


function entGetSubRtMtch2Test(testCase)
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


entIdx = 1;
actReturn = entGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs,  incN, entN, incNuWorst, entNuWorst, entIdx);
expReturn = [2 1 1];

verifyEqual(testCase,actReturn,expReturn)
end

function entGetSubRtMtch3Test(testCase)
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
entNuWorst = [3 2 3];


entIdx = 2;
actReturn = entGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs,  incN, entN, incNuWorst, entNuWorst, entIdx);
expReturn = [1 2 1];

verifyEqual(testCase,actReturn,expReturn)
end


function entGetSubRtMtch4Test(testCase)
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
entNuWorst = [3 2 1];


entIdx = 3;
actReturn = entGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs,  incN, entN, incNuWorst, entNuWorst, entIdx);
expReturn = [];

verifyEqual(testCase,actReturn,expReturn)
end


function entGetSubRtMtch5Test(testCase)
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
entNuWorst = [3 2 1];


entIdx = 1;
actReturn = entGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs,  incN, entN, incNuWorst, entNuWorst, entIdx);
expReturn = [2 1 1];

verifyEqual(testCase,actReturn,expReturn)
end

function entGetSubRtMtch6Test(testCase)
% case: pass

incIndList = [-1 -2 1 2 3 4];
entIndList = [-1 -2 1 2 3];
incN = length(incIndList);
entN = length(entIndList);

% incPrefs = [
%     2 3 -1 -2 1;
%     1 2 3 -1 -2;
%     1 2 3 -1 -2;
%     1 2 3 -1 -2
% ];
% 
% entPrefs = [
%     1 2 3 4 -1 -2;
%     1 2 3 4 -1 -2;
%     1 2 3 4 -1 -2
% ];

incPrefs = [
    1 2 3 -1 -2;
    1 2 3 -1 -2;
    1 2 3 -1 -2;
    1 2 3 -1 -2
];

entPrefs = [
    2 3 4 -1 -2 1;
    1 2 3 4 -1 -2;
    1 2 3 4 -1 -2
];

incPreMtch = [1 1 1 1];
entPreMtch = [1 1 1];
incNuWorst = [3 3 3 3];
entNuWorst = [3 2 1];


entIdx = 1;
actReturn = entGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs,  incN, entN, incNuWorst, entNuWorst, entIdx);
% expReturn = [1 1 1 1];
expReturn = [];

verifyEqual(testCase,actReturn,expReturn)
end