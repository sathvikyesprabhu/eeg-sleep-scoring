function BIGmat=MFgen(COVlist,len)
trace_list=zeros(len,1);
det_list=zeros(len,1);
norm_list=zeros(len,1);
trace_inv=zeros(len,1);
det_inv=zeros(len,1);
norm_inv=zeros(len,1);

for i=1:len
    trace_list(i)=trace(COVlist(:,:,i));
    det_list(i)=det(COVlist(:,:,i));
    norm_list(i)=norm(COVlist(:,:,i));
    trace_inv(i)=trace(inv(COVlist(:,:,i)));
    det_inv(i)=det(inv(COVlist(:,:,i)));
    norm_inv(i)=norm(inv(COVlist(:,:,i)));
end
BIGmat=[trace_list det_list norm_list trace_inv det_inv norm_inv];
end