function [ ecg , Rind , PVCind , N , t ] = loadPVCFile( index , fs , files )
%loadPVCFile Load files in DATPVC folder
% Inputs: 
%   --> index - file number
%   --> fs - Sampling frequency (Hz)
%   --> files - cell with file names
%
% Outputs:
%   --> ecg - ECG signal
%   --> Rind - R peak indexes
%   --> PVCind - PVC bynary indexes
%   --> N - number of data points
%   --> t - time vector

load(files{index});

if index == 4
    ecg = - DAT.ecg;
else
    ecg = DAT.ecg;
end

Rind = DAT.ind;
PVCind = Rind(DAT.pvc==1);

N = length(ecg);
t = 0:(1/fs):N/fs-(1/fs);

end