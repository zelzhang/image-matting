function [P,p] = get_pencil_curve(f,img, output_file_name)
  % GET_PENCIL_CURVE Get a curve (sequence of points) from the user by dragging
  % on the current plot window
  %
  % P = get_pencil_curve()
  % P = get_pencil_curve(f)
  % 
  % Inputs:
  %   f  figure id
  % Outputs:
  %   P  #P by 3 list of points
  %   p  handle to plot
  %
  %
  P = [];
  % Get the input figure or get current one (creates new one if none exist)
  if nargin == 0 || isempty(f)
    f = gcf;
  end
  color = 'w';
  iptsetpref('ImshowBorder','tight');
  
  
  
  
  figure(f), imshow(img);
    

  % get axes of current figure (creates on if doesn't exist)
  a = gca;

  % set equal axis 
  axis equal;
  % freeze axis
  axis manual;
  % set view to XY plane
%  view(2);

  rotate3d off;
  set(gcf,'windowbuttondownfcn',@ondown);
  set(gcf,'keypressfcn',        @onkeypress);
  % living variables
  p = [];

  done = false;
  while(~done)
    drawnow;
  end
  return;
  % We've been also gathering Z coordinate which is meaningless
  P = P(:,1:2);

  % Callback for mouse press
  function ondown(src,ev)
    % Tell window that we'll handle drag and up events
    set(gcf,'windowbuttonmotionfcn', @ondrag);
    set(gcf,'windowbuttonupfcn',     @onup);
    append_current_point();
  end

  % Callback for mouse press
  function ondrag(src,ev)
    append_current_point();
  end

  % Callback for mouse release
  function onup(src,ev)
    
    set(gcf,'windowbuttonmotionfcn', '');
    
    export_fig tmpo.png;
    p=[];
    P=[];
   %finish();
  end

  function onkeypress(src,ev)
    % escape character id
    ESC = char(27);
    switch ev.Character
    case ESC
        'esc'
        if(color == 'w')
            color = 'k'; 
        else
            done = true;
            export_fig tmpo.png;
            imgo = imread('tmpo.png');
            imwrite(imgo, output_file_name);
            return;
        end
    %otherwise
    %  finish();
    %  error(['Unknown key: ' ev.Character]);
    end
  end

  function append_current_point()
    % get current mouse position, and remember old one
    
    cp = get(gca,'currentpoint');
    P = [P;cp(1,:)];
    if isempty(p)
      hold on;
      p = plot(P(:,1),P(:,2), 'LineWidth', 16, 'Color',color);
      hold off;
    else
      set(p,'Xdata',P(:,1),'Ydata',P(:,2), 'Color', color);
    end
    
  end

  function finish()
    done = true;
    set(gcf,'windowbuttonmotionfcn','');
    set(gcf,'windowbuttonupfcn','');
    set(gcf,'windowbuttondownfcn','');
    set(gcf,'keypressfcn','');
  end

end