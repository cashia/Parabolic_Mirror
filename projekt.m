global mirror
mirror = figure( 'position',[100 100 800 600] , ...
                 'color',[0.1 0.05 0.2], ...
                 'numbertitle','off', ...
                 'menubar' , 'none' , ...
                 'tag','Mirror' , ...
                 'name', 'Mirror');
global labels
p = uipanel('Parent', mirror,'Title','Parametry','FontSize',12,'Position',[0 0.90 1 0.1]);
ud = uicontrol(p,'Style', 'text', 'String', 'Ogniskowa:', 'Position', [20 20 90 20], 'Enable', 'inactive');
uk = uicontrol(p,'Style', 'text', 'String', '(min: 1)', 'Position', [20 5 90 20], 'Enable', 'inactive');
uf = uicontrol(p,'Style', 'edit','String', '40',  'Position', [110 20 60 20], 'Callback', @changeF);
ue = uicontrol(p,'Style', 'text', 'String', 'Wielkość:', 'Position', [200 20 90 20], 'Enable', 'inactive');
ug = uicontrol(p,'Style', 'edit','String', '90','Position', [310 20 60 20], 'Callback', @changeG);
uh = uicontrol(p,'Style', 'text', 'String', 'Liczba promieni:', 'Position', [400 15 120 20], 'Enable', 'inactive');
ui = uicontrol(p,'Style','popupmenu','Position', [530 20 60 20], 'String', {'1','2','3','4'}, 'Callback', @selection);
uj = uicontrol(p,'Style','pushbutton','Position', [640 20 60 20], 'String',  'reset', 'Callback', @reset);
ul = uicontrol(p,'Style','pushbutton','Position', [720 20 60 20], 'String',  'close', 'Callback', @closeWindow);
labels = [uf ug ui];
%                     [    1               2                3            4         
%global param param = [ogniskowa polozenie_Y_promienia polozenie_lampy zakres 
%      5         6         7    8        9              11      ]  
%plot_lustra osGlowna ognisko h_fig liczba_promieni  buttonpress]
global param
global beams
beams = [NaN NaN NaN NaN];
param = [40 1 100 90 NaN NaN NaN NaN 1 NaN];
xlim = [ -10  200 ];%osi x od - 60 do 200
ylim = diff(xlim)/1.7 * [ -1   1 ];% os y od -130 do 130

axes1 = axes( ...
'position' , [0 0 1 1] , ...
'color'    , [0 0 0] , ...
'xlim'     , xlim , ...
'ylim'     , ylim , ...
'visible'  , 'off'   );   
 
hold on

%ZWIERCIADLO WKLESLE PARABOLA
drawMirror();

while 1
    if(waitforbuttonpress)
        param(10) = double(get(gcf,'CurrentCharacter'));
        delete(param(8));
        delete(beams);
        switch param(10)
            % 28 leftarrow
            % 29 rightarrow
            % 30 uparrow
            % 31 downarrow
            case 30%gora
                param(2) = param(2) + 1;
            case 31%dol
                param(2) = param(2) - 1;
            case 28%lewo
                param(3) = param(3) - 1;
            case 29%prawo
                param(3) = param(3) + 1;
            otherwise
        end
        drawBeam();
    end
end
 function changeF(uf, eventdata,handles)
        global param
        global beams
        var1=get(uf,'string');
        set(uf,'string',var1);
        param(1) = str2double(var1);
        delete(param(5:8));
        delete(beams);
        drawMirror();
 end
 
function changeG(ug, eventdata,handles)
        global param
        global beams
        var2=get(ug,'string');
        set(ug,'string',var2);
        param(4) = str2double(var2);
        delete(param(5:8));
        delete(beams);
        drawMirror();
    end
function selection(ui,eventdata,handles)
        global param
        global beams
        param(9) = ui.Value;
        delete(param(5:8));
        delete(beams);
        drawMirror();
end

function reset(uj,eventdata)
    global param
    global labels
    global beams
    delete(param(5:8));
    param = [40 1 100 90 NaN NaN NaN NaN 1 NaN];
    labels(1).String = '40';
    labels(2).String = '90';
    labels(3).Value = 1;
    delete(beams);
    drawMirror();
end
function closeWindow(ul,eventdata)
    global mirror
    delete(mirror);
end
