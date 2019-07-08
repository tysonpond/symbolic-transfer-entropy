# Symbolic Transfer Entropy

My implementation of symbolic transfer entropy -- a method of estimating transfer entropy which is proposed in

~ [Symbolic Transfer Entropy](https://journals.aps.org/prl/abstract/10.1103/PhysRevLett.100.158101)
Matthaus Staniek and Klaus Lehnertz 

## Files 

In the order of which they were used:

1. coupled_lorenz.m 
    + integrates coupled lorenz systems and stores time series data
    + data is stored in lorenz_data/
    + odd columns correspond to driver (x), even columns correspond to response (y)
    + each column pair correspond to one coupling parameter    

2. coupled_rossler.m
    + same as coupled_lorenz.m but with rossler systems

3. symbolic_TE.py
    + my implementation of symbolic transfer entropy (STE)

4. TE_test.py 
    + computes STE for lorenz system and rossler system
    + stores entropies in lorenz_entropies.csv and rossler_entropies.csv  

5. TE_plot.py
    + recreate figures from paper
    + resulting figures are saved in figs/