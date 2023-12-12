function incBetterSet = incGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incIdx)
 % {s ¥in S; c R(s) v(s)} here c is incumbant and s is entrant


incBetterSet = [];
for entIdx = 1:(entN-2) % -1 to omit the null set
    entIdxPref = entPrefs(entIdx, :); % preference of incIdx-th inc
    if find(entIdxPref == incIdx) <= find(entIdxPref == entPreMtch(entIdx))
       incBetterSet = [incBetterSet, entIdx];
    end
end

if ~ismember(-1, incBetterSet)
    incBetterSet = [incBetterSet, -1];
end

if ~ismember(-2, incBetterSet)
    incBetterSet = [incBetterSet, -2];
end

end