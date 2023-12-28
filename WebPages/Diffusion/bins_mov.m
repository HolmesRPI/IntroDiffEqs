function bins_mov

%  outcomes of the N-step random walk
%  using P particles all starting at x=0

vid0 = VideoWriter('/Users/mark/Desktop/bins','MPEG-4');
open(vid0);

N=12
P=1000
M=10  % -M<x<M
Mark=10;  % marker size
frames=30;

clf
co = [0 0 1;
    0 0.5 0;
    1 0 0;
    0 0.75 0.75;
    0.75 0 0.75;
    0.75 0.75 0;
    0.25 0.25 0.25];
set(groot,'defaultAxesColorOrder',co)

%%%% get(gcf)
set(gcf,'Position', [25 867 683 478])
subaxis(2,1,1,1,'MT',0.01,'MB',0.05,'MR',0.001,'ML',0.06,'P',0.04)

S=rand(P,2); S(:,1)=S(:,1)-0.5;
plot(S(:,1),S(:,2),'.b','MarkerSize',Mark)

say=['t = 0'];
text(M-2,1.05,say,'FontSize',18,'FontWeight','bold')

say=[num2str(P),' Random Walk Particles'];
title(say,'FontSize',18,'FontWeight','bold')

axis([-M M 0 1.2])
xlabel('x-axis')
ylabel('Particles')
yticks([-2])
box on
set(gca,'FontSize',14,'FontWeight','bold')

subaxis(2,1,1,2)

R=round(S(:,1));
Num=zeros(2*M+1,1);

clear BB NN
ib=0;
for im=-M:M
    Bin(im+M+1)=im;
    for ip=1:P
        if R(ip)==im
            Num(im+M+1)=Num(im+M+1)+1;
        end
    end
    if Num(im+M+1)>0
        ib=ib+1;
        BB(ib)=Bin(im+M+1);
        NN(ib)=Num(im+M+1);
    end
end

plot(BB,NN,'.','MarkerSize',30)
ylabel('Particles per Bin')
xlabel('x-axis')
set(gca,'FontSize',14,'FontWeight','bold')
axis([-M M 0 P])

say=['Holmes, 2023'];
text(M-2,-P/5.5,say,'FontSize',10,'FontWeight','bold')


exportgraphics(gcf,'/Users/mark/Desktop/0.png')


writeVideo(vid0,getframe(gcf));

%return
%pause

dx=1;
dt=1;
D=dx^2/(2*dt);
xc=linspace(-M,M,300);

for it=1:N
    clf
    subaxis(2,1,1,1,'MT',0.01,'MB',0.05,'MR',0.001,'ML',0.06,'P',0.04)

    S(:,1)=S(:,1)+2*round(rand(P,1))-1;
    plot(S(:,1),S(:,2),'.b','MarkerSize',Mark)

    say=['t = ',num2str(it)];
    text(M-2,1.05,say,'FontSize',18,'FontWeight','bold')

    say=[num2str(P),' Random Walk Particles'];
    title(say,'FontSize',18,'FontWeight','bold')

    axis([-10 10 0 1.2])
    xlabel('x-axis')
    ylabel('Particles')
    yticks([-2])
    box on
    set(gca,'FontSize',14,'FontWeight','bold')

    subaxis(2,1,1,2)
    hold on

    for ic=1:300
        r=xc(ic)^2/(4*D*it);
        uc(ic)=P*dx*exp(-r)/sqrt(pi*D*it);
    end
    plot(xc,uc,'r','LineWidth',2)

    legend(' Solution of Diffusion Equation','Location','NorthEast','AutoUpdate','off')
    set(findobj(gcf,'tag','legend'),'FontSize',14,'FontWeight','bold')

    R=round(S(:,1));
    Num=zeros(2*M+1,1);

    clear BB NN
    ib=0;
    for im=-M:M
        Bin(im+M+1)=im;
        for ip=1:P
            if R(ip)==im
                Num(im+M+1)=Num(im+M+1)+1;
            end
        end
        if Num(im+M+1)>0
            ib=ib+1;
            BB(ib)=Bin(im+M+1);
            NN(ib)=Num(im+M+1);
        end
    end
    plot(BB,NN,'.b','MarkerSize',30)
    axis([-M M 0 P])
    ylabel('Particles per Bin')
    xlabel('x-axis')
    set(gca,'FontSize',14,'FontWeight','bold')

    say=['Holmes, 2023'];
    text(M-2,-P/5.5,say,'FontSize',10,'FontWeight','bold')

    F = getframe(gcf);
    for i=1:frames
        writeVideo(vid0 ,F);
    end

    if it==2
        exportgraphics(gcf,'/Users/mark/Desktop/2.png')
    end

    %pause

end

hold off

close(vid0)


















