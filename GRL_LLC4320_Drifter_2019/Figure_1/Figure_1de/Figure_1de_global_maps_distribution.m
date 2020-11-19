

clc
clear

load('Drifter_data_points_global_distributions.mat')



figure
figsize = [24 6]*3;
set(gcf,'PaperSize',figsize)
set(gcf,'PaperPosition',[0 0 figsize])
previewmap

subplot(1,4,[1,2,3])
load('Drifter_data_points_global_distributions_Argos_only.mat', 'mlat2','mlon2','qd','qu','qmed500')
mlat2(mlat2>=60) = nan;
mlat2(mlat2<=-60) = nan;
m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
hold on
hp0 = m_plot(mlon2(qd&qmed500),mlat2(qd&qmed500),'.');
set(hp0,'markersize',8,'color',[0.85,0.37,0.1]);

load('Drifter_data_points_global_distributions_GPS_only.mat', 'mlat2','mlon2','qd','qu','qmed500')
mlat2(mlat2>=60) = nan;
mlat2(mlat2<=-60) = nan;
hp1 = m_plot(mlon2(qd&qmed500),mlat2(qd&qmed500),'.');
set(hp1,'markersize',8,'color',[0.4,0.4,0.4]);
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',20)
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',20)
set(gca,'FontSize',20,'FontWeight','Demi','fontname','Helvetica')
legend([hp0 hp1],'Argos (drogued)','GPS (drogued)')


subplot(1,4,4)
edges = -60.5:1:60.5;
% all data (segment center, 132,970)
load('Drifter_data_points_global_distributions_Argos_only.mat', 'mlat2','qd','qu')
[N_qd,lat_bins_qd,bin_number_qd] = histcounts(mlat2(qd),edges);
[N_qu,lat_bins_qd,bin_number_qd] = histcounts(mlat2(qu),edges);
edge_centre = -60:1:60;
plot(N_qd,edge_centre,'color',[0.85,0.37,0.1],'linewidth',4)
hold on
% gps (segment center, 25.008)
load('Drifter_data_points_global_distributions_GPS_only.mat', 'mlat2','qd','qu')
[N_gps_qd,lat_bins_qd,bin_number_qd] = histcounts(mlat2(qd),edges);
plot(N_gps_qd,edge_centre,'color',[0.4,0.4,0.4],'linewidth',4)
set(gca,'FontSize',20,'FontWeight','Demi','fontname','Helvetica','LineWidth',2)
set(gca,'YTick',[-60:20:60])
set(gca,'YTickLabel',{'60ºS','40ºS','20ºS','0º','20ºN','40ºN','60ºN'});
set(gca,'XTick',[0,100,250,400,550,700])
xlabel('Counts')
grid on
xlim([0 800])
legend('Argos(drogued)','GPS(drogued)')


set(gcf, 'Color', 'w');
export_fig('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_1/Figure_1de/Figure_1de', '-pdf');
close all






