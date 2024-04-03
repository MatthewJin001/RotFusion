function [Ai,RAi,tAi,Bi,RBi,tBi,X_truth,R_truth,t_truth]=simuData(n)

cRe=angle2dcm(0.6865,0.0195,-0.7830);
cte=[0.0338;0.0570;-0.0155];
cTe=[cRe,cte;0,0,0,1];
cRe_truth=cRe;
cte_truth=cte;

eTc=inv(cTe);
X_truth=eTc;
R_truth=X_truth(1:3,1:3);
t_truth=X_truth(1:3,4);

robot_roll=-1.7066+ (-0.3789+1.7066)*rand(1,n+1);
robot_pitch=-0.9643+ (-0.2018+0.9643)*rand(1,n+1);
robot_yaw=-3.0407+ (-2.0808+3.0407)*rand(1,n+1);
robot_x=-0.5795+(-0.1316+0.5795)*rand(1,n+1);
robot_y=0.3136+(0.6986-0.3136)*rand(1,n+1);
robot_z=-0.1054+(0.1975+0.1054)*rand(1,n+1);

eRib=zeros(3,3,n+1);etib=zeros(3,n+1);eTib=zeros(4,4,n+1);
for i=1:n+1
    eRib(:,:,i)=angle2dcm(robot_roll(i),robot_pitch(i),robot_yaw(i));
    etib(:,i)=[robot_x(i);robot_y(i);robot_z(i)];
    eTib(:,:,i)=[eRib(:,:,i),etib(:,i);0,0,0,1];
end

Ai=zeros(4,4,n); RAi=zeros(3,3,n);tAi=zeros(3,n);
for i=1:n
    %Ai=(eTb_j)(eTb_i)^-1
    Ai(:,:,i)=eTib(:,:,i)*inv(eTib(:,:,i+1));

    RAi(:,:,i)=Ai(1:3,1:3,i);
    tAi(:,i)=Ai(1:3,4,i);
end

Bi=zeros(4,4,n); RBi=zeros(3,3,n);tBi=zeros(3,n);
for i=1:n
    Bi(:,:,i)=inv(X_truth)*Ai(:,:,i)*X_truth;

    RBi(:,:,i)=Bi(1:3,1:3,i);
    tBi(:,i)=Bi(1:3,4,i);
end

end