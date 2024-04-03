function [eval_R,eval_t] =expeval(R,t,evalAi,evalBi)
n=size(evalAi,3);

eval_R=0;eval_t=0;
for i=1:n
eval_R=eval_R+norm(vex(logm(evalAi(1:3,1:3,i)*R*inv(R*evalBi(1:3,1:3,i)))))^2;
eval_t=eval_t+norm(evalAi(1:3,1:3,i)*t+evalAi(1:3,4,i)-R*evalBi(1:3,4,i)-t)^2;
end
eval_R=sqrt(eval_R/n);
eval_t=sqrt(eval_t/n);




end
