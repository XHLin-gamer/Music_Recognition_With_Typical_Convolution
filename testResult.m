function [name]= testResult( tone )
    

    tone_processed = tone(1:20:441000,1);
    
    BuffInDir = dir('Data/Process/*.mat');
    BuffName = {BuffInDir.name};
    resultCell = zeros(length(BuffName),1);
    parfor i = 1:length(BuffName)
        fileName = strcat('Data/Process/',BuffName{i})
        
        y = load(fileName);
        target = y.process;
        % accelarate with gpu
         gpu_tone_processed = gpuArray(tone_processed);
         gpu_target = gpuArray(target);
         gpu_h = xcorr(gpu_tone_processed,gpu_target);
         h = gather(gpu_h);

%       original convolution
%        h = xcorr(tone_processed,target);
        
        maks = max(h);
%        disp(fileName);
%        disp(maks);
        
        resultCell(i,1) = maks;
%         for spamming the visual charts        
%         sz = size(h);
%         fig = figure;
%         plot(1:1:sz(1,1),h);
%         frame = getframe(fig); 
%         img = frame2im(frame); 
%         imgName = strcat('Data/Img/',BuffName{i},'.png');
%         imwrite(img,imgName); 
%         close all;
    end
    pos = find(max(resultCell) == resultCell);
    name = BuffName{pos};
end