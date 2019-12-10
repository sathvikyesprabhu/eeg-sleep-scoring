
result=zeros(20,1);
A=1:20;
for i=1:20
    
    COVtrain=[];
    record_labels_train=[];
    for y=A(A~=i)
        load(['epoch30_delta' num2str(y) '.mat']);
        load(['epoch30_labels' num2str(y) '.mat']);
        COVtrain=cat(3,COVtrain,covariances(mat1));
        record_labels_train=cat(1,record_labels_train,record_labels);
    end
    
    COVtest=[];
    record_labels_test=[];
    for z=i
        load(['epoch30_delta' num2str(z) '.mat']);
        load(['epoch30_labels' num2str(z) '.mat']);
        COVtest=cat(3,COVtest,covariances(mat1));
        record_labels_test=cat(1,record_labels_test,record_labels);
    end
    
    n1_idx= find(record_labels_train==1);
    n2_idx= find(record_labels_train==2);
    n3_idx= find(record_labels_train==3);
    n4_idx= find(record_labels_train==4);
    n5_idx= find(record_labels_train==5);
    
    num=min([length(n1_idx) length(n2_idx) length(n3_idx) length(n4_idx) length(n5_idx) ]);
  
    y1=datasample(n1_idx,num);
    y2=datasample(n2_idx,num);
    y3=datasample(n3_idx,num);
    y4=datasample(n4_idx,num);
    y5=datasample(n5_idx,num);
    
    x=cat(1,y1,y2,y3,y4,y5);
    random_array=randperm(num*5,num*5);
    x=x(random_array);
    
    COVtrain=COVtrain(:,:,x);
    record_labels_train_unb=record_labels_train(x);
 
    record_labels_test_unb=record_labels_test(record_labels_test>0);
    COVtest=COVtest(:,:,record_labels_test>0);

    Ytrain=record_labels_train_unb;
    trueYtest=record_labels_test_unb;
    
    Ytest=ts_ensemble(COVtest,COVtrain,Ytrain);
    acc= 100*mean(Ytest==trueYtest);
    result(i)=acc;
end

