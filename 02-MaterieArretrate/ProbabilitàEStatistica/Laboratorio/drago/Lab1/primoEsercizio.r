

# Prima lezione di Probabilità e Statistica Laboratorio

#Operazione semplice
1 + 1

#Operazione con assegnazione ad una variabile
A <- 1 + 1

B = 3 -2
B

#Load or save or display the commands history.
history()


#é possibile utilizzare il formato ?funzione per aprire la documentazione di una data funzione
#questo comando quindi ci mostra la documentazione della funzione mean
?mean

#############################################
#       ESEMPI DI VARIABILI                 #
#############################################

#assegnazione
students <- 100

#sovrascrittura
students <- 102

#rimozione variabili dall'ambiente
remove(students)

#rimozione di TUTTE le variabili dell'ambiente
remove(list = ls())




#############################################
#       VETTORI                             #
#############################################

#dichiarazione di vettore v1 con 3 elementi all'interno
v1 <- c(2, 5, 1)

#i vettori possono essere creati anche unendo più vettori tra di loro
r <- c(2, 4, 1)
s <- c(44, 22, 44)
t <- c(r, s)

?vector



#Generare un vettore di elementi regolarmente distribuiti
#vettore con 10 elementi da 1 a 10
x1 <- 1:10

#Per creare sequenze più specifiche si può usare la funzione seq()

x2 <- seq(from = 0, to = 0.5, by = 0.1)
# in questo caso crea un vettore da 0 a 0.5 con un salto di 0.1 per ogni elemento

?seq


#RIPETIZIONI di vettori
#crea un vettore con la ripetizione di una stessa sequenza di valori, times volte
r1 <- rep(c(1,2,3), times = 3)
#ripetere ogni elemento 3 volte
r2 <- rep(c(1,2,3), each = 3)
#ripetere primo elemento 1 volta, secondo 2 volte, terzo 3 volte
r3 <- rep(c(1,2,3), times = c(1,2,3))


################################
#   Funzioni utili per i vettori
##################################



length(r1)
#funzione media
mean(r1)

cumsum(r1)


################################
# CREAZIONE DI UNA MATRICE
##############################à


#CI SONO VARI METODI PER FARLO
# 1- CONCATENANDO VETTORI COME COLONNE (cbind)
# 2- CONCATENANDO VETTORI COME RIGHE (rbind)
# 3- USANDO LA FUNZIONE martix() specificando righe e colonne

mat1 <- cbind( c(1,2,3), c(4,5,6)) 
mat2 <- rbind( c(1,2,3), c(4,5,6)) 

matriceIntera = matrix(data = c(1,2,3,4,5,6,7,8,9), nrow = 3, ncol = 3)

#Come vedere un elemento specifico?
mat1[2,2]

#Per vedere righe intere o colonne intere si lascia vuoto l'indice di interesse
mat1[,2]


#Come selezionare più righe / colonne
#seleziono righe da 2 a 3 e colonne da 1 a 2
mat1[2:3, 1:2]

#Per eliminare righe
mat1[-1,]



###################
# MATRICI PARTICOLARI
#################à

mat_zero <- matrix(0, 3, 3)
mat_ones <- matrix(1, 3, 3)

#Matrice identità
mat_id <- diag(3)



#SOMMA di matrice con altra matrice

A <- matrix(data = 1:9, nrow =3)
B <- matrix(data = 1:9, nrow= 3)

matriceSomma = A + B

C <- 3




