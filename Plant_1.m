function[sys,x0,str,ts]=spacemodel(t,x,u,flag)
switch flag,
    case 0,
        [sys,x0,str,ts]=mdlInitializeSizes;
    case 1,
        sys=mdlDerivatives(t,x,u);
    case 3,
        sys=mdlOutputs(t,x,u);
    case {2,4,9}
        sys=[];
    otherwise
        error(['Unhandled flag=',num2str(flag)]);
end
function[sys,x0,str,ts]=mdlInitializeSizes

sizes=simsizes;
sizes.NumContStates=2;
sizes.NumDiscStates=0;
sizes.NumOutputs=4;
sizes.NumInputs=1;
sizes.DirFeedthrough=1;
sizes.NumSampleTimes=1;
sys=simsizes(sizes);
x0=[0 0];
str=[];
ts=[0 0];

function sys=mdlDerivatives(t,x,u)
ut=u(1);

sys(1)=x(2);
sys(2)=-0.6*x(2)-x(1)*x(2)+2*ut+sin(ut)+ut^3-ut*x(2);


function sys=mdlOutputs(t,x,u)
ut=u(1);

sys(1)=x(1)+1;
sys(2)=x(1);
sys(3)=x(2);
sys(4)=1;