function [winner]=getRose(contestants,events)
%Runs the Bachelor competition

for i=1:length(events)%For the number of episodes/events
    event=events{i};%Finds this episodes event
    
    if strcmp(event,'Mocktail Party')%Gives the associated Score for each days event
        aS='FirstImpression';
    elseif strcmp(event,'Group Date')
        aS='Compatibility';
    elseif strcmp(event,'Costume Party')
        aS='FashionSense';  
    elseif strcmp(event,'Hackathon')
        aS='MATLABSkills';
    elseif strcmp(event,'Hometown Visit')
        aS='SobStory';
    end
    
    matScores=[contestants.MATLABSkills];%Gets the matlab scores and adds compatibility point
    M=max(matScores);
    mask=matScores==M;
    hold=num2cell([contestants.Compatibility]+mask);
    [contestants.Compatibility]=hold{:};
    
    if strcmp(event,'Mocktail Party') || strcmp(event,'Costume Party')%Adds Compatibilty for mocktail and costume party
        scores=[contestants.(aS)];
        M=max(scores);
        mask=scores==M;
        hold=num2cell([contestants.Compatibility]+mask);
        [contestants.Compatibility]=hold{:};
    end    
    
    compat=[contestants.Compatibility];
    avgCompat=mean(compat);%Gets the average compatibility
    mask2=compat<avgCompat;%Finds if any compat scores are less than the avg compat and removes one point for that event
    hold=num2cell([contestants.(aS)]-mask2);
    [contestants.(aS)]=hold{:};

    scores=[contestants.(aS)];
    M=min(scores);%Finds the lowest score
    mask3=scores==M;
    if sum(mask3)>1%If more than one person has the lowest score
        people=contestants(mask3);
        total=[people.FirstImpression];
        total=[total;[people.Compatibility]];
        total=[total;[people.FashionSense]];
        total=[total;[people.MATLABSkills]];
        total=[total;[people.SobStory]];
        hold=sum(total);
        [M,I]=min(hold);
        name=people(I).Name;%Gets the name of the person with the lowest score
        mask4=strcmp({contestants.Name},name);
        hold=num2cell([contestants.(aS)]+mask2);
        [contestants.(aS)]=hold{:};%Adds a point back to any one with a low compat score
        contestants(mask4)=[];
    elseif sum(mask3)==1
        hold=num2cell([contestants.(aS)]+mask2);
        [contestants.(aS)]=hold{:};%Adds a point back to any one with a low compat score
        contestants(mask3)=[];%Removes the contestant with the lowest score
    end
    
end
winner=contestants.Name;
end