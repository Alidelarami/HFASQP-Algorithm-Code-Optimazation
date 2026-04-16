%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Test System 3 - nvar 60 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% **Parameters Definiterion**  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nvar=60;
Pmin=[0	0	0	60	60	60	60	60	60	40	40	55	55	0	0	0	60	60	60	60	60	60	40	40	55	55];%%%1----26
Pmax=[680	360	360	180	180	180	180	180	180	120	120	120	120	680	360	360	180	180	180	180	180	180	120	120	120	120];
Pcmin=[81    40    81    40    10    35    81    40    81    40    10    35];
Pcmax=[  247  125.8    247    125.8   60   105       247     125.8     247    125.8    60   105];
Hmin=[0	0	0	0	0	0	0	0	0	0];
Hmax=[2695.2	60	60	120	120	2695.2	60	60	120	120];
zeross=zeros(1,12);
oness=ones(1,12);
LP=[Pmin       Pcmin     zeross     Hmin];
UB=[Pmax       Pcmax      oness    Hmax ];
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  **Cost Function**  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
     PD=4700;
     HD=2500;

     Pmin=[0	0	0	60	60	60	60	60	60	40	40	55	55	0	0	0	60	60	60	60	60	60	40	40	55	55];%%%1----26
% %  Pmax=[680	360	360	180	180	180	180	180	180	120	120	120	120	680	360	360	180	180	180	180	180	180	120	120	120	120];
     alpha=[0.00028	0.00056	0.00056	0.00324	0.00324	0.00324	0.00324	0.00324	0.00324	0.00284	0.00284	0.00284	0.00284	0.00028	0.00056	0.00056	0.00324	0.00324	0.00324	0.00324	0.00324	0.00324	0.00284	0.00284	0.00284	0.00284];
     beta=[8.1	8.1	8.1	7.74	7.74	7.74	7.74	7.74	7.74	8.6	8.6	8.6	8.6	8.1	8.1	8.1	7.74	7.74	7.74	7.74	7.74	7.74	8.6	8.6	8.6	8.6];
     gamma=[550	309	309	240	240	240	240	240	240	126	126	126	126	550	309	309	240	240	240	240	240	240	126	126	126	126];
     lambda=[300	200	200	150	150	150	150	150	150	100	100	100	100	300	200	200	150	150	150	150	150	150	100	100	100	100];
     rho=[0.035	0.042	0.042	0.063	0.063	0.063	0.063	0.063	0.063	0.084	0.084	0.084	0.084	0.035	0.042	0.042	0.063	0.063	0.063	0.063	0.063	0.063	0.084	0.084	0.084	0.084];
      PH{1}={[98.8,0],[81,104.8],[215,180],[247,0]};
      PH{2}={[44,0],[44,15.9],[40,75],[110.2,135.6],[125.8,32.4],[125.8,0]};
      PH{3}={[98.8,0],[81,104.8],[215,180],[247,0]};
      PH{4}={[44,0],[44,15.9],[40,75],[110.2,135.6],[125.8,32.4],[125.8,0]};
      PH{5}={[20,0],[10,40],[45,55],[60,0]};
      PH{6}={[35,0],[35,20],[90,45],[90,25],[105,0]};
      PH{7}={[98.8,0],[81,104.8],[215,180],[247,0]};
      PH{8}={[44,0],[44,15.9],[40,75],[110.2,135.6],[125.8,32.4],[125.8,0]};
      PH{9}={[98.8,0],[81,104.8],[215,180],[247,0]};
      PH{10}={[44,0],[44,15.9],[40,75],[110.2,135.6],[125.8,32.4],[125.8,0]};
      PH{11}={[20,0],[10,40],[45,55],[60,0]};
      PH{12}={[35,0],[35,20],[90,45],[90,25],[105,0]};
      a=[0.0345	0.0435	0.0345	0.0435	0.1035	0.072	0.0345	0.0435	0.0345	0.0435	0.1035	0.072];
      b=[14.5	36	14.5	36	34.5	20	14.5	36	14.5	36	34.5	20];
      c=[2650	1250	2650	1250	2650	1565	2650	1250	2650	1250	2650	1565];
      d=[0.03	0.027	0.03	0.027	0.025	0.02	0.03	0.027	0.03	0.027	0.025	0.02];
      e=[4.2	0.6	4.2	0.6	2.203	2.34	4.2	0.6	4.2	0.6	2.203	2.34];
      f=[0.031	0.011	0.031	0.011	0.051	0.04	0.031	0.011	0.031	0.011	0.051	0.04];
       
      ah=[0.038	0.038	0.038	0.052	0.052	0.038	0.038	0.038	0.052	0.052];
      bh=[2.0109	2.0109	2.0109	3.0651	3.0651	2.0109	2.0109	2.0109	3.0651	3.0651];
      ch=[950	950	950	480	480	950	950	950	480	480];

    Pc1=[  PH{1}{1:end}];
    Pc2=[  PH{2}{1:end}];
    Pc3=[  PH{3}{1:end}];
    Pc4=[  PH{4}{1:end}];
    Pc5=[  PH{5}{1:end}];
    Pc6=[  PH{6}{1:end}];
    Pc7=[  PH{7}{1:end}];
    Pc8=[  PH{8}{1:end}];
    Pc9=[  PH{9}{1:end}];
    Pc10=[  PH{10}{1:end}];
    Pc11=[  PH{11}{1:end}];
    Pc12=[  PH{12}{1:end}];
