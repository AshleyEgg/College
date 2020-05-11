function [bracket]=marchMadness(ppg,oppg,wpct,seed,matches)
[~,~,rawPPG]=xlsread(ppg);
[~,~,rawOPPG]=xlsread(oppg);
[~,~,rawWPCT]=xlsread(wpct);
[~,~,rawSEED]=xlsread(seed);
[~,~,rawM]=xlsread(matches);
labels={'Team','Seed','PPG','OPPG','WPCT'};%labels for each column
total=reshape({rawSEED{:,2},rawSEED{:,1}},64,2);%Contains the names of all the teams actually playing and their seed data
ppg={};
oppg={};
wpct={};
for i=1:64%For every team actually playing
    loc=strcmp(total{i,1},rawPPG(:,1));
    ppg=[ppg;rawPPG{loc,2}];
    oppg=[oppg;rawOPPG{loc,2}];
    wpct=[wpct;rawWPCT{loc,2}];
end
total=[total,ppg,oppg,wpct];%Takes all the data from the differnt files and puts them in one place
total=[labels;total];%Adds labels to each column

%Below calculates the score for each team and adds it on as a column to
%total
score={'Score'};
for i=2:65%For every team in total
    seed=total{i,2};
    ppg=total{i,3};
    oppg=total{i,4};
    wpct=total{i,5};
    hold=((1/6)*(ppg-oppg)/ppg)+((1/6)*wpct)+((2/3)*((16-seed)/15));%Calcuolates the score for each team
    score=[score;hold];
end
total=[total,score];%Adds the score column onto the end of total

%Begins to format the bracket with all the teams
idx=cell2mat(rawM(1:16));%gets the order that they play in
div1=total(2:4:end,:);%Breaks all the teams into their brackets
div2=total(3:4:end,:);
div3=total(4:4:end,:);
div4=total(5:4:end,:);
div1=div1(idx,:);%Puts all the teams in the correct order
div2=div2(idx,:);
div3=div3(idx,:);
div4=div4(idx,:);
total=[div1;div2;div3;div4];
bracket=total(:,1);


%Need to simulate the first round
hold={};
for i=1:2:63%For every team in the first round
    first=total{i,6};
    second=total{i+1,6};
    temp=playGame(first,second);
    if temp
        hold=[hold;{[]};total{i,1}];
    else
        hold=[hold;{[]};total{i+1,1}];
    end       
end
bracket=[bracket,hold];

%Second round
hold=cell(2,1);
for i=2:4:63
    mask1=strcmp(bracket{i,2},total(:,1));
    mask2=strcmp(bracket{i+2,2},total(:,1));
    first=total{mask1,6};
    second=total{mask2,6};
    temp=playGame(first,second);
    
    if temp
        hold=[hold;total{mask1,1};cell(3,1)];
    else
        hold=[hold;total{mask2,1};cell(3,1)];
    end 
end
hold=hold(1:end-2);
bracket=[bracket,hold];
% 
% %Sweet Sixteen
hold=cell(4,1);
for i=3:8:63
    mask1=strcmp(bracket{i,3},total(:,1));
    mask2=strcmp(bracket{i+4,3},total(:,1));
    first=total{mask1,6};
    second=total{mask2,6};
    temp=playGame(first,second);
    
    if temp
        hold=[hold;total{mask1,1};cell(7,1)];
    else
        hold=[hold;total{mask2,1};cell(7,1)];
    end 
end
hold=hold(1:end-4);
bracket=[bracket,hold];

% %Elite 8
hold=cell(8,1);
for i=5:16:63
    mask1=strcmp(bracket{i,4},total(:,1));
    mask2=strcmp(bracket{i+8,4},total(:,1));
    first=total{mask1,6};
    second=total{mask2,6};
    temp=playGame(first,second);
    
    if temp
        hold=[hold;total{mask1,1};cell(15,1)];
    else
        hold=[hold;total{mask2,1};cell(15,1)];
    end 
end
hold=hold(1:end-8);
bracket=[bracket,hold];

% %Final Four
hold=cell(16,1);
for i=9:32:63
    mask1=strcmp(bracket{i,5},total(:,1));
    mask2=strcmp(bracket{i+16,5},total(:,1));
    first=total{mask1,6};
    second=total{mask2,6};
    temp=playGame(first,second);
    
    if temp
        hold=[hold;total{mask1,1};cell(31,1)];
    else
        hold=[hold;total{mask2,1};cell(31,1)];
    end 
end
hold=hold(1:end-16);
bracket=[bracket,hold];

% %Championship
hold=cell(32,1);
for i=17:64:64
    mask1=strcmp(bracket{i,6},total(:,1));
    mask2=strcmp(bracket{i+32,6},total(:,1));
    first=total{mask1,6};
    second=total{mask2,6};
    temp=playGame(first,second);
    
    if temp
        hold=[hold;total{mask1,1};cell(31,1)];
    else
        hold=[hold;total{mask2,1};cell(31,1)];
    end 
end
bracket=[bracket,hold];
end

