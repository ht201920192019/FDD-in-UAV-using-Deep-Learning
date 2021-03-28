

% sim('parrotMinidroneWaypointFollower.slx')
noise_weight  = Sensors.IMU.noiseWeights
new_noise_weight = noise_weight+noise_weight*0.05
Sensors.IMU.noiseWeights = new_noise_weight;

wp= meteorites()
waypoint = wp


function wp = meteorites()
p= []
q= []
wp=[]
point=[]
count= 0
for i = 1:20
    angle = unifrnd(0, 2 * pi) ;
    distance = sqrt(unifrnd(4, 12.25));
    x= int8(distance * cos(angle));
    y= int8(distance * sin(angle));
    
    if(x== 0 && y== 0)
        continue
    else
        count=count+1;
        point = cat(2,x,y,-1)
        wp = vertcat(wp,point)
        wp = double(wp)
    end
    
    if count == 13
       break
    end  

end
end


