function test(rounds)
    files = dir('Data/Raw/*.mat');
    files_names = {files.name};
    corr = 0;
    for i = 1:rounds
        rnd = unidrnd(39);
        %testTone = getTestTone();
        targetName = strcat('Data/Raw/',files_names{rnd});
        targetFile = load(targetName);
        len = length(targetFile.Buffer) - 441000;
        rnd_sec = unidrnd(len);
        end_sec = rnd_sec + 441000;
        tone = targetFile.Buffer(rnd_sec:1:end_sec);
        disp(files_names{rnd});
        %sound(tone,44100);
        ans = testResult(tone);
        disp(ans);
        if(ans == files_names{rnd})
            corr = corr + 1;
        else
            errPath = strcat('Data/Err/',files_names{rnd});
            save(errPath,'tone');
        end
    end
        disp(corr);
end