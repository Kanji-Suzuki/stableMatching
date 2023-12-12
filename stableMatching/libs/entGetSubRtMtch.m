function [entSubRtMtch, incSubRtPrefs, entSubRtPrefs] = entGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, entIdx)
 % i(f, v). best choice of f that is worse than v(f)

% preference of an ent
entPref = entPrefs(entIdx, :);
% index of the entPreMtch in the preference
entSecondBestIdx = find(entPref == entPreMtch(entIdx), 1);

entSecondBestOpt = [];
%if entPreMtch is not the worst, take the best one among that are worse
%than entPreMtch
if (entSecondBestIdx ~= length(entPref)) && (entSecondBestIdx < length(entPref))
    entSecondBestOpt = [entSecondBestOpt, entPref(entSecondBestIdx+1)];
end

% get new matching for subroutine.
% if condition is not satisfied, return empty set
entSubRtMtch = [];
incSubRtPrefs = incPrefs;
entSubRtPrefs = entPrefs;
if ~isempty(entSecondBestOpt) && find(entPref==entSecondBestOpt, 1) <= find(entPref==entNuWorst(entIdx), 1)
    % update incSubRtMtch
    entSubRtMtch = entPreMtch;
    entSubRtMtch(entIdx) = entSecondBestOpt;
    % update incSubRtPrefs
    for i = 1:(incN-2)
        incPref = incPrefs(i, :);
        incSubRtMtchIdx = find(incPref==incPreMtch(i), 1);
        if incSubRtMtchIdx >= 2
            incSubRtPrefs(i, :) = [ incPref(incSubRtMtchIdx:end) incPref(1:incSubRtMtchIdx-1) ]; % use updated match
        end
    end
    % update entSubRtPrefs
    for i = 1:(entN-2)
        entPref = entPrefs(i, :);
        entSubRtMtchIdx = find(entPref==entSubRtMtch(i), 1);
        if entSubRtMtchIdx >= 2
            entSubRtPrefs(i, :) = [ entPref(entSubRtMtchIdx:end) entPref(1:entSubRtMtchIdx-1) ]; % use updated match
        end

    end
end

end