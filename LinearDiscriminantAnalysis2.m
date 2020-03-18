% Vector Xi contains 2 elements that are jointly gaussian, Have same variance. Yi{0,1} has varying probability.
F = dlmread('data_2.txt');
p = 0.05;
Mu_0 = [9 ; 10];
Mu_1 = [6 ; 7];
Sigma = [1.15 0.1 ; 0.1 0.5];
SigI = inv(Sigma);
VecBT = transpose(2.*SigI*(Mu_0-Mu_1));
A = transpose(Mu_1-Mu_0)*SigI*(Mu_1+Mu_0)+2.*log((1-p)/p);
for i =1 : length(F)
    Xi = [F(i) ; F(6000+i)];
    LinDis = (VecBT*Xi + A);
    class(i) = (LinDis>=0);
end

figure;
hold on;
for i = 1 : (length(F))
    if (class(i))
        scatter(F(i,1),F(i,2),'.','b');
    else
        scatter(F(i,1),F(i,2),'.','r');
    end

end
    f = @(x,y)VecBT*[x ; y]+A;
    fcontour(f,[0 15 0 15],'-','LineWidth',1,'Levellist',0);
      
    
    
    
    
    
    
