%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  Test System 1 - nvar 8  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% **Parameters Definiterion**  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
nvar=8;                           % Number of  Variables
LP=[35       40         10      35        0   0   0        0];
UB=[135     125.8        60   105         1   1   1       60];%%% 
   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%  **Cost Function**  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

PD=300;       HD=150;       %%%  Case 1 
% %  PD=250;       HD=175;   %%  Case 2
% %  PD=160;       HD=220;    %%   Case 3
  alpha=[ 0.000115  ];
  beta= [ 0.00172  ];
  gamma=[7.6997  ];
  lambda=[254.8863];
  rho=[   0 ];%%%only power
  a=[ 0.0435   0.1035   0.072  ];
  b=[ 36   34.5   20 ];
  c=[ 1250   2650   1565  ];
  d=[ 0.027   0.025   0.02  ];
  e=[ 0.6    2.203   2.34  ];
  f=[  0.011  0.051   0.04 ];  %%%% 
  ah=[0.038];       bh=[2.0109];       ch=[950];%%%only heating

 
% % %     B=10e-7.*[ 49 14 15 15 20 25
% % %         14 45 16 20 18 19
% % %         15 16 39 10 12 15
% % %         15 20 10 40 14 11
% % %         20 18 12 14 35 17
% % %         25 19 15 11 17 39];

%     model1.B0=1e-3*[-0.3908 -0.1279 0.7047 0.0591 0.2161 -0.6635];
%     
%     model1.B00=0.056; 

%%%%%%%%%
%
%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%

%%%%
 
      P=   [  x(1)   ];%%%4%%power
    Pc=  [x(2)   x(3)   x(4)];  %%%3 CHP
Hcmin1=min(polyxpoly ([0,15.9,75,135.6,32.4,0],[ 44,44 ,40,110.2,125.8,125.8],[Pc(1)-1000 Pc(1) Pc(1)+1000],[Pc(1) Pc(1) Pc(1)]));
Hcmax1=max(polyxpoly ([0,15.9,75,135.6,32.4,0],[ 44,44 ,40,110.2,125.8,125.8],[Pc(1)-1000 Pc(1) Pc(1)+1000],[Pc(1) Pc(1) Pc(1)]));

Hcmin2=min(polyxpoly([0,40,55,0],[20,10,45,60],[Pc(2)-1000 Pc(2) Pc(2)+1000],[Pc(2) Pc(2) Pc(2)]));
Hcmax2=max(polyxpoly([0,40,55,0],[20,10,45,60],[Pc(2)-1000 Pc(2) Pc(2)+1000],[Pc(2) Pc(2) Pc(2)]));

Hcmin3=min(polyxpoly([0,20,45,25,0],[35,35,90,90,105] ,[Pc(3)-1000 Pc(3) Pc(3)+1000],[Pc(3) Pc(3) Pc(3)]));
Hcmax3=max(polyxpoly([0,20,45,25,0],[35,35,90,90,105] ,[Pc(3)-1000 Pc(3) Pc(3)+1000],[Pc(3) Pc(3) Pc(3)]));
          
    Hcmin=[Hcmin1     Hcmin2        Hcmin3];
    Hcmax=[Hcmax1    Hcmax2       Hcmax3];
    
    nCHP=6;
    for i=1:nCHP/2
        if Hcmin(i)==Hcmax(i)
            Hcmin(i)=0;
            
            
        end
    end
    Hc= Hcmin+(Hcmax-Hcmin) .*[x(5)   x(6)    x(7)];%%%2
    H=   x(8);%%%1
    
     
    
    %%%%
    %%%%
    %%%%%%%%%%%%%%%%%%%%%%%%%
    %%%%%
    
    
    CP=alpha.*P.*P.*P   +    beta.*P.*P  +   gamma.*P  +   lambda ;%%cost power
    CPTotal=sum(CP);
    CCHP=  a.*Pc.*Pc   +   b.*Pc+    c+d.*Hc.*Hc    +e.*Hc   +f.*Pc.*Hc;
    CCHPTotal=sum(CCHP);
    CH=   ah.*H.*H     +bh.*H     + ch;%%%only heating
    CHTotal=sum(CH);

    
%    B0=model.B0;
%    B00=model.B00;
    
    PL=0;%%[P Pc]*B*[P Pc]';%+[P]*B(1:4,5:6)*[Pc]+[Pc]*B(5:6,5:6)*[Pc];%+B0*P'+B00;
    PTotal=sum([P Pc]);
    HTotal=sum([Hc H]); 
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


