function [incUniqueNewQ, entUniqueNewQ, incStableMtch, entStableMtch] = runSubRt(incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incQ, entQ, incStableMtch, entStableMtch, contractN)
 % subroutine
% Set a default value for contractN
if nargin < 13 || isempty(contractN)
        contractN = 1;
end

incNewQ = [];
entNewQ = [];

% loop in Q
for mtchIdx = 1:size(incQ,1)
    incMtch = incQ(mtchIdx, :);
    entMtch = entQ(mtchIdx, :);

    % loop in all incs
    for incIdx = 1:(incN-2) % -2 to omit the null set and unmatch
        [incSubRtMtch, incSubRtPrefs, entSubRtPrefs] = incGetSubRtMtch(incMtch, entMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incIdx);
        if ~ isempty(incSubRtMtch) % cmopute nu_f
            [incMtchIterP1, entMtchIterP1] = findFxdPtNewMtchTwice(incSubRtMtch, entMtch, incIndList, entIndList, incSubRtPrefs, entSubRtPrefs, incN, entN, contractN); % step1. preference is updated
            [incMtchIterP2, entMtchIterP2] = getNewMtch(incMtchIterP1, entMtchIterP1, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN); % step2: function T in Remark 1 is applied. preference is NOT updated
            if isequal(incMtchIterP2, incMtchIterP1) && isequal(entMtchIterP2, entMtchIterP1)
                incStableMtch = [incStableMtch; incMtchIterP2]; % add to stable match
                entStableMtch = [entStableMtch; entMtchIterP2];
            else
                if compareMtchs(incMtchIterP1, entMtchIterP1, incNuWorst, entNuWorst, incIndList, entIndList, incPrefs, entPrefs, incN, entN) % if nu_f > nu_
                    incNewQ = [incNewQ; incMtchIterP1];
                    entNewQ = [entNewQ; entMtchIterP1];
                end
            end
        else % if there doesn't exist i(f, nu) R(f) nu_(f), do nothing
            continue
        end
    end
    
    % loop in all ents
    for entIdx = 1:(entN-2) % -2 to omit the null set and unmatch
        [entSubRtMtch, incSubRtPrefs, entSubRtPrefs] =  entGetSubRtMtch(incMtch, entMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, entIdx);
        if ~ isempty(entSubRtMtch) % cmopute nu_f
            [incMtchIterP1, entMtchIterP1] = findFxdPtNewMtchTwice(incMtch, entSubRtMtch, incIndList, entIndList, incSubRtPrefs, entSubRtPrefs, incN, entN, contractN); % step1
            [incMtchIterP2, entMtchIterP2] = getNewMtch(incMtchIterP1, entMtchIterP1, incIndList, entIndList, incPrefs, entPrefs, incN, entN, contractN); % step2
            if isequal(incMtchIterP2, incMtchIterP1) && isequal(entMtchIterP2, entMtchIterP1)
                incStableMtch = [incStableMtch; incMtchIterP2];
                entStableMtch = [entStableMtch; entMtchIterP2];
            else
                if compareMtchs(incMtchIterP1, entMtchIterP1, incNuWorst, entNuWorst, incIndList, entIndList, incPrefs, entPrefs, incN, entN) % if nu_f > nu_
                    incNewQ = [incNewQ; incMtchIterP1];
                    entNewQ = [entNewQ; entMtchIterP1];
                end
            end
        else % if there doesn't exist i(f, nu) R(f) nu_(f), do nothing
            continue
        end
    end
end

incUniqueNewQ = [];
entUniqueNewQ = [];
if ~ isempty(incNewQ)
    uniqueNewQ = unique([incNewQ entNewQ], 'rows','stable');
    incUniqueNewQ = uniqueNewQ(:, 1:(incN-2));
    entUniqueNewQ = uniqueNewQ(:, (incN-1):end);
end


end