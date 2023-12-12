function [incSmallestRationalPreMtch, entSmallestRationalPreMtch] = getSmallestRationalPreMtch(incPrefs, entPrefs, incIndList, entIndList, incN, entN)
% each inc and ent take Smallest their option

% for all incumbents, get U(c, nu) and get the most prefered one.
incSmallestRationalPreMtch = [];
for incIdx = 1:(incN-2) % -2 to omit the null set and unmatch
    incPref = incPrefs(incIdx, :);
    if find(incPref == -1, 1) <= find(incPref == -2, 1)
        incSmallestRationalPreMtch(incIdx) = -1;
    else
        incSmallestRationalPreMtch(incIdx) = -2;
    end
end

% for all eentrants, get V(c, nu) and get the most prefered one.
entSmallestRationalPreMtch = [];
for entIdx = 1:(entN-2) % -2 to omit the null set and unmatch
    entPref = entPrefs(entIdx, :);
    if find(entPref == -1, 1) <= find(entPref == -2, 1)
        entSmallestRationalPreMtch(entIdx) = -1;
    else
        entSmallestRationalPreMtch(entIdx) = -2;
    end
end

end