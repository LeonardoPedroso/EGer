%% Load data
dataTh = load('./DATA/5_1_2_DAC_R_2R.mat');
dataR1 = load('./DATA/DAC_4R_R1_exp.mat');
dataR2 = load('./DATA/DAC_4R_R4_exp.mat');

%% PLot exp vs teor
output = false;

if output
figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs((0:(1/100e3):2^4/(100e3)),[dataTh.tbDAC5(:,5);0],'LineWidth',3);
plot(dataR1.tExp,dataR1.Vo,'LineWidth',3);
legend({'Teórico','Experimental'},'Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('$t$ (s)','Interpreter','latex');
xlim([0 1.6e-4]);
saveas(gcf,'5_1_2_DAC_R1.png');
hold off;


figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs((0:(1/100e3):2^4/(100e3)),[dataTh.tbDAC5(:,8);0],'LineWidth',3);
plot(dataR2.tExp,dataR2.Vo,'LineWidth',3);
legend({'Teórico','Experimental'},'Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('$t$ (s)','Interpreter','latex');
xlim([0 1.6e-4]);
saveas(gcf,'5_1_2_DAC_R4.png');
hold off;
end

%% table teor vs exp patamares

output = false;

if output
tbErrorR1 = zeros(2^4,5);
for i = 1:2^4
   tbErrorR1(i,1) = i-1; % Q
   tbErrorR1(i,2) = dataTh.tbDAC5(i,5); % T
   tbErrorR1(i,3) = dataR1.Vlevels(i); % E
   tbErrorR1(i,4) = tbErrorR1(i,3)-tbErrorR1(i,2);% Error abs
   tbErrorR1(i,5) = 100*tbErrorR1(i,4)/tbErrorR1(i,2); % Error rel
end

tbErrorR4 = zeros(2^4,5);
for i = 1:2^4
   tbErrorR4(i,1) = i-1; % Q
   tbErrorR4(i,2) = dataTh.tbDAC5(i,8); % T
   tbErrorR4(i,3) = dataR2.Vlevels(i); % E
   tbErrorR4(i,4) = tbErrorR4(i,3)-tbErrorR4(i,2);% Error abs
   tbErrorR4(i,5) = 100*tbErrorR4(i,4)/tbErrorR4(i,2); % Error rel
end

save('5_1_2_tbComparison.mat','tbErrorR1','tbErrorR4');
tbErrorR1
tbErrorR4

end


%% table dif patamaresd

output = false;


if output
tbPatamares = zeros(2^4-1,7);
for i = 1:2^4-1
   tbPatamares(i,1) = (i-1); % Q->Q+1
   tbPatamares(i,2) = (dataTh.tbDAC5(i+1,5)-dataTh.tbDAC5(i,5));
   tbPatamares(i,3) = dataR1.Vlevels(i+1)-dataR1.Vlevels(i);
   tbPatamares(i,4) = 100*(tbPatamares(i,3)-tbPatamares(i,2))/tbPatamares(i,2);
   tbPatamares(i,5) = (dataTh.tbDAC5(i+1,8)-dataTh.tbDAC5(i,8));
   tbPatamares(i,6) = dataR2.Vlevels(i+1)-dataR2.Vlevels(i);
   tbPatamares(i,7) = 100*(tbPatamares(i,6)-tbPatamares(i,5))/tbPatamares(i,5);
end
save('5_1_2_tbPatamares.mat','tbPatamares');
tbPatamares
end

%% Cte Aj

dataTh = load('./DATA/cteAj_5_1_2_DAC_R_2R.mat');

%% PLot exp vs teor
output = true;

if output
figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs((0:(1/100e3):2^4/(100e3)),[dataTh.tbDAC5(:,5);0],'LineWidth',3);
plot(dataR1.tExp,dataR1.Vo,'LineWidth',3);
legend({'Teórico','Experimental'},'Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('$t$ (s)','Interpreter','latex');
xlim([0 1.6e-4]);
saveas(gcf,'cteAj_5_1_2_DAC_R1.png');
hold off;


figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs((0:(1/100e3):2^4/(100e3)),[dataTh.tbDAC5(:,8);0],'LineWidth',3);
plot(dataR2.tExp,dataR2.Vo,'LineWidth',3);
legend({'Teórico','Experimental'},'Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('$t$ (s)','Interpreter','latex');
xlim([0 1.6e-4]);
saveas(gcf,'cteAj_5_1_2_DAC_R4.png');
hold off;
end

%% table teor vs exp patamares

output = true;

if output
tbErrorR1 = zeros(2^4,5);
for i = 1:2^4
   tbErrorR1(i,1) = i-1; % Q
   tbErrorR1(i,2) = dataTh.tbDAC5(i,5); % T
   tbErrorR1(i,3) = dataR1.Vlevels(i); % E
   tbErrorR1(i,4) = tbErrorR1(i,3)-tbErrorR1(i,2);% Error abs
   tbErrorR1(i,5) = 100*tbErrorR1(i,4)/tbErrorR1(i,2); % Error rel
end

tbErrorR4 = zeros(2^4,5);
for i = 1:2^4
   tbErrorR4(i,1) = i-1; % Q
   tbErrorR4(i,2) = dataTh.tbDAC5(i,8); % T
   tbErrorR4(i,3) = dataR2.Vlevels(i); % E
   tbErrorR4(i,4) = tbErrorR4(i,3)-tbErrorR4(i,2);% Error abs
   tbErrorR4(i,5) = 100*tbErrorR4(i,4)/tbErrorR4(i,2); % Error rel
end

save('cteAj_5_1_2_tbComparison.mat','tbErrorR1','tbErrorR4');
tbErrorR1
tbErrorR4

latex(vpa(sym(tbErrorR1),4))
latex(vpa(sym(tbErrorR4),4))

end
