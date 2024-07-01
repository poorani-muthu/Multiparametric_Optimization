clear all;
x1=[-1 1 -1 1 -1 1 -1 1 0 0 0 0 0 0 0];
x2=[-1 -1 1 1 0 0 0 0 -1 1 -1 1 0 0 0];
x3=[0 0 0 0 -1 -1 1 1 -1 -1 1 1 0 0 0];
ymc=[35.1 33.4 25.1 28.5 21.7 20.4 38.6 36.3 24.8 20.2 42.8 36.5 30.4 3.1 30.7 ];
yts=[7.7 8.7 10.4 7.8 21.6 18 5.6 6.6 14.7 15.7 4.4 3.2 9.7 7.1 8.2];
yeb=[53.7 56.9 62.4 23.4 48.1 10.3 59.3 57.6 57.1 36.7 86.7 68.3 75 71.8 69.6];
ytpc=[13.0 10.1 22.9 19.9 17.4 19 17.7 12.6 11 23.7 9.6 17.8 16.2 17.1 14.5];

X=[x1' x2' x3'];

modeleqn_mc=regstats(ymc,X,'linear'); 

Bmc=modeleqn_mc.beta;

Ypredmc=modeleqn_mc.yhat;

figure(1)
subplot(2,2,1)
plot(1:15,ymc','r','Linewidth',1.5)
hold on
plot(1:15,Ypredmc,'bo')
hold off
xlabel('Exp run no.')
ylabel('MC')

modeleqn_ts=regstats(yts,X,'quadratic'); 

Bts=modeleqn_ts.beta;

Ypred_ts=modeleqn_ts.yhat;

subplot(2,2,2)
plot(1:15,yts','r','Linewidth',1.5)
hold on
plot(1:15,Ypred_ts,'bo')
hold off
xlabel('Exp run no.')
ylabel('TS')


modeleqn_eb=regstats(yeb,X,'quadratic'); 

Beb=modeleqn_eb.beta;

Ypred_eb=modeleqn_eb.yhat;

subplot(2,2,3)
plot(1:15,yeb','r','Linewidth',1.5)
hold on
plot(1:15,Ypred_eb,'bo')
hold off
xlabel('Exp run no.')
ylabel('EB')


modeleqn_tpc=regstats(ytpc,X,'quadratic'); 

Btpc=modeleqn_tpc.beta;

Ypred_tpc=modeleqn_tpc.yhat;

subplot(2,2,4)
plot(1:15,ytpc','r','Linewidth',1.5)
hold on
plot(1:15,Ypred_tpc,'bo')
hold off
xlabel('Exp run no.')
ylabel('TPC')

figure(2)
subplot(2,2,1)
x1_=linspace(min(x1),max(x1),50);
x2_=linspace(min(x2),max(x2),50);
[X1,X2]=meshgrid(x1_,x2_);
X3=mean(x3);
Z=Bmc(1)+Bmc(2)*X1+Bmc(3)*X2+Bmc(4)*X3;
figure(2)
surf(X1,X2,Z);
xlabel('x1')
ylabel('x2')
zlabel('Ymc')

subplot(2,2,2)
x1_=linspace(min(x1),max(x1),50);
x2_=linspace(min(x2),max(x2),50);
[X1,X2]=meshgrid(x1_,x2_);
X3=mean(x3);
Z=Bts(1)+Bts(2)*X1+Bts(3)*X2+Bts(4)*X3+Bts(5)*X1*X2+Bts(6)*X1*X3+Bts(7)*X2*X3+Bts(8)*X1.*X1+Bts(9)*X2*X2+Bts(10)*X3*X3;
figure(2)
surf(X1,X2,Z);
xlabel('x1')
ylabel('x2')
zlabel('Yts')


subplot(2,2,3)
x1_=linspace(min(x1),max(x1),50);
x2_=linspace(min(x2),max(x2),50);
[X1,X2]=meshgrid(x1_,x2_);
X=mean(x3);
Z=Beb(1)+Beb(2)*X1+Beb(3)*X2+Beb(4)*X3+Beb(5)*X1*X2+Beb(6)*X1*X3+Beb(7)*X2*X3+Beb(8)*X1.*X1+Beb(9)*X2*X2+Beb(10)*X3*X3;
figure(2)
surf(X1,X2,Z);
xlabel('x1')
ylabel('x2')
zlabel('Yeb')

subplot(2,2,4)
x1_=linspace(min(x1),max(x1),50);
x2_=linspace(min(x2),max(x2),50);
[X1,X2]=meshgrid(x1_,x2_);
X3=mean(x3);
Z=Btpc(1)+Btpc(2)*X1+Btpc(3)*X2+Btpc(4)*X3+Btpc(5)*X1*X2+Btpc(6)*X1*X3+Btpc(7)*X2*X3+Btpc(8)*X1.*X1+Btpc(9)*X2*X2+Btpc(10)*X3*X3;
figure(2)
surf(X1,X2,Z);
xlabel('x1')
ylabel('x2')
zlabel('Ytpc')