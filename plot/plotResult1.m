h=figure;

subplot(2,4,1)  
sigma_num=1;
for method_num=1:method_max
plot(num_array',mean(squeeze(error_Rx(sigma_num,:,method_num,:)),2),'LineWidth',1.5);
hold on;
end
legend('rot','tran','fuse','interpreter','latex','FontName','Times New Roman','FontSize',6)
title('low rot,low tran','interpreter','latex','FontName','Times New Roman','FontSize',8)
xlim tight
ylim([0.5,5])
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
ylabel('eR/mrad','interpreter','latex','FontName','Times New Roman','FontSize',8)
set(gca,'fontname','Times New Roman','FontSize',8)

subplot(2,4,5)  
for method_num=1:method_max
plot(num_array',mean(squeeze(error_tx(sigma_num,:,method_num,:)),2),'LineWidth',1.5);
hold on;
end
xlim tight
ylim([0.4,3.5])
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
ylabel('et/mm','interpreter','latex','FontName','Times New Roman','FontSize',8)
set(gca,'fontname','Times New Roman','FontSize',8)

subplot(2,4,2)  
sigma_num=2;
for method_num=1:method_max
plot(num_array',mean(squeeze(error_Rx(sigma_num,:,method_num,:)),2),'LineWidth',1.5);
hold on;
end
title('low rot,high tran','interpreter','latex','FontName','Times New Roman','FontSize',8)
xlim tight
ylim([0.5,5])
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
set(gca,'fontname','Times New Roman','FontSize',8)

subplot(2,4,6)  
for method_num=1:method_max
plot(num_array',mean(squeeze(error_tx(sigma_num,:,method_num,:)),2),'LineWidth',1.5);
hold on;
end
xlim tight
ylim([0.4,3.5])
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
set(gca,'fontname','Times New Roman','FontSize',8)

subplot(2,4,3)  
sigma_num=3;
for method_num=1:method_max
plot(num_array',mean(squeeze(error_Rx(sigma_num,:,method_num,:)),2),'LineWidth',1.5);
hold on;
end
title('high rot,low tran','interpreter','latex','FontName','Times New Roman','FontSize',8)
xlim tight
ylim([0.5,5])
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
set(gca,'fontname','Times New Roman','FontSize',8)


subplot(2,4,7)  
for method_num=1:method_max
plot(num_array',mean(squeeze(error_tx(sigma_num,:,method_num,:)),2),'LineWidth',1.5);
hold on;
end
xlim tight
ylim([0.4,3.5])
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
set(gca,'fontname','Times New Roman','FontSize',8)


subplot(2,4,4)  
sigma_num=4;
for method_num=1:method_max
plot(num_array',mean(squeeze(error_Rx(sigma_num,:,method_num,:)),2),'LineWidth',1.5);
hold on;
end
title('high rot,high tran','interpreter','latex','FontName','Times New Roman','FontSize',8)
xlim tight
ylim([0.5,5])
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
set(gca,'fontname','Times New Roman','FontSize',8)

subplot(2,4,8)  
for method_num=1:method_max
plot(num_array',mean(squeeze(error_tx(sigma_num,:,method_num,:)),2),'LineWidth',1.5);
hold on;
end
xlim tight
ylim([0.4,3.5])
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
set(gca,'fontname','Times New Roman','FontSize',8)