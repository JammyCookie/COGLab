%Katherine Dash, Nick Saba, Jami Stuckey, Noah Ziemba 
%2/13/20, Thurs. 
%Biomech. Lab 3 - COG 

%Values for proportion of body weight for each body segment 
TrunkWeight = 0.496; 
HeadNeckWeight = 0.079; 
ThighWeight = 0.097; 
ShankWeight = 0.045; 
FootWeight = 0.014;
ArmWeight = 0.035; 
ForearmWeight = 0.015;
HandWeight = 0.006;
BodyWeight = TrunkWeight+HeadNeckWeight+ThighWeight*2+ShankWeight*2 ...
    +FootWeight*2+ArmWeight*2+ForearmWeight*2+HandWeight*2;

for i=1:4
    filename = strcat('Trial0',num2str(i),'.xlsx');
    Triali = importdata(filename);
    Triali = Triali.data; 

    %Values for location of each body part (in mm) 
    HEAD = Triali(1); 
    C7 = Triali(2); 
    LSHO = Triali(3);
    LELB = Triali(4);
    LWR	= Triali(5);
    LFIN = Triali(6);
    RSHO = Triali(7);
    RELB = Triali(8);
    RWR = Triali(9);
    RFIN = Triali(10);
    LHIP = Triali(11);
    LKNE = Triali(12);
    LHEE = Triali(13);
    LANK = Triali(14);
    LTOE = Triali(15);
    RHIP = Triali(16);
    RKNE = Triali(17);
    RHEE = Triali(18);
    RANK = Triali(19);
    RTOE = Triali(20);

    %Find the length of each body segment
    TrunkLength = C7-mean([LHIP,RHIP]); 
    HeadNeckLength = HEAD-C7; 
    RightThighLength = RHIP-RKNE; 
    RightShankLength = RKNE-RANK; 
    RightFootLength = RANK-RHEE; 
    LeftThighLength = LHIP-LKNE; 
    LeftShankLength = LKNE-LANK; 
    LeftFootLength = LANK-LHEE; 
    RightArmLength = RSHO-RELB; 
    RightForearmLength = RELB-RWR; 
    RightHandLength = RWR-RFIN; 
    LeftArmLength = LSHO-LELB; 
    LeftForearmLength = LELB-LWR; 
    LeftHandLength = LWR-RFIN; 
    BodyLength = mean([RightFootLength,LeftFootLength])+mean([RightShankLength,LeftShankLength]) ... 
        +mean([RightThighLength,LeftThighLength])+TrunkLength+HeadNeckLength;

    %Find the center of mass location from ground for each body segment 
    RightFootCOM = 0.5*RightFootLength;
    LeftFootCOM = 0.5*LeftFootLength;
    RightShankCOM = RightFootLength+0.567*RightShankLength; 
    LeftShankCOM = LeftFootLength+0.567*LeftShankLength;
    RightThighCOM = RightFootLength+RightShankLength+0.567*RightThighLength; 
    LeftThighCOM = LeftFootLength+LeftShankLength+0.567*LeftThighLength; 
    TrunkCOM = mean([RightFootLength,LeftFootLength])+mean([RightShankLength,LeftShankLength]) ... 
        +mean([RightThighLength,LeftThighLength])+0.438*TrunkLength; 
    HeadNeckCOM = mean([RightFootLength,LeftFootLength])+mean([RightShankLength,LeftShankLength]) ... 
        +mean([RightThighLength,LeftThighLength])+TrunkLength+0.567*HeadNeckLength; 
    RightArmCOM = BodyLength-HeadNeckLength-0.436*RightArmLength; 
    LeftArmCOM = BodyLength-HeadNeckLength-0.436*LeftArmLength; 
    RightForearmCOM = BodyLength-HeadNeckLength-0.43*RightForearmLength;
    LeftForearmCOM = BodyLength-HeadNeckLength-0.43*LeftForearmLength;
    RightHandCOM = BodyLength-HeadNeckLength-RightForearmLength-0.494*RightHandLength; 
    LeftHandCOM = BodyLength-HeadNeckLength-LeftForearmLength-0.494*LeftHandLength; 

    %Calculate center of gravity 
    COG = (mean([RightFootCOM,LeftFootCOM])*FootWeight+mean([RightShankCOM,LeftShankCOM]) ... 
        *ShankWeight+mean([RightShankCOM,LeftShankCOM])*ShankWeight+mean([RightThighCOM,LeftThighCOM]) ... 
        *ThighWeight+TrunkCOM*TrunkWeight+HeadNeckCOM*HeadNeckWeight+mean([RightArmCOM,LeftArmCOM]) ... 
        *ArmWeight+mean([RightForearmCOM,LeftForearmCOM])*ForearmWeight+mean([RightHandCOM,LeftHandCOM]) ... 
        *HandWeight)/BodyWeight; 
    
    COGarray(i) = COG; 
end 

Trial5 = importdata('Trial05.txt');
Trial5 = Trial5.data; 

