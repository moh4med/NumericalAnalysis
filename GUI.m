function varargout = GUI(varargin)
% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 22-Dec-2016 11:07:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;
setGlobaliteration(0);
setGlobalmin(0)
setGlobalmax(0)
setGlobaldata([])
serr(10)
set(handles.dtable,'Data',[])
% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function eqn_Callback(hObject, eventdata, handles)
get(handles.eqn,'string')
% hObject    handle to eqn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of eqn as text
%        str2double(get(hObject,'String')) returns contents of eqn as a double


% --- Executes during object creation, after setting all properties.
function eqn_CreateFcn(hObject, eventdata, handles)
% hObject    handle to eqn (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function setGlobaliteration(val)
global iter
iter = val;
function r = getGlobaliteration
global iter
r = iter;
function setGlobalmin(val)
global mini
mini = val;
function r = getGlobalmin
global mini
r = mini;
function setGlobalmax(val)
global maxi
maxi = val;
function r = getGlobalmax
global maxi
r = maxi;
function setGlobaldata(val)
global data
data = val;
function r = getGlobaldata
global data
r = data;
function sxr(val)
global xr
xr = val;
function r = gxr
global xr
r = xr;
function serr(val)
global err
err = val;
function r = gerr
global err
r = err;
function pushbutton2_Callback(hObject, eventdata, handles)
%delete(findobj('Color','b'))
%delete(findobj('Color','y'))
total_iteration=getGlobaliteration   ;
val=get(handles.methods,'value');
step = str2num(get(handles.step,'string'));
if step ==0
    step=str2num(get(handles.iteration,'string'))
end
 gmini=getGlobalmin;
 gmax=getGlobalmax;
if total_iteration==0
     setGlobalmin(str2num(get(handles.ss,'string')));
     setGlobalmax(str2num(get(handles.ee,'string')));
     gmini=getGlobalmin;
     gmax=getGlobalmax;
end
s=0;
f=inline(get(handles.eqn,'string'));
tic;
if val==2       %bisection;
    if f(gmini)*f(gmax)>0
         msgbox('Invalid Values', 'Error','error');
    else 
        str2num(get(handles.iteration,'string'))
    while gerr>str2num(get(handles.epsilon,'string'))&&s<step &&total_iteration< str2num(get(handles.iteration,'string'))
        gmini=getGlobalmin;
        gmax=getGlobalmax;
        total_iteration=total_iteration+1;
        setGlobaliteration(total_iteration);
        s=s+1;
        %call
       [gmini1 gmax1 xrr er]=bisection(get(handles.eqn,'string'),gmini,gmax,gxr,total_iteration)
       sxr(xrr)
       serr(er)
       gg=getGlobaldata;
       aa=[total_iteration gmini gmax xrr f(xrr) er*100];
       gg=[gg;aa];
       setGlobaldata(gg);
       setGlobalmin(gmini1);
       setGlobalmax(gmax1);
       set(handles.dtable,'Data',gg)
       axes(handles.axes2)
       p = plot(gg(2:end,6));
       set(p, 'Color', 'red', 'LineWidth', 1);
       axes(handles.eqplot)
       set(findobj('Color','b'),'Color','g');
      set(findobj('Color','y'),'Color','g');
       r1=f(gmax)-10:.01:f(gmax)+10;
       c = plot(gmax,r1);
       hold on
       set(c, 'Color', 'blue', 'LineWidth', 1);
       r2=f(gmini)-10:.01:f(gmini)+10;
       d = plot(gmini,r2);
        hold on
       set(d, 'Color', 'blue', 'LineWidth', 1);
       r3=f(xrr)-10:.01:f(xrr)+10;
       e = plot(xrr,r2);
       hold on
       pan on
       set(e, 'Color', 'yellow', 'LineWidth', 1);
       if f(xrr)==0
           serr(-5)
           break;
       end  
        pause(str2num(get(handles.tt,'string')));
    end
    end
elseif val==3   %netwon
    while gerr>str2num(get(handles.epsilon,'string'))&&s<step &&total_iteration< str2num(get(handles.iteration,'string'))
        gmini=getGlobalmin;
        total_iteration=total_iteration+1;
        setGlobaliteration(total_iteration);
        s=s+1;
        %call
       [gmini1 er]=newton(get(handles.eqn,'string'),gmini)
       serr(er);
       gg=getGlobaldata;
       aa=[total_iteration gmini  f(gmini) er*100];
       gg=[gg;aa];
       setGlobaldata(gg);
       setGlobalmin(gmini1);
       set(handles.dtable,'Data',gg)
       axes(handles.axes2)
        p = plot(gg(:,4));
        set(p, 'Color', 'red', 'LineWidth', 1);
       axes(handles.eqplot)
       set(findobj('Color','b'),'Color','g');
       line([gmini gmini],[f(gmini) 0],'Color','b','LineWidth',1);
       hold on
       line([gmini gmini1],[f(gmini) 0],'Color','b','LineWidth',1);
       hold on
        if f(gmini1)==0
           serr(-5);
           break;
        end  
        pause(str2num(get(handles.tt,'string')));
    end
elseif val==4   %secant
        while gerr>str2num(get(handles.epsilon,'string'))&&s<step &&total_iteration< str2num(get(handles.iteration,'string'))
        gmini=getGlobalmin;
        gmax=getGlobalmax;
        total_iteration=total_iteration+1;
        setGlobaliteration(total_iteration);
        s=s+1;
        %call
       [gmini1 gmax1 er]=secant(get(handles.eqn,'string'),gmini,gmax)
       serr(er)
       gg=getGlobaldata;
       aa=[total_iteration gmini gmax f(gmini) f(gmax) gmax1 er*100];
       gg=[gg;aa];
       setGlobaldata(gg);
       setGlobalmin(gmini1);
       setGlobalmax(gmax1);
       set(handles.dtable,'Data',gg)
       axes(handles.axes2)
        p = plot(gg(:,7));
        set(p, 'Color', 'red', 'LineWidth', 1);
        axes(handles.eqplot)
       set(findobj('Color','b'),'Color','magenta');
        set(findobj('Color','y'),'Color','g');
         set(findobj('Color','g'),'Color','g');
       line([gmini gmini],[f(gmini) 0],'Color','b','LineWidth',2);
       hold on
       line([gmax gmax],[f(gmax) 0],'Color','y','LineWidth',2);
       hold on
        line([gmax1 gmax1],[f(gmax1) 0],'Color','g','LineWidth',2);
       hold on
       zoom on
            if f(gmax1)==0
           serr(-5)
           break;
       end  
        pause(str2num(get(handles.tt,'string')));
    end
    
elseif val==5   %false
     if f(gmini)*f(gmax)>0
         msgbox('Invalid Values', 'Error','error');
    else 
        str2num(get(handles.iteration,'string'))
    while gerr>str2num(get(handles.epsilon,'string'))&&s<step &&total_iteration< str2num(get(handles.iteration,'string'))
        gmini=getGlobalmin;
        gmax=getGlobalmax;
        total_iteration=total_iteration+1;
        setGlobaliteration(total_iteration);
        s=s+1;
        %call
       [gmini1 gmax1 xrr er]=regula_falsi(get(handles.eqn,'string'),gmini,gmax,gxr,total_iteration)
       sxr(xrr);
       serr(er);
       gg=getGlobaldata;
       aa=[total_iteration gmini gmax xrr f(xrr) er*100];
       gg=[gg;aa];
       setGlobaldata(gg);
       setGlobalmin(gmini1);
       setGlobalmax(gmax1);
       set(handles.dtable,'Data',gg)
       axes(handles.axes2)
        p = plot(gg(2:end,6));
        set(p, 'Color', 'red', 'LineWidth', 1);
         axes(handles.eqplot)
       set(findobj('Color','b'),'Color','g');
        set(findobj('Color','y'),'Color','magenta');
       line([gmini gmax],[f(gmini) f(gmax)],'Color','b','LineWidth',2);
       hold on
       line([xrr xrr],[f(xrr) 0],'Color','y','LineWidth',2,'LineStyle','--');
       hold on
       pan on
            if f(xrr)==0
          serr(-5)
           break;
       end  
        pause(str2num(get(handles.tt,'string')));
    end
     end
elseif val==6           %fixed
    while gerr>str2num(get(handles.epsilon,'string'))&&s<step &&total_iteration< str2num(get(handles.iteration,'string'))
        gmini=getGlobalmin;
        total_iteration=total_iteration+1;
        setGlobaliteration(total_iteration);
        s=s+1;
        %call
       [gmini1 er]=fixedpoint(get(handles.geq,'string'),gmini,total_iteration)
       serr(er);
       gg=getGlobaldata;
       aa=[total_iteration gmini er*100];
       gg=[gg;aa];
       setGlobaldata(gg);
       setGlobalmin(gmini1);
       set(handles.dtable,'Data',gg)
       axes(handles.axes2)
        p = plot(gg(2:end,3));
        set(p, 'Color', 'red', 'LineWidth', 1);
         axes(handles.eqplot)
       set(findobj('Color','b'),'Color','g');
       line([gmini gmini],[f(gmini) 0],'Color','b','LineWidth',2);
       hold on
       pan on
            if f(gmini)==0
          serr(-5)
           break;
       end  
        pause(str2num(get(handles.tt,'string')));
end
end
if total_iteration==str2num(get(handles.iteration,'string'))||gerr<str2num(get(handles.epsilon,'string'))
    h = msgbox({'Operation Completed' 'total iteration= ' num2str(total_iteration)});
     h = msgbox({'total time= ' num2str(toc)});
     setGlobaldata([]);
end
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function tt_Callback(hObject, eventdata, handles)
% hObject    handle to tt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tt as text
%        str2double(get(hObject,'String')) returns contents of tt as a double


% --- Executes during object creation, after setting all properties.
function tt_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tt (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function step_Callback(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of step as text
%        str2double(get(hObject,'String')) returns contents of step as a double


% --- Executes during object creation, after setting all properties.
function step_CreateFcn(hObject, eventdata, handles)
% hObject    handle to step (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in methods.
function methods_Callback(hObject, eventdata, handles)
setGlobaliteration(0);
serr(10)
val=get(handles.methods,'value')
names={'iter' ;'xl'; 'xu'; 'xr'; 'f(xr)'; 'error'};
if val==3
    names={'iter' ;'x'; 'f(x)'; 'error'};
    set(handles.ee,'Visible','Off');
else
     set(handles.ee,'Visible','on');
end
if val==4
    names={'iter' ;'xi-1'; 'xi'; 'f(xi-1)'; 'f(xi)';'xi+1'; 'error'};
end
if val==6
    names={'iter' ; 'xi'; 'error'};
    set(handles.ee,'Visible','Off');
    set(handles.geq,'Visible','on');
else
    set(handles.geq,'Visible','Off');
end
set(handles.dtable,'ColumnName',names)
% hObject    handle to methods (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns methods contents as cell array
%        contents{get(hObject,'Value')} returns selected item from methods


% --- Executes during object creation, after setting all properties.
function methods_CreateFcn(hObject, eventdata, handles)
% hObject    handle to methods (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function iteration_Callback(hObject, eventdata, handles)
% hObject    handle to iteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of iteration as text
%        str2double(get(hObject,'String')) returns contents of iteration as a double


% --- Executes during object creation, after setting all properties.
function iteration_CreateFcn(hObject, eventdata, handles)
% hObject    handle to iteration (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function epsilon_Callback(hObject, eventdata, handles)
% hObject    handle to epsilon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of epsilon as text
%        str2double(get(hObject,'String')) returns contents of epsilon as a double


% --- Executes during object creation, after setting all properties.
function epsilon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to epsilon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ss_Callback(hObject, eventdata, handles)
% hObject    handle to ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ss as text
%        str2double(get(hObject,'String')) returns contents of ss as a double


% --- Executes during object creation, after setting all properties.
function ss_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ss (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function ee_Callback(hObject, eventdata, handles)
% hObject    handle to ee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ee as text
%        str2double(get(hObject,'String')) returns contents of ee as a double


% --- Executes during object creation, after setting all properties.
function ee_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ee (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
setGlobaliteration(0);
gmini=str2num(get(handles.ss,'string'));
gmax=str2num(get(handles.ee,'string'));
setGlobalmin(gmini)
setGlobalmax(gmax)
setGlobaldata([])
serr(10)
set(handles.dtable,'Data',[])
delete(findobj('Color','r'))
delete(findobj('Color','y'))
delete(findobj('Color','b'))
delete(findobj('Color','g'))
delete(findobj('Color','black'))
delete(findobj('Color','magenta'))
equation=inline(get(handles.eqn,'string'))
axes(handles.eqplot)
minval=str2num(get(handles.min,'string'))
maxval=str2num(get(handles.max,'string'))
p = ezplot(equation,[minval maxval]);
set(p, 'Color', 'black', 'LineWidth', 2);
hold on
grid on
zoom on
pan on
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton3 and none of its controls.
function pushbutton3_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on pushbutton2 and none of its controls.
function pushbutton2_KeyPressFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on key press with focus on iteration and none of its controls.
function iteration_KeyPressFcn(hObject, eventdata, handles)

% hObject    handle to iteration (see GCBO)
% eventdata  structure with the following fields (see UICONTROL)
%	Key: name of the key that was pressed, in lower case
%	Character: character interpretation of the key(s) that was pressed
%	Modifier: name(s) of the modifier key(s) (i.e., control, shift) pressed
% handles    structure with handles and user data (see GUIDATA)



function min_Callback(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of min as text
%        str2double(get(hObject,'String')) returns contents of min as a double


% --- Executes during object creation, after setting all properties.
function min_CreateFcn(hObject, eventdata, handles)
% hObject    handle to min (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function max_Callback(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of max as text
%        str2double(get(hObject,'String')) returns contents of max as a double


% --- Executes during object creation, after setting all properties.
function max_CreateFcn(hObject, eventdata, handles)
% hObject    handle to max (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
setGlobaliteration(0);
gmini=str2num(get(handles.ss,'string'));
gmax=str2num(get(handles.ee,'string'));
setGlobalmin(gmini)
setGlobalmax(gmax)
setGlobaldata([])
serr(10)
set(handles.dtable,'Data',[])
delete(findobj('Color','r'))
delete(findobj('Color','y'))
delete(findobj('Color','b'))
delete(findobj('Color','g'))
delete(findobj('Color','magenta'))
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function geq_Callback(hObject, eventdata, handles)
% hObject    handle to geq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of geq as text
%        str2double(get(hObject,'String')) returns contents of geq as a double


% --- Executes during object creation, after setting all properties.
function geq_CreateFcn(hObject, eventdata, handles)
% hObject    handle to geq (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
