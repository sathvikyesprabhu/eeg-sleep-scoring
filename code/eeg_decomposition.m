
for i=1
    load(['epoch30Record' num2str(i) '.mat']);
    
    fs=200;
        
    len=length(subject1_with_label);
    mat=zeros(5,6000,len);
    mat1=zeros(5,6000,len);
    mat2=zeros(5,6000,len);
    mat3=zeros(5,6000,len);
    mat4=zeros(5,6000,len);
    mat5=zeros(5,6000,len);
    record_labels=zeros(len,1);
    
    
    b=fir1(50,[0.5 60]/(fs/2),'bandpass');
    w=50/(fs/2);
    bw=w;%Q factor=1
    [num,den]=iirnotch(w,bw);
   
    for j=1:len
        
        data=subject1_with_label{j,1};
        record_labels(j)=subject1_with_label{j,2};
        
        for k=1:5
            
            data(k,:)= filter(b,1,data(k,:));% bandpass filter
            data(k,:)= filter(num,den,data(k,:));%notch filter
            
            [C,L]=wavedec(data(k,:),4,'db4');
            Z=zeros(1,length(C));
            C_delta=Z; % Initializing the coefficients as Zero
            C_theta=Z;
            C_alpha=Z;
            C_beta=Z;
            C_gamma=Z;
            
            C_delta(1:L(1))=C(1:L(1)); % Separating the coefficients
            C_theta(L(1)+1:L(1)+L(2))=C(L(1)+1:L(1)+L(2));
            C_alpha(L(2)+1:L(2)+L(3))=C(L(2)+1:L(2)+L(3));
            C_beta(L(3)+1:L(3)+L(4))=C(L(3)+1:L(3)+L(4));
            C_gamma(L(4)+1:L(4)+L(5))=C(L(4)+1:L(4)+L(5));

          
            eeg_delta=waverec(C_delta,L,'db4'); % Reconstructing the subbands
            eeg_theta=waverec(C_theta,L,'db4');
            eeg_alpha=waverec(C_alpha,L,'db4');
            eeg_beta=waverec(C_beta,L,'db4');
            eeg_gamma=waverec(C_gamma,L,'db4');
            
            mat(k,:,j)=data(k,:);
            mat1(k,:,j)=eeg_delta;
            mat2(k,:,j)=eeg_theta;
            mat3(k,:,j)=eeg_alpha;
            mat4(k,:,j)=eeg_beta;
            mat5(k,:,j)=eeg_gamma;
                       
        end
       
    end
    save(['epoch30_all' num2str(i) '.mat'],'mat');
    save(['epoch30_delta' num2str(i) '.mat'],'mat1');
    save(['epoch30_theta' num2str(i) '.mat'],'mat2');
    save(['epoch30_alpha' num2str(i) '.mat'],'mat3');
    save(['epoch30_beta' num2str(i) '.mat'],'mat4');
    save(['epoch30_gamma' num2str(i) '.mat'],'mat5');
    
  
end