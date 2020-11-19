clc
clear

% Drifters
load('KE_drifter_qd_latmean_true_1D.mat')
load('bootstrap_drifter_qd_10000_1D.mat')


% confidence intervals (via a bootstrapping method)
confidence_interval = 250;
for i = 1:181
    
    sorted(i,:) = sort(KE_drifter_qd_open_all_bootstrap(:,i));
    KE_drifter_upper(i) = sorted(i, end-confidence_interval);
    KE_drifter_lower(i) = sorted(i, confidence_interval);

    sorted(i,:) = sort(KE_drifter_qd_open_semi_bootstrap(:,i));
    KE_semi_upper(i) = sorted(i, end-confidence_interval);
    KE_semi_lower(i) = sorted(i, confidence_interval);
    
    sorted(i,:) = sort(KE_drifter_qd_open_diurnal_bootstrap(:,i));
    KE_diurnal_upper(i) = sorted(i, end-confidence_interval);
    KE_diurnal_lower(i) = sorted(i, confidence_interval);    

    sorted(i,:) = sort(KE_drifter_qd_open_f_bootstrap(:,i));
    KE_f_upper(i) = sorted(i, end-confidence_interval);
    KE_f_lower(i) = sorted(i, confidence_interval);

    sorted(i,:) = sort(KE_drifter_qd_open_high_bootstrap(:,i));
    KE_high_upper(i) = sorted(i, end-confidence_interval);
    KE_high_lower(i) = sorted(i, confidence_interval);        
    
    sorted(i,:) = sort(KE_drifter_qd_open_low_bootstrap(:,i));
    KE_low_upper(i) = sorted(i, end-confidence_interval);
    KE_low_lower(i) = sorted(i, confidence_interval);    
    
    
end

KE_drifter_all_conf(1,:) = KE_drifter_upper - KE_drifter_qd_open_all_true;
KE_drifter_all_conf(2,:) = abs(KE_drifter_lower - KE_drifter_qd_open_all_true);

KE_drifter_semi_conf(1,:) = KE_semi_upper - KE_drifter_qd_open_semi_true;
KE_drifter_semi_conf(2,:) = abs(KE_semi_lower - KE_drifter_qd_open_semi_true);

KE_drifter_diurnal_conf(1,:) = KE_diurnal_upper - KE_drifter_qd_open_diurnal_true;
KE_drifter_diurnal_conf(2,:) = abs(KE_diurnal_lower - KE_drifter_qd_open_diurnal_true);

KE_drifter_f_conf(1,:) = KE_f_upper - KE_drifter_qd_open_f_true;
KE_drifter_f_conf(2,:) = abs(KE_f_lower - KE_drifter_qd_open_f_true);

KE_drifter_high_conf(1,:) = KE_high_upper - KE_drifter_qd_open_high_true;
KE_drifter_high_conf(2,:) = abs(KE_high_lower - KE_drifter_qd_open_high_true);

KE_drifter_low_conf(1,:) = KE_low_upper - KE_drifter_qd_open_low_true;
KE_drifter_low_conf(2,:) = abs(KE_low_lower - KE_drifter_qd_open_low_true);



% LLC4320


lat_llc = ncread('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_3/E_llc_lat_mean_scaled.nc','lat');

KE_llc_all = ncread('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_3/E_llc_lat_mean_scaled.nc','E_llc_raw');
KE_llc_diurnal = ncread('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_3/E_llc_lat_mean_scaled.nc','E_llc_diurnal')';
KE_llc_f = ncread('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_3/E_llc_lat_mean_scaled.nc','E_llc_f')';
KE_llc_high = ncread('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_3/E_llc_lat_mean_scaled.nc','E_llc_high')';
KE_llc_semi = ncread('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_3/E_llc_lat_mean_scaled.nc','E_llc_semi')';
KE_llc_low = ncread('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_3/E_llc_lat_mean_scaled.nc','E_llc_low')';



lati=linspace(-90,90,181);




%% LLC4320 & drogued 


figure
figsize = [9 15]*3.5;
set(gcf,'PaperSize',figsize)
set(gcf,'PaperPosition',[0 0 figsize])
previewmap

