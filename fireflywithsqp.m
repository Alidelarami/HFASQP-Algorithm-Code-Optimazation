clc
clear all
close all
format shortG
% Files 'myfun' and 'fitness' are not executable directly.% To run the algorithm, execute 'fireflywithsqp.m' instead.
%% Insert Data
data=[];
%%%% For running different test systems, please read the captions carefully.
%%%% Delete lines 12 to 17 and then apply the replacement.
%%%% The parameters that need to be changed or replaced are located inside the test system file.
%%%%%%%%%%%%%%%%%%% **Parameters Definiterion** %%%%%%%%%%%%%%%%% 
nvar=9;             % Number of  Variables %% Test System 2 

LP=[10      20    30     40            81          40       0   0           0   ];
UB=[75   125    175    250         247        125.8       1   1          2695.20];%%%% 
 

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
VarMax=UB;        VarMin=LP;      
 SQP=1;   %%%SQP =-1 
 %%%%if SQP = 1 the running HFASQP    else running alone FA 
 maxiter=300;          % Maximum Number of iterations
npop=50;              % Number of Fireflies 50
 
%% "maxiter", "npop", and "nvar" are consistent with section 4 of the simulation.
L=1;
gamma=1./sqrt(L);            % Light Absorption Coefficient
beta0=2;                     % Attraction Coefficient Base Value
alpha=0.02;                   % Mutation Coefficient
alpha_RF=0.95;                %Radius Reduction Factor 
data.lb=LP;
data.ub=UB;
%% Create Random Pop
tic
emp.x=[];
emp.fit=[];
emp.info=[];
pop=repmat(emp,npop,1);
for i=1:npop
   pop(i).x=unifrnd(LP,UB);
   [pop(i),O]=fitness(pop(i),data);
end
% Best Solution
[~,ind]=min([pop.fit]);
gpop=pop(ind);
%% Main Loop               best new
  
for iter=1:maxiter 
    newpop=pop;
     k=npop;
       for i=1:npop
        for j=1:npop
            if pop(j).fit<=pop(i).fit;
                k=k+1;         
                rij=norm(pop(i).x-pop(j).x,2);
                beta=beta0*exp(-gamma*rij^2);
                E=alpha*(unifrnd(-1,1,1,nvar).*(UB-LP));
                newpop(i).x=pop(i).x...
                            +beta*(pop(j).x-pop(i).x)...
                            +E;
                [newpop(i),O]=fitness(newpop(i),data);
                newpop(k)=newpop(i);
            end
        end
    end
    
    % Merge
    [pop]=[pop;newpop;gpop];
    
    % Sort and Select
     [~, ind]=sort([pop.fit]);
    pop=pop(ind);
    pop=pop(1:npop);
     %%% Local search
    Tmax=maxiter;
    T=iter;
      
   
        if (((SQP*rand*100)  >  T))
        gpop=pop(1); %%Best Sol%1
       disp(' SQP is useage '); 
        X_Best=gpop.x ;
        Fitness_Best=gpop.fit;
   x0=X_Best;         
  lb1= VarMin;
 ub1=  VarMax;
  Aeq = [];
  beq = [];
  A=[];
  b=[];
  options = optimoptions('fmincon'); %,'UseParallel', true);
  [x,fval] = fmincon(@myfun,x0,A,b,Aeq,beq,lb1,ub1,[],options) ; % Call optimizer
    X_Best_Temp=   x ;
  Leader_score=    fval ;     
        if(Leader_score<Fitness_Best);%%Replace Best Sol
            gpop.x=X_Best_Temp;
            gpop.fit=Leader_score;
            pop(1)=gpop;%1
        end
    end
    %%%End local search
    % Select Best Sol 
    gpop=pop(1);%1     
    BEST(iter)=gpop.fit; 
% % % %     MEAN(iter)=mean([pop.fit]);   
    disp(['iter ' num2str(iter) ' Best= ' num2str(BEST(iter))  'x='  num2str(gpop.x)])
    % Reduction Mutation Coefficient
    alpha=alpha*alpha_RF;
    
end

%% Results

disp(' ');
disp([ ' BEST solution = '  num2str(gpop.x)]);
disp([ ' BEST fitness = '  num2str(gpop.fit)]);
disp([ ' Time = '  num2str(toc)]);

figure()
plot(BEST,'b','LineWidth',2);
hold on;
% % plot(MEAN,'b','LineWidth',2);
xlabel(' Iteration ');
ylabel(' fitness');
legend( 'BEST');
title('HFASQP');
