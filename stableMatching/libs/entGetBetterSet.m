function entBetterSet = entGetBetterSet(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, entidx)
 %  {c ¥in C; s R(c) v(c)} here c is incumbant and s is entrant

entBetterSet = [];
for incIdx = 1:(incN-2) % -1 to omit the null set
    incIdxPref = incPrefs(incIdx, :); % preference of incIdx-th inc
    if find(incIdxPref == entidx) <= find(incIdxPref == incPreMtch(incIdx))
       entBetterSet = [entBetterSet, incIdx];
    end
end

if ~ismember(-1, entBetterSet)
    entBetterSet = [entBetterSet, -1];
end

if ~ismember(-2, entBetterSet)
    entBetterSet = [entBetterSet, -2];
end

end