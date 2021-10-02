function [] = CreateBuffer()
    audioInDir = dir('Data/Music/*.mp4');
    audioNames = {audioInDir.name};

    BuffInDir = dir('Data/Raw/*.mat');
    BuffName = {BuffInDir.name};
    if(length(BuffName)~=0)
         for i=1:length(BuffName)
            disp (BuffName(i));
            name = BuffName{i};
            file = strcat('Data\Raw\',name);
            y = load(file);
            sz = size(y.Buffer);
            process = y.Buffer(1:20:sz(1,1),1);
            filenameToSave = strcat( '.\Data\Process\',name(1:(length(name)-4)),'.mat');
            disp (filenameToSave);
            save(filenameToSave,'process');
        end
    end
    
    
end