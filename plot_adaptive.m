close all;

Lengthtime = length(out.t.time);
zero1 = zeros(Lengthtime,1);

figure(1);
plot(out.t.time(:,1),out.kg.signals.values(:,1),'r',out.t.time(:,1),out.kl.signals.values(:,1),'b','linewidth',1);
xlabel('t');ylabel('kg/kl');
legend('kg','kl');
grid on;

figure(2);
plot(out.t.time(:,1),out.Reference.signals.values(:,1),'k',out.t.time(:,1),out.DSMC.signals.values(:,1),'b',out.t.time(:,1),out.DSMCadaptive.signals.values(:,1),'r','linewidth',1);
xlabel('t');ylabel('Output');
legend('Reference','DSMC','DSMCadaptive');
grid on;

figure(3);
plot(out.t.time(:,1),out.utDSMC.signals.values(:,1),'b',out.t.time(:,1),out.ut.signals.values(:,1),'r','linewidth',1);
xlabel('t');ylabel('Input');
legend('DSMCut','DSMCadaptiveut');
grid on;

figure(4);
plot(out.t.time(:,1),out.Reference.signals.values(:,1)-out.DSMC.signals.values(:,1),'b',out.t.time(:,1),out.Reference.signals.values(:,1)-out.DSMCadaptive.signals.values(:,1),'r','linewidth',1);
xlabel('t');ylabel('Output');
legend('DSMCet','DSMCadaptiveet');
grid on;