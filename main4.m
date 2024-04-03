clc;clear;
currentFolder = pwd;

addpath ([currentFolder,'\data\'])
addpath ([currentFolder,'\auxiliary\'])
addpath ([currentFolder,'\method\'])

load data100
num_array=[20,40,60,80];
num_max=length(num_array);
sigma_max=4;
sigma_R_array=[0.0015,0.0015,0.0045,0.0045];
sigma_t_array=[0.001,0.003,0.001,0.003];
method_max=3;
test_max=50;
error_Rx=zeros(sigma_max,num_max,method_max,test_max);
error_tx=zeros(sigma_max,num_max,method_max,test_max);
rnti=zeros(sigma_max,num_max,method_max,test_max);

for test_num=1:test_max
    for sigma_num=1:sigma_max
        sigma_R=sigma_R_array(sigma_num);
        sigma_t=sigma_t_array(sigma_num);
        [Ain,RAin,tAin,Bin,RBin,tBin]=addNoise(Ai,RAi,tAi,Bi,RBi,tBi,sigma_R,sigma_t);

        for num=1:num_max
            Ain_use=Ain(:,:,1:num_array(num));
            RAin_use=RAin(:,:,1:num_array(num));
            tAin_use=tAin(:,1:num_array(num));
            Bin_use=Bin(:,:,1:num_array(num));
            RBin_use=RBin(:,:,1:num_array(num));
            tBin_use=tBin(:,1:num_array(num));

            method_num=1;
            [R_out,t_out,rnti(sigma_num,num,method_num,test_num)]...
                =HECrot(RAin_use,tAin_use,RBin_use,tBin_use);
            [error_Rx(sigma_num,num,method_num,test_num),error_tx(sigma_num,num,method_num,test_num)]...
                =EVE(R_out,t_out,R_truth,t_truth);

            method_num=2;
            [R_out,t_out,rnti(sigma_num,num,method_num,test_num)]...
                =HECtran(RAin_use,tAin_use,RBin_use,tBin_use);
            [error_Rx(sigma_num,num,method_num,test_num),error_tx(sigma_num,num,method_num,test_num)]...
                =EVE(R_out,t_out,R_truth,t_truth);

            method_num=3;
            [R_out,t_out,rnti(sigma_num,num,method_num,test_num)]...
                =HECfuse(RAin_use,tAin_use,RBin_use,tBin_use);
            [error_Rx(sigma_num,num,method_num,test_num),error_tx(sigma_num,num,method_num,test_num)]...
                =EVE(R_out,t_out,R_truth,t_truth);
        end
    end
end

plotResult4;

