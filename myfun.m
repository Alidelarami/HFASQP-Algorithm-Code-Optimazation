function [O]= myfun(x)
%%%%%%%%%%%%%%%%%%%%%%%%% **Cost Function** %%%%%%%%%%%%%%%%%%%
 %%%%%%% First, remove all lines from 6 to 118.
 %%%%%%% Replacement of **Cost Function** for Test System x.
 %%%%%%% For example Test System 2. 

 PD=600;        HD=150;
    alpha=[0.008 0.003 0.0012 0.001];
    beta=[2 1.8 2.1 2];
    gamma=[25 60 100 120];
    lambda=[100 140 160 180];
   rho=[0.042 0.04 0.038 0.037];
    a=[0.0345 0.0435];
     b=[14.5   36];
    c=[2650    1250];
     d=[0.03 0.027];
     e=[4.2 0.6];
   f=[0.031 0.11];
    Hmin=[0];
     Hmax=[2695.20];
  ah=[0.038];
    bh=[2.0109];
    ch=[950];
 
    B=10e-7.*[ 49 14 15 15 20 25
        14 45 16 20 18 19
        15 16 39 10 12 15
        15 20 10 40 14 11
        20 18 12 14 35 17
        25 19 15 11 17 39];

%     model1.B0=1e-3*[-0.3908 -0.1279 0.7047 0.0591 0.2161 -0.6635];
%     
%     model1.B00=0.056; 
 
%%%%
Pmin=[10 20 30 40];
    Pmax=[75 125 175 250]; 
    Pc1= [98.8000         0   81.0000  104.8000  215.0000  180.0000  247.0000         0];
    Pc2=[44.0000   0   44.0000   15.9000   40.0000   75.0000  110.2000    .....  
        135.6000  125.8000   32.4000  125.8000  ]; 
    
% % %    Pcmin=[min(Pc1(1:2:end)) min(Pc2(1:2:end))];
% % %      Pcmax=[max(Pc1(1:2:end)) max(Pc2(1:2:end))]; 

     Hmin=[0];
     Hmax=[2695.20];
    P=  [x(1)   x(2)     x(3)    x(4)];%%%4
    Pc=  [x(5)   x(6)];%%%2
    Hcmin1=min(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(1)-1000 Pc(1) Pc(1)+1000],[Pc(1) Pc(1) Pc(1)]));
    Hcmax1=max(polyxpoly([0,104.8,180,0],[98.8,81,215,247],[Pc(1)-1000 Pc(1) Pc(1)+1000],[Pc(1) Pc(1) Pc(1)]));
    Hcmin2=min(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(2)-1000 Pc(2) Pc(2)+1000],[Pc(2) Pc(2) Pc(2)]));
    Hcmax2=max(polyxpoly([0,15.9,75,135.6,32.4,0],[44,44,40,110.2,125.8,125.8],[Pc(2)-1000 Pc(2) Pc(2)+1000],[Pc(2) Pc(2) Pc(2)]));
    Hcmin=[Hcmin1 Hcmin2];
    Hcmax=[Hcmax1 Hcmax2];
    
    nCHP=4;
    for i=1:nCHP/2
        if Hcmin(i)==Hcmax(i)
            Hcmin(i)=0;
            
            
        end
    end
    Hc= Hcmin+(Hcmax-Hcmin) .*[x(7)   x(8)];%%%2
    H=  x(9);%%%1
    
    
    CP=alpha.*P.*P+beta.*P+gamma+abs(lambda.*sin(rho.*(Pmin-P)));
    
    CPTotal=sum(CP);
    CCHP=a.*Pc.*Pc+b.*Pc+c+d.*Hc.*Hc+e.*Hc+f.*Pc.*Hc;
    
    CCHPTotal=sum(CCHP);
    CH=ah.*H.*H+bh.*H+ch;
    
    CHTotal=sum(CH);

    
%    B0=model.B0;
%    B00=model.B00;
    
    PL=[P Pc]*B*[P Pc]';%+[P]*B(1:4,5:6)*[Pc]+[Pc]*B(5:6,5:6)*[Pc];%+B0*P'+B00;
    
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


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
    
    O=out.z;
 %%%%   %%  x =[P Pc Hc H]


end   