global key
color = brick.ColorCode(2);
distance = brick.UltrasonicDist(1);
brick.MoveMotor('AC', -50);
isbrake = true;
num = 0;
temp = 0;
read = 0;
while (color ~= 3)
   disp("Inside of First While loop - Motors On");
   while (isbrake)
     disp("Inside of second While loop - Checking values");
     if (num == 0)
       brick.MoveMotor('AC', -50);
       end
     distance = brick.UltrasonicDist(1);
     brick.SetColorMode(2, 2);
     color = brick.ColorCode(2);
     disp(distance);
     disp(color);
     num = num + 1;
     if(color == 5)
       brick.MoveMotor('ABCD', 0);
       pause(.5);
     else isbrake = true;
     end
   disp("Num:");
   disp(num);
    if (color == 5)
     disp("Inside of second While loop and First if - Stoping if at Light");
     disp("Stop");
     wait = 0;
     while (wait ~= 5)
        wait = wait + 1; 
     end
     disp("Stoped");
     brick.MoveMotor('ABCD', 0);
     color = brick.ColorCode(2);
    end
   
   if (num == 18)
       brick.MoveMotor('A', -50);
       brick.MoveMotor('C', 50); 
       pause(.46);% Turning for First Check
       brick.MoveMotor('ABCD', 0);
       disp("Got inside of if before while");
       read = 0;
       while (read <= 20)% First Reading of Distance
           disp("Got inside of First while");
           read = 1 + read;
           distance1 = brick.UltrasonicDist(1);
           temp = temp + distance1;
       end
       distance1 = temp/20;
       disp(distance1);
       if (distance1 <= 20)% Go back when Wall to close 
       brick.MoveMotor('AC', 50); 
       pause(.2);
       brick.MoveMotor('ABCD', 0);
       end
       brick.MoveMotor('A', 50);% Turn To second Check Pos
       brick.MoveMotor('C', -50); 
       pause(.46);% Time of Turn
       brick.MoveMotor('ABCD', 0);
       pause(.2);
       temp = 0;
       read = 0;
       while (read <= 15)% Second Reading
           disp("Got inside of second while");
           read = 1 + read;
           distance2 = brick.UltrasonicDist(1);
           temp = temp + distance2;
       end       
       distance2 = temp/20;
       disp(distance2);
       if (distance2 <= 15)% Second Check for wall and Back Up
       brick.MoveMotor('AC', 50); 
       pause(.25); % Back Up time
       brick.MoveMotor('ABCD', 0); 
       end
       brick.MoveMotor('A', 50);% Turn for Pos 3
       brick.MoveMotor('C', -50); 
       pause(.46);% Turn Time
       brick.MoveMotor('ABCD', 0);
       pause(.2);
       temp = 0;
       read = 0;
       while (read <= 15)% Third Check
           disp("Got inside of third while");
           read = 1 + read;
           distance3 = brick.UltrasonicDist(1);
           temp = temp + distance3;
       end 
       distance3 = temp/20;
       disp(distance3);
       if (distance3 <= 15)% Check for wall for Back up
       brick.MoveMotor('AC', 50);
       pause(.27);
       brick.MoveMotor('ABCD', 0);
       end
       temp = 0;
       before = 0;
       if (distance1 >= 40 && before == 0)
         disp("Right");
         brick.MoveMotor('A', 50);
         brick.MoveMotor('C', -50); 
         pause(1);
         brick.MoveMotor('ABCD', 0);
         pause(.2);
         %num = 0;
         before = 1;
       end
       if (distance2 >= 40 && before == 0)
         disp("Stright");
         brick.MoveMotor('A', -50);
         brick.MoveMotor('C', 50); 
         pause(.5);
         brick.MoveMotor('ABCD', 0);
         %num = 0;   
         before = 1;
       end   
       if (distance3 >= 40 && before == 0)
         disp("Left");
         %num = 0; 
         before = 1;
       end
       
   end
   if(distance <= 30)
      isbrake = false;
   else isbrake = true;
   end
   %if(color ~= 5)
   %isbrake = false;
   %else isbrake = true;
   %end
    %if (color == 5)
    % disp("Inside of second While loop and First if - Stoping if at Light");
    % disp("Stop");
    % wait = 0;
    % while (wait ~= 5)
    %    wait = wait + 1; 
    % end
    % disp("Stoped");
    % brick.MoveMotor('ABCD', 0);
    % color = brick.ColorCode(2);
    %end
    if (num >= 19)
       num = 0; 
    end

   end
   if (color == 5)
       disp("Inside of second While loop and First if - Stoping if at Light");
       brick.MoveMotor('ABCD', 0);
       color = brick.ColorCode(2);
       End
 
   disp('test one');
  % if (distance <= 30)
  %     disp('test two');
  %    brick.MoveMotor('A', 100);
  %    brick.MoveMotor('C', -100); 
  %    pause(.3);
  %    distance = brick.UltrasonicDist(1);
  %    disp("Inside of second While loop and Second if - Turn left");
  %    disp(distance);
  %    if (distance <= 30)
  %      brick.MoveMotor('A', 100);
  %      brick.MoveMotor('C', -100); 
  %      pause(.3);
  %      distance = brick.UltrasonicDist(1);
  %      disp("Inside of second While loop and Third if - Turn left");
  %      disp(distance);
  %    end
  %      if (distance <= 30)
  %          brick.MoveMotor('A', 100);
  %          brick.MoveMotor('C', -100); 
  %          pause(.3);  
  %          disp("Inside of second While loop and Fourth if - Turn left");
  %      end
  % end
   brick.MoveMotor('AC', -50);
   pause(1);
   while (distance <= 30 && color ~= 5)
       
   distance = brick.UltrasonicDist(1);
   brick.SetColorMode(2, 2);
   color = brick.ColorCode(2);
   num = 0;
   end
   isbrake = true;
end
InitKeyboard();
while 1 
   pause(.1);
   switch key
       case 'downarrow'

           brick.MoveMotor('AC', 100);
           
       case 'uparrow'
           
           brick.MoveMotor('AC', -100);

       case 'leftarrow'
           
           brick.MoveMotor('A', -100);
           brick.MoveMotor('C', 100);

       case 'rightarrow'
           
           brick.MoveMotor('A', 100);
           brick.MoveMotor('C', -100);

       case 'p'
           
           brick.MoveMotor('B', 50);
           
        case 'o'
           
           brick.MoveMotor('B', -30);
           
       case 0
           disp('on')
           brick.MoveMotor('ABCD', 0);
           
       case 'q'
           break;
       
   end
end
CloseKeyboard();