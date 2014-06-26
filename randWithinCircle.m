function [X,Y] = randWithinCircle(radious, size);
%generate normal distributed position for (size) users
%return vectors with position X, Y
r = zeros(size, 1);
X = zeros(size, 1);
Y = zeros(size, 1);
theta = zeros(size, 1);

    for n=1:size
        r(n) = radious*sqrt(rand(1,1));
        theta(n)=2*pi*rand(1,1);
        X(n)=r(n)*cos(theta(n));
        Y(n)=r(n)*sin(theta(n));
    end
    
end 

% to test
%plot(X,Y, 'g.')
%axis([-1.1*radious 1.1*radious -1.1*radious 1.1*radious])
%axis square