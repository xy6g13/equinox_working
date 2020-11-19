
clc
clear

load('Drifter_data_points_global_distributions.mat')



figure
figsize = [16 12]*3;
set(gcf,'PaperSize',figsize)
set(gcf,'PaperPosition',[0 0 figsize])
previewmap

m_proj('miller','lon',[0 360],'lat',[-80 80]);
m_pcolor(lon,lat,N_all);
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',9,'tickdir','in','linewidth',2);
h=colorbar;
get(h, 'Position')
ph = get(h,'pos');
set(h, 'Position', [ph(1)+.035 ph(2) ph(3) ph(4)],'YAxisLocation','right')
set(get(h,'ylabel'),'string','Number of data points','FontSize',24,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',24)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',24)
set(gca,'colorscale','log')
caxis([10^2 2*10^4])
cmocean('dense',10);
map = brewermap(15,'spectral');
colormap(flip(map))
set(gca,'FontSize',24,'FontWeight','Demi','fontname','Helvetica')


set(gcf, 'Color', 'w');
export_fig('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_1/Figure_1a/Figure_1a', '-pdf');
close all

