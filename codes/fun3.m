function [ Z ] = fun3(  )

[X,Y]=input_data;
originalX=X;
N=size(X,1); % N Images

D=size(X,2); % 400

Ag=zeros(D,1);
for i = 1:N
    x = sum(X(i,:))/D;
    X(i,:) = X(i,:) - x;  
    Ag(i)=x;
end


 CovMat = (1/N)*(X'*X);
 
[U,S,V] = svd(CovMat);



k = 0;
err = 1;

while(abs(err)>0.1)
    k = k + 1;
    U_reduce = U(:,1:k);
    Z = X*U_reduce;  % transformed matrix
    ReConMat = Z*(U_reduce');  % Reconstruction matrix
    for i=1:N
        ReConMat(i,:) = ReConMat(i,:) + Ag(i);
    end
   X_approx=ReConMat;
    err = 0;
    ep = 0;
    for i = 1:N
        err = err + norm(X_approx(i,:)-originalX(i,:))^2;
        ep = ep + norm(originalX(i,:))^2;
    end
    err = err/ep;
  
end
%fprintf('pca at error < 0.1 is %d\n',k);







end

