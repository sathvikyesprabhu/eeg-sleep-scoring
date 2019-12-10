function Ytest=ts_ensemble(COVtest,COVtrain,Ytrain)

C=mean_covariances(COVtrain,'riemann');
Strain=Tangent_space(COVtrain,C);
Stest=Tangent_space(COVtest,C);
EnsembleModel=fitcensemble(Strain',Ytrain, 'Method','Bag','NumLearningCycles',497);
Ytest=predict(EnsembleModel,Stest');

end