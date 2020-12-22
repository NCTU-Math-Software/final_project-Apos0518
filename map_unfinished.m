function map
    hx = [];
    hy = [];
    C = 0;
    MS = 'MakerSize';
    button = 1;
    
    imread(); 
    image(X);
    
    function map
    tx = []; % 作為儲存x座標的向量
    ty = []; % 作為儲存y座標的向量
    hx = []; %
    hy = [];
    C = -1;
    figure('position',[200,200,800,800])
    MS = 'MarkerSize';
    button = 1;
    
    X = imread('NCTU.jpg');
    image(X)
    hold on
    
    while button == 1
        [x, y, button] = ginput(1);
        C = C+1;
        tx = [tx x];
        ty = [ty y];
    end
    
    
    for ii = 1:C-2
        xs = linspace(tx(ii), tx(ii+1),10);
        xs(10) = [];
        ys = linspace(ty(ii), ty(ii+1),10);
        ys(10) = [];
        hx = [hx xs];
        hy = [hy ys];
    end
    
    xs = linspace(tx(C-1), tx(C), 10);
    ys = linspace(ty(C-1), ty(C), 10);
    hx = [hx xs];
    hy = [hy ys];
    
    t = 1:(9*(C-2) + 10);
    
    px = polyfit(t, hx, 20);
    py = polyfit(t, hy, 20);
    
    s = linspace(1, (9*(C-2) + 10), 100);
    fx = polyval(px, s);
    fy = polyval(py, s);
    plot(fx, fy,'-', MS, 2)
end
    
        
    
