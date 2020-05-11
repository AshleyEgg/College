function puzzleMaker (name,varargin)
% Inputs:
%     Required: name = filename of image to turn into puzzle (doesn't have
%                      to be square)
%     Optional: thick = thickness of border around each tile (used to make
%                       exaggerated lines for problem description)
%     Pairs: append = input 'Append',(char) - Use to add more letters to
%                     the end of new filename.
%            replace = input 'Replace',(char) - Use to replace new filename
%                      altogether with new name (still keeps 'puzzle' on
%                      the end).
%            shifts = input 'ProShifts',(double) - Use to specify number of
%                     times to randomly shift the puzzle. Default is 1.

% Parse variable-length inputs
p = inputParser;
    p.FunctionName = 'puzzleMaker';
    p.StructExpand = false;
    % Define default values
    defaultThick = 1;
    defaultAppend = '';
    defaultReplace = '';
    defaultShifts = 1;
    % Add inputs
    addRequired(p,'name',@ischar);
    addOptional(p,'thick',defaultThick,@isnumeric);
    addParameter(p,'Append',defaultAppend,@ischar);
    addParameter(p,'Replace',defaultReplace,@ischar);
    addParameter(p,'ProShifts',defaultShifts,@isnumeric);
    % Parse p
    parse(p,name,varargin{:}); 
name = p.Results.name;
thick = p.Results.thick;
append = p.Results.Append;
replace = p.Results.Replace;
shifts = p.Results.ProShifts;

% Easter Egg
switch lower(name(lower(name)>='a'&lower(name)<='z'))
    case 'thatsthepuzzle'
        filename = ...
            'http://www.feistees.com/wp-content/uploads/2012/01/pzzle.jpg';
        name = 'puzzles';
    otherwise
        filename = name;
end
% Replace name for new file if specified (easier to write test cases)
if ~isempty(replace)
    name = replace;
end
% Specify in output's filename if this is a pro puzzle
if shifts>1
    append = [append,'Pro'];
end

im = imread(filename);
% Resize image into square that can be split into 4x4 sections
[imr,imc,~] = size(im);
newr = floor(imr/4)*4;
newc = floor(imc/4)*4;
new = min(newr,newc);
im = im(1:floor(imr/2)*2,1:floor(imc/2)*2,:); % First make even
diffr = floor(imr/2)-new/2;
diffc = floor(imc/2)-new/2;
im = im(1+diffr:end-diffr,1+diffc:end-diffc,:); % Crop out center
% Create colors inbetween sections
rgb = uint8(randperm(205,3*10)+50); % 3 layers, 10 lines. Nothing too dark
rgb = reshape(rgb,[10,1,3]);
rgb = repmat(rgb,[thick,new,1]);
% Insert color dividers into im
intv = new/4;
for r=1:5
    if r>1
        im(intv*(r-1)-(thick-1):intv*(r-1),:,:) = rgb(r:10:end,:,:);
    end
    if r<5
        im(intv*(r-1)+1:intv*(r-1)+thick,:,:) = rgb(r:10:end,:,:);
    end
end
for c=1:5 % Rotate so dimensions match
    if c>1
        im(:,intv*(c-1)-(thick-1):intv*(c-1),:) = ...
            rot90(rgb(c+5:10:end,:,:),3);
    end
    if c<5
        im(:,intv*(c-1)+1:intv*(c-1)+thick,:) = ...
            rot90(rgb(c+5:10:end,:,:),3);
    end
end
% Run helper function to shift puzzle
im = scramble(im,shifts);
% Write to new image
[begin,~] = strtok(name,'.');
filename = [begin,'puzzle',append,'.png'];
imwrite(uint8(im),filename)

end

function im = scramble (im,shifts)
intv = size(im,1)/4;
% Choose random section to start at
currr = ceil(rand*4);
currc = ceil(rand*4);
[prevr,prevc] = movementHelper(currr,currc);
% Shift the number of times specified
for i=1:shifts
    thisr = (currr-1)*intv+1:currr*intv;
    thisc = (currc-1)*intv+1:currc*intv;
    sect = im(thisr,thisc,:);
    % Choose what direction to shift using another helper
    newr = prevr;
    newc = prevc;
    % To prevent making the same shift in reverse
    while newr==prevr&&newc==prevc
        [newr,newc] = movementHelper(currr,currc);
    end
    thatr = (newr-1)*intv+1:newr*intv;
    thatc = (newc-1)*intv+1:newc*intv;
    im(thisr,thisc,:) = im(thatr,thatc,:);
    im(thatr,thatc,:) = sect;
    % Basically shifting the blank tile, so always want to move new
    prevr = currr;
    prevc = currc;
    currr = newr;
    currc = newc;
end
% Remove 16th section
finalr = (newr-1)*intv+1:newr*intv;
finalc = (newc-1)*intv+1:newc*intv;
im(finalr,finalc,:) = 0;
end

function [newr,newc] = movementHelper (origr,origc)
vec = [origr,origc];
ind = round(rand)+1;
origd = vec(ind);
if origd==1
    vec(ind) = 2;
elseif origd==4
    vec(ind) = 3;
else
    vec(ind) = origd+(-1)^(round(rand));
end
newr = vec(1);
newc = vec(2);
end