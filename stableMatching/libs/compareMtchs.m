function boolLarger = compareMtchs(incMtch1, entMtch1, incMtch2, entMtch2, incIndList, entIndList, incPrefs, entPrefs, incN, entN)
% Mtch1 is larger than Mtch2


% for all incumbents, test whether Mtch1 is larger than Mtch2
incEqualBoolList = zeros(1, incN);
incLargerBoolList = zeros(1, incN);
for incIdx = 1:(incN-2) % -2 to omit the null set and unmatch
    incPref = incPrefs(incIdx, :);
    incOrderMtch1 = find(incPref == incMtch1(incIdx), 1);
    incOrderMtch2 = find(incPref == incMtch2(incIdx), 1);
    if incOrderMtch1 == incOrderMtch2
        incEqualBoolList(incIdx) = 1;
    elseif incOrderMtch1 < incOrderMtch2
        incLargerBoolList(incIdx) = 1;
    end
end

% for all entrants, test whether Mtch1 is larger than Mtch2
entEqualBoolList = zeros(1, incN);
entLargerBoolList = zeros(1, incN);
for entIdx = 1:(entN-2) % -2 to omit the null set and unmatch
    entPref = entPrefs(entIdx, :);
    entOrderMtch1 = find(entPref == entMtch1(entIdx), 1);
    entOrderMtch2 = find(entPref == entMtch2(entIdx), 1);
    if entOrderMtch1 == entOrderMtch2
        entEqualBoolList(entIdx) = 1;
    elseif entOrderMtch1 < entOrderMtch2
        entLargerBoolList(entIdx) = 1;
    end
end

% display(sum(incEqualBoolList)+sum(incLargerBoolList) == incN)
% display(sum(entEqualBoolList)+sum(entLargerBoolList) == entN)
% display(sum(incLargerBoolList)+sum(entLargerBoolList) > 0)

if (sum(incEqualBoolList)+sum(incLargerBoolList) == incN-2) && ... % for all incs, mtch1 is weakly prefered to mtch2. 
        (sum(entEqualBoolList)+sum(entLargerBoolList) == entN-2) && ... % for all ents, mtch1 is weakly prefered to mtch2. 
        (sum(incLargerBoolList)+sum(entLargerBoolList) > 0) % and at least for a inc or ent, mtch1 is strictly prefered to mtch2.
    boolLarger = true;
else
    boolLarger=false;
end

end