% % % % % %       Pcmin=[min(Pc1(1:2:end)) min(Pc2(1:2:end)) min(Pc3(1:2:end))...
% % % % % %         min(Pc4(1:2:end)) min(Pc5(1:2:end)) min(Pc6(1:2:end))...
% % % % % %         min(Pc7(1:2:end)) min(Pc8(1:2:end)) min(Pc9(1:2:end))...
% % % % % %         min(Pc10(1:2:end)) min(Pc11(1:2:end)) min(Pc12(1:2:end))];
% % % % % %       Pcmax=[max(Pc1(1:2:end)) max(Pc2(1:2:end)) max(Pc3(1:2:end))...
% % % % % %         max(Pc4(1:2:end)) max(Pc5(1:2:end)) max(Pc6(1:2:end))...
% % % % % %         max(Pc7(1:2:end)) max(Pc8(1:2:end)) max(Pc9(1:2:end))...
% % % % % %         max(Pc10(1:2:end)) max(Pc11(1:2:end)) max(Pc12(1:2:end))];
   Pcmin=   [81    40    81    40    10    35    81    40    81    40    10    35];
Pcmax=[  247  125.8    247    125.8   60   105       247     125.8     247    125.8    60   105];
     nUnit=numel([ alpha repmat(  a,1,2)   ah]);
     nPlant=numel( alpha);
     nCHP=numel(repmat(  a,1,2));
     nHeat=numel(  ah);
     
 
            
    P= x(1:nPlant);%%%1-26
    Pc= x(nPlant+1:nPlant+nCHP/2);%%%%27-----38
    Hcmin1=min(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(1)-1000 Pc(1) Pc(1)+1000],[Pc(1) Pc(1) Pc(1)]));
    Hcmax1=max(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(1)-1000 Pc(1) Pc(1)+1000],[Pc(1) Pc(1) Pc(1)]));
    Hcmin2=min(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(2)-1000 Pc(2) Pc(2)+1000],[Pc(2) Pc(2) Pc(2)]));
    Hcmax2=max(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(2)-1000 Pc(2) Pc(2)+1000],[Pc(2) Pc(2) Pc(2)]));
    Hcmin3=min(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(3)-1000 Pc(3) Pc(3)+1000],[Pc(3) Pc(3) Pc(3)]));
    Hcmax3=max(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(3)-1000 Pc(3) Pc(3)+1000],[Pc(3) Pc(3) Pc(3)]));
    Hcmin4=min(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(4)-1000 Pc(4) Pc(4)+1000],[Pc(4) Pc(4) Pc(4)]));
    Hcmax4=max(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(4)-1000 Pc(4) Pc(4)+1000],[Pc(4) Pc(4) Pc(4)]));
    Hcmin5=min(polyxpoly([0,40,55,0],[20,10,45,60],[Pc(5)-1000 Pc(5) Pc(5)+1000],[Pc(5) Pc(5) Pc(5)]));
    Hcmax5=max(polyxpoly([0,40,55,0],[20,10,45,60],[Pc(5)-1000 Pc(5) Pc(5)+1000],[Pc(5) Pc(5) Pc(5)]));
    Hcmin6=min(polyxpoly([0,20,45,25,0],[35,35,90,90,105],[Pc(6)-1000 Pc(6) Pc(6)+1000],[Pc(6) Pc(6) Pc(6)]));
    Hcmax6=max(polyxpoly([0,20,45,25,0],[35,35,90,90,105],[Pc(6)-1000 Pc(6) Pc(6)+1000],[Pc(6) Pc(6) Pc(6)]));
    Hcmin7=min(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(7)-1000 Pc(7) Pc(7)+1000],[Pc(7) Pc(7) Pc(7)]));
    Hcmax7=max(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(7)-1000 Pc(7) Pc(7)+1000],[Pc(7) Pc(7) Pc(7)]));
    Hcmin8=min(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(8)-1000 Pc(8) Pc(8)+1000],[Pc(8) Pc(8) Pc(8)]));
    Hcmax8=max(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(8)-1000 Pc(8) Pc(8)+1000],[Pc(8) Pc(8) Pc(8)]));
    Hcmin9=min(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(9)-1000 Pc(9) Pc(9)+1000],[Pc(9) Pc(9) Pc(9)]));
    Hcmax9=max(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(9)-1000 Pc(9) Pc(9)+1000],[Pc(9) Pc(9) Pc(9)]));
    Hcmin10=min(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(10)-1000 Pc(10) Pc(10)+1000],[Pc(10) Pc(10) Pc(10)]));
    Hcmax10=max(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(10)-1000 Pc(10) Pc(10)+1000],[Pc(10) Pc(10) Pc(10)]));
    Hcmin11=min(polyxpoly([0,40,55,0],[20,10,45,60],[Pc(11)-1000 Pc(11) Pc(11)+1000],[Pc(11) Pc(11) Pc(11)]));
    Hcmax11=max(polyxpoly([0,40,55,0],[20,10,45,60],[Pc(11)-1000 Pc(11) Pc(11)+1000],[Pc(11) Pc(11) Pc(11)]));
    Hcmin12=min(polyxpoly([0,20,45,25,0],[35,35,90,90,105],[Pc(12)-1000 Pc(12) Pc(12)+1000],[Pc(12) Pc(12) Pc(12)]));
    Hcmax12=max(polyxpoly([0,20,45,25,0],[35,35,90,90,105],[Pc(12)-1000 Pc(12) Pc(12)+1000],[Pc(12) Pc(12) Pc(12)]));
    Hcmin=[Hcmin1 Hcmin2 Hcmin3 Hcmin4 Hcmin5 Hcmin6 Hcmin7 Hcmin8 Hcmin9 Hcmin10 Hcmin11 Hcmin12];
    Hcmax=[Hcmax1 Hcmax2 Hcmax3 Hcmax4 Hcmax5 Hcmax6 Hcmax7 Hcmax8 Hcmax9 Hcmax10 Hcmax11 Hcmax12];
    for i=1:nCHP/2
        if Hcmin(i)==Hcmax(i)
            Hcmin(i)=0;
        end
    end
    Hc=Hcmin+(Hcmax-Hcmin).*x(nPlant+nCHP/2+1:nPlant+nCHP);%%%39----50
    H= x(nPlant+nCHP+1:nUnit);%%%%51-----60

     
    
    CP=alpha.*P.*P+beta.*P+gamma+abs(lambda.*sin(rho.*(Pmin-P)));
    
    CPTotal=sum(CP);
    
    
    CCHP=a.*Pc.*Pc+b.*Pc+c+d.*Hc.*Hc+e.*Hc+f.*Pc.*Hc;
    
    CCHPTotal=sum(CCHP);
   CH=ah.*H.*H+bh.*H+ch;
    
    CHTotal=sum(CH);
    
    PL=0;
    
    PTotal=sum([P Pc]);
    HTotal=sum([Hc H]);

    PD= PD;
    HD= HD;
    
    PowerBalanceViolation=max(1-(PTotal-PL)/(PD),0);
    %PowerBalanceViolationCHP=max(1-(PTotal-PL)/(PD-sum(P)),0);
    %HeatBalanceViolationCHP=max(1-(HTotal)/(HD-sum(H)),0);
    HeatBalanceViolation=max(1-(HTotal)/(HD),0);

    q=1;
    z=(CPTotal+CCHPTotal+CHTotal)*(1+q*PowerBalanceViolation+q*1*HeatBalanceViolation);
    %z=(CPTotal+CCHPTotal+CHTotal)*(1+q*PowerBalanceViolation)*(1+q*HeatBalanceViolation);
    
    out.P=P;
    out.Pc=Pc;
    out.Hc=Hc;
    out.H=H;
    out.PTotal=PTotal;
    out.HTotal=HTotal;
    out.CP=CP;
    out.CCHP=CCHP;
    out.CH=CH;
    out.CPTotal=CPTotal;
    out.CCHPTotal=CCHPTotal;
    out.CHTotal=CHTotal;
    out.PL=PL;
    out.PowerBalanceViolation=PowerBalanceViolation;
    %out.PowerBalanceViolationCHP=PowerBalanceViolationCHP;
    %out.HeatBalanceViolationCHP=HeatBalanceViolationCHP;
    out.HeatBalanceViolation=HeatBalanceViolation;
    out.z=z;
    %%% 
   %%%  %%  x =[P Pc Hc H  ]  