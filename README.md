## A Practical Method For Hand-Eye Calibration Through Fusion

## Overview
Jin, G., Yu, X., Chen, Y., Zhang, L., Li, J. (2024), A Practical Method For Hand-Eye Calibration Through Fusion, submitted to IEEE/ASME Trans. Mech.

The hand-eye calibration problem is a fundamental problem in visual assisted robotics. Ensuring the calibration robustness is crucial as the calibration results are used in every task execution. Unlike traditional separate or simultaneous method, we propose a rotation fusion method to further improve the robustness. The proposed method is practical and includes four straightforward steps. First, the forward rotation estimate is obtained using the rotation of AX = XB. Second, the backward rotation estimate is achieved via the translation of AX = XB, which is not involved in existing methods. Third, the two rotation estimates are fused with identity covariance to cope with different noise conditions. Last, the translation estimate is obtained by a least-square minimization. 

<img src="figure/png1.PNG" width="45%">

**_Figure_**: Signal flow diagrams of (a) the separate method, (b) the simultaneous method, and (c) our fusion method for hand-eye calibration.



## How to use
### Dependencies
The code runs on Matlab R2023a without any additional dependencies. The necessary auxiliary functions can be found in the "Auxiliary" folder.

### Main Instructions
To run the fusion calibration, call
```
[R_out,t_out,rnti]=HECfuse(RAin,tAin,RBin,tBin)
```
where
* ``RAin`` (3x3xn): rotation matrix of A,
* ``tAin`` (3xn): translation vector of A (unit: m),
* ``RBin`` (3x3xn): rotation matrix of B,
* ``tAin`` (3x3xn): translation vector of B (unit: m),
* ``R_out`` (3x3): rotation matrix of hand-eye pose,
* ``t_out`` (3x1): translation vector of hand-eye pose (unit: m),
* ``rnti`` (1×1)： runtime (unit: seconds).

The comparison methods include
* ``HECrot`` : forward separate method,
* ``HECtran`` : backward separate method,
* ``HECsim`` :  simultaneous method,
* ``HECTsai`` : Tsai's method,
* ``HECWu`` : Wu's method,
* ``HECSARA`` : Sarabandi's method.

Please refer to the submitted article or reference for details.

### Demos
Demo ``main`` contains the calibration and evaluation of multiple methods. run ``main.m``, the results will be stored in ``result.xlsx``. The calibration and the evaluation results of the normal dataset in the paper are as follows

```
       Method          Time        TimeD       Proj      Rec  
    _____________    ________    _________    ______    ______

    {'Tsai'     }      1.7045       1.6613    3.0243     2.723
    {'Park'     }      1.5945       1.5656    3.0215    2.7227
    {'Horaud'   }      1.6124       1.5988    3.0214    2.7223
    {'Liang'    }      1.5536       1.5438    3.0214    2.7223
    {'Li'       }      1.5731       1.5679    2.3647    1.9909
    {'Shah'     }      1.5188       1.5149    1.4898    1.4405
    {'TabbZ1'   }      2.2759       1.5356    1.6917    1.5853
    {'TabbZ2'   }      10.009       1.5189    1.6701    1.5838
    {'TabbR'    }      2.1257       1.4869    1.4113    1.3595
    {'AliX1'    }      3.0857       1.5695    3.3509    3.0197
    {'AliX2'    }      2.6798       1.5229    3.4001    3.1389
    {'AliR1'    }      3.9818       1.5295    1.4353    1.3806
    {'AliR2'    }      2.6223       1.5303    1.4139    1.3612
    {'Zhao'     }      3.3255        1.412    2.7252    2.4904
    {'Wu'       }      1.5477       1.5415    3.4871    3.1516
    {'Sarabandi'}       1.548       1.5413    3.0603    2.7448
    {'GPAS'     }    0.018806    0.0003097    1.4438     1.353
    {'GPAP'     }     0.10938     0.000254    1.4113    1.3595
    {'GPAM'     }    0.048826    0.0004161    1.4275    1.3479
```



<img src="figure/png2.PNG" width="45%">

**_Figure_**: The accuracy results of the comparative methods for Category 1.



<img src="figure/png3.PNG" width="45%">

**_Figure_**: The accuracy results of the comparative methods for Category 2.



<img src="figure/png4.PNG" width="45%">

**_Figure_**: The accuracy results of the comparative methods for Category 3.


<img src="figure/png5.PNG" width="40%">

**_Figure_**: The algorithm runtime of the comparative methods for Category 1.

## Reference
* Tsai R Y, Lenz R K. A new technique for fully autonomous and efficient 3 d robotics hand/eye calibration[J]. IEEE Transactions on robotics and automation, 1989, 5(3): 345-358.
* Wu J, Sun Y, Wang M, et al. Hand-eye calibration: 4-D procrustes analysis approach[J]. IEEE Transactions on Instrumentation and Measurement, 2019, 69(6): 2966-2981
* * Sarabandi S, Porta J M, Thomas F. Hand-eye calibration made easy through a closed-form two-stage method[J]. IEEE Robotics and Automation Letters, 2022, 7(2): 3679-3686. 


## Contact

Gumin Jin, Department of Automation, Shanghai Jiao Tong University, Shanghai, jingumin@sjtu.edu.cn
