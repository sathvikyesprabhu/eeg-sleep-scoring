
result=zeros(10,20);
result_mean=zeros(1,20);
for y=1:20
    
    load(['epoch30_delta' num2str(y) '.mat']);
    load(['epoch30_labels' num2str(y) '.mat']);

    
    for z=1:10
        
        
        n1_idx= find(record_labels==1);
        n2_idx= find(record_labels==2);
        n3_idx= find(record_labels==3);
        n4_idx= find(record_labels==4);
        n5_idx= find(record_labels==5);
        
        num=min([length(n1_idx) length(n2_idx) length(n3_idx) length(n4_idx) length(n5_idx)]);
        y1=datasample(n1_idx,num);
        y2=datasample(n2_idx,num);
        y3=datasample(n3_idx,num);
        y4=datasample(n4_idx,num);
        y5=datasample(n5_idx,num);
        
        x=cat(1,y1,y2,y3,y4,y5);
        random_array=randperm(num*5,num*5);
        x=x(random_array);
        
        mat_unb=mat1(:,:,x);
        record_labels_unb=record_labels(x);
        
        COVlist=covariances(mat_unb);
        indices=crossvalind('Kfold',length(record_labels_unb),10);
        
        acc_ts_ensemble=zeros(10,1);
        
        for i=1:10
            test=(indices==i);
            train=~test;
            COVtest=COVlist(:,:,test);
            COVtrain=COVlist(:,:,train);
            Ytrain=record_labels_unb(train);
            trueYtest=record_labels_unb(test);
                    
            Ytest=ts_ensemble(COVtest,COVtrain,Ytrain);
            acc_ts_ensemble(i,1) = 100*mean(Ytest==trueYtest);

        end
        
        
        
        acc_mean=mean(acc_ts_ensemble);
        result(z,y)=acc_mean;
        
        
    end
    result_mean(1,y)=mean(result(:,y),1);
    
end



