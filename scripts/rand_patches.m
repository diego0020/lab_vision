function ps=rand_patches(im,pw,ph,np)
w=size(im,1);
h=size(im,2);
ps=zeros(pw,ph,np);
for i=1:np
    p_x=randi(w-pw);
    p_y=randi(h-ph);
    p=im(p_x:p_x+pw-1,p_y:p_y+ph-1);
    ps(:,:,i)=p;    
end
end