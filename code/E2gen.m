function eig_matrix=E2gen(COVlist,len)
eig_matrix=zeros(len,5);
for i=1:len
    eig_array=eig(COVlist(:,:,i));
    [~,idx]=max(eig_array);
    [V,~]=eig(COVlist(:,:,i));
    eig_matrix(i,:)=V(:,idx);
end

end