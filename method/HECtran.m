function [R_out,t_out,rnti]=HECtran(RAin,tAin,RBin,tBin)
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

step=100;
iter_max=100;
step_th=1e-7;
k_num=1;

Rtrank=Rrot;
ttrank=trot;
while (step_th<step && k_num<iter_max)

    k_num=k_num+1;

    Jtran=zeros(3*n,6); vtran=zeros(3*n,1); ftran=zeros(3*n,1);
    for i=1:n
        Jtran(3*i-2:3*i,:)=[-skew(Rtrank*tBin(:,i)),eye(3)-RAin(:,:,i)];
        vtran(3*i-2:3*i,:)=tAin(:,i);
        ftran(3*i-2:3*i,:)=Rtrank*tBin(:,i)+(eye(3)-RAin(:,:,i))*ttrank;
    end
    delta=inv(Jtran'*Jtran)*Jtran'*(vtran-ftran);
    xitrank=delta(1:3);
    deltat=delta(4:6);

    Rtrank=expm(skew(xitrank))*Rtrank;
    ttrank=ttrank+deltat;

    step=norm(xitrank);

end

R_out=Rtrank;
t_out=ttrank;

rnti=toc;
end