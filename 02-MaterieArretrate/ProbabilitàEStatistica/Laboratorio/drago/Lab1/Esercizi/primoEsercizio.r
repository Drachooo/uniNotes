###############################################
# Crea i seguenti vettori due volte: il primo usando l’operatore due punti (colon operator)e il secondo
#usando il comando seq()
# > 1, 2, 3, 4, 5, 6, 7, 8, 9, 10
# > 2,7,12

vettore1 = 1:10
vettore1


vettore2 = seq(from = 2, to = 12, by = 5)
vettore2

########################################################
#Crea una matrice 4x2 di tutti zeri e memorizzala in una variabile (mymat).Poi,sostituisci la seconda riga della matrice con un vettorecompostodai valori 3 e 6

mymat = matrix(0, 4, 2) 
mymat

# sostituisco in seconda riga il vettore 3,6
mymat[2,] = c(3, 6)


#############################################
#Crea un vettore x costituito da 20 punti equidistanti nell’intervallo da–𝛑 a +𝛑. Crea un vettorey che sia sin(x).

x = seq(-pi, pi, length.out = 20)
x
y = sin(x)
y

#############################################
#D. Crea una matrice 4x6 di numeri interi casuali, ciascuno nell’intervallo da -5 a 5; memorizzalain una  variabile (mat). Crea un’altra matrice (mat_pos) che contenga il valore assoluto di ciascun elemento corrispondente nella matrice originale.


#---------------#
# La funzione sample genera un campione di valori (in questo caso da -5 a 5, per una estrazione totale di 24 numeri con reimissione del valore estranno nei valori possibili)

mat <- matrix(sample(-5:5, 24, replace = TRUE),nrow = 4, ncol = 6)
mat

mat_pos = abs(mat)
mat_pos


####################àà
#Crea una sequenza di valori u che vada da-2 a 2 con incrementi di 0.1.Poicalcola il valoredi exp(u) per ciascun valore della sequenza e memorizzai risultati in una variabile v.


u = seq(-2, 2, 0.1)
u

v = exp(u)
v

#####################################
#Crea un vettorez convalori che vanno da 1 a100 conincrementi di 5.Crea un vettorewche contengala radice quadratadi ciascun valore in z

z = seq(1, 100, 5)
z

z = sqrt(z)
z
