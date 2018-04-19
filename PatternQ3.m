
load samples.mat;
[n,m] = size(samples);
pw = [0.5 ,0.5, 0; (1/3), (1/3), (1/3); 0.8, 0.1, 0.1];
%Q3a and Q3b%
%create the Dichomotor and calculate training error
%class 1 sample
error = 0;
x1W = [samples(:,1), samples(1:10, 1+3), samples(:, 1+3*2)];
p = pw(1,:);
for i=1:10
    x0 = samples(i, 1);    
    c = dichotomizer(x0, x1W, p);
    if c ~= 1
        error = error + 1;
    end
end
%class 2 sample
for i=1:10
    x0 = samples(i, 4);    
    c = dichotomizer(x0, x1W, p);
    if c ~= 2
        error = error + 1;
    end
end
%class 3 sample
% for i=1:10
%     x0 = samples(i, 7);
%     x1W = [samples(:,1), samples(:, 1+3), samples(:, 1+3*2)];
%     p = pw(1,:);
%     c = dichotomizer(x0, x1W, p);
%     if c ~= 3
%         error = error + 1;
%     end
% end
error_rate = error/20;
fprintf("The error rate with Q3.b is: %f\n", error_rate);


%Q3c%
%2 features
error = 0;
x12W = [samples(:,1:2), samples(:, 1+3:2+3), samples(:, 1+3*2:2+3*2)];
for i=1:10
    x0 = samples(i, 1:2);    
    c = dichotomizer(x0, x12W, p);
    if c ~= 1
        error = error + 1;
    end
end
%class 2 sample
for i=1:10
    x0 = samples(i, 4:5);
    c = dichotomizer(x0, x12W, p);
    if c ~= 2
        error = error + 1;
    end
end
%class 3 sample
% for i=1:10
%     x0 = samples(i, 7:8);
%     x1W = [samples(:,1:2), samples(:, 1+3:2+3), samples(:, 1+3*2:2+3*2)];
%     p = pw(1,:);
%     c = dichotomizer(x0, x1W, p);
%     if c ~= 3
%         error = error + 1;
%     end
% end
error_rate = error/20;
fprintf("The error rate of 2 features in Q3.c is: %f\n", error_rate);

%2 features 2&3
error = 0;
x23W = [samples(:,2:3), samples(:, 2+3:3+3), samples(:, 2+3*2:3+3*2)];
for i=1:10
    x0 = samples(i, 2:3);
    c = dichotomizer(x0, x23W, p);
    if c ~= 1
        error = error + 1;
    end
end
%class 2 sample
for i=1:10
    x0 = samples(i, 5:6);
    c = dichotomizer(x0, x23W, p);
    if c ~= 2
        error = error + 1;
    end
end
%class 3 sample
% for i=1:10
%     x0 = samples(i, 7:8);
%     x1W = [samples(:,1:2), samples(:, 1+3:2+3), samples(:, 1+3*2:2+3*2)];
%     p = pw(1,:);
%     c = dichotomizer(x0, x1W, p);
%     if c ~= 3
%         error = error + 1;
%     end
% end
error_rate = error/20;
fprintf("The error rate of 2 (x2, x3) features in Q3.c is: %f\n", error_rate);

%2 features 1&3
error = 0;
x13W = [samples(:,1),samples(:,3), samples(:,4), samples(:,6), samples(:,7),samples(:, 9)];
for i=1:10
    x0 = [samples(i, 1), samples(i, 3)];
    c = dichotomizer(x0, x13W, p);
    if c ~= 1
        error = error + 1;
    end
end
%class 2 sample
for i=1:10
    x0 = [samples(i, 4), samples(i, 6)];
    x1W = [samples(:,1),samples(:,3), samples(:,4), samples(:,6), samples(:,7),samples(:, 9)];
    c = dichotomizer(x0, x13W, p);
    if c ~= 2
        error = error + 1;
    end
end
%class 3 sample
% for i=1:10
%     x0 = samples(i, 7:8);
%     x1W = [samples(:,1:2), samples(:, 1+3:2+3), samples(:, 1+3*2:2+3*2)];
%     p = pw(1,:);
%     c = dichotomizer(x0, x1W, p);
%     if c ~= 3
%         error = error + 1;
%     end
% end
error_rate = error/20;
fprintf("The error rate of 2 (x1, x3) features in Q3.c is: %f\n", error_rate);


%3 features
error = 0;
x123W = [samples(:,1:3), samples(:, 1+3:3+3), samples(:, 1+3*2:3+3*2)];
for i=1:10
    x0 = samples(i, 1:3);
    c = dichotomizer(x0, x123W, p);
    if c ~= 1
        error = error + 1;
    end
end
%class 2 sample
for i=1:10
    x0 = samples(i, 4:6);
    c = dichotomizer(x0, x123W, p);
    if c ~= 2
        error = error + 1;
    end
end
%class 3 sample
% for i=1:10
%     x0 = samples(i, 7:8);
%     x1W = [samples(:,1:2), samples(:, 1+3:2+3), samples(:, 1+3*2:2+3*2)];
%     p = pw(1,:);
%     c = dichotomizer(x0, x1W, p);
%     if c ~= 3
%         error = error + 1;
%     end
% end
error_rate = error/20;
fprintf("The error rate of 3 features in Q3.c is: %f\n", error_rate);

%Q3d
x = [[1,2,1];[5,3,2];[0,0,0];[1,0,0]];
mu_d = [mean(samples(:,1:3));mean(samples(:,4:6));mean(samples(:,7:9))];
for k = 1:4    
    for w= 1:3
        d = mahalanobis(x(k,:), samples(:,1+3*(w-1):w*3));
        fprintf("Mahalanobis between point%d & mean of W%d = %f\n", k, w, d);
    end
end

x123W = [samples(:,1:3), samples(:, 1+3:3+3), samples(:, 1+3*2:3+3*2)];
%Q3e
fprintf("Q3e\n");
for i=1:4    
    p = pw(2,:);
    class = dichotomizer(x(i,:),x123W,p);
    fprintf("point%d is class %d\n", i, class);
end

%Q3f
fprintf("Q3f\n");
for i=1:4
    p = pw(3,:);
    class = dichotomizer(x(i,:),x123W,p);
    fprintf("point%d is class %d\n", i, class);
end
    
function g = getG(x0, XW, pw)
    mu = mean(XW);
    sigma = cov(XW);
    pdf = mvnpdf(x0 , mu, sigma);
    g = log(pdf) + log(pw);
end

function d = mahalanobis(x0, XW)
    mu = mean(XW);
    sigma = cov(XW);
    x1 = (x0-mu);
    x1_t = x1.';
    d = mtimes(x1, inv(sigma));
    d = mtimes(d, x1_t);
%     d =x1 .* inv(sigma);
%     d = d .* x1_t;
end


function  class = dichotomizer(x, XW, pw)
    [~, v] = size(XW);
    v = v/3-1;
    g1 = getG(x, XW(1:10, 1:1+v), pw(1));
    g2 = getG(x, XW(1:10, 2+v:2+2*v), pw(2));
    g3 = getG(x, XW(1:10, 3+2*v:3+3*v), pw(3));
    if max([g1,g2,g3]) == g1
        class = 1;
    elseif max([g1,g2,g3]) == g2
        class = 2;
    else
        class = 3;
    end    
end
    