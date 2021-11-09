# Sleep EEG analysis utilizing inter-channel covariance matrices

- Journal article:  https://www.sciencedirect.com/science/article/abs/pii/S0208521620300188
- Bibliography entry for citation:
 ```
	@article{GOPANK2020527,
title = {Sleep EEG analysis utilizing inter-channel covariance matrices},
journal = {Biocybernetics and Biomedical Engineering},
volume = {40},
number = {1},
pages = {527-545},
year = {2020},
issn = {0208-5216},
doi = {https://doi.org/10.1016/j.bbe.2020.01.013},
url = {https://www.sciencedirect.com/science/article/pii/S0208521620300188},
author = {Gopika {Gopan K.} and Sathvik S. Prabhu and Neelam Sinha},
keywords = {Electroencephalographic signals, Sleep stages, Covariance matrices, Ensemble classifier, Riemannian manifold},
abstract = {Background
Sleep is vital for normal body functions as sleep disorders can adversely affect a person. Electroencephalographic (EEG) signals indicate brain functions and have characteristic signatures for various sleep stages. These enable the use of EEG as an effective tool for in-depth studies about sleep. Sleep stages are broadly divided as rapid eye movement (REM) and non-rapid eye movement (NREM). NREM is further divided into 3 stages. The objective of the work is to distinguish the given EEG epoch as wake, NREM1, NREM2, NREM3 and REM. DREAMS Subject Database containing 5 EEG channels is used here. This work focuses on utilizing EEG by exploiting variations in inter-dependencies of different brain regions during sleep.
New method
Covariance matrices of the wavelet-decomposed channels are used to obtain the variations in inter-dependencies. The feature sets are: (1) simple matrix properties(MF) like trace, determinant and norm, (2) eigen-values (E1), (3) eigen-vector corresponding to the largest eigen-value (E2) and (4) tangent vectors obtained using Riemann geometry (RG-TS). The features are input to ensemble classifier with bagging. Subject-specific, All-subjects-combined and Leave-one-subject-out methods of analysis are carried out.
Results
In all methods of analysis, RG-TS features give maximum accuracy (80.05%, 83.05% and 61.79%), closely followed by E1 (79.49%, 77.14% and 58.34%).
Comparison with existing method
The proposed method obtains higher and/or comparable accuracy. This work also ensures no biasing of classifier due to unequal class distribution.
Conclusion
The performances of RG-TS and E1 features reveal that the changes in inter-dependencies of pre-frontal and occipital lobe along with the central lobe can be used to distinguish the different sleep stages.}
}
	```
