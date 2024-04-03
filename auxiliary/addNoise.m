function [Ain,RAin,tAin,Bin,RBin,tBin]=addNoise(Ai,RAi,tAi,Bi,RBi,tBi,sigma_R,sigma_t)
n=size(Ai,3);

RAin=zeros(3,3,n);tAin=zeros(3,n);Ain=zeros(4,4,n);
RBin=zeros(3,3,n);tBin=zeros(3,n);Bin=zeros(4,4,n);
for i=1:n
    [a,b,c]=dcm2angle(RAi(:,:,i));
    a=a+normrnd(0,sigma_R);b=b+normrnd(0,sigma_R);c=c+normrnd(0,sigma_R);
    RAin(:,:,i)=angle2dcm(a,b,c);
    tAin(:,i)=tAi(:,i)+normrnd(0,sigma_t,[3 1]);
    Ain(:,:,i)=[RAin(:,:,i),tAin(:,i);0,0,0,1];

    [a,b,c]=dcm2angle(RBi(:,:,i));
    a=a+normrnd(0,sigma_R);b=b+normrnd(0,sigma_R);c=c+normrnd(0,sigma_R);
    RBin(:,:,i)=angle2dcm(a,b,c);
    tBin(:,i)=tBi(:,i)+normrnd(0,sigma_t,[3 1]);
    Bin(:,:,i)=[RBin(:,:,i),tBin(:,i);0,0,0,1];
end

end

