%Data imputation

F = importdata("data.txt");
xax = [10, 20, 50, 100, 200, 300, 500, 1000, 2000, 10000, 20000, 30000, 60000];
for i = 1:13
   yax(i) = lineaverage(F, xax(i)); 
   Aax(i) = meansqerror(F, xax(i)); 
end

% Display
format short g

rax = [transpose(xax) transpose(yax)];
T = array2table(rax,'VariableNames',{'N','\mu'}); T
rax = [transpose(xax) transpose(Aax)];
T = array2table(rax,'VariableNames',{'N','Mean Square'}); T

figure;
stem(xax,yax,'filled',"black");
title("N versus mu_N");
xlabel("N (logarithmic scale)"); ylabel("mu_N");
set(gca, 'XScale', 'log');

figure;
stem(xax,Aax,'filled',"black");
title("N versus A_N");
xlabel("N (logarithmic scale)"); ylabel("A_N");
set(gca, 'XScale', 'log');

function avg = lineaverage(F, N)
    R = N;

    sum = 0;
    i = 1;
    while(i <= R)
        if(~isnan(F(i)))
            F(i);
            sum = sum + F(i);
        else
            R = R + 1;
        end
        i = i + 1;
    end
    
    avg = sum/N;
end

function A_n = meansqerror(F, N)
    R = N;
    avg = lineaverage(F, N);
    
    sum = 0;
    i = 1;
    while(i <= R)
        if(~isnan(F(i)))
            sum = sum + (F(i)-avg).^2;
        else
            R = R + 1;
        end
        i = i + 1;
    end
    
    A_n = sum/N;
end
