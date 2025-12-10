classdef GUI_3_exported < matlab.apps.AppBase

    % Properties that correspond to app components
    properties (Access = public)
        UIFigure                    matlab.ui.Figure
        GripperSwitch               matlab.ui.control.Switch
        GripperSwitchLabel          matlab.ui.control.Label
        Image                       matlab.ui.control.Image
        DisconnectButton            matlab.ui.control.Button
        ConnectButton               matlab.ui.control.Button
        Joint_5Slider               matlab.ui.control.Slider
        Joint_5SliderLabel          matlab.ui.control.Label
        Joint_4Slider               matlab.ui.control.Slider
        Joint_4SliderLabel          matlab.ui.control.Label
        Joint_3Slider               matlab.ui.control.Slider
        Joint_3SliderLabel          matlab.ui.control.Label
        Joint_2Slider               matlab.ui.control.Slider
        Joint_2SliderLabel          matlab.ui.control.Label
        Joint_1Slider               matlab.ui.control.Slider
        Joint_1SliderLabel          matlab.ui.control.Label
        Wheels_rotateSlider         matlab.ui.control.Slider
        Wheels_rotateSliderLabel    matlab.ui.control.Label
        Wheels_straightSlider       matlab.ui.control.Slider
        Wheels_straightSliderLabel  matlab.ui.control.Label
    end

    
    properties (Access = public)
        sim % Description
    end
    

    % Callbacks that handle component events
    methods (Access = private)

        % Button pushed function: ConnectButton
        function ConnectButtonPushed(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end

            [returnCode, joint_1]=app.sim.simxGetObjectHandle(clientID, 'joint1', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_1, 0, app.sim.simx_opmode_streaming);
            [returnCode, joint_2]=app.sim.simxGetObjectHandle(clientID, 'joint2', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_2, 0, app.sim.simx_opmode_streaming);
            [returnCode, joint_3]=app.sim.simxGetObjectHandle(clientID, 'joint3', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_3, 0, app.sim.simx_opmode_streaming);
            [returnCode, joint_4]=app.sim.simxGetObjectHandle(clientID, 'joint4', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_4, 0, app.sim.simx_opmode_streaming);
            [returnCode, joint_5]=app.sim.simxGetObjectHandle(clientID, 'joint5', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_5, 0, app.sim.simx_opmode_streaming);

        end

        % Button pushed function: DisconnectButton
        function DisconnectButtonPushed(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end
            vel = 0;

            [returnCode, wheel_1]=app.sim.simxGetObjectHandle(clientID,'wheel1',app.sim.simx_opmode_blocking);
            [returnCode, wheel_2]=app.sim.simxGetObjectHandle(clientID,'wheel2',app.sim.simx_opmode_blocking);
            [returnCode, wheel_3]=app.sim.simxGetObjectHandle(clientID,'wheel3',app.sim.simx_opmode_blocking);
            [returnCode, wheel_4]=app.sim.simxGetObjectHandle(clientID,'wheel4',app.sim.simx_opmode_blocking);

            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_1,vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_2,vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_3,vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_4,vel, app.sim.simx_opmode_streaming);

            disp('simulation stopped');
        end

        % Value changed function: Wheels_straightSlider
        function Wheels_straightSliderValueChanged(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end

            vel = app.Wheels_straightSlider.Value;

            [returnCode, wheel_1]=app.sim.simxGetObjectHandle(clientID,'wheel1',app.sim.simx_opmode_blocking);
            [returnCode, wheel_2]=app.sim.simxGetObjectHandle(clientID,'wheel2',app.sim.simx_opmode_blocking);
            [returnCode, wheel_3]=app.sim.simxGetObjectHandle(clientID,'wheel3',app.sim.simx_opmode_blocking);
            [returnCode, wheel_4]=app.sim.simxGetObjectHandle(clientID,'wheel4',app.sim.simx_opmode_blocking);

            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_1,vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_2,vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_3,vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_4,vel, app.sim.simx_opmode_streaming);
            
        end

        % Value changed function: Wheels_rotateSlider
        function Wheels_rotateSliderValueChanged(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end

            vel = app.Wheels_rotateSlider.Value;

            [returnCode, wheel_1]=app.sim.simxGetObjectHandle(clientID,'wheel1',app.sim.simx_opmode_blocking);
            [returnCode, wheel_2]=app.sim.simxGetObjectHandle(clientID,'wheel2',app.sim.simx_opmode_blocking);
            [returnCode, wheel_3]=app.sim.simxGetObjectHandle(clientID,'wheel3',app.sim.simx_opmode_blocking);
            [returnCode, wheel_4]=app.sim.simxGetObjectHandle(clientID,'wheel4',app.sim.simx_opmode_blocking);

            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_1,vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_2,-vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_3,-vel, app.sim.simx_opmode_streaming);
            [returnCode] = app.sim.simxSetJointTargetVelocity(clientID,wheel_4,vel, app.sim.simx_opmode_streaming);
            
        end

        % Value changed function: Joint_1Slider
        function Joint_1SliderValueChanged(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end

            pos1 = app.Joint_1Slider.Value;
            [returnCode, joint_1]=app.sim.simxGetObjectHandle(clientID, 'joint1', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_1, pos1*(pi/180), app.sim.simx_opmode_streaming);
        end

        % Value changed function: Joint_2Slider
        function Joint_2SliderValueChanged(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end

            pos2 = app.Joint_2Slider.Value;
            [returnCode, joint_2]=app.sim.simxGetObjectHandle(clientID, 'joint2', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_2, pos2*(pi/180), app.sim.simx_opmode_streaming);
            
        end

        % Value changed function: Joint_3Slider
        function Joint_3SliderValueChanged(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end

            pos3 = app.Joint_3Slider.Value;
            [returnCode, joint_3]=app.sim.simxGetObjectHandle(clientID, 'joint3', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_3, pos3*(pi/180), app.sim.simx_opmode_streaming);
            
        end

        % Value changed function: Joint_4Slider
        function Joint_4SliderValueChanged(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end

            pos4 = app.Joint_4Slider.Value;
            [returnCode, joint_4]=app.sim.simxGetObjectHandle(clientID, 'joint4', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_4, pos4*(pi/180), app.sim.simx_opmode_streaming);
            
        end

        % Value changed function: Joint_5Slider
        function Joint_5SliderValueChanged(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID = app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to remote API server');
            else
                   disp('Failed Connecting to Remote API');
            end

            pos5 = app.Joint_5Slider.Value;
            [returnCode, joint_5]=app.sim.simxGetObjectHandle(clientID, 'joint5', app.sim.simx_opmode_blocking);
            [returnCode] = app.sim.simxSetJointTargetPosition(clientID, joint_5, pos5*(pi/180), app.sim.simx_opmode_streaming);
        end

        % Image clicked function: Image
        function ImageClicked(app, event)
            sim=remApi('remoteApi'); 
            app.sim.simxFinish(-1); 
            clientID=app.sim.simxStart('127.0.0.1',19999,true,true,5000,5);
            if (clientID>-1)
                disp('Connected to remote API server');
            else
                disp('Failed Connecting to Remote API');
            end
            for i=1:3
            [errorCode, cam_handle] = app.sim.simxGetObjectHandle(clientID,'Vision_sensor',app.sim.simx_opmode_oneshot_wait);
            [errorCode, resolution, image] = app.sim.simxGetVisionSensorImage2(clientID, cam_handle, 0, app.sim.simx_opmode_streaming);
            end
            imshow(image);
            imwrite(image, "SceneView.jpg");
        end

        % Value changed function: GripperSwitch
        function GripperSwitchValueChanged(app, event)
            app.sim = remApi('remoteApi');
            app.sim.simxFinish(-1);
            clientID =app.sim.simxStart('127.0.0.1',19997,true,true,5000,5);
            if(clientID>-1)
                   disp('Connected to V-REP');

                [returnCode,gripper_joint1]=app.sim.simxGetObjectHandle(clientID,'gripper1',app.sim.simx_opmode_blocking); 
                [returnCode,gripper_joint2]=app.sim.simxGetObjectHandle(clientID,'gripper2', app.sim.simx_opmode_blocking);

            if strcmp(app.GripperSwitch.Value, 'UnHold')
                [returnCode]= app.sim.simxSetJointTargetVelocity(clientID,gripper_joint2,-0.04, app.sim.simx_opmode_oneshot_wait);
            else
                [returnCode]= app.sim.simxSetJointTargetVelocity(clientID,gripper_joint2,0.04, app.sim.simx_opmode_oneshot_wait);
            end 
                [~,j2]= app.sim.simxGetJointPosition(clientID,gripper_joint2,app.sim.simx_opmode_blocking);  
                [returnCode]= app.sim.simxSetJointTargetPosition(clientID,gripper_joint1,j2*0.02,app.sim.simx_opmode_oneshot_wait); 
                    
                
           app.sim.simxFinish(-1);
             else
                disp('Failed connecting to V-REP remote API server');
             return
             end          
             
            app.sim.delete(); % call the destructor!    
            disp('Program ended');
            
        end
    end

    % Component initialization
    methods (Access = private)

        % Create UIFigure and components
        function createComponents(app)

            % Create UIFigure and hide until all components are created
            app.UIFigure = uifigure('Visible', 'off');
            app.UIFigure.Position = [100 100 640 480];
            app.UIFigure.Name = 'MATLAB App';

            % Create Wheels_straightSliderLabel
            app.Wheels_straightSliderLabel = uilabel(app.UIFigure);
            app.Wheels_straightSliderLabel.HorizontalAlignment = 'right';
            app.Wheels_straightSliderLabel.FontWeight = 'bold';
            app.Wheels_straightSliderLabel.FontColor = [0 0 1];
            app.Wheels_straightSliderLabel.Position = [33 410 98 22];
            app.Wheels_straightSliderLabel.Text = 'Wheels_straight';

            % Create Wheels_straightSlider
            app.Wheels_straightSlider = uislider(app.UIFigure);
            app.Wheels_straightSlider.Limits = [-2 2];
            app.Wheels_straightSlider.MajorTicks = [-2 -1 0 1 2];
            app.Wheels_straightSlider.ValueChangedFcn = createCallbackFcn(app, @Wheels_straightSliderValueChanged, true);
            app.Wheels_straightSlider.Position = [152 419 150 3];

            % Create Wheels_rotateSliderLabel
            app.Wheels_rotateSliderLabel = uilabel(app.UIFigure);
            app.Wheels_rotateSliderLabel.HorizontalAlignment = 'right';
            app.Wheels_rotateSliderLabel.FontWeight = 'bold';
            app.Wheels_rotateSliderLabel.FontColor = [0 0 1];
            app.Wheels_rotateSliderLabel.Position = [322 410 87 22];
            app.Wheels_rotateSliderLabel.Text = 'Wheels_rotate';

            % Create Wheels_rotateSlider
            app.Wheels_rotateSlider = uislider(app.UIFigure);
            app.Wheels_rotateSlider.Limits = [-2 2];
            app.Wheels_rotateSlider.MajorTicks = [-2 -1 0 1 2];
            app.Wheels_rotateSlider.ValueChangedFcn = createCallbackFcn(app, @Wheels_rotateSliderValueChanged, true);
            app.Wheels_rotateSlider.Position = [430 419 150 3];

            % Create Joint_1SliderLabel
            app.Joint_1SliderLabel = uilabel(app.UIFigure);
            app.Joint_1SliderLabel.HorizontalAlignment = 'right';
            app.Joint_1SliderLabel.FontWeight = 'bold';
            app.Joint_1SliderLabel.Position = [37 165 47 22];
            app.Joint_1SliderLabel.Text = 'Joint_1';

            % Create Joint_1Slider
            app.Joint_1Slider = uislider(app.UIFigure);
            app.Joint_1Slider.Limits = [-180 180];
            app.Joint_1Slider.Orientation = 'vertical';
            app.Joint_1Slider.ValueChangedFcn = createCallbackFcn(app, @Joint_1SliderValueChanged, true);
            app.Joint_1Slider.Position = [60 195 3 150];

            % Create Joint_2SliderLabel
            app.Joint_2SliderLabel = uilabel(app.UIFigure);
            app.Joint_2SliderLabel.HorizontalAlignment = 'right';
            app.Joint_2SliderLabel.FontWeight = 'bold';
            app.Joint_2SliderLabel.Position = [131 165 47 22];
            app.Joint_2SliderLabel.Text = 'Joint_2';

            % Create Joint_2Slider
            app.Joint_2Slider = uislider(app.UIFigure);
            app.Joint_2Slider.Limits = [-60 60];
            app.Joint_2Slider.Orientation = 'vertical';
            app.Joint_2Slider.ValueChangedFcn = createCallbackFcn(app, @Joint_2SliderValueChanged, true);
            app.Joint_2Slider.Position = [154 195 3 150];

            % Create Joint_3SliderLabel
            app.Joint_3SliderLabel = uilabel(app.UIFigure);
            app.Joint_3SliderLabel.HorizontalAlignment = 'right';
            app.Joint_3SliderLabel.FontWeight = 'bold';
            app.Joint_3SliderLabel.Position = [218 165 47 22];
            app.Joint_3SliderLabel.Text = 'Joint_3';

            % Create Joint_3Slider
            app.Joint_3Slider = uislider(app.UIFigure);
            app.Joint_3Slider.Limits = [-120 90];
            app.Joint_3Slider.Orientation = 'vertical';
            app.Joint_3Slider.ValueChangedFcn = createCallbackFcn(app, @Joint_3SliderValueChanged, true);
            app.Joint_3Slider.Position = [241 195 3 150];

            % Create Joint_4SliderLabel
            app.Joint_4SliderLabel = uilabel(app.UIFigure);
            app.Joint_4SliderLabel.HorizontalAlignment = 'right';
            app.Joint_4SliderLabel.FontWeight = 'bold';
            app.Joint_4SliderLabel.Position = [305 165 47 22];
            app.Joint_4SliderLabel.Text = 'Joint_4';

            % Create Joint_4Slider
            app.Joint_4Slider = uislider(app.UIFigure);
            app.Joint_4Slider.Limits = [-120 120];
            app.Joint_4Slider.Orientation = 'vertical';
            app.Joint_4Slider.ValueChangedFcn = createCallbackFcn(app, @Joint_4SliderValueChanged, true);
            app.Joint_4Slider.Position = [328 195 3 150];

            % Create Joint_5SliderLabel
            app.Joint_5SliderLabel = uilabel(app.UIFigure);
            app.Joint_5SliderLabel.HorizontalAlignment = 'right';
            app.Joint_5SliderLabel.FontWeight = 'bold';
            app.Joint_5SliderLabel.Position = [395 165 47 22];
            app.Joint_5SliderLabel.Text = 'Joint_5';

            % Create Joint_5Slider
            app.Joint_5Slider = uislider(app.UIFigure);
            app.Joint_5Slider.Limits = [-90 90];
            app.Joint_5Slider.Orientation = 'vertical';
            app.Joint_5Slider.ValueChangedFcn = createCallbackFcn(app, @Joint_5SliderValueChanged, true);
            app.Joint_5Slider.Position = [418 195 3 150];

            % Create ConnectButton
            app.ConnectButton = uibutton(app.UIFigure, 'push');
            app.ConnectButton.ButtonPushedFcn = createCallbackFcn(app, @ConnectButtonPushed, true);
            app.ConnectButton.FontWeight = 'bold';
            app.ConnectButton.FontColor = [0.0706 0.7098 0.0706];
            app.ConnectButton.Position = [118 74 100 22];
            app.ConnectButton.Text = 'Connect';

            % Create DisconnectButton
            app.DisconnectButton = uibutton(app.UIFigure, 'push');
            app.DisconnectButton.ButtonPushedFcn = createCallbackFcn(app, @DisconnectButtonPushed, true);
            app.DisconnectButton.FontWeight = 'bold';
            app.DisconnectButton.FontColor = [0.9098 0 0];
            app.DisconnectButton.Position = [408 74 100 22];
            app.DisconnectButton.Text = 'Disconnect';

            % Create Image
            app.Image = uiimage(app.UIFigure);
            app.Image.ImageClickedFcn = createCallbackFcn(app, @ImageClicked, true);
            app.Image.Position = [271 35 100 100];

            % Create GripperSwitchLabel
            app.GripperSwitchLabel = uilabel(app.UIFigure);
            app.GripperSwitchLabel.HorizontalAlignment = 'center';
            app.GripperSwitchLabel.FontWeight = 'bold';
            app.GripperSwitchLabel.FontColor = [0.851 0.3255 0.098];
            app.GripperSwitchLabel.Position = [528 230 49 22];
            app.GripperSwitchLabel.Text = 'Gripper';

            % Create GripperSwitch
            app.GripperSwitch = uiswitch(app.UIFigure, 'slider');
            app.GripperSwitch.ValueChangedFcn = createCallbackFcn(app, @GripperSwitchValueChanged, true);
            app.GripperSwitch.Position = [528 267 45 20];

            % Show the figure after all components are created
            app.UIFigure.Visible = 'on';
        end
    end

    % App creation and deletion
    methods (Access = public)

        % Construct app
        function app = GUI_3_exported

            % Create UIFigure and components
            createComponents(app)

            % Register the app with App Designer
            registerApp(app, app.UIFigure)

            if nargout == 0
                clear app
            end
        end

        % Code that executes before app deletion
        function delete(app)

            % Delete UIFigure when app is deleted
            delete(app.UIFigure)
        end
    end
end