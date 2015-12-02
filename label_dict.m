function [ num] = label_dict( label )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here
%Anger Disgust Fear Happiness Neutral Sadness Surprise
if(strcmp(label,'AN' ))
    num =1
end
if(strcmp(label,'DI' ))
    num =2
end
if(strcmp(label,'FE' ))
    num =3
end
if(strcmp(label,'HA' ))
    num =4
end
if(strcmp(label,'NE' ))
    num =5
end
if(strcmp(label,'SA' ))
    num =6
end
if(strcmp(label,'SU' ))
    num =7
end
end

