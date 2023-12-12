function tests = incGetBetterSetTest
tests = functiontests(localfunctions);
end

function incGetBetterSet1Test(testCase)
% case: pass

incIndList = [-1 -2 1 2 3 4];
entIndList = [-1 -2 1 2 3];

incPreMtch = [3 2 2 1]; % indices of most prefered ents
entPreMtch = [1 4 4]; % indices of most prefered incs. 5 is not icluded in entIndList

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

incIdx = 2;
actReturn = incGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incIdx);
expReturn = [-1, -2, 2, 3];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end

function incGetBetterSet2Test(testCase)
% case: pass

incIndList = [-2 -1 1 2 3 4];
entIndList = [-2 -1 1 2 3];

incPreMtch = [1 1 1 1]; 
entPreMtch = [3 3 3]; 

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

incIdx = 1;
actReturn = incGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incIdx);
expReturn = [-1 -2 1 2 3];
%ここで-1をReturnに入れることにするか否かで、expReturnが変わります。
%もし、getNewMtch.mの方で、-1とincBetterSetの要素の選好上の順位を比較するphaseを含めるのであれば、ここに-1が入っていなくてもTv(3)=-1と
%なってくれるので問題ありません。しかし、もし現行の方式でTv()を定めるのであれば、ここに-1が入っていないとTv(3)=2となってしまい、
% %Tの個人合理性が満たされない可能性があります。どちらにしましょうか？

%とりあえず-1を含めずにtestは追加していこうと思います。

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end

function incGetBetterSet3Test(testCase)
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

incIdx = 3;
actReturn = incGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incIdx);
expReturn = [-1 -2];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end

function incGetBetterSet4Test(testCase)
% case: pass

incIndList = [-2 -1 1 2 3 4];
entIndList = [-2 -1 1 2 3];

incPreMtch = [1 1 1 1]; 
entPreMtch = [1 1 3]; 

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

incIdx = 2;
actReturn = incGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incIdx);
expReturn = [-1 -2 3];

verifyEqual(testCase,sort(actReturn),sort(expReturn))
end

