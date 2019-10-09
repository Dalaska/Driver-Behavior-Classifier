%==========================================================================
%                                 plot primitives  
% 1. plot speed, throttle, acceleration and brake 
% 2. color coding the events
%==========================================================================

figure(1)
hold on
plot( time,speed,'k','linewidth',2)
plot( time,throttle/2)
plot( time,-5+brake*5,'linewidth',1)
plot( time,acel*10,'r')
plot( [-1 -2],[0 0],'b','linewidth',2)
plot( [-1 -2],[0 0],'m','linewidth',2)
xlabel('time sec')
ylabel('speed mph')
legend('speed','throttle','braking','accelerating','micro-trip start','micro-trip end')

hgt = max(speed); % height of block
tp = 0.4; % transparency
for n=1:length(p_list)
    if p_list(n,5)>0
        start_pos = p_list(n,3); %start position
        stop_pos = p_list(n,4); %stop positon
        x = [time(start_pos), time(stop_pos), time(stop_pos), time(start_pos)]; %time   
        y = [0, 0, hgt, hgt];
        switch p_list(n,2)   
            case 1
                f=fill(x, y, 'r', 'FaceAlpha', tp); % accelerating - red
            case 2
                f=fill(x, y, 'y', 'FaceAlpha', tp); % sustain - yellow
            case 3
                f=fill(x, y, 'g', 'FaceAlpha', tp); % coasting - green
            case 4
                f=fill(x, y, 'b', 'FaceAlpha', tp); % decelerating - blue
            case 5
                f=fill(x, y, 'k', 'FaceAlpha', tp); % idle - black
        end
        set(f,'EdgeColor','none')
    end
end
axis([0 time(end) -10 70])