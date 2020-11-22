
function varargout = projet(varargin)
% PROJET MATLAB code for projet.fig
%      PROJET, by itself, creates a new PROJET or raises the existing
%      singleton*.
%
%      H = PROJET returns the handle to a new PROJET or the handle to
%      the existing singleton*.
%
%      PROJET('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PROJET.M with the given input arguments.
%
%      PROJET('Property','Value',...) creates a new PROJET or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before projet_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to projet_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help projet

% Last Modified by GUIDE v2.5 15-Apr-2020 16:35:44

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @projet_OpeningFcn, ...
                   'gui_OutputFcn',  @projet_OutputFcn, ...
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


% --- Executes just before projet is made visible.
function projet_OpeningFcn(hObject, ~, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to projet (see VARARGIN)
%background
% Update handles structure
guidata(hObject, handles);
% create an axes that spans the whole gui
ah = axes('unit', 'normalized', 'position', [0 0 1 1]); 
% import the background image and show it on the axes
bg = imread('bg.jpg'); imagesc(bg);
% prevent plotting over the background and turn the axis off
set(ah,'handlevisibility','off','visible','off')
% making sure the background is behind all the other uicontrols
uistack(ah, 'bottom');
% imshow(get(handles.path,'string'));

% Choose default command line output for projet
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes projet wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = projet_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SIG=get(handles.msg,'string');
symbole=unique(char(SIG));
N=length(symbole);
for i=1:length(symbole)
    k=strfind(char(SIG),symbole(i));
    n=length(k);
pn(i)=n/length(char(SIG));
end 
symboles=double(symbole);
m_code=huffmandict(symboles,pn);
ls={};
for i=1:N
    bin=num2str(m_code{i,2});
    if(symbole(i)==' ')
    x=strcat('esp' ,'   ==>   ', bin);
    else 
        x=strcat(symbole(i) ,'   ==>   ', bin);
    end
  ls=[ls,x];
end
code2 = huffmanenco(char(SIG),m_code); 
tx= (length(char(SIG)*8)-length(m_code))/length(char(SIG)*8);
set(handles.taux_de_huffman,'string',tx);
set(handles.liste_huffman,'string',ls);
% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(~, ~, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
SIG=get(handles.msg,'string');
symbole=unique(char(SIG));
N=length(symbole);
for i=1:length(symbole)
    k=findstr(char(SIG),symbole(i));
    n=length(k);
    pr(i)=n/length(char(SIG));
end 
symboles=double(symbole);
code=ShannonFanoCode(symboles,pr)
ls={};
for i=1:N
    bin=num2str(code{i,2});
    if(symbole(i)==' ')
    x=strcat('esp' ,'   ==>   ', bin);
    else 
    x=strcat(symbole(i) ,'  ==>  ', bin);
    end
  ls=[ls,x];
end
m_code = EntropyEncoder(char(SIG),code)
tx= (length(char(SIG)*8)-length(code))/length(char(SIG)*8);
set(handles.taux_de_shannon,'string',tx);
 set(handles.liste_shannon,'string',ls);

function msg_Callback(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of msg as text
%        str2double(get(hObject,'String')) returns contents of msg as a double


% --- Executes during object creation, after setting all properties.
function msg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function liste_shannon_Callback(hObject, eventdata, handles)
% hObject    handle to liste_shannon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of liste_shannon as text
%        str2double(get(hObject,'String')) returns contents of liste_shannon as a double


% --- Executes during object creation, after setting all properties.
function liste_shannon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to liste_shannon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in liste_huffman.
function liste_huffman_Callback(hObject, eventdata, handles)
% hObject    handle to liste_huffman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns liste_huffman contents as cell array
%        contents{get(hObject,'Value')} returns selected item from liste_huffman


% --- Executes during object creation, after setting all properties.
function liste_huffman_CreateFcn(hObject, eventdata, handles)
% hObject    handle to liste_huffman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function taux_de_shannon_Callback(hObject, eventdata, handles)
% hObject    handle to taux_de_shannon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taux_de_shannon as text
%        str2double(get(hObject,'String')) returns contents of taux_de_shannon as a double


% --- Executes during object creation, after setting all properties.
function taux_de_shannon_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taux_de_shannon (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function taux_de_huffman_Callback(hObject, eventdata, handles)
% hObject    handle to taux_de_huffman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of taux_de_huffman as text
%        str2double(get(hObject,'String')) returns contents of taux_de_huffman as a double


% --- Executes during object creation, after setting all properties.
function taux_de_huffman_CreateFcn(hObject, eventdata, handles)
% hObject    handle to taux_de_huffman (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function resultat_Callback(hObject, eventdata, handles)
% hObject    handle to resultat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultat as text
%        str2double(get(hObject,'String')) returns contents of resultat as a double


% --- Executes during object creation, after setting all properties.
function resultat_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultat (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t_1=get(handles.taux_de_shannon,'string');
t_2=get(handles.taux_de_huffman,'string');
tx_1=str2double(char(t_1));
tx_2=str2double(char(t_2));
if tx_1>tx_2
    set(handles.resultat,'string','impossible');
end
if tx_1<tx_2
    set(handles.resultat,'string','l''algo de huff est plus performant');
end
if tx_1==tx_2
    set(handles.resultat,'string','les deux algos sont equivalents');
end


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.resultat,'string','');
set(handles.liste_huffman,'string','');
set(handles.liste_shannon,'string','');
set(handles.taux_de_huffman,'string','');
set(handles.taux_de_shannon,'string','');
set(handles.msg,'string','');



function path_Callback(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of path as text
%        str2double(get(hObject,'String')) returns contents of path as a double


% --- Executes during object creation, after setting all properties.
function path_CreateFcn(hObject, eventdata, handles)
% hObject    handle to path (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
str=get(handles.path,'string');
imshow(char(str))

% --- Executes on button press in pushbutton7.
function pushbutton7_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.path,'string','');


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes on selection change in vertical.
function vertical_Callback(hObject, eventdata, handles)
% hObject    handle to vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns vertical contents as cell array
%        contents{get(hObject,'Value')} returns selected item from vertical


% --- Executes during object creation, after setting all properties.
function vertical_CreateFcn(hObject, eventdata, handles)
% hObject    handle to vertical (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in horizontal.
function horizontal_Callback(hObject, eventdata, handles)
% hObject    handle to horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns horizontal contents as cell array
%        contents{get(hObject,'Value')} returns selected item from horizontal


% --- Executes during object creation, after setting all properties.
function horizontal_CreateFcn(hObject, eventdata, handles)
% hObject    handle to horizontal (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in zigzag.
function zigzag_Callback(hObject, eventdata, handles)
% hObject    handle to zigzag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns zigzag contents as cell array
%        contents{get(hObject,'Value')} returns selected item from zigzag


% --- Executes during object creation, after setting all properties.
function zigzag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to zigzag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton8.
function pushbutton8_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url=get(handles.path,'string');
imshow(char(url));
% v=vertical(char(url));
% msg=sum(v);
[k,err]=imread(char(url)); 
  u=k(:);
  
  ls2={};
  cmp2=0;
  x2=1;
  maxv=1;
  for i = 1:length(u)-1   
      if u(i)==0
          cmp2=1  ;       
          if u(i)==u(i+1)
              cmp2=x2+1;
              x2=cmp2;
              if maxv<x2
                  maxv=x2;
              end
          else
              x2=1;
              cmp2=0;    
          end
      end
  end
set(handles.vertical,'string',num2str(maxv));
% --- Executes on button press in pushbutton9.
function pushbutton9_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url=get(handles.path,'string');
imshow(char(url));
% h=horizontal(char(url));
% msg=sum(h);
[M,err]=imread(char(url));
M=transpose(M);
M=M(:);
  ls={};
  cmp=0;
  x=1;
  max=1;
  for i = 1:length(M)-1   
      if M(i)==0
          cmp=1  ;       
          if M(i)==M(i+1)
              cmp=x+1;
              x=cmp;
              if max<x
                  max=x;
              end
          else
              x=1;
              cmp=0;    
          end
      end 
  end
set(handles.horizontal,'string',num2str(max));

% --- Executes on button press in pushbutton10.
function pushbutton10_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
url=get(handles.path,'string');
imshow(char(url));
[M,err]=imread(char(url));
 [r,c] = size(M);
  checker = rem(hankel(1:r,r-1+(1:c)),2);
  [rEven,cEven] = find(checker);
  [cOdd,rOdd] = find(~checker.'); 
  rTotal = [rEven; rOdd];
  cTotal = [cEven; cOdd];
  [junk,sortIndex] = sort(rTotal+cTotal);
  rSort = rTotal(sortIndex);
  cSort = cTotal(sortIndex);
  index = sub2ind([r c],rSort,cSort);
  M = M(index);
  ls={};
  cmp=0;
  x=1;
  zig=1;
  for i = 1:length(M)-1   
      if M(i)==0
          cmp=1   ;      
          if M(i)==M(i+1)
              cmp=x+1;
              x=cmp;
              if zig<x
                  zig=x;
              end
          else
              x=1;
              cmp=0;    
          end
      end 
  end
set(handles.zigzag,'string',num2str(zig));



function resultat_2_Callback(hObject, eventdata, handles)
% hObject    handle to resultat_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of resultat_2 as text
%        str2double(get(hObject,'String')) returns contents of resultat_2 as a double


% --- Executes during object creation, after setting all properties.
function resultat_2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to resultat_2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton11.
function pushbutton11_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
t_1=get(handles.vertical,'string');
t_2=get(handles.horizontal,'string');
t_3=get(handles.zigzag,'string');
val1=str2double(char(t_1));
val2=str2double(char(t_2));
val3=str2double(char(t_3));
v=[val1 val2 val3];
m=max(v);
if val1==m
    set(handles.resultat_2,'string','la lecture qui contient chaine la plus longue est la verticale');
end
if val2==m
    set(handles.resultat_2,'string','la lecture chaine  qui contient  la plus longue est l horizontale');
end
if val3==m
    set(handles.resultat_2,'string','la lecture qui contient la chaine la plus longue est la zigzag');
end

function pushbutton12_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton12 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
id=get(handles.choix,'value');
items=get(handles.choix,'string');
choix=items{id};
char(choix)
tf=strcmp(char(choix),'Texte');
tf
if tf==1
    set(handles.msg,'enable','on');
    set(handles.pushbutton2,'enable','on');
    set(handles.pushbutton3,'enable','on');
    set(handles.pushbutton4,'enable','on');
    set(handles.pushbutton5,'enable','on');
    set(handles.pushbutton5,'enable','on');
    set(handles.liste_shannon,'enable','on');
    set(handles.liste_huffman,'enable','on');
    set(handles.taux_de_huffman,'enable','on');
    set(handles.taux_de_shannon,'enable','on');
    set(handles.resultat,'enable','on');
    set(handles.path,'enable','off');
    set(handles.pushbutton6,'enable','off');
    set(handles.pushbutton7,'enable','off');
    set(handles.pushbutton8,'enable','off');
    set(handles.pushbutton9,'enable','off');
    set(handles.pushbutton10,'enable','off');
    set(handles.pushbutton11,'enable','off');
    set(handles.vertical,'enable','off');
    set(handles.horizontal,'enable','off');
    set(handles.zigzag,'enable','off');
    set(handles.resultat_2,'enable','off');
else
    set(handles.path,'enable','on');
    set(handles.pushbutton6,'enable','on');
    set(handles.pushbutton7,'enable','on');
    set(handles.pushbutton8,'enable','on');
    set(handles.pushbutton9,'enable','on');
    set(handles.pushbutton10,'enable','on');
    set(handles.pushbutton11,'enable','on');
    set(handles.vertical,'enable','on');
    set(handles.horizontal,'enable','on');
    set(handles.zigzag,'enable','on');
    set(handles.resultat_2,'enable','on');
    set(handles.msg,'enable','off');
    set(handles.pushbutton2,'enable','off');
    set(handles.pushbutton3,'enable','off');
    set(handles.pushbutton4,'enable','off');
    set(handles.pushbutton5,'enable','off');
    set(handles.pushbutton5,'enable','off');
    set(handles.liste_shannon,'enable','off');
    set(handles.liste_huffman,'enable','off');
    set(handles.taux_de_huffman,'enable','off');
    set(handles.taux_de_shannon,'enable','off');
    set(handles.resultat,'enable','off');
end


% --- Executes on selection change in choix.
function choix_Callback(hObject, eventdata, handles)
% hObject    handle to choix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns choix contents as cell array
%        contents{get(hObject,'Value')} returns selected item from choix


% --- Executes during object creation, after setting all properties.
function choix_CreateFcn(hObject, eventdata, handles)
% hObject    handle to choix (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
