function drawMirror
    global param
    n = 1000;%liczba probek
    a = 1/4/param(1); %nachylenie paraboli
    y = linspace(-param(4), param(4), n);
    x = a*y.^2;
    lw = 5; %grubosc lusterka
    param(5) = plot(x,y, 'w' , 'linewidth', lw);
    hold on
    %Os glowna
    os = linspace(0, 0 , 200);
    hold on
    param(6) = plot(os, 'w--');
    Fx = param(1)/2;
    Fy = 0;
    param(7) = plot(Fx,Fy,'wo');
    hold on
    drawBeam();
 end