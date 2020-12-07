%% LAB 3 -Filtro Adaptativo

%% 5_1
clear;
Tsim = 100;
Ts = 1; %(s)
scramblerLocal = [3 5];
scramblerRemote = [5 7];
sim("lab3_5_1",Tsim*Ts);
save("./data/5_1/simout_5_1.mat",'xk_local','xk_remote');

figure('units','normalized','outerposition',[0 0 1 1]);
plot(xk_local.Time,xk_local.Data,'LineWidth',3);
hold on;
ylabel('$x_k$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
legend('Local');
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_1/xk_local.png");
hold off;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(xk_remote.Time,xk_remote.Data,'LineWidth',3);
hold on;
ylabel('$x_k$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
legend('Remoto');
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_1/xk_remote.png");
hold off;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(xk_local.Time,0*xk_local.Data,'LineWidth',3);
hold on;
ylabel('$x_k$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
legend('Local/Remoto');
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_1/xk_local_0.png");
hold off;

close all;

%% 5_3
clear;
Tsim = 12;
Ts = 1; %(s)
coefHybrid = [0 0.2 1 0.3 -0.4 -0.1 0.1 -0.05 -0.02 -0.01];
sim("lab3_5_3",Tsim*Ts);
save("./data/5_3/simout_5_3.mat",'hybrid');

figure('units','normalized','outerposition',[0 0 1 1]);
plot(hybrid.Time,hybrid.Data,'LineWidth',3);
hold on;
ylabel('$x_k$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
legend('Híbrido');
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_3/hybrid.png");
hold off;
close all;

%% 5_5
clear;
Ts = 1; %(s)
Tsim = 1500; % (samples)
scramblerLocal = [3 5];
scramblerRemote = [5 7];
coefHybrid = [0 0.2 1 0.3 -0.4 -0.1 0.1 -0.05 -0.02 -0.01];
c_ik_init = [0 0 0 0 0];
mu = 0.02;
alpha = 0.9;

sim("lab3_5_5",Tsim*Ts);
save("./data/5_5/simout_5_5.mat",'c_ik','ERLE');

figure('units','normalized','outerposition',[0 0 1 1]);
plot(ERLE.Time,ERLE.Data,'LineWidth',3);
hold on;
ylabel('$ERLE$ (dB)','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_5/ERLE.png");
hold off;
close all;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(c_ik.Time,c_ik.Data,'LineWidth',3);
hold on;
ylabel('$c_i$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
legend({'$c_0$','$c_1$','$c_2$','$c_3$','$c_4$'},...
    'Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_5/c_ik.png");
hold off;
close all;

%%  5_6_1
clear;
Ts = 1; %(s)
Tsim = 600; % (samples)
scramblerLocal = [3 5];
scramblerRemote = [5 7];
coefHybrid = [0 0.2 1 0.3 -0.4 -0.1 0.1 -0.05 -0.02 -0.01];
c_ik_init = zeros(26,1);
mu = 5e-2;
alpha = 0.99;
G = 0;

sim("lab3_5_6",Tsim*Ts);
save("./data/5_6/simout_5_6_1_mu5e-2.mat",'c_ik','ERLE');

figure('units','normalized','outerposition',[0 0 1 1]);
plot(ERLE.Time,ERLE.Data,'LineWidth',3);
hold on;
ylabel('$ERLE$ (dB)','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/ERLE_5_6_1_mu5e-2.png");
hold off;
close all;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(c_ik.Time,c_ik.Data,'LineWidth',3);
hold on;
ylabel('$c_i$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
%legend({'$c_0$','$c_1$','$c_2$','$c_3$','$c_4$'},...
%     'Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/c_ik_5_6_1_mu5e-2.png");
hold off;
close all;

mu = 5e-3;
Tsim = 2e4; % (samples)
sim("lab3_5_6",Tsim*Ts);
save("./data/5_6/simout_5_6_1_mu5e-3.mat",'c_ik','ERLE');

figure('units','normalized','outerposition',[0 0 1 1]);
plot(ERLE.Time,ERLE.Data,'LineWidth',3);
hold on;
ylabel('$ERLE$ (dB)','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/ERLE_5_6_1_mu5e-3.png");
hold off;
close all;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(c_ik.Time(1:round(length(c_ik.Time)/10)),...
    c_ik.Data(1:round(length(c_ik.Time)/10),1:10),'LineWidth',3);
hold on;
ylabel('$c_i$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
lg = cell(10,1);
for i = 1:10
    lg{i,1} = sprintf("$c_{%02d}$",i-1);
end
legend(lg,'Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/c_ik_5_6_1_mu5e-3.png");
hold off;
figure('units','normalized','outerposition',[0 0 1 1]);
plot(c_ik.Time(1:round(length(c_ik.Time)/5)),...
    c_ik.Data(1:round(length(c_ik.Time)/5),11:26),'LineWidth',3);
hold on;
ylabel('$c_i$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
lg = cell(16,1);
for i = 1:16
    lg{i,1} = sprintf("$c_{%02d}$",i+9);
end
legend(lg,'Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/c_ik_5_6_1_mu5e-3_0.png");
hold off;
close all;



%%  5_6_1 (mu max)
clear;
Ts = 1; %(s)
Tsim = 8e4; % (samples)
scramblerLocal = [3 5];
scramblerRemote = [5 7];
coefHybrid = [0 0.2 1 0.3 -0.4 -0.1 0.1 -0.05 -0.02 -0.01];
c_ik_init = zeros(26,1);
alpha = 0.99;
G = 0;

mu_try = [5e-3 6e-3 7e-3 8e-3 9e-3 1e-2 2e-2 3e-2 3.8e-2 3.9e-2 4e-2 5e-2];
c_ik_try = cell(length(mu_try),1);
ERLE_try = cell(length(mu_try),1);
for i = 1:length(mu_try)
    mu = mu_try(i);
    sim("lab3_5_6",Tsim*Ts);
    c_ik_try{i,1} = c_ik;
    ERLE_try{i,1} = ERLE;
end
save("./data/5_6/simout_5_6_1_mu_try.mat",'c_ik_try','ERLE_try');
%%
figure('units','normalized','outerposition',[0 0 1 1]);
for i = 1:length(mu_try)
    plot(ERLE_try{i,1}.Time(1:round(length(ERLE_try{i,1}.Time)/4)),...
        ERLE_try{i,1}.Data(1:round(length(ERLE_try{i,1}.Time)/4),:),...
        'LineWidth',3);
    if i == 1
       hold on; 
    end
end
lg = cell(length(mu_try),1);
for i = 1:length(mu_try)
    lg{i,1} = sprintf("$u = %g$",mu_try(i));
end
legend(lg,'Interpreter','latex','Location','southeast');
ylim([-50 350]);
ylabel('$ERLE$ (dB)','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/ERLE_5_6_1_mu_try_zoom.png");
hold off;


figure('units','normalized','outerposition',[0 0 1 1]);
for i = 1:length(mu_try)
    plot(ERLE_try{i,1}.Time,ERLE_try{i,1}.Data,'LineWidth',3);
    if i == 1
       hold on; 
    end
end
lg = cell(length(mu_try),1);
for i = 1:length(mu_try)
    lg{i,1} = sprintf("$u = %g$",mu_try(i));
end
legend(lg,'Interpreter','latex','Location','southeast');
ylim([-50 400]);
ylabel('$ERLE$ (dB)','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/ERLE_5_6_1_mu_try.png");
hold off;


k = 6;
figure('units','normalized','outerposition',[0 0 1 1]);
plot(ERLE_try{k,1}.Time(1:round(length(ERLE_try{k,1}.Time)/4)),...
        ERLE_try{k,1}.Data(1:round(length(ERLE_try{k,1}.Time)/4),:),...
        'LineWidth',3);
legend({sprintf("$u = %g$",mu_try(k))},...
    'Interpreter','latex','Location','southeast');
ylim([-50 350]);
ylabel('$ERLE$ (dB)','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/ERLE_5_6_1_mu_opt.png");
hold off;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(c_ik_try{k,1}.Time(1:round(length(c_ik_try{k,1}.Time)/40)),...
    c_ik_try{k,1}.Data(1:round(length(c_ik_try{k,1}.Time)/40),1:10),'LineWidth',3);
hold on;
ylabel('$c_i$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
lg = cell(10,1);
for i = 1:10
    lg{i,1} = sprintf("$c_{%02d}$",i-1);
end
legend(lg,'Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/c_ik_5_6_1_mu_opt.png");
hold off;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(c_ik_try{k,1}.Time(1:round(length(c_ik_try{k,1}.Time)/40)),...
    c_ik_try{k,1}.Data(1:round(length(c_ik_try{k,1}.Time)/40),11:26),'LineWidth',3);
hold on;
ylabel('$c_i$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
lg = cell(16,1);
for i = 1:16
    lg{i,1} = sprintf("$c_{%02d}$",i+9);
end
legend(lg,'Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/c_ik_5_6_1_mu_opt_0.png");
hold off;
close all;

% Perguntas:
% 1. Porque é que o ERLE fica maior?
% 2. Escolhemos as soluções que dão ERLE mais acima e não têm regime 
% estacionário? - a rapidez é igual


%% 5_6_2
clear;
Ts = 1; %(s)
Tsim = 1e4; % (samples)
scramblerLocal = [3 5];
scramblerRemote = [5 7];
coefHybrid = [0 0.2 1 0.3 -0.4 -0.1 0.1 -0.05 -0.02 -0.01];
c_ik_init = zeros(26,1);
alpha = 0.99;
G = 0.1;

mu_try = [5e-4 1e-3 2e-3 4e-3 5e-3 6e-3 7e-3 8e-3 9e-3 1e-2 2e-2 3e-2 3.8e-2 3.9e-2 4e-2 5e-2];
c_ik_try = cell(length(mu_try),1);
ERLE_try = cell(length(mu_try),1);
for i = 1:length(mu_try)
    mu = mu_try(i);
    sim("lab3_5_6",Tsim*Ts);
    c_ik_try{i,1} = c_ik;
    ERLE_try{i,1} = ERLE;
end
save("./data/5_6/simout_5_6_2_mu_try.mat",'c_ik_try','ERLE_try');
%%
figure('units','normalized','outerposition',[0 0 1 1]);
for i = 1:length(mu_try)
    plot(ERLE_try{i,1}.Time,ERLE_try{i,1}.Data,'LineWidth',3);
    if i == 1
       hold on; 
    end
end
lg = cell(length(mu_try),1);
for i = 1:length(mu_try)
    lg{i,1} = sprintf("$u = %g$",mu_try(i));
end
legend(lg,'Interpreter','latex','Location','southeast');
ylim([-10 30]);
ylabel('$ERLE$ (dB)','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/ERLE_5_6_2_mu_try.png");
hold off;
close all;

%opt
k = 2;
figure('units','normalized','outerposition',[0 0 1 1]);
plot(ERLE_try{k,1}.Time(1:round(length(ERLE_try{k,1}.Time)/2)),...
        ERLE_try{k,1}.Data(1:round(length(ERLE_try{k,1}.Time)/2),:),...
        'LineWidth',3);
legend({sprintf("$u = %g$",mu_try(k))},...
    'Interpreter','latex','Location','southeast');
ylabel('$ERLE$ (dB)','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/ERLE_5_6_2_mu_opt.png");
hold off

figure('units','normalized','outerposition',[0 0 1 1]);
plot(c_ik_try{k,1}.Time(1:round(length(c_ik_try{k,1}.Time)/3)),...
    c_ik_try{k,1}.Data(1:round(length(c_ik_try{k,1}.Time)/3),1:10),'LineWidth',3);
hold on;
ylabel('$c_i$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
lg = cell(10,1);
for i = 1:10
    lg{i,1} = sprintf("$c_{%02d}$",i-1);
end
legend(lg,'Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/c_ik_5_6_2_mu_opt.png");
hold off;

figure('units','normalized','outerposition',[0 0 1 1]);
plot(c_ik_try{k,1}.Time(1:round(length(c_ik_try{k,1}.Time))),...
    c_ik_try{k,1}.Data(1:round(length(c_ik_try{k,1}.Time)),11:26),'LineWidth',3);
hold on;
ylabel('$c_i$','Interpreter','latex');
xlabel('$k$','Interpreter','latex');
lg = cell(16,1);
for i = 1:16
    lg{i,1} = sprintf("$c_{%02d}$",i+9);
end
legend(lg,'Interpreter','latex');
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on'; 
saveas(gcf,"./data/5_6/c_ik_5_6_2_mu_opt_0.png");
hold off;
close all;



