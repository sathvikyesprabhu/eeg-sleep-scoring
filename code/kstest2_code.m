y=5;
load(['Record' num2str(y) '_delta.mat']);
load(['Record' num2str(y) '_labels.mat']);

l=cell(5,1);
for z=1:5
    l{z,1}=find(record_labels==z);
end

COVlist=covariances(mat);

p=1;
q=3;
h=zeros(nnz(record_labels==p),nnz(record_labels==q));
for i=1:nnz(record_labels==p)
    for j=1:nnz(record_labels==q)
        COVtrain=COVlist(:,:,l{p,1});
        COVtest=COVlist(:,:,l{q,1});
        
        C=mean_covariances(COVtrain,'riemann');
        Strain=Tangent_space(COVtrain(:,:,i),C);
        Stest=Tangent_space(COVtest(:,:,j),C);
        
        h(i,j)=kstest2(Strain,Stest);
    end
end

