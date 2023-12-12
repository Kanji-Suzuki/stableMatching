function [incBool, endBool] = isPreMtch(incPreMtch, entPreMtch, incIndList, entIndList)

incN = length(incIndList);
entN = length(entIndList);

incResult = 0;
% if each inc's preMtch is in the set of ents
for incIdx = 1:(incN-1) % -1 to omit the null set
    incResult = incResult + sum(incPreMtch(incIdx) == incIndList);
end
entResult = 0;
for entIdx = 1:(entN-1)
    entResult = entResult + sum(entPreMtch(entIdx) == entIndList);
end

incBool = (incResult == incN - 1);
endBool = (entResult == entN - 1);

end