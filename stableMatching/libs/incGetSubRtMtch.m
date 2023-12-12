function [incSubRtMtch, incSubRtPrefs, entSubRtPrefs] = incGetSubRtMtch(incPreMtch, entPreMtch, incIndList, entIndList, incPrefs, entPrefs, incN, entN, incNuWorst, entNuWorst, incIdx)
 % i(f, v). best choice of f that is worse than v(f)


% preference of an inc
incPref = incPrefs(incIdx, :);
% index of the incPreMtch in the preference
incSecondBestIdx = find(incPref == incPreMtch(incIdx), 1);

incSecondBestOpt = [];
%if incPreMtch is not the worst, take the best one among that are worse
%than incPreMtch
if (incSecondBestIdx ~= length(incPref)) && (incSecondBestIdx < length(incPref))
    incSecondBestOpt = [incSecondBestOpt, incPref(incSecondBestIdx+1)];
end

% get new matching for subroutine.
% if condition is not satisfied, return empty set
incSubRtMtch = [];
incSubRtPrefs = incPrefs;
entSubRtPrefs = entPrefs;
if ~isempty(incSecondBestOpt) && find(incPref==incSecondBestOpt, 1) <= find(incPref==incNuWorst(incIdx), 1)
    % update incSubRtMtch
    incSubRtMtch = incPreMtch;
    incSubRtMtch(incIdx) = incSecondBestOpt;
    % update incSubRtPrefs
    for i = 1:(incN-2)
        incPref = incPrefs(i, :);
        incSubRtMtchIdx = find(incPref==incSubRtMtch(i), 1);
        if incSubRtMtchIdx >= 2
            incSubRtPrefs(i, :) = [ incPref(incSubRtMtchIdx:end) incPref(1:incSubRtMtchIdx-1) ]; % use updated match
        end
    end
    % update entSubRtPrefs
    for i = 1:(entN-2)
        entPref = entPrefs(i, :);
        entSubRtMtchIdx = find(entPref==entPreMtch(i), 1);
        if entSubRtMtchIdx >= 2
            entSubRtPrefs(i, :) = [ entPref(entSubRtMtchIdx:end) entPref(1:entSubRtMtchIdx-1) ]; % use updated match
        end

    end
end

end