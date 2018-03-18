% Save Large TFR in Matlab
%
% This is a demo to save and load large TFR varible (e.g. from Fieldtrip)
% TFR is your Time-Freq represenation, it should be a complex number.
%
%
% Author: Biao Han
% March 2018

%% Save TFR
data = single(TFR.fourierspctrm); % single saves half of your storage space
save_bin('TFR_fourierspctrm.bin',data);
TFR = rmfield(TFR,'fourierspctrm');
save('TFR_withoutfourierspctrm.mat','TFR');

%% Load TFR
load(['TFR_withoutfourierspctrm.mat']);
TFR.fourierspctrm = load_bin('TFR_fourierspctrm.bin');


%% Functions to use
function out = load_bin(filename)
real_data = h5read(filename,'/real');
imag_data =h5read(filename,'/imag');
out = complex(real_data,imag_data);
end

function save_bin(filename,z)
h5create(filename,'/real',size(z),'Datatype','single')
h5create(filename,'/imag',size(z),'Datatype','single')
z_real = real(z);
z_imag = imag(z);
h5write(filename, '/real', z_real)
h5write(filename, '/imag', z_imag)
h5disp(filename)
end