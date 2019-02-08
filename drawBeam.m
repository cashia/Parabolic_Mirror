function drawBeam
    global param
    global beams
    global x1
    global y1
    lw2 = 2;
    a = 1/4/param(1);
    if((param(2) > (5 -sqrt(param(3)/a)) && (param(2) < (sqrt(param(3)/a)) - 5)))
        %obliczamy promien
        switch param(9)
            case 1
               calcBeam(param(2));
               beams(1:4) = plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
            case 2
               calcBeam(param(2)+2.5);
               beams(1:2) =  plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
               hold on
               calcBeam(param(2)-2.5);
               beams(3:4) = plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
            case 3
               calcBeam(param(2)-4);
               beams(1:2) =  plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
               hold on
               calcBeam(param(2)+4);
               beams(3) = plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
               hold on
               calcBeam(param(2));
               beams(4) = plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
           case 4
               calcBeam(param(2)-3.8);
               beams(1) =  plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
               hold on
               calcBeam(param(2)-1.3);
               beams(2) = plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
               hold on
               calcBeam(param(2)+3.8);
               beams(3) =  plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
               hold on
               calcBeam(param(2)+1.3);
               beams(4) = plot(x1,y1, 'Color', [253 20 120]/255, 'linewidth', lw2);
        end
        %latarka
        xlat = [20+param(3) param(3) param(3) param(3)+20];
        ylat = [param(2)-5 param(2)-5 param(2)+5 param(2)+5];
        param(8) = patch(xlat,ylat,[228 104 177]/255);
    else
        switch param(10)
            case 30
                param(2) = param(2) - 1;
            case 31
                param(2) = param(2) + 1;
            case 28
                param(3) = param(3) + 1;
            case 29
                param(3) = param(3) - 1;
            otherwise
        end
        drawBeam();
    end
end