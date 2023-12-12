function entBetterSet = entGetBetterSetCont(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN, entIdx)
 %  {c ¥in C; s R(c) v(c)} here c is incumbant and s is entrant

entBetterSet = [];
for incIdx = 1:(incN-2) % -1 to omit the null set
    incIdxPref = incPrefs(incIdx, :); % preference of incIdx-th inc
    for contIdx = 1:contractN
        entContIdx = (contIdx-1) * (entN-2) + entIdx;
        if find(incIdxPref == entContIdx) <= find(incIdxPref == incPreMtch(incIdx))
            incContIdx = (contIdx-1) * (incN-2) + incIdx; 
            entBetterSet = [entBetterSet, incContIdx];
        end
    end
end

if ~ismember(-1, entBetterSet)
    entBetterSet = [entBetterSet, -1];
end

if ~ismember(-2, entBetterSet)
    entBetterSet = [entBetterSet, -2];
end

end