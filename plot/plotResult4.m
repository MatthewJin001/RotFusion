 h=figure;
 
sigma_num=4; %Only plot the situation with the highest noise level
for method_num=1:method_max
plot(num_array,mean(squeeze(rnti(sigma_num,:,method_num,:))*1000,2),'LineWidth',1.5);
hold on;
end
legend('rot','tran','fuse','interpreter','latex','FontName','Times New Roman','FontSize',6)
xlim tight
ylim padded
xticks([20,40,60,80])
grid on;set(gca,'GridLineStyle','-.','GridColor','k','GridAlpha',0.2)
ylabel('Rnti/msec','interpreter','latex','FontName','Times New Roman','FontSize',8)
set(gca,'fontname','Times New Roman','FontSize',8)






