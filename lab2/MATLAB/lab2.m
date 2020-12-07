%% 4. Estudo funcional do conversor D/A
output = false;

R = 12e3; %(Ohm)
Vref = 5; %(V)
n = 4;

tbDAC4 = zeros(2^4,n+2);
tbDAC4(:,1:n) = flip(dec2bin(2^n-1:-1:0)-'0',2);
for i = 1:2^n
   tbDAC4(i,n+1) = -(2/3)*Vref*sum(tbDAC4(i,1:n)./(2.^(n:-1:1)));
   tbDAC4(i,n+2) = -(4/3)*Vref*sum(tbDAC4(i,1:n)./(2.^(n:-1:1)));
end
save('./DATA/4_3_2_DAC_R_2R.mat','tbDAC4','n');

if output
tbDAC4
figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs(0:2^4,[tbDAC4(:,n+1);0],'LineWidth',3);
stairs(0:2^4,[tbDAC4(:,n+2);0],'LineWidth',3);
legend({'$R_f = 2R$','$R_f = 4R$'},'Interpreter','latex','Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('Contador');
saveas(gcf,'./DATA/4_3_2_DAC_R_2R.png');
hold off;
end

%% 5. Influência das resistências de entrada
output = true;

R = 12e3; %(Ohm)
Vref = 5; %(V)
n = 4;

corrR1 = [1/2 5/16 21/64 85/256];
corrR2 = [1/4 1/2 5/16 21/64];
corrR3 = [1/4 1/4 1/2 5/16];
corrR4 = [1/4 1/4 1/4 1/2];

tbDAC5 = zeros(2^4,n+2);
tbDAC5(:,1:n) = flip(dec2bin(2^n-1:-1:0)-'0',2);
for i = 1:2^n
   tbDAC5(i,n+1) = -4*Vref*sum(corrR1.*tbDAC5(i,1:n)./(2.^(n:-1:1)));
   tbDAC5(i,n+2) = -4*Vref*sum(corrR2.*tbDAC5(i,1:n)./(2.^(n:-1:1)));
   tbDAC5(i,n+3) = -4*Vref*sum(corrR3.*tbDAC5(i,1:n)./(2.^(n:-1:1)));
   tbDAC5(i,n+4) = -4*Vref*sum(corrR4.*tbDAC5(i,1:n)./(2.^(n:-1:1)));
end

save('./DATA/5_1_2_DAC_R_2R.mat','tbDAC5');

if output
tbDAC5
figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs(0:2^4,[tbDAC5(:,n+1);0],'LineWidth',3);
stairs(0:2^4,[tbDAC5(:,n+2);0],'LineWidth',3);
stairs(0:2^4,[tbDAC5(:,n+3);0],'LineWidth',3);
stairs(0:2^4,[tbDAC5(:,n+4);0],'LineWidth',3);
legend({'$R_1 = R$','$R_2 = R$','$R_3 = R$','$R_4 = R$'},'Interpreter','latex','Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('Contador');
saveas(gcf,'./DATA/5_1_2_DAC_R_2R.png');
hold off;
figure('units','normalized','outerposition',[0 0 1 1]);
hold on;
set(gca,'FontSize',35);
ax = gca;
ax.XGrid = 'on';
ax.YGrid = 'on';
stairs(0:2^4,[tbDAC5(:,n+1);0],'LineWidth',3);
stairs(0:2^4,[tbDAC5(:,n+4);0],'LineWidth',3);
legend({'$R_1 = R$','$R_4 = R$'},'Interpreter','latex','Location','best');
ylabel('$V_0\:\mathrm{(V)}$','Interpreter','latex');
xlabel('Contador');
saveas(gcf,'./DATA/5_1_2_DAC_R_2R_exp.png');
hold off;
end

%% 6. Tempo de estabelecimento
SR = 0.5e6; %(V/s)
load('./DATA/4_3_2_DAC_R_2R.mat','tbDAC4','n');

delta2R = tbDAC4(end,n+1)-tbDAC4(1,n+1);
delta4R = tbDAC4(end,n+2)-tbDAC4(1,n+2);

settling2R = delta2R/SR;
settling4R = delta4R/SR;

save('./DATA/6_settling.mat','settling2R','settling4R');

if output
    settling2R 
    settling4R 
end

%% 7. Picos de tensão nas transições entre estados
% atraso
% +
% 1110 -> 0000 -> 0001
% 0001 -> 1111 -> 1110
