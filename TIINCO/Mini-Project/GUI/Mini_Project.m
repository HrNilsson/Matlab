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

% Last Modified by GUIDE v2.5 06-Mar-2014 10:50:35

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

% GUIData handles initializion:
n = 15; k = 7;
handles.k = k;
handles.n = n;
handles.received = zeros(1,n);
handles.buffer = zeros(1,n);
handles.corrected = zeros(1,n);
handles.syndrome = zeros(1,n-k);
handles.message = zeros(1,k);
handles.genPoly = char(0);
handles.code = zeros(1,n-k);
handles.error = zeros(1,n);

handles.stepping = 0;
% Txt field initialitazion:
set(handles.txtN,'String', mat2str(handles.n));
set(handles.txtK,'String', mat2str(handles.k));

set(handles.txtReceived,'String', mat2str(zeros(1,handles.n)));
set(handles.txtBuffer,'String', mat2str(zeros(1,handles.n)));
set(handles.txtCorrected,'String', mat2str(zeros(1,handles.n)));
set(handles.txtSyndrome,'String', mat2str(zeros(1,handles.n-handles.k)));
set(handles.txtCalcError,'String', mat2str(zeros(1,handles.n)));

set(handles.txtTag,'String', 'Not set');
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

handles.message = str2num(get(hObject,'String'));

% Update handles structure
guidata(hObject,handles);

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
handles.genPoly = sym((get(hObject,'String')));
% Update handles structure
guidata(hObject,handles);

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
handles.error = str2num(get(hObject,'String'));

handles.received = mod(handles.error+handles.code,2);
set(handles.txtReceived,'String', mat2str(handles.received));
% Update handles structure
guidata(hObject,handles);


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
handles.message = randi([0 1],[1,handles.k]);
set(handles.txtMessage,'String', mat2str(handles.message));

% Update handles structure
guidata(hObject,handles);


% --- Executes on button press in btnGenPoly.
function btnGenPoly_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenPoly (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
syms X;
handles.genPoly = 1 + X^4 + X^6 + X^7 + X^8;
set(handles.txtGenPol,'String', char(handles.genPoly));

% Update handles structure
guidata(hObject,handles);

% --- Executes on button press in btnGenCode.
function btnGenCode_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenCode (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.code = cyclicEncode(handles.genPoly,handles.message);

if(~isequal(handles.error,zeros(1,handles.n)))
    handles.received = mod(handles.error+handles.code,2);
    set(handles.txtReceived,'String', mat2str(handles.received));
end
set(handles.txtCode,'String', mat2str(handles.code));
% Update handles structure
guidata(hObject,handles);

% --- Executes on button press in btnGenError.
function btnGenError_Callback(hObject, eventdata, handles)
% hObject    handle to btnGenError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.error = zeros(1,handles.n);
handles.error(randi([1 handles.n])) = 1;
handles.error(randi([1 handles.n])) = 1;
set(handles.txtError,'String', mat2str(handles.error));
handles.received = mod(handles.error+handles.code,2);
set(handles.txtReceived,'String', mat2str(handles.received));
% Update handles structure
guidata(hObject,handles);


% --- Executes on button press in btnRun.
function btnRun_Callback(hObject, eventdata, handles)
% hObject    handle to btnRun (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

cyclicDecodeGUI(handles.received, handles.genPoly, handles.n, handles.k, handles, hObject, 0);


% --- Executes on button press in btnReset.
function btnReset_Callback(hObject, eventdata, handles)
% hObject    handle to btnReset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

handles.stepping = 0;

handles.buffer = zeros(1,handles.n);
handles.syndrome = zeros(1,handles.n-handles.k);

set(handles.txtBuffer,'String', mat2str(zeros(1,handles.n)));
set(handles.txtCorrected,'String', mat2str(zeros(1,handles.n)));
set(handles.txtSyndrome,'String', mat2str(zeros(1,handles.n-handles.k)));
set(handles.txtCalcError,'String', mat2str(zeros(1,handles.n)));
set(handles.txtTag,'String', 'Not set');
set(handles.txtTag,'BackgroundColor', [1 1 1]);

% Update handles structure
guidata(hObject,handles);


% --- Executes on button press in btnStep.
function btnStep_Callback(hObject, eventdata, handles)
% hObject    handle to btnStep (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if(handles.stepping == 1)
    uiresume;
else
    handles.stepping = 1;
    guidata(hObject,handles);
    cyclicDecodeGUI(handles.received, handles.genPoly, handles.n, handles.k, handles, hObject, handles.stepping)
end


function txtN_Callback(hObject, eventdata, handles)
% hObject    handle to txtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtN as text
%        str2double(get(hObject,'String')) returns contents of txtN as a double
handles.n = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function txtN_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtN (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtK_Callback(hObject, eventdata, handles)
% hObject    handle to txtK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtK as text
%        str2double(get(hObject,'String')) returns contents of txtK as a double

handles.k = str2double(get(hObject,'String'));

% Update handles structure
guidata(hObject,handles);


% --- Executes during object creation, after setting all properties.
function txtK_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtK (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function txtCalcError_Callback(hObject, eventdata, handles)
% hObject    handle to txtCalcError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtCalcError as text
%        str2double(get(hObject,'String')) returns contents of txtCalcError as a double


% --- Executes during object creation, after setting all properties.
function txtCalcError_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtCalcError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function txtTag_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Cyclic Meggit decoder 
function cyclicDecodeGUI( receiveVector, genPol, n, k, handles, hObject, stepping)
% Meggit Decoder

r = degree(genPol);
n1 = numel(receiveVector);
k1 = n1-r;
if(n1 ~= n || k1 ~= k)
   error('The received vector and the generator polynomium does not correspond to the values of n and k'); 
end

% Generator polynomium in vector form:
genVec = pol2polvec(genPol);

% 'Registers' initialization:
bufferReg = zeros(1,n);
codeVector = zeros(1,n);
errorVector = zeros(1,n);
syndromeReg = zeros(1,r);
errorDetected = 0;
tag = 'Not set';

errSyndTable = generateErrExpr(n, genPol);

for i = 1:n*2
    % Output codeVector
    codeVector = circshift(codeVector,[1 1]);
    if(i > n)
        codeVector(1) = mod(bufferReg(end) + errorDetected,2);
    end

    %Update syndrome register
    syndromeGate = syndromeReg(end);

    for j = 1:r-1
        syndromeReg(r+1-j) = mod(syndromeReg(r-j) + syndromeGate*genVec(r+1-j),2);
    end
    
    if(i > n)
        syndromeReg(1) = mod(receiveVector(n) + errorDetected + syndromeGate*genVec(1),2);
    else
        syndromeReg(1) = mod(receiveVector(n) + syndromeGate*genVec(1),2);
    end
    
    for j = 1:n
        if(isequal(errSyndTable(j,:),syndromeReg))
            errorDetected = 1;
            if(i >= n)
                errorVector(2*n-i) = 1;
            end
            break;
        end
        errorDetected = 0;
    end

    % Buffer register update
    bufferReg = circshift(bufferReg,[1 1]);
    bufferReg(1) = mod(receiveVector(n) + codeVector(1),2);
    
    % Receive vector update
    receiveVector = circshift(receiveVector,[1 1]);
    receiveVector(1) = 0;
    
    if(stepping == 1 && i ~=2*n)
        %Update GUI
        set(handles.txtBuffer,'String', mat2str(bufferReg));
        set(handles.txtCorrected,'String', mat2str(codeVector));
        set(handles.txtSyndrome,'String', mat2str(syndromeReg));
        set(handles.txtCalcError,'String', mat2str(errorVector));
        set(handles.txtTag,'String', tag);
        set(handles.txtTag,'BackgroundColor', [1 1 1]);
        set(handles.txtDecError,'BackgroundColor', [1 1 1]);
        set(handles.txtDecError,'String', 'Not set.');
        guidata(hObject,handles);
        % GUI wait
        uiwait;
    end
end

if(isequal(syndromeReg,zeros(1,r)))
    tag = 'Correctable';
    set(handles.txtTag,'BackgroundColor', [0 1 0]);
else
    tag = 'Uncorrectable error';
    set(handles.txtTag,'BackgroundColor', [1 0 0]);
end

if(~isequal(handles.code,codeVector) && (strcmp(tag,'Correctable')))
    set(handles.txtDecError,'BackgroundColor', [1 0 0]);
    set(handles.txtDecError,'String', 'Error');
else
    set(handles.txtDecError,'BackgroundColor', [0 1 0]);
    set(handles.txtDecError,'String', 'No error');
end

%Update GUI
set(handles.txtBuffer,'String', mat2str(bufferReg));
set(handles.txtCorrected,'String', mat2str(codeVector));
set(handles.txtSyndrome,'String', mat2str(syndromeReg));
set(handles.txtCalcError,'String', mat2str(errorVector));
set(handles.txtTag,'String', tag);

handles.stepping = 0;
guidata(hObject,handles);



function txtTag_Callback(hObject, eventdata, handles)
% hObject    handle to txtTag (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtTag as text
%        str2double(get(hObject,'String')) returns contents of txtTag as a double


% --- Executes during object creation, after setting all properties.
function txtDecError_CreateFcn(hObject, eventdata, handles)
% hObject    handle to txtDecError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called



function txtDecError_Callback(hObject, eventdata, handles)
% hObject    handle to txtDecError (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of txtDecError as text
%        str2double(get(hObject,'String')) returns contents of txtDecError as a double
