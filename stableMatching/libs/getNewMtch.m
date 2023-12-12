function [incNewMtch, entNewMtch] = getNewMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN)

% Set a default value for contractN
if nargin < 9 || isempty(contractN)
        contractN = 1;
end

% function T in Remark 1.
% for all incumbents, get U(c, nu) and get the most prefered one.
incNewMtch = [];
for incIdx = 1:(incN-2) % -2 to omit the null set and unmatch
    incBetterSetIdx = incGetBetterSetCont(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN, incIdx);
    for prefIdx = incPrefs(incIdx, :) % from prefered to defered
        if sum(incBetterSetIdx==prefIdx) == true
            incNewMtch = [incNewMtch, prefIdx];
            break;
        end
    end
end

% for all eentrants, get V(c, nu) and get the most prefered one.
entNewMtch = [];
for entIdx = 1:(entN-2) % -2 to omit the null set and unmatch
    entBetterSetIdx = entGetBetterSetCont(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN, entIdx);
    for prefIdx = entPrefs(entIdx, :)
        if sum(entBetterSetIdx==prefIdx) == true
            entNewMtch = [entNewMtch, prefIdx];
            break;
        end
    end
end

end