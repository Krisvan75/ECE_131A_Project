% Jointly Gaussian Random Variables have different Variance, Yi{0,1} has equal probability of 1/2.
F = dlmread('data_3.txt');
p = 0.05;
Mu_0 = [9 ; 10];
Mu_1 = [6 ; 7];
Sigma = [1.15 0.1 ; 0.1 0.5];
Sigma1 = [0.2 0.3 ; 0.3 2];
SigI = inv(Sigma);
Sig1I= inv(Sigma1);
VecBT = transpose(2.*(SigI*Mu_0 - Sig1I*Mu_1));
C = Sig1I-SigI;
A = (Mu_1'*Sig1I*Mu_1)-(Mu_0'*SigI*Mu_0)+log(det(Sig1I)/det(SigI))+2*log((1-p)./p);
for i =1 : length(F)
    Xi = [F(i) ; F(6000+i)];
    LinDis = (Xi'*C*Xi+VecBT*Xi + A);
    class(i) = (LinDis>=0);
end

figure;
hold on;
for i = 1 : (length(F)-5980)
    if (class(i))
        scatter(F(i,1),F(i,2),'.','b');
    else
        scatter(F(i,1),F(i,2),'.','r');
    end

end
f = @(x,y) [x y]*C*[x y]' + VecBT*[x y]' + A;
fcontour(f,[0 15 0 15], 'Levellist', 0);
   
      
    
    
    
    
    
    
