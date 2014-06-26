% create Users 2D array (users number, cell radious, proportion between regular
% an d2d users (0 = no d2d, 1 = d2d);
% for instance n = 50, radious = 100, d2dProportion = 0.4 (50 users, cell
% radious 100, ~40% D2D users
% penis = createUsers(50,100,0.5);

function [UserArray] = createUsers(n, radious, d2dProportion)

    %UserArray = zeros(n, 4);
    %User Array
    %1 – nr identyfikacyjny
    %2 – wspó³rzêdn¹ x
    %3 - wspó³rzêdn¹ y
    %4 – okreœlenie, czy jest u¿ytkownikiem D2D czy zwyk³ym (np. 0/1)
    
    %normal distributed position for n users and cell radious size
    [X,Y] = randWithinCircle(radious, n);
    
    %Generate d2dUsers and ensure there is even number of them
    d2d = zeros(n, 1); 
    sumD2D = 0;
    d2d = isD2D(n, d2dProportion);
    for i = 1:n
        if(d2d(i) == 1)
            sumD2D = sumD2D + 1;
        end
    end
    
    %If odd number of d2d, find first d2d user and reset it's d2d flag
    if(mod(sumD2D, 2) ~= 0)
        counter = 1;
        while(d2d(counter) ~= 1)
            counter = counter + 1;
        end
        d2d(counter) = 0;
    end
    
    %Fulfill the users table with user objects
    for i = 1: n
        UserArray(i) = User(i, X(i), Y(i), d2d(i));
    end
    

end