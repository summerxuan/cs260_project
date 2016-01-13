num_image = size(f,1)
num_point = size(f,2)
for i = 1: num_image
    for j = 1 : 83
        figure(1);
        plot(f(i,(2*j-1)),f(i,(2*j)),'*r');
        hold on;
    end
    
end
