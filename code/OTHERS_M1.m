
for y=1:20
    load(['epoch30_delta' num2str(y) '.mat']);
    load(['epoch30_labels' num2str(y) '.mat']);
    len=length(record_labels);
    COVlist=covariances(mat1);
    
    BIGmat=E1gen(COVlist,len); %Use this for E1
%     BIGmat=E2gen(COVlist,len); %Use this for E2
%     BIGmat=MFgen(COVlist,len); %Use this for MF
    
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
        
        BIGmat_unb=BIGmat(x,:);
        record_labels_unb=record_labels(x);
        
        indices=crossvalind('Kfold',length(record_labels_unb),10);
        
        for i=1:10
            test=(indices==i);
            train=~test;
            BIGtest=BIGmat_unb(test,:);
            BIGtrain=BIGmat_unb(train,:);
            Ytrain=record_labels_unb(train);
            trueYtest=record_labels_unb(test);
            
            EnsembleModel=fitcensemble(BIGtrain,Ytrain, 'Method','Bag','NumLearningCycles',497);
            Ytest=predict(EnsembleModel,BIGtest);
            acc(i) = 100*mean(Ytest==trueYtest);
        end
        result(z,y)=mean(acc);
        
    end
    result_mean(y)=mean(result(:,y),1);
end