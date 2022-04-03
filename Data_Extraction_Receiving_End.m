function varargout = Data_Extraction_Receiving_End(varargin)

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Data_Extraction_Receiving_End_OpeningFcn, ...
                   'gui_OutputFcn',  @Data_Extraction_Receiving_End_OutputFcn, ...
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



% --- Executes just before Data_Extraction_Receiving_End is made visible.
function Data_Extraction_Receiving_End_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Data_Extraction_Receiving_End (see VARARGIN)

% Choose default command line output for Data_Extraction_Receiving_End
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Data_Extraction_Receiving_End wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Data_Extraction_Receiving_End_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in browse_stego.
function browse_stego_Callback(hObject, eventdata, handles)
% hObject    handle to browse_stego (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
 [filename, pathname] = uigetfile({'*.mp4';'*.avi';'*.jpg';'*.png'},'File Selector');
 
 s11=VideoReader(filename);
 s21=read(s11,200);
 imwrite(s21,'stego_output_frame.png');
 
 %handles.myImage = strcat(pathname, filename);
 handles.myImage = strcat(pathname, 'stego_output_frame.png');
 
 axes(handles.axes1);
 imshow(handles.myImage)
 % save the updated handles object
 guidata(hObject,handles);


% --- Executes on button press in extract_data.
function extract_data_Callback(hObject, eventdata, handles)
% hObject    handle to extract_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
k=extract(handles.myImage);
set(handles.encrypted_text,'String',k)
%m=strrep(m,'a','1');




function pass_Callback(hObject, eventdata, handles)
% hObject    handle to pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of pass as text
%        str2double(get(hObject,'String')) returns contents of pass as a double
%cipher_key=get(hObject,'String');
%set(handles.password,'String',cipher_key);


% --- Executes during object creation, after setting all properties.
function pass_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pass (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end







% --- Executes on button press in decrypt_data.
function decrypt_data_Callback(hObject, eventdata, handles)
% hObject    handle to decrypt_data (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
%m=extract(handles.myImage);
%set(handles.encrypted_text,'String',m)

m=get(handles.encrypted_text,'String');
m=strrep(m,'a','1');
m=strrep(m,'b','2');
m=strrep(m,'c','3');
m=strrep(m,'d','4');
m=strrep(m,'e','5');
m=strrep(m,'f','6');
m=strrep(m,'g','7');
m=strrep(m,'h','8');
m=strrep(m,'i','9');
m=strrep(m,'j','0');
m=strrep(m,'x',' ')
m=str2num(m)
n=size(m);
a1=1;
for i1=n
    a1=a1*i1;
end
abc=sqrt(a1)
input_data=reshape(m,abc,abc);
reps=7;
user_key=get(handles.pass,'String');


final_data=decrypt(input_data,reps,user_key);
si=size(final_data)
a2=1;
for i2=si
    a2=a2*i2;
end
ans1=reshape(final_data,1,a2);
ans1=num2str(ans1);
ac=size(ans1);
    
set(handles.compressed,'String',ans1)


% --- Executes on button press in decompress.
function decompress_Callback(hObject, eventdata, handles)
% hObject    handle to decompress (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
s=get(handles.compressed,'String');
%s=strsplit(s);
%s=str2double(s);
%s1=get(handles.counts,'String');
%s1=strsplit(s1);
%s1=str2double(s1);
%s2=get(handles.length,'String');
%s2=str2double(s2);
%n=arithdecrypt(s,s1,s2,handles);
m=get(handles.encrypted_text,'String');
m=strrep(m,'a','1');
m=strrep(m,'b','2');
m=strrep(m,'c','3');
m=strrep(m,'d','4');
m=strrep(m,'e','5');
m=strrep(m,'f','6');
m=strrep(m,'g','7');
m=strrep(m,'h','8');
m=strrep(m,'i','9');
m=strrep(m,'j','0');
m=strrep(m,'x',' ')
m=str2num(m)

n=size(m);
a1=1;
for i1=n
    a1=a1*i1;
end
abc=sqrt(a1)
input_data=reshape(m,abc,abc);
reps=7;
user_key=get(handles.pass,'String');
%user_key='Subham';


final_data=decrypt(input_data,reps,user_key);
abc=size(final_data);
xx=0;
for i2=abc
    xx=xx+i2
end
xx=xx-1;
xx=xx/7;
xx=reshape(final_data,xx,7)
xx=bi2de(xx);
xx=char(xx);
anx=xx;
xx=size(xx)
aaa=1;
for i4=xx
    aaa=aaa*i4;
end
b=aaa
xx=xx
xx=reshape(anx,1,b);

set(handles.original_seq,'String',xx)
x123=get(handles.original_seq,'String');
set(handles.text13,'String',length(x123));





function counts_Callback(hObject, eventdata, handles)
% hObject    handle to counts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of counts as text
%        str2double(get(hObject,'String')) returns contents of counts as a double


% --- Executes during object creation, after setting all properties.
function counts_CreateFcn(hObject, eventdata, handles)
% hObject    handle to counts (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function length_Callback(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% --- Executes during object creation, after setting all properties.
function length_CreateFcn(hObject, eventdata, handles)
% hObject    handle to length (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in pushbutton6.
function pushbutton6_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x=get(handles.original_seq,'String');
set(handles.text13,'String',length(x));




