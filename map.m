function map
    hx = [];
    hy = [];
    C = 0;
    MS = 'MakerSize';
    button = 1;
    
    load 
    image(X);
    
    while button == 1
        [x, y, button] = ginput(1);
        C = C+1;
        plot(x, y, '.b', MS, 10)
        plot(x, y, '-')
    end
    
    for ii = 1:C-2
        xs = linspace(x(ii), x(ii+1),10);
        xs(10) = [];
        ys = linspace(y(ii), y(ii+1),10);
        ys(10) = [];
        hx = [hx xs];
        hy = [hy ys];
    end
    
    xs = linspace(x(C-1), x(C), 10);
    ys = linspace(y(C-1), y(C), 10);
    hx = [hx xs];
    hy = [hy ys];
    
    t = 0:(5*(C-1)+1);
    
    px = polyfit(t, hx,10);
    py = polyfit(t, hy,10);
    
    t = linspace(0, 10, 100);
    fx = polyval(px, t);
    fy = polyval(py, t);
    plot(fx, fy)
end
    
        
    