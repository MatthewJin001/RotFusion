function [R_out,t_out,rnti]=HECsim(RAin,tAin,RBin,tBin,a,b)
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
step_th=1e-6;
k_num=1;

Rsimk=Rrot;
tsimk=trot;

while (step_th<step && k_num<iter_max)

    k_num=k_num+1;

    Jtran=zeros(3*n,6); vtran=zeros(3*n,1); ftran=zeros(3*n,1);
    Jrot=zeros(3*n,3); vrot=zeros(3*n,1);frot=zeros(3*n,1);
    for i=1:n
        Jtran(3*i-2:3*i,:)=[-skew(Rsimk*tBin(:,i)),eye(3)-RAin(:,:,i)];
        vtran(3*i-2:3*i,:)=tAin(:,i);
        ftran(3*i-2:3*i,:)=Rsimk*tBin(:,i)+(eye(3)-RAin(:,:,i))*tsimk;

        Jrot(3*i-2:3*i,:)=[-skew(Rsimk*betai(:,i))];
        vrot(3*i-2:3*i,:)=alphai(:,i);
        frot(3*i-2:3*i,:)=Rsimk*betai(:,i);
    end
    delta=inv(b^2*Jtran'*Jtran+a^2*[Jrot'*Jrot,zeros(3,3);zeros(3,6)])*(b^2*Jtran'*(vtran-ftran)+a^2*[Jrot,zeros(3*n,3)]'*(vrot-frot));
    xisimk=delta(1:3);
    deltat=delta(4:6);

    Rsimk=expm(skew(xisimk))*Rsimk;
    tsimk=tsimk+deltat;

    step=norm(xisimk);

end
% disp('out');
R_out=Rsimk;
t_out=tsimk;
rnti=toc;
end