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

%Values for location of each body part (in mm) 
HEAD = 1500.387451; 
C7 = 1311.485718; 
LSHO = 1287.266968;
LELB = 974.70459;
LWR	= 792.648193;
LFIN = 715.708801;
RSHO = 1279.489868;
RELB = 955.712891;
RWR = 762.925598;
RFIN = 691.197571;
LHIP = 815.815369;
LKNE = 431.896851;
LHEE = 7.43395;
LANK = 67.84079;
LTOE = 17.552322;
RHIP = 793.683228;
RKNE = 426.813721;
RHEE = 7.254061;
RANK = 79.939293;
RTOE = 20.029524;

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

% Need a way to read in data from Trial 5 (assuming file is named
% 'Trial05.txt' and in the same directory
filename = ('Trial05.txt');
Trial5 = load(filename);
