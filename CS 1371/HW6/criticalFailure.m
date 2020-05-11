function [G]=criticalFailure(vec)
E = vec(1);
F = vec(2);

if E~=1
    G='Good Job!';
else
    if F>=1&&F<=5
        G='Right Leg Wounded';
    elseif F>=6&&F<=10
        G='Left Leg Wounded';
    elseif F<=11&&F<=15
        G='Right Arm Wounded';
    else
        G='Left Arm Wounded';
    end
    
end
end