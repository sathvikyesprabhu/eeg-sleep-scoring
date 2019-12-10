function eig_matrix=E1gen(COVlist,len)

for i=1:len
    eig_matrix(i,:)=eig(COVlist(:,:,i));
end
end