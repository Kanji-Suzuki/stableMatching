function tests = runAlgoTest
tests = functiontests(localfunctions);
end

function runAlgo1Test(testCase)
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

%[incNewQ, entNewQ, incStableMtch, entStableMtch]
[actReturn1, actReturn2] = runAlgo(incIndList, entIndList, incPrefs, entPrefs, incN, entN);
expReturn1 = [3 1 2 -1; 1 2 3 -1; 2 3 1 -1]; 
expReturn2 = [2 3 1; 1 2 3; 3 1 2];

verifyEqual(testCase, sortrows([actReturn1 actReturn2]), sortrows([expReturn1 expReturn2]))
end


function runAlgo2Test(testCase)
% case: pass
incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1 2];

incPreMtch = [4 3]; % indices of most prefered ents
entPreMtch = [2 4]; % indices of most prefered incs. 5 is not icluded in entIndList

incPrefs = [
    1 2 3 4 -1 -2;
    3 4 1 2 -1 -2
];

entPrefs = [
    1 2 3 4 -1 -2;
    4 3 1 2 -1 -2
];

contractN = 2;
incN = length(incIndList);
entN = length(entIndList);

[actReturn1, actReturn2] = runAlgo(incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);
expReturn1 = [1 4];
expReturn2 = [1 4];

verifyEqual(testCase, sortrows([actReturn1 actReturn2]), sortrows([expReturn1 expReturn2]))
end

function runAlgo3Test(testCase)
% case: pass
incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1 2];

incPrefs = [
    1 3 2 4 -1 -2;
    2 4 1 3 -1 -2;
];

entPrefs = [
    4 2 3 1 -1 -2;
    3 1 4 2 -1 -2;
];

contractN = 2;
incN = length(incIndList);
entN = length(entIndList);

[actReturn1, actReturn2] = runAlgo(incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);

expReturn1 = [
    1 2;
    1 4;
    2 1;
    2 3;
    3 2;
    3 4;
    4 1;
    4 3;
    ];
expReturn2 = [
    1 2;
    1 4;
    2 1;
    4 1;
    3 2;
    3 4;
    2 3;
    4 3;
    ];

verifyEqual(testCase, sortrows([actReturn1 actReturn2]), sortrows([expReturn1 expReturn2]))
end

function runAlgo4Test(testCase)
% case: pass
incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1];

incPrefs = [
    3 1 2 -1 -2;
    1 2 3 -1 -2;
];

entPrefs = [
    5 1 2 3 4 6 -1 -2;
];

contractN = 3;
incN = length(incIndList);
entN = length(entIndList);

[actReturn1, actReturn2] = runAlgo(incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);

expReturn1 = [
    3 -1
    ];
expReturn2 = [
    5
    ];

verifyEqual(testCase, sortrows([actReturn1 actReturn2]), sortrows([expReturn1 expReturn2]))
end

function runAlgo5Test(testCase)
% case: pass
incIndList = [-1 -2 1 2];
entIndList = [-1 -2 1 2];

incPrefs = [
    1 2 3 4 5 6 -1 -2;
    1 3 5 2 4 6 -1 -2;
];

entPrefs = [
    6 5 4 3 2 1 -1 -2;
    6 4 2 5 3 1 -1 -2;
];

contractN = 3;
incN = length(incIndList);
entN = length(entIndList);

[actReturn1, actReturn2] = runAlgo(incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);

expReturn1 = [
    2 1; % preference のmatrixに掛け合わせられる。men tims (women times contract)
    2 3; % マッチしているところだけで0 or 1
    2 5;
    6 5;
    4 5;
    4 3;
    ];
expReturn2 = [
    2 1;
    4 1;
    6 1;
    6 5;
    6 3;
    4 3;
    ];

verifyEqual(testCase, sortrows([actReturn1 actReturn2]), sortrows([expReturn1 expReturn2]))
end

