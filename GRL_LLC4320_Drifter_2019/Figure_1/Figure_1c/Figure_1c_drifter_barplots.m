clc
clear

% all data (segment center, 132,970)
load('Drifter_dataset_time_distribution.mat')

gtime_begin = [1986 01 01 0 0 0];
gtime_end = [2019 01 01 0 0 0];
mtime_begin = datenum(gtime_begin);
mtime_end = datenum(gtime_end);


for i = 1:33
 
    mtime_tick(i) = datenum([i+1986 01 01 0 0 0]);

end


figure
figsize = [24 8]*2.5;
set(gcf,'PaperSize',figsize)
set(gcf,'PaperPosition',[0 0 figsize])
previewmap

h = bar(time_year,[N_A' N_G']);

set(h(1),'EdgeColor',[0.8500 0.3250 0.0980],'FaceColor',[0.8500 0.3250 0.0980])
set(h(2),'EdgeColor',[0.4 0.4 0.4],'FaceColor',[0.4 0.4 0.4])

xlim([mtime_begin mtime_end])
ylim([10^0 10^7.2])
legend('Argos-tracked drifters','GPS-tracked drifters')
set(gca,'TickLength',[0.00 0.1])
set(gca,'YTick',[10^0,10^1,10^2,10^3,10^4,10^5,10^6,10^7])
set(gca,'XTick',[mtime_tick(1:2:end)])
grid on
set(gca,'YScale','log')
set(gca,'XMinorGrid','off')
set(gca,'YMinorGrid','off')
%set(gca,'XGrid','off')
xlabel('Year','FontSize',28,'FontWeight','Demi','fontname','Helvetica')
ylabel('Number of data points','FontSize',28,'FontWeight','Demi','fontname','Helvetica')
set(gca,'FontSize',28,'FontWeight','Demi','fontname','Helvetica','LineWidth',2)
datetick('x',10,'keeplimits');


set(gcf, 'Color', 'w');
export_fig('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_1/Figure_1c/Figure_1c', '-pdf');
close all



