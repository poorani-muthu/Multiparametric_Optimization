A=[1,0,0;0,1,0;0,0,1;-1,0,0;0,-1,0;0 0,-1];
b=[1;1;1;1;1;1];
xint=[-1,-1,-1];

x1low=-1;
x1high=1;
x2low=-1;
x2high=1;
x3low=-1;
x3high=1;

ymcs=20.2;
ymch=42.8;

ytss=3.2;
ytsh=21.6; 

yebs=10.3; 
yebh=86.7; 

ytpcs=9.6; 
ytpch=23.7; 

% yts=8.333-0.525*x(1)+0.2*x(2)-6.275*x(3)-0.9*x(1)*x(2)+1.15*x(1)*x(3)-0.55*x(2)*x(3)+1.8833*x(1).*x(1)-15.667*x(2)*x(2)+2.7333*x(3)*x(3);
% yeb=72.133-9.4125*x(1)-7.95*x(2)+14.9625*x(3)-10.5500*x(1)*x(2)+9.025*x(1)*x(3)+0.5*x(2)*x(3)-20.7042*x(1).*x(1)-2.3292*x(2)*x(2)-7.6042*x(3)*x(3);
% ytpc=15.933-1.1750*x(1)+5.0750*x(2)-1.675*x(3)-0.0250*x(1)*x(2)-1.675*x(1)*x(3)-1.1250*x(2)*x(3)+0.8458*x(1).*x(1)-0.3042*x(2)*x(2)-0.1042*x(3)*x(3);

fun = @(x) PSO(x,ymcs,ymch,ytss,ytsh,yebs,yebh,ytpcs,ytpch);
xopt=fmincon(fun,xint,A,b)

function Y= PSO(x,ymcs,ymch,ytss,ytsh,yebs,yebh,ytpcs,ytpch)
if (28.5066-0.2375*x(1)-3.2250*x(2)+8.3875*x(3))>ymch
    ymccap=0;
elseif (28.5066-0.2375*x(1)-3.2250*x(2)+8.3875*x(3))<ymcs
    ymccap = 1;
else
    ymccap=(ymch-(28.5066-0.2375*x(1)-3.2250*x(2)+8.3875*x(3))/(ymch-ymcs));
end

if (8.333-0.525*x(1)+0.2*x(2)-6.275*x(3)-0.9*x(1)*x(2)+1.15*x(1)*x(3)-0.55*x(2)*x(3)+1.8833*x(1)*x(1)-15.667*x(2)*x(2)+2.7333*x(3)*x(3))<ytss
    ytscap=0;
elseif (8.333-0.525*x(1)+0.2*x(2)-6.275*x(3)-0.9*x(1)*x(2)+1.15*x(1)*x(3)-0.55*x(2)*x(3)+1.8833*x(1)*x(1)-15.667*x(2)*x(2)+2.7333*x(3)*x(3))>ytsh
    ytscap=0;
else 
    ytscap=(((8.333-0.525*x(1)+0.2*x(2)-6.275*x(3)-0.9*x(1)*x(2)+1.15*x(1)*x(3)-0.55*x(2)*x(3)+1.8833*x(1)*x(1)-15.667*x(2)*x(2)+2.7333*x(3)*x(3))-ytss)/(ytsh-ytss));
end

if (72.133-9.4125*x(1)-7.95*x(2)+14.9625*x(3)-10.5500*x(1)*x(2)+9.025*x(1)*x(3)+0.5*x(2)*x(3)-20.7042*x(1)*x(1)-2.3292*x(2)*x(2)-7.6042*x(3)*x(3))>yebh
    yebcap=0;
elseif (72.133-9.4125*x(1)-7.95*x(2)+14.9625*x(3)-10.5500*x(1)*x(2)+9.025*x(1)*x(3)+0.5*x(2)*x(3)-20.7042*x(1)*x(1)-2.3292*x(2)*x(2)-7.6042*x(3)*x(3))<yebs
    yebcap =1;
else
    yebcap=(yebh-(72.133-9.4125*x(1)-7.95*x(2)+14.9625*x(3)-10.5500*x(1)*x(2)+9.025*x(1)*x(3)+0.5*x(2)*x(3)-20.7042*x(1)*x(1)-2.3292*x(2)*x(2)-7.6042*x(3)*x(3))/(yebh-yebs));
end
 
if (15.933-1.1750*x(1)+5.0750*x(2)-1.675*x(3)-0.0250*x(1)*x(2)-1.675*x(1)*x(3)-1.1250*x(2)*x(3)+0.8458*x(1)*x(1)-0.3042*x(2)*x(2)-0.1042*x(3)*x(3))<ytpcs
    ytpccap=0;
elseif (15.933-1.1750*x(1)+5.0750*x(2)-1.675*x(3)-0.0250*x(1)*x(2)-1.675*x(1)*x(3)-1.1250*x(2)*x(3)+0.8458*x(1)*x(1)-0.3042*x(2)*x(2)-0.1042*x(3)*x(3))>ytpch
        ytpccap=1;
else 
    ytpccap=(15.933-1.1750*x(1)+5.0750*x(2)-1.675*x(3)-0.0250*x(1)*x(2)-1.675*x(1)*x(3)-1.1250*x(2)*x(3)+0.8458*x(1)*x(1)-0.3042*x(2)*x(2)-0.1042*x(3)*x(3)-ytpcs)/(ytpch-ytpcs);
end
ymccap
ytscap
yebcap
ytpccap
DS=((ymccap^1)*(ytscap^1)*(yebcap^1)*(ytpccap^1))^(1/(4))
Y=1/(1+DS)
    end