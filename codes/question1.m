
[X,Y]=input_data;

%%
K=10;  
idx=kmeans(X,K); 
% clustering completes here
%%
m=size(Y,1);
label=zeros(m,1);
%% Label finding
for i=1:m
    [a,b]=find(Y(i,:)==1);  
    label(i)=b-1;  % 0 1 2 3 4 5 6 7 8 9
end
% Label completes
%% 

p=zeros(5000,1);
for m=1:K
   f=find(idx==m);  % finding the indices for cluster m 
   %disp(size(f,1));
   g=label(f,1);   % corresponding label of those clusters
   gg=mode(g);
   %disp(gg);
  fprintf('digit assigned to cluster %d is %d\n',m,gg);
  no_of_images=size(g,1);
    fprintf('Number of images in cluster %d = %d\n',m,no_of_images);
   for i=1:size(f,1)
      p(f(i))=gg; 
       
   end
 
end
 %
count=0;
for j=1:5000
    
   if(p(j)==label(j))
       count=count+1;
   end
    
end
[C,order]=confusionmat(label,p);
save('confusion10.mat','C');
%disp(count);    
acc=(count/5000)*100;

  fprintf('Accuracy is %f \n\n',acc);
    
