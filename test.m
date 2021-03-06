function test(rounds)
    files = dir('Data/Raw/*.mat');
    files_names = {files.name};
    corr = 0;
    for i = 1:rounds
        rnd = unidrnd(length(files_names));
        %testTone = getTestTone();
        targetName = strcat('Data/Raw/',files_names{rnd});
        targetFile = load(targetName);
        len = length(targetFile.Buffer) - 882000 - 44100;
        rnd_sec = unidrnd(len) + 44100;
        end_sec = rnd_sec + 882000;
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