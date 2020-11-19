
clc
clear

load('drifter_num.mat')


figure
figsize = [24 8]*2.5;
set(gcf,'PaperSize',figsize)
set(gcf,'PaperPosition',[0 0 figsize])
previewmap
h1 = cdfplot(time_length_all/720)
hold on
set(h1,'Color','k','LineWidth',4)
xlim([0 60])
set(gca,'XTick',[0,2,3,6,12,24,36,48,60])
set(gca,'YTick',[0:0.1:1])
xlabel('Drifter duration (months)','FontSize',28,'FontWeight','Demi','fontname','Helvetica')
ylabel('Cumulative dist. func.','FontSize',28,'FontWeight','Demi','fontname','Helvetica')
title('')
set(gca,'FontSize',28,'FontWeight','Demi','fontname','Helvetica','LineWidth',2)


set(gcf, 'Color', 'w');
export_fig('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_1/Figure_1b/Figure_1b', '-pdf');
close all






