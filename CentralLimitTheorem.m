ns = [1, 2, 3, 4, 5, 10, 20, 30];
for nr = 1 : length(ns)
    Part_D(ns(nr));
end
function Part_A(n)
    t = 10.^4;
    X = 2 + 4.* rand([n t]);
    % Resolve Mn to be 
    Mn = zeros(1,t);
    for i = 1:n
        Mn = Mn + ((X(i,1:t))./n);
    end
    [height,centers] = hist(Mn, (min(Mn) : (1/(n+1)) : max(Mn)));
    
    figure
    subplot(2,1,1)
    pdf = height/trapz(centers,height);
    stem(centers,pdf);
    xlabel('x'); ylabel('f_X (x)');
    legend({'M_n PDF'},'Location','northwest')
    title(['PDF OF M_',num2str(n),' (n = ',num2str(n),')']);
    grid on

    subplot(2,1,2)
    cdf = cumsum(height)/t;
    stem(centers,cdf);
    xlabel('x'); ylabel('F_X (x)');
    legend({'M_n CDF'},'Location','northwest')
    title(['CDF OF M_',num2str(n),' (n = ',num2str(n),')']);
    grid on
end

function Part_C(n)
    t = 10.^4;
    % Equations for Gaussian and Uniform dists
    G = 4 + sqrt(4./(3.*n)).*randn(1,t);
    U = 2 + 4.* rand([n t]);
    
    % Resolve Mn to be
    Mn = zeros(1,t);
    for i = 1:n
        Mn = Mn + ((U(i,1:t))./n);
    end
    
    [height_gauss,centers_gauss] = hist(G, (min(G) : (1/(n+1)) : max(G)));
    [height_uniform,centers_uniform] = hist(Mn, (min(Mn) : (1/(n+1)) : max(Mn)));
    subplot(2,1,1);
    pdf_g = height_gauss/trapz(centers_gauss,height_gauss);
    plot(centers_gauss,pdf_g,'-');
    hold on
    pdf_u = height_uniform/trapz(centers_uniform,height_uniform);
    stem(centers_uniform,pdf_u);
    legend({'Gaussian Distribution Overlay', 'M_n PDF'},'Location','northwest')
    xlabel('x'); ylabel('f_X (x)');
    title(['PDF OF M_',num2str(n),' (n = ',num2str(n),')']);
    hold off
    grid on
    subplot(2,1,2)
    
    cdf_g = cumsum(height_gauss)/t;
    plot(centers_gauss,cdf_g,'-');
    hold on
    cdf_u = cumsum(height_uniform)/t;
    stem(centers_uniform,cdf_u);
    
    legend({'Gaussian Distribution Overlay', 'M_n CDF'},'Location','northwest')
    xlabel('x'); ylabel('F_X (x)');
    title(['[] CDF OF M_',num2str(n),' (n = ',num2str(n),')']);
    hold off
    grid on
end
function Part_D(n);
    t = 10.^4;
    % Equations for Gaussian and Custom dists
    G = 3 + sqrt(12./(7.*n)).*randn(1,t);
    U = randdice([n t]);
    
    % Resolve Mn to be
    Mn = zeros(1,t);
    for i = 1:n
        Mn = Mn + ((U(i,1:t))./n);
    end
    
    [height_gauss,centers_gauss] = hist(G, (min(G) : (1/(n+1)) : max(G)));
    [height_uniform,centers_uniform] = hist(Mn, (min(Mn) : (1/(n+1)) : max(Mn)));
    subplot(2,1,1)
    
    pdf_u = height_uniform/trapz(centers_uniform,height_uniform);
    stem(centers_uniform,pdf_u);
    hold on
    pdf_g = height_gauss/trapz(centers_gauss,height_gauss);
    plot(centers_gauss,pdf_g,'-');
    
    xlabel('x'); ylabel('f_X (x)');
    legend({'Gaussian Distribution Overlay', 'M_n PDF'},'Location','northwest')
    title(['[Weighted Dice] PDF OF M_',num2str(n),' (n = ',num2str(n),')']);
    hold off
    grid on
    
    % CDF
    subplot(2,1,2)
    
    cdf_g = cumsum(height_gauss)/t;
    plot(centers_gauss,cdf_g,'-');
    hold on
    cdf_u = cumsum(height_uniform)/t;
    stem(centers_uniform,cdf_u);
    
    xlabel('x'); ylabel('F_X (x)');
    legend({'Gaussian Distribution Overlay', 'M_n CDF'},'Location','northwest')
    title(['[Weighted Dice] CDF OF M_',num2str(n),' (n = ',num2str(n),')']);
    hold off
    grid on
end

function matrix = randdice(mx)
    size  = 1:5;
    dist  = [1/7 2/7 1/7 2/7 1/7];
    
    matrix = zeros(mx(1),mx(2));
    for column = 1:mx(1)
        for row = 1:mx(2)
            matrix(column,row) = randsample(size,1,true,dist);
        end
    end
end











    
    
    
    
