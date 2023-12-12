function incBetterSet = incGetBetterSetCont(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN, incIdx)
 % {s ¥in S; c R(s) v(s)} here c is the contract relating to the incIdx and
 % s is an entrant with a contract
 
incBetterSet = [];
for entIdx = 1:(entN-2) % -1 to omit the null set
    entIdxPref = entPrefs(entIdx, :); % preference of incIdx-th inc
    for contIdx = 1:contractN
        incContIdx = (contIdx-1) * (incN-2) + incIdx; % contract relating to the incIdx
        if find(entIdxPref == incContIdx) <= find(entIdxPref == entPreMtch(entIdx))
            entContIdx = (contIdx-1) * (entN-2) + entIdx; % index correspoding to the entrant with the contract incContIdx
            incBetterSet = [incBetterSet, entContIdx];
        end
    end
end

if ~ismember(-1, incBetterSet)
    incBetterSet = [incBetterSet, -1];
end

if ~ismember(-2, incBetterSet)
    incBetterSet = [incBetterSet, -2];
end

end