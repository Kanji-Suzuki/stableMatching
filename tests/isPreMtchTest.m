function tests = isPreMtchTest
tests = functiontests(localfunctions);
end

function isPreMtch1Test(testCase)
% all available indices of incs and ents
% -1 is a null set
incIndList = [-1 1 2 3 4];
entIndList = [-1 1 2 3];

incPreMtch = [3 2 2 1]; % indices of most prefered ents
entPreMtch = [1 1 3]; % indices of most prefered incs

[actReturn1, actReturn2] = isPreMtch(incPreMtch, entPreMtch, incIndList, entIndList);
expReturn1 = true;
verifyEqual(testCase,actReturn1,expReturn1)
end

function isPreMtch2Test(testCase)

% all available indices of incs and ents
% -1 is a null set
incIndList = [-1 1 2 3 4];
entIndList = [-1 1 2 3];

incPreMtch = [3 2 2 1]; % indices of most prefered ents
entPreMtch = [1 1 3]; % indices of most prefered incs

[actReturn1, actReturn2] = isPreMtch(incPreMtch, entPreMtch, incIndList, entIndList);
expReturn2 = true;
verifyEqual(testCase,actReturn2,expReturn2)
end

function isPreMtch3Test(testCase)
% all available indices of incs and ents
% -1 is a null set
incIndList = [-1 1 2 3 4];
entIndList = [-1 1 2 3];

incPreMtch = [5 2 2 1]; % indices of most prefered ents
entPreMtch = [1 1 3]; % indices of most prefered incs

[actReturn1, actReturn2] = isPreMtch(incPreMtch, entPreMtch, incIndList, entIndList);
expReturn1 = false;
verifyEqual(testCase,actReturn1,expReturn1)
end

function isPreMtch4Test(testCase)

% all available indices of incs and ents
% -1 is a null set
incIndList = [-1 1 2 3 4];
entIndList = [-1 1 2 3];

incPreMtch = [3 2 2 1]; % indices of most prefered ents
entPreMtch = [1 1 4]; % indices of most prefered incs

[actReturn1, actReturn2] = isPreMtch(incPreMtch, entPreMtch, incIndList, entIndList);
expReturn2 = false;
verifyEqual(testCase,actReturn2,expReturn2)
end