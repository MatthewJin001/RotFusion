function [R_out,t_out,rnti]=HECrot(RAin,tAin,RBin,tBin)
tic;
n=size(RAin,3);

alphai=zeros(3,n);
betai=zeros(3,n);
for i=1:n
    alphai(:,i)=vex(logm(RAin(:,:,i)));
    betai(:,i)=vex(logm(RBin(:,:,i)));
end

W=zeros(3,3);
for i=1:n
    W=W+alphai(:,i)*betai(:,i)';
end
[U,S,V]=svd(W);
Rrot=U*diag([1,1,det(U)*det(V)])*V';


J=zeros(3*n,3); v=zeros(3*n,1);
for i=1:n
    J(3*i-2:3*i,:)=eye(3)-RAin(:,:,i);
    v(3*i-2:3*i,:)=tAin(:,i)-Rrot*tBin(:,i);
end
trot=inv(J'*J)*J'*v;

R_out=Rrot;
t_out=trot;
rnti=toc;
end