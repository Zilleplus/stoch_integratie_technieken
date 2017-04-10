function [ M ] = ex2_1_get_matrix_M( alpha,beta )
    M=[
        0.5     0.5             0       0               0;
        0.5     0.5*(1-alpha)   beta    0               0;
        0       0.5*alpha       0       0.3*alpha       0;
        0       0               1-beta  0.3*(1-alpha)   0.4;
        0       0               0       0.7             0.6;
    ];
end

