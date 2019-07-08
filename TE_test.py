# TE_test.py
# Tyson Pond
# Last Modified: 2019-07-08

import symbolic_TE
import numpy as np
import os

#lorenz
directory = 'lorenz_data/'
entropies = np.zeros((101,10))

###rossler
##directory = 'rossler_data/'
##entropies = np.zeros((81,10))

col = 0
for file in os.listdir(directory):
    data = np.loadtxt(open(directory + file, "r"), delimiter=",")
    xs = [data[:,2*k] for k in range(int(np.shape(data)[1]/2))]
    ys = [data[:,2*k+1] for k in range(int(np.shape(data)[1]/2))]
    te_xy = []
    te_yx = []
    for i in range(len(xs)):
        te_xy.append(symbolic_TE.symbolic_TE(xs[i],ys[i],l=10,m=5))
        te_yx.append(symbolic_TE.symbolic_TE(ys[i],xs[i],l=10,m=5))

    diff = np.array(te_yx) - np.array(te_xy)
    entropies[:,col] = diff
    col += 1
        
np.savetxt('lorenz_entropies.csv', entropies, delimiter=",")
