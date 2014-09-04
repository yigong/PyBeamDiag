function convertBinary5(filenamePhrase)     %phrase characteristic of filename
% convertBinary3('filenamePhrase')

IDphrase = filenamePhrase;
f = dir;
n=1;
%Event = {};

disp('Identifying filenames...')
for i=1:length(dir)
    if ~isempty(strfind(f(i).name,IDphrase))
        fnames{n} = f(i).name;
        s = strfind(fnames{n},'k')
        n=n+1;
    end
end

disp(['Found ',num2str(length(fnames)),' files to be processes'])

for i=1:length(fnames)
    disp(['Analyzing',fnames{i},'...'])
    
    % Convert Binary Track Matrix to Events of Choice
    Res = GetCoincidentETrackEvents5(fnames{i}); % Saves events of choice
    
    % Load needed matrixs
    load('../../psft_650um.mat')   % psft_650um.mat')         % 650um psft Table
    load('../../dEdx_ref.mat')     % Silicon dEdx ref table
    
    
    % Run Analysis on each Batch of Events
   
        Event = RunTracks5(Res,20000, 'DEdx_ref', psft); % Saves coincident events
        
    
    F = strfind(fnames{i},'.dat');
    sname = [fnames{i}(1:(F-1)),'_TRK.mat'];
    save(sname,'Event');
    disp([' Saving ', sname, ' to file'])
    
    % Reset Variables
    clear Event Res;

    disp(['Done Analyzing ',fnames{i},'...'])

end

