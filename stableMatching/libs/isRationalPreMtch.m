function [incBool, endBool] = isRationalPreMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs)

incN = length(incIndList);
entN = length(entIndList);

% a rational premathing is a premathing
[incBool, endBool] = isPreMtch(incPreMtch, entPreMtch, incIndList, entIndList);
if incBool && endBool 
    preMtchBool = true;
else
    preMtchBool = false;
end

% mathe is prefered to the null set
incResult = 0;
for incIdx = 1:(incN-1) % -1 to omit the null set
    incIdxPref = incPrefs(incIdx, :); % preference of incIdx-th inc
    incResult = incResult + (find(incIdxPref==incPreMtch(incIdx)) <= find(incIdxPref==-1));
end

entResult = 0;
for entIdx = 1:(entN-1) % -1 to omit the null set
    entIdxPref = entPrefs(entIdx, :); % preference of entIdx-th ent
    entResult = entResult + (find(entIdxPref==entPreMtch(entIdx)) <= find(entIdxPref==-1));
end

incBool = (incResult == incN - 1) & preMtchBool;
endBool = (entResult == entN - 1) & preMtchBool;

end