%creating glmfit with betas for second level analysis
%I went through manually and replaced the number each time to get new
%dglm for each participant
%Credit to Blanka for the coding block

load('PPI_PPI1.mat');
    Xglm = PPI.ppi;

 load('VOI_VOILPC_1', 'Y');
    Yglm = Y;

    [betas, ~, stats] = glmfit(Xglm, Yglm)