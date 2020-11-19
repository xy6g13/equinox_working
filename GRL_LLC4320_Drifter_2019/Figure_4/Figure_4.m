
clc
clear

% LLC4320
load('llc_ke_grid_open_scaled.mat')

% Drifter (drogued or Drogued)
load('drifter_qd_ke_binned_scaled_1by1.mat')


%% 60S - 60N

% omit values in the equatorial band for near-inertial KE
llc_ke_f_grid(81:101,:) = nan;
KE_drifter_f(81:101,:) = nan;


figure
figsize = [20 16]*3;
set(gcf,'PaperSize',figsize)
set(gcf,'PaperPosition',[0 0 figsize])
previewmap

subplot(421)
m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_pcolor(lon,lat,llc_ke_low_grid)
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
h=colorbar;
set(get(h,'ylabel'),'string','(m^2 s^{-2})','FontSize',16,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
set(gca,'colorscale','log')
caxis([10^-2 10^0])
cmocean('matter',20);
set(gca,'FontSize',16,'FontWeight','Demi','fontname','Helvetica')
title('Low-frequency KE (LLC4320)','FontWeight','Demi','fontname','Helvetica','FontSize',16);

subplot(423)
m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_pcolor(lon,lat,llc_ke_f_grid)
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
h=colorbar;
set(get(h,'ylabel'),'string','(m^2 s^{-2})','FontSize',16,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
set(gca,'colorscale','log')
caxis([10^-3 10^-1])
cmocean('matter',20);
set(gca,'FontSize',16,'FontWeight','Demi','fontname','Helvetica')
title('Near-inertial KE (LLC4320)','FontWeight','Demi','fontname','Helvetica','FontSize',16);

subplot(425)
m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_pcolor(lon,lat,llc_ke_semi_grid)
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
h=colorbar;
set(get(h,'ylabel'),'string','(m^2 s^{-2})','FontSize',16,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
set(gca,'colorscale','log')
caxis([10^-3 10^-1])
cmocean('matter',20);
set(gca,'FontSize',16,'FontWeight','Demi','fontname','Helvetica')
title('Semi-diurnal KE (LLC4320)','FontWeight','Demi','fontname','Helvetica','FontSize',16);


subplot(427)
m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_pcolor(lon,lat,llc_ke_diurnal_grid)
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
h=colorbar;
set(get(h,'ylabel'),'string','(m^2 s^{-2})','FontSize',16,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
set(gca,'colorscale','log')
caxis([10^-3 10^-1])
cmocean('matter',20);
set(gca,'FontSize',16,'FontWeight','Demi','fontname','Helvetica')
title('Diurnal KE (LLC4320)','FontWeight','Demi','fontname','Helvetica','FontSize',16);



h = subplot(422);
p = get(h, 'pos');
p(1) = p(1) - 0.025;
set(h, 'pos', p);

m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_pcolor(lon,lat,KE_drifter_low)
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
h=colorbar;
set(get(h,'ylabel'),'string','(m^2 s^{-2})','FontSize',16,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
set(gca,'colorscale','log')
caxis([10^-2 10^0])
cmocean('matter',20);
set(gca,'FontSize',16,'FontWeight','Demi','fontname','Helvetica')
title('Low-frequency KE (drogued drifter)','FontWeight','Demi','fontname','Helvetica','FontSize',16);


h = subplot(424);
p = get(h, 'pos');
p(1) = p(1) - 0.025;
set(h, 'pos', p);
m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_pcolor(lon,lat,KE_drifter_f)
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
h=colorbar;
set(get(h,'ylabel'),'string','(m^2 s^{-2})','FontSize',16,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
set(gca,'colorscale','log')
caxis([10^-3 10^-1])
cmocean('matter',20);
set(gca,'FontSize',16,'FontWeight','Demi','fontname','Helvetica')
title('Near-inertial KE (drogued drifter)','FontWeight','Demi','fontname','Helvetica','FontSize',16);

h = subplot(426);
p = get(h, 'pos');
p(1) = p(1) - 0.025;
set(h, 'pos', p);
m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_pcolor(lon,lat,KE_drifter_semi)
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
h=colorbar;
set(get(h,'ylabel'),'string','(m^2 s^{-2})','FontSize',16,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
set(gca,'colorscale','log')
caxis([10^-3 10^-1])
cmocean('matter',20);
set(gca,'FontSize',16,'FontWeight','Demi','fontname','Helvetica')
title('Semi-diurnal KE (drogued drifter)','FontWeight','Demi','fontname','Helvetica','FontSize',16);


h = subplot(428);
p = get(h, 'pos');
p(1) = p(1) - 0.025;
set(h, 'pos', p);
m_proj('miller','lon',[0 360],'lat',[-60 60]);
m_pcolor(lon,lat,KE_drifter_diurnal)
shading flat
m_coast('patch',[.75 .75 .75],'edgecolor','k');
m_grid('xtick',7,'ytick',7,'tickdir','in','linewidth',2);
h=colorbar;
set(get(h,'ylabel'),'string','(m^2 s^{-2})','FontSize',16,'FontWeight','Demi','fontname','Helvetica');
set(findobj('tag','m_grid_yticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
% similar but for longitudes, Note: no "s" for this tag [caused by a m_map "bug"]
set(findobj('tag','m_grid_xticklabel'),'FontWeight','Demi','fontname','Helvetica','FontSize',16)
set(gca,'colorscale','log')
caxis([10^-3 10^-1])
cmocean('matter',20);
set(gca,'FontSize',16,'FontWeight','Demi','fontname','Helvetica')
title('Diurnal KE (drogued drifter)','FontWeight','Demi','fontname','Helvetica','FontSize',16);


print('-dpng','/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_4/Figure_4')
crop('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_4/Figure_4.png')
close all



