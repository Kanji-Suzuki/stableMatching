function [incNewMtchTwice, entNewMtchTwice] = getNewMtchTwice(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN)

% Set a default value for contractN
if nargin < 9 || isempty(contractN)
        contractN = 1;
end

[incNewMtchOnce, entNewMtchOnce] = getNewMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);
[incNewMtchTwice, entNewMtchTwice] = getNewMtch(incNewMtchOnce, entNewMtchOnce, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);

end