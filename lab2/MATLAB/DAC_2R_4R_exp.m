%% Load data
dataTh = load('./DATA/4_3_2_DAC_R_2R.mat');
data2R = load('./DATA/4_3_2_DAC_2R_exp.mat');
data4R = load('./DATA/4_3_2_DAC_4R_exp.mat');

%% PLot exp vs teor
output = false;

if output
figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs((0:(1/100e3):2^4/(100e3)),[dataTh.tbDAC4(:,5);0],'LineWidth',3);
plot(data2R.tExp,data2R.Vo,'LineWidth',3);
legend({'Teórico','Experimental'},'Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('$t$ (s)','Interpreter','latex');
xlim([0 1.6e-4]);
saveas(gcf,'4_3_2_DAC_2R.png');
hold off;


figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs((0:(1/100e3):2^4/(100e3)),[dataTh.tbDAC4(:,6);0],'LineWidth',3);
plot(data4R.tExp,data4R.Vo,'LineWidth',3);
legend({'Teórico','Experimental'},'Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('$t$ (s)','Interpreter','latex');
xlim([0 1.6e-4]);
saveas(gcf,'4_3_2_DAC_4R.png');
hold off;
end

%% table teor vs exp patamares

output = false;

if output
tbError2R = zeros(2^4,5);
for i = 1:2^4
   tbError2R(i,1) = i-1; % Q
   tbError2R(i,2) = dataTh.tbDAC4(i,5); % T
   tbError2R(i,3) = data2R.Vlevels(i); % E
   tbError2R(i,4) = tbError2R(i,3)-tbError2R(i,2);% Error abs
   tbError2R(i,5) = 100*tbError2R(i,4)/tbError2R(i,2); % Error rel
end

tbError4R = zeros(2^4,6);
for i = 1:2^4
   tbError4R(i,1) = i-1; % Q
   tbError4R(i,2) = dataTh.tbDAC4(i,6); % T
   tbError4R(i,3) = data4R.Vlevels(i); % E
   tbError4R(i,4) = data4R.Vlevels(i)/data2R.Vlevels(i); % E
   tbError4R(i,5) = tbError4R(i,3)-tbError4R(i,2);% Error abs
   tbError4R(i,6) = 100*tbError4R(i,5)/tbError4R(i,2); % Error rel
end

save('tbComparison.mat','tbError2R','tbError2R');
tbError2R
tbError4R

end


%% table dif patamaresd

output = false;

patamar2R = (dataTh.tbDAC4(2,5)-dataTh.tbDAC4(1,5));
patamar4R = (dataTh.tbDAC4(2,6)-dataTh.tbDAC4(1,6));

if output
tbPatamares = zeros(2^4-1,5);
for i = 1:2^4-1
   tbPatamares(i,1) = (i-1); % Q->Q+1
   tbPatamares(i,2) = data2R.Vlevels(i+1)-data2R.Vlevels(i);
   tbPatamares(i,3) = 100*(tbPatamares(i,2)-patamar2R)/patamar2R;
   tbPatamares(i,4) = data4R.Vlevels(i+1)-data4R.Vlevels(i);
   tbPatamares(i,5) = 100*(tbPatamares(i,4)-patamar4R)/patamar4R;
end
save('tbPatamares.mat','tbPatamares');
tbPatamares
end

%% Find error source

output = false;

if output
tbError2R = zeros(2^4,4);
for i = 1:2^4
   tbError2R(i,1) = i-1; % Q
   tbError2R(i,2) = dataTh.tbDAC4(i,5); % T
   tbError2R(i,3) = data2R.Vlevels(i); % E
   tbError2R(i,4) = tbError2R(i,3)/tbError2R(i,2);% Error abs
  
end

tbError4R = zeros(2^4,4);
for i = 1:2^4
   tbError4R(i,1) = i-1; % Q
   tbError4R(i,2) = dataTh.tbDAC4(i,6); % T
   tbError4R(i,3) = data4R.Vlevels(i); % E
   tbError4R(i,4) = tbError4R(i,3)/tbError4R(i,2);% Error abs
end


tbError2R
tbError4R

k2R = mean(tbError2R(1:8,4))
k4R = mean(tbError4R(1:8,4))

save('tbErrorSource.mat','tbError2R','tbError4R','k2R','k4R');
end





%% Cte Aj
ghjk
dataTh = load('./DATA/cteAj_4_3_2_DAC_R_2R.mat');


% PLot exp vs teor
output = true;

if output
figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs((0:(1/100e3):2^4/(100e3)),[dataTh.tbDAC4(:,5);0],'LineWidth',3);
plot(data2R.tExp,data2R.Vo,'LineWidth',3);
legend({'Teórico ajustado','Experimental'},'Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('$t$ (s)','Interpreter','latex');
xlim([0 1.6e-4]);
saveas(gcf,'cteAj_4_3_2_DAC_2R.png');
hold off;


figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs((0:(1/100e3):2^4/(100e3)),[dataTh.tbDAC4(:,6);0],'LineWidth',3);
plot(data4R.tExp,data4R.Vo,'LineWidth',3);
legend({'Teórico ajustado','Experimental'},'Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('$t$ (s)','Interpreter','latex');
xlim([0 1.6e-4]);
saveas(gcf,'cteAj_4_3_2_DAC_4R.png');
hold off;
end

sdfghjk

% table teor vs exp patamares

output = false;

if output
tbError2R = zeros(2^4,5);
for i = 1:2^4
   tbError2R(i,1) = i-1; % Q
   tbError2R(i,2) = dataTh.tbDAC4(i,5); % T
   tbError2R(i,3) = data2R.Vlevels(i); % E
   tbError2R(i,4) = tbError2R(i,3)-tbError2R(i,2);% Error abs
   tbError2R(i,5) = 100*tbError2R(i,4)/tbError2R(i,2); % Error rel
end

tbError4R = zeros(2^4,6);
for i = 1:2^4
   tbError4R(i,1) = i-1; % Q
   tbError4R(i,2) = dataTh.tbDAC4(i,6); % T
   tbError4R(i,3) = data4R.Vlevels(i); % E
   tbError4R(i,4) = data4R.Vlevels(i)/data2R.Vlevels(i); % E
   tbError4R(i,5) = tbError4R(i,3)-tbError4R(i,2);% Error abs
   tbError4R(i,6) = 100*tbError4R(i,5)/tbError4R(i,2); % Error rel
end

save('tbComparison.mat','tbError2R','tbError2R');
tbError2R
tbError4R

end


% table dif patamaresd

output = false;

patamar2R = (dataTh.tbDAC4(2,5)-dataTh.tbDAC4(1,5));
patamar4R = (dataTh.tbDAC4(2,6)-dataTh.tbDAC4(1,6));

if output
tbPatamares = zeros(2^4-1,5);
for i = 1:2^4-1
   tbPatamares(i,1) = (i-1); % Q->Q+1
   tbPatamares(i,2) = data2R.Vlevels(i+1)-data2R.Vlevels(i);
   tbPatamares(i,3) = 100*(tbPatamares(i,2)-patamar2R)/patamar2R;
   tbPatamares(i,4) = data4R.Vlevels(i+1)-data4R.Vlevels(i);
   tbPatamares(i,5) = 100*(tbPatamares(i,4)-patamar4R)/patamar4R;
end
save('tbPatamares.mat','tbPatamares');
tbPatamares
end

% Find error source

output = false;

if output
tbError2R = zeros(2^4,4);
for i = 1:2^4
   tbError2R(i,1) = i-1; % Q
   tbError2R(i,2) = dataTh.tbDAC4(i,5); % T
   tbError2R(i,3) = data2R.Vlevels(i); % E
   tbError2R(i,4) = tbError2R(i,3)/tbError2R(i,2);% Error abs
  
end

tbError4R = zeros(2^4,4);
for i = 1:2^4
   tbError4R(i,1) = i-1; % Q
   tbError4R(i,2) = dataTh.tbDAC4(i,6); % T
   tbError4R(i,3) = data4R.Vlevels(i); % E
   tbError4R(i,4) = tbError4R(i,3)/tbError4R(i,2);% Error abs
end


tbError2R
tbError4R

k2R = mean(tbError2R(1:8,4))
k4R = mean(tbError4R(1:8,4))

save('tbErrorSource.mat','tbErrorSource2R','tbErrorSource4R','k2R','k4R');
end
