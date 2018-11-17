
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

% while k<10
%     k = k + 1;
%    
    k=191;
    U_reduce = U(:,1:k);
    Z = X*U_reduce;  % transformed matrix
    ReConMat = Z*(U_reduce');  % Reconstruction matrix
 
   for i=1:N
        ReConMat(i,:) = ReConMat(i,:) + Ag(i);
   end
   
    
      imshow(reshape(ReConMat(2500,:),[20 20])); 
      
%         img=grey2mat(imshow);
%     
   X_approx=ReConMat;
    err = 0;
   
    for i = 1:N
        err = err + (1/5000)*norm(X_approx(i,:)-originalX(i,:))^2;
      
    end
    k
    err
    
   % imshow(reshape(ReConMat(1,:),[20 20]));
  





