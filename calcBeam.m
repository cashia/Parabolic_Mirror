function calcBeam(h)
    global param
    global x1
    global y1
    Fx = param(1)/2;
    Fy = 0;
    a = 1/4/param(1);
    if(h<0)
        pierwszy = 2;
    else
        pierwszy = 1;
    end
    %funkcja liniowa odbitego promienia
    if(h>(param(4)-1) || h<(-param(4)+1))
        x1 = [param(3) -100];
        y1 = [h h];
    else
        k = a*h^2; %miejsce pierwszego odbicia
        x2 = [k Fx];
        y2 = [h Fy];
        %funkcja liniowa odbitego promienia
        if(h == 0)
            x1 = [param(3) k Fx 200];
            y1 = [h h Fy h];
        else
            p = polyfit(x2,y2,1);
            x22 = linspace(k, 300);
            y22 = polyval(p,x22);
            a22 = (y22(end)-y22(1))/(x22(end)-x22(1));
            b22 = y22(1)-a22*x22(1);
            h2 = roots([a -1/a22 b22/a22]);
            h2 = sort(h2);
            k2 = a*h2(pierwszy)^2;
            if((h2(1) < param(4)) && (h2(1) > -param(4)) && (h2(2) < param(4)) && (h2(2) > -param(4)))%to jest odbicie
                x1 = [param(3) k Fx k2 200];
                y1 = [h h Fy h2(pierwszy) h2(pierwszy)];
            else
                x1 = [param(3) k Fx x22];
                y1 = [h h Fy y22];
            end
        end
    end    
end
