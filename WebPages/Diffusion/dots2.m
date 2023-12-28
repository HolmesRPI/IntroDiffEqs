function dots2

%  displays outcomes of the N-step random walk
%  using P particles all starting at x=0

h=0.1;

M=7;
X=linspace(-1,1,M);
Y=linspace(0,1,M/2);


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

Xm=-1.5;  XM=1.5;
Ym=-0.5;  YM=1.5;

figure(1)
clf
% get(gcf)
set(gcf,'Position', [3 827 572 518])
subaxis(1,1,1,1,'MT',0.004,'MB',0.1,'MR',0.02,'ML',0.15,'P',0.02)

hold on
grid on
xlabel('x-axis')
ylabel('y-axis')
set(gca,'xtick',[Xm 0 XM])
set(gca,'ytick',[Ym 0 YM])
axis equal
set(gca,'FontSize',28,'FontWeight','bold')
axis([Xm XM Ym YM])
say=['t = 0'];
text(0.75,1.2,say,'FontSize',28,'FontWeight','bold')
plot(x,y,'.b','MarkerSize',30)
plot([-1 0],[0 1],'r','LineWidth',0.2)
plot([0 1],[1 0],'r','LineWidth',0.2)
plot([-1 1],[0 0],'r','LineWidth',0.2)
hold off

exportgraphics(gcf,'/Users/mark/Desktop/t0.png')












