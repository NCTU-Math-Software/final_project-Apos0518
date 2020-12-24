% Input: None
% Output: 顯示圖片，並且在使用者點選行經的節點之後顯示路徑
function map
    tx = []; % 作為儲存x座標的向量
    ty = []; % 作為儲存y座標的向量
    hx = []; % 將tx分割成更多的點之後，以此儲存
    hy = []; % 將ty分割成更多的點之後，以此儲存
    C = -1; % 計算次數的初值
    figure('name', 'map', 'outerposition', get(0, 'screensize')) % 視窗大小
    MS = 'MarkerSize'; % 線段寬度
    button = 1; % 用以進入迴圈
    
    X = imread('NCTU.jpg'); % 存取圖片
    image(X) % 顯示圖片
    hold on % 保留圖片
    
    while button == 1 % 按下滑鼠左鍵時，得以繼續點選
        [x, y, button] = ginput(1); % 存取滑鼠的點選
        plot(x, y, '.', MS, 3) % 畫出點擊的點
        C = C+1; % 計算滑鼠點選左鍵的次數
        tx = [tx x]; % 儲存x座標
        ty = [ty y]; % 儲存y座標
    end
    
    % 若左鍵點選的次數低於兩次，則中止程式
    if (C == 0) || (C == 1)
        close % 關閉圖片
        return;
    else
        % 將起點至倒數第二個點之間的線段進行分割
        for ii = 1:C-2
            xs = linspace(tx(ii), tx(ii+1),10); % 分割線段
            xs(10) = []; % 避免同個點被存取兩次
            ys = linspace(ty(ii), ty(ii+1),10); % 分割線段
            ys(10) = []; % 避免同個點被存取兩次
            hx = [hx xs]; % 儲存xs
            hy = [hy ys]; % 儲存ys
        end

        xs = linspace(tx(C-1), tx(C), 10); % 分割線段
        ys = linspace(ty(C-1), ty(C), 10); % 分割線段
        hx = [hx xs]; % 儲存xs
        hy = [hy ys]; % 儲存ys

        t = 1:(9*(C-2) + 10); % hx及hy各自存取的點的個數
        
        % 提高路線的精準度
        if C < 5
            px = polyfit(t, hx, 5); % 為hx內的點找出多項式
            py = polyfit(t, hy, 5); % 為hy內的點找出多項式
        elseif (C >= 5) && (C < 10)
            px = polyfit(t, hx, 7); % 為hx內的點找出多項式
            py = polyfit(t, hy, 7); % 為hy內的點找出多項式
        elseif (C >= 10) && (C < 15)
            px = polyfit(t, hx, 13); % 為hx內的點找出多項式
            py = polyfit(t, hy, 13); % 為hy內的點找出多項式
        else
            px = polyfit(t, hx, 17); % 為hx內的點找出多項式
            py = polyfit(t, hy, 17); % 為hy內的點找出多項式
        end
            
        s = linspace(1, (9*(C-2) + 10), 100); % 分割t
        fx = polyval(px, s); % 解方程式px 
        fy = polyval(py, s); % 解方程式py
        plot(fx, fy,'k', MS, 10) % 作圖
    end
end
