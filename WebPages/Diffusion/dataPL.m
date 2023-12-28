function dataPL

% the example data sets
% requires subaxis.m and parseArgs.m files (for plotting)

a=-1; b=1;
nx=12;
xd=linspace(a,b,nx);

% 5th degree poly
for iy=1:nx
    yd4(iy)=(xd(iy)+0.9)*(xd(iy)+0.1)^2*(xd(iy)-0.2)*(xd(iy)-0.8);
end

% jump function
for iy=1:nx
    yd1(iy)=(-1)^iy*0.02;
end
yd1(5)=1; yd1(6)=1; yd1(7)=1; yd1(8)=1;

% oscillatory function
for iy=1:nx
    yd2(iy)=(-1)^iy;
end

% circle function
for iy=1:nx
    yd3(iy)=sqrt(1-xd(iy)^2);
end

clf
% get(gcf)
set(gcf,'Position', [3 978 666 367])

subaxis(2,2,2,2,'MT',0.003,'MB',0.11,'MR',0.01,'ML',0.06,'P',0.01)
hold on
box on
plot(xd,yd1,'or','MarkerSize',7,'LineWidth',2)
axis([-1.1 1.1 -0.5 1.5])
grid on
xlabel('x-axis')
%ylabel('y-axis')
set(gca,'FontSize',14,'FontWeight','bold')

subaxis(2,2,1,2)
hold on
box on
plot(xd,yd2,'or','MarkerSize',7,'LineWidth',2)
axis([-1.1 1.1 -2 2])
set(gca,'ytick',[-1 0 1])
grid on
xlabel('x-axis')
ylabel('y-axis')
set(gca,'FontSize',14,'FontWeight','bold')

subaxis(2,2,2,1)
hold on
box on
plot(xd,yd3,'or','MarkerSize',7,'LineWidth',2)
axis([-1.1 1.1 -0.1 1.1])
grid on
%set(gca,'xtick',[0 1 2])
set(gca,'ytick',[0 0.5 1])
set(gca,'FontSize',14,'FontWeight','bold')

subaxis(2,2,1,1)
hold on
box on
plot(xd,yd4,'or','MarkerSize',7,'LineWidth',2)
axis([-1.1 1.1 -0.2 0.4])
grid on
ylabel('y-axis')
set(gca,'FontSize',14,'FontWeight','bold')

pause

subaxis(2,2,1,1)
plot(xd,yd4,'b','MarkerSize',7,'LineWidth',2)
pause

subaxis(2,2,2,1)
plot(xd,yd3,'b','MarkerSize',7,'LineWidth',2)
pause

subaxis(2,2,1,2)
plot(xd,yd2,'b','MarkerSize',7,'LineWidth',2)
pause

subaxis(2,2,2,2)
plot(xd,yd1,'b','MarkerSize',7,'LineWidth',2)
pause