subplot(411)
h2 = plot(lat_llc,KE_llc_low,'b','LineWidth',3)
hold on
h1 = plot(lati,KE_drifter_qd_open_low_true,'-','color','k','LineWidth',3)
shadedErrorBar(lati,KE_drifter_qd_open_low_true,KE_drifter_low_conf,{'-','color','k','markerfacecolor',[.75 .75 .75],'markeredgecolor','k','LineWidth',3},1);
xlim([-60 60])
grid on
ylabel('(m^2 s^{-2})')
set(gca,'YTick',[0:0.1:0.4]);
set(gca,'XTick',[-60:20:60]);
set(gca,'XTickLabel',{'60ºS','40ºS','20ºS','0º','20ºN','40ºN','60ºN'});
legend([h2 h1],'LLC4320','Drogued drifter')
set(gca,'FontSize',20,'LineWidth',3,'FontWeight','Demi','FontName','Helvetica')
DataX = interp1([0 1],xlim(),0.015);
DataY = interp1([0 1],ylim(),0.90);
text(DataX,DataY,'(a) Low-frequency KE','FontName','Helvetica','FontSize',24,'FontWeight','Demi')

subplot(412)
KE_llc_f(51:70)=nan;
shadedErrorBar(lati(1:81),KE_drifter_qd_open_f_true(1:81),KE_drifter_f_conf(:,1:81),{'-','color','k','markerfacecolor',[.75 .75 .75],'markeredgecolor','k','LineWidth',3},1);
hold on
shadedErrorBar(lati(102:end),KE_drifter_qd_open_f_true(102:end),KE_drifter_f_conf(:,102:end),{'-','color','k','markerfacecolor',[.75 .75 .75],'markeredgecolor','k','LineWidth',3},1);
hold on
plot(lat_llc,KE_llc_f,'b','LineWidth',3)
KE_drifter_qu_open_f_true(81:102)= nan;
xlim([-60 60])
ylim([0 0.03])
set(gca,'YTick',[0:0.01:0.03]);
grid on
ylabel('(m^2 s^{-2})')
set(gca,'XTick',[-60:20:60]);
set(gca,'XTickLabel',{'60ºS','40ºS','20ºS','0º','20ºN','40ºN','60ºN'});
set(gca,'FontSize',20,'LineWidth',3,'FontWeight','Demi','FontName','Helvetica')
DataX = interp1([0 1],xlim(),0.015);
DataY = interp1([0 1],ylim(),0.90);
text(DataX,DataY,'(b) Near-inertial KE','FontName','Helvetica','FontSize',24,'FontWeight','Demi')

subplot(413)
shadedErrorBar(lati,KE_drifter_qd_open_semi_true,KE_drifter_semi_conf,{'-','color','k','markerfacecolor',[.75 .75 .75],'markeredgecolor','k','LineWidth',3},1);
hold on
plot(lat_llc,KE_llc_semi,'b','LineWidth',3)
xlim([-60 60])
ylim([0 0.012])
set(gca,'YTick',[0:0.004:0.012]);
grid on
ylabel('(m^2 s^{-2})')
set(gca,'XTick',[-60:20:60]);
set(gca,'XTickLabel',{'60ºS','40ºS','20ºS','0º','20ºN','40ºN','60ºN'});
set(gca,'FontSize',20,'LineWidth',3,'FontWeight','Demi','FontName','Helvetica')
DataX = interp1([0 1],xlim(),0.015);
DataY = interp1([0 1],ylim(),0.90);
text(DataX,DataY,'(c) Semi-diurnal KE','FontName','Helvetica','FontSize',24,'FontWeight','Demi')

subplot(414)
shadedErrorBar(lati,KE_drifter_qd_open_diurnal_true,KE_drifter_diurnal_conf,{'-','color','k','markerfacecolor',[.75 .75 .75],'markeredgecolor','k','LineWidth',3},1);
hold on
plot(lat_llc,KE_llc_diurnal,'b','LineWidth',3)
xlim([-60 60])
ylim([0 0.016])
set(gca,'YTick',[0:0.004:0.016]);
grid on
ylabel('(m^2 s^{-2})')
xlabel('Latitude')
set(gca,'XTick',[-60:20:60]);
set(gca,'XTickLabel',{'60ºS','40ºS','20ºS','0º','20ºN','40ºN','60ºN'});
set(gca,'FontSize',20,'LineWidth',3,'FontWeight','Demi','FontName','Helvetica')
DataX = interp1([0 1],xlim(),0.015);
DataY = interp1([0 1],ylim(),0.90);
text(DataX,DataY,'(d) Diurnal KE','FontName','Helvetica','FontSize',24,'FontWeight','Demi')


set(gcf, 'Color', 'w');

export_fig('/Users/xiaolongyu/Documents/Postdoc_LLC4320_Drifter/Figure_3/Figure_3', '-pdf');

close all





