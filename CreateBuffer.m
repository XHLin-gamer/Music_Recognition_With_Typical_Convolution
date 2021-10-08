function [] = CreateBuffer()
    audioInDir = dir('Data/Music/*.mp4');
    audioNames = {audioInDir.name};


    if(length(audioNames)==0)
        disp 'No Audio Files in Current Directory'
    else
        for i=1:length(audioNames)       
            filename = char(audioNames(i));
            filename = strcat('Data/Music/',filename);
            disp (filename);
            Buffer = audioread(filename);
            filenameToSave = strcat('Data/Raw/',char(audioNames(i)),'.mat');
            save(filenameToSave,'Buffer');
        end
    end
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