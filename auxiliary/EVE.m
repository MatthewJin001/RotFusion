function [error_Rx,error_tx]=EVE(R_out,t_out,R_truth,t_truth)
error_Rx=norm(vex(logm(R_out*R_truth')))*1000;
error_tx=norm(t_out-t_truth)*1000;
end