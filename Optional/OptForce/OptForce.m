%% Install Cobra and define solver
initCobraToolbox (0)
changeCobraSolver('gurobi', 'ALL')

%STEP 1: Maximize specific growth rate and product formation
%First, we load the model. This model comprises only 90 reactions, which describe the central metabolism of E. coli [2].
%Then, we change the objective function to maximize biomass ("R75"). We also change the lower bounds, so E. coli will be able to consume glucose, oxygen, sulfate, ammomium, citrate and glycerol.
%%Load model 
model = readCbModel('eciML1515');
model.c(strcmp(model.rxns, 'R75')) = 1;
model = changeRxnBounds(model, 'EX_glu__L_e', -100, 'l'); 
model = changeRxnBounds(model, 'EX_o2_e', -100, 'l'); 
model = changeRxnBounds(model, 'EX_so4_e', -100, 'l'); 
%model = changeRxnBounds(model, 'EX_nh3', -100, 'l'); 
model = changeRxnBounds(model, 'EX_cit_e', -100, 'l'); 
model = changeRxnBounds(model, 'EX_glyc_e', -100, 'l'); 

%Then, we calculate the maximum specific growth rate and the maximum production rate for L-ser.
growthRate = optimizeCbModel(model);
fprintf('The maximum growth rate is %1.2f', growthRate.f);

model = changeObjective(model, 'EX_ser__L_e')
maxSer = optimizeCbModel(model);
fprintf('The maximum production rate of L-Serine is %1.2f', maxSer.f);

%STEP 2: Define constraints for both wild-type and mutant strain
constrWT = struct('rxnList', {{'R75'}}, 'rxnValues', 14, 'rxnBoundType', 'b')
constrMT = struct('rxnList', {{'R75', 'EX_ser__L_e'}}, 'rxnValues', [0, 155.55], ...
'rxnBoundType', 'bb')

%%%Error from step#3.
%Step 3: Flux Variability Analysis
[minFluxesW, maxFluxesW, minFluxesM, maxFluxesM, ~, ~] = FVAOptForce(model, ...
                                                                     constrWT, constrMT);
                                                                 
disp([minFluxesW, maxFluxesW, minFluxesM, maxFluxesM]);