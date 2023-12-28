function dots

%  displays outcomes of the N-step random walk
%  using P particles all starting at x=0

N=100;
h=0.1;

font1=16;
font2=18;

frames=4;
vid0 = VideoWriter('/Users/mark/Desktop/dots','MPEG-4');
open(vid0);

M=1000;
X=linspace(-1,1,M);
Y=linspace(0,1,M/2);

T1=10;
T2=N;

ic=0;
for ix=1:M
    for iy=1:M/2
        if Y(iy)<=1-abs(X(ix))
            ic=ic+1;
            x(ic)=X(ix);
            y(ic)=Y(iy);
        end
    end
end
P=ic

Xm=-4;  XM=4;
Ym=-3;  YM=4;

figure(1)
clf
% get(gcf)
set(gcf,'Position', [3 827 572 518])
subaxis(1,1,1,1,'MT',0.004,'MB',0.1,'MR',0.001,'ML',0.1,'P',0.02)

hold on
grid on
xlabel('x-axis')
ylabel('y-axis')
set(gca,'xtick',[Xm 0 XM])
set(gca,'ytick',[Ym 0 YM])
axis equal
set(gca,'FontSize',font1,'FontWeight','bold')
axis([Xm XM Ym YM])
say=['t = 0'];
text(2.5,3.3,say,'FontSize',font2,'FontWeight','bold')
plot(x,y,'.b','LineWidth',1.8)

say=['Holmes, 2023'];
text(-3.9,-2.9,say,'FontSize',8,'FontWeight','bold')

hold off
writeVideo(vid0,getframe(gcf));

figure(2)
clf
% get(gcf)
set(gcf,'Position', [3 990 908 355])
subaxis(1,3,1,1,'MT',0.004,'MB',0.04,'MR',0.001,'ML',0.05,'P',0.02)
hold on
grid on
xlabel('x-axis')
ylabel('y-axis')
set(gca,'xtick',[Xm 0 XM])
set(gca,'ytick',[Ym 0 YM])
axis equal
set(gca,'FontSize',font1,'FontWeight','bold')
axis([Xm XM Ym YM])
say=['t = 0'];
text(1.5,3.3,say,'FontSize',font2,'FontWeight','bold')
plot(x,y,'.b','LineWidth',1.8)
hold off
%exportgraphics(gcf,'/Users/mark/Desktop/diff0.png')

%return

for it=1:N
    theta0=2*pi*rand(1,P);
    x=x+h*cos(theta0);
    y=y+h*sin(theta0);

    figure(1)
    clf
    set(gcf,'Position', [3 827 572 518])
    subaxis(1,1,1,1,'MT',0.004,'MB',0.1,'MR',0.001,'ML',0.1,'P',0.02)
    hold on
    grid on
    xlabel('x-axis')
    ylabel('y-axis')
    set(gca,'xtick',[Xm 0 XM])
    set(gca,'ytick',[Ym 0 YM])
    axis equal
    set(gca,'FontSize',font1,'FontWeight','bold')
    axis([Xm XM Ym YM])
    say=['t = ',num2str(it)];
    text(2.5,3.3,say,'FontSize',font2,'FontWeight','bold')
    plot(x,y,'.b','LineWidth',1.8)

    say=['Holmes, 2023'];
    text(-3.9,-2.9,say,'FontSize',8,'FontWeight','bold')

    %pause

    F = getframe(gcf);
    for i=1:frames
        writeVideo(vid0 ,F);
    end

    if it==T1
        figure(2)
        subaxis(1,3,2,1)
        hold on
        grid on
        xlabel('x-axis')
        ylabel('y-axis')
        set(gca,'xtick',[Xm 0 XM])
        set(gca,'ytick',[Ym 0 YM])
        axis equal
        set(gca,'FontSize',font1,'FontWeight','bold')
        axis([Xm XM Ym YM])
        say=['t = ',num2str(it)];
        text(1.5,3.3,say,'FontSize',font2,'FontWeight','bold')
        plot(x,y,'.b','LineWidth',1.8)
    elseif it==T2
        figure(2)
        subaxis(1,3,3,1)
        hold on
        grid on
        xlabel('x-axis')
        ylabel('y-axis')
        set(gca,'xtick',[Xm 0 XM])
        set(gca,'ytick',[Ym 0 YM])
        axis equal
        set(gca,'FontSize',font1,'FontWeight','bold')
        axis([Xm XM Ym YM])
        say=['t = ',num2str(it)];
        text(1.5,3.3,say,'FontSize',font2,'FontWeight','bold')
        plot(x,y,'.b','LineWidth',1.8)
        exportgraphics(gcf,'/Users/mark/Desktop/diff100.png')
    end
end

hold off

close(vid0)











