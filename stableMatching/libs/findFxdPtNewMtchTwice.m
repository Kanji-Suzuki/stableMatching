function [incMtchIterP1, entMtchIterP1] = findFxdPtNewMtchTwice(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN)

% Set a default value for contractN
if nargin < 9 || isempty(contractN)
        contractN = 1;
end

incStableMtch = [];
entStableMtch = [];

incMtchIter = incPreMtch;
entMtchIter = entPreMtch;
incMtchIterP1 = zeros(1, incN);
entMtchIterP1 = zeros(1, entN);

i = 0;
while i <= 100
    [incMtchIterP1, entMtchIterP1] = getNewMtchTwice(incMtchIter, entMtchIter, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);
    i = i + 1;

    if isequal(incMtchIter, incMtchIterP1) && isequal(entMtchIter, entMtchIterP1)
        break
    end

    incMtchIter = incMtchIterP1;
    entMtchIter = entMtchIterP1;
end

end