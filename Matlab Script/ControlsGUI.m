function varargout = ControlsGUI(varargin)
% CONTROLSGUI MATLAB code for ControlsGUI.fig
%      CONTROLSGUI, by itself, creates a new CONTROLSGUI or raises the existing
%      singleton*.
%
%      H = CONTROLSGUI returns the handle to a new CONTROLSGUI or the handle to
%      the existing singleton*.
%
%      CONTROLSGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in CONTROLSGUI.M with the given input arguments.
%
%      CONTROLSGUI('Property','Value',...) creates a new CONTROLSGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before ControlsGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to ControlsGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help ControlsGUI

% Last Modified by GUIDE v2.5 05-Sep-2017 05:18:25

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @ControlsGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @ControlsGUI_OutputFcn, ...
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


% --- Executes just before ControlsGUI is made visible.
function ControlsGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to ControlsGUI (see VARARGIN)

% Choose default command line output for ControlsGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes ControlsGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = ControlsGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



function tempField_Callback(hObject, eventdata, handles)
% hObject    handle to tempField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of tempField as text
%        str2double(get(hObject,'String')) returns contents of tempField as a double


% --- Executes during object creation, after setting all properties.
function tempField_CreateFcn(hObject, eventdata, handles)
% hObject    handle to tempField (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in applyTempButton.
function applyTempButton_Callback(hObject, eventdata, handles)
% hObject    handle to applyTempButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
temp = str2double(get(handles.tempField, 'string'));

arduino=serial('COM5','BaudRate',9600); % create serial communication object on port COM4
fopen(arduino); % initiate arduino communication
fprintf(arduino,'%s',char(temp)); % send answer variable content to arduino
fclose(arduino); % end communication with arduino

PIDFAN
