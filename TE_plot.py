# TE_plot.py
# Tyson Pond
# Last Modified: 2019-07-08

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

# lorenz
df = pd.read_csv('lorenz_entropies.csv', header=None)
x = np.linspace(0,20,df.shape[0])

# rossler
##df = pd.read_csv('rossler_entropies.csv', header=None)
##x = np.linspace(0,8,df.shape[0])

y = df.mean(axis=1).values
err = df.std(axis=1).values

fig = plt.figure()
(_, caps, _) = plt.errorbar(x,y, yerr=err, capsize=1, elinewidth=1, color='red',
                            ecolor='red')
for cap in caps:
    cap.set_color('red')
    cap.set_markeredgewidth(2)

# lorenz
plt.xlabel(r'$C$')
plt.ylabel(r'$TE_{X\to Y} - TE_{Y\to X}$')
plt.ylim(-0.1,0.85)
plt.show()

# rossler    
##plt.xlabel(r'$\epsilon$')
##plt.ylabel(r'$TE_{X\to Y} - TE_{Y\to X}$')
##plt.ylim(0,1.4)
##plt.show()
