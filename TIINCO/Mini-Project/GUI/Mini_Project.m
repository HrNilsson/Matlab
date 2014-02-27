function varargout = Mini_Project(varargin)
% MINI_PROJECT MATLAB code for Mini_Project.fig
%      MINI_PROJECT, by itself, creates a new MINI_PROJECT or raises the existing
%      singleton*.
%
%      H = MINI_PROJECT returns the handle to a new MINI_PROJECT or the handle to
%      the existing singleton*.
%
%      MINI_PROJECT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in MINI_PROJECT.M with the given input arguments.
%
%      MINI_PROJECT('Property','Value',...) creates a new MINI_PROJECT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Mini_Project_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Mini_Project_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Mini_Project

% Last Modified by GUIDE v2.5 27-Feb-2014 11:38:12

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Mini_Project_OpeningFcn, ...
                   'gui_OutputFcn',  @Mini_Project_OutputFcn, ...
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


% --- Executes just before Mini_Project is made visible.
function Mini_Project_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Mini_Project (see VARARGIN)

% Choose default command line output for Mini_Project
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Mini_Project wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Mini_Project_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function txtBuffer_Callback(hObject, eventdata, handles)
% hObject    handle to txtBuffer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtBuffer as text
%        str2double(get(hObject,'String')) returns contents of txtBuffer as a double


% --- Executes during object creation, after setting all properties.
function txtBuffer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtBuffer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtCorrected_Callback(hObject, eventdata, handles)
% hObject    handle to txtCorrected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCorrected as text
%        str2double(get(hObject,'String')) returns contents of txtCorrected as a double


% --- Executes during object creation, after setting all properties.
function txtCorrected_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCorrected (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtReceived_Callback(hObject, eventdata, handles)
% hObject    handle to txtReceived (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtReceived as text
%        str2double(get(hObject,'String')) returns contents of txtReceived as a double


% --- Executes during object creation, after setting all properties.
function txtReceived_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtReceived (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtSyndrome_Callback(hObject, eventdata, handles)
% hObject    handle to txtSyndrome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtSyndrome as text
%        str2double(get(hObject,'String')) returns contents of txtSyndrome as a double


% --- Executes during object creation, after setting all properties.
function txtSyndrome_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtSyndrome (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtMessage_Callback(hObject, eventdata, handles)
% hObject    handle to txtMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtMessage as text
%        str2double(get(hObject,'String')) returns contents of txtMessage as a double


% --- Executes during object creation, after setting all properties.
function txtMessage_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtGenPol_Callback(hObject, eventdata, handles)
% hObject    handle to txtGenPol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtGenPol as text
%        str2double(get(hObject,'String')) returns contents of txtGenPol as a double


% --- Executes during object creation, after setting all properties.
function txtGenPol_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtGenPol (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtCode_Callback(hObject, eventdata, handles)
% hObject    handle to txtCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCode as text
%        str2double(get(hObject,'String')) returns contents of txtCode as a double


% --- Executes during object creation, after setting all properties.
function txtCode_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtError_Callback(hObject, eventdata, handles)
% hObject    handle to txtError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtError as text
%        str2double(get(hObject,'String')) returns contents of txtError as a double


% --- Executes during object creation, after setting all properties.
function txtError_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in btnGenMessage.
function btnGenMessage_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenMessage (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnGenPoly.
function btnGenPoly_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenPoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnGenCode.
function btnGenCode_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnGenError.
function btnGenError_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnRun.
function btnRun_Callback(hObject, eventdata, handles)
% hObject    handle to btnRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in btnStep.
function btnStep_Callback(hObject, eventdata, handles)
% hObject    handle to btnStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
