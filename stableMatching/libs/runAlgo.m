function [incUniqueStableMtch, entUniqueStableMtch] = runAlgo(incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN)
% Algorithm 5.1. of Federico Echenique and M. Bumin Yenmez, 
% 'A solution to matching with preferences over colleagues'

% Set a default value for contractN
if nargin < 7 || isempty(contractN)
        contractN = 1;
end

incStableMtch = [];
entStableMtch = [];

% get largest and smallest element of Phi'.
[incLargestRationalPreMtch, entLargestRationalPreMtch] = getLargestRationalPreMtch(incPrefs, entPrefs);
[incSmallestRationalPreMtch, entSmallestRationalPreMtch] = getSmallestRationalPreMtch(incPrefs, entPrefs, incIndList, entIndList, incN, entN);

% Find the largest and smallest fixed points of T^2
[incLargestMtchFixed, entLargestMtchFixed]=findFxdPtNewMtchTwice(incLargestRationalPreMtch, entLargestRationalPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);
[incSmallesMtchFixed, entSmallesMtchFixed]=findFxdPtNewMtchTwice(incSmallestRationalPreMtch, entSmallestRationalPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);

% apply T to the largest fixed point of T^2
[incNewLargestMtchFixed, entNewLargestMtchFixed] = getNewMtch(incLargestMtchFixed, entLargestMtchFixed, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN);
if isequal(incLargestMtchFixed, incNewLargestMtchFixed) && isequal(entLargestMtchFixed, entNewLargestMtchFixed)
    incStableMtch = [incStableMtch; incLargestMtchFixed];
    entStableMtch = [entStableMtch; entLargestMtchFixed];
else
    % routine
    incQ = [incLargestMtchFixed];
    entQ = [entLargestMtchFixed];

    while ~isempty(incQ)
        [incNewQ, entNewQ, incStableMtch, entStableMtch] = runSubRt(incIndList, entIndList, incPrefs, entPrefs, incN, entN, ...
            incSmallesMtchFixed, entSmallesMtchFixed, incQ, entQ, incStableMtch, entStableMtch, contractN);
        incQ = incNewQ;
        entQ = entNewQ;
    end
end

% get the unique mathces
uniqueStableMtch = unique([incStableMtch entStableMtch], 'rows');
incUniqueStableMtch = uniqueStableMtch(:, 1:(incN-2));
entUniqueStableMtch = uniqueStableMtch(:, (incN-1):end);

end