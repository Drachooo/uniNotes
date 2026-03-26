#---------------------------------#
#   LEZIONE 2 18-03-26
#
#--------------


#TIPI DI DATI

#Le variabili di tipo character ervono per memorizzare testo.
month <- "Marzo"

#FUNZIONI UTILI 
# nchar -> restituisce la lunghezza di una stringa
# paste(), paste0() -> unisce (concatena) due o più stringhe con o senza spazio
#toupper(), tolower()

monthCAPS <- toupper(month)

#possibilità di creare anche vettori in questo modo

vettoreMese <- c(monthCAPS, month, "january")


#------------#
#Liste, Array, Data Frame
#La lista è una collezione di dati che possono essere: dello stesso tipo oppure di tipi diversi

l1 <- list("Everest", "Casa", 83, TRUE)

#Un array è una struttura di dati che può memorizzare dati dello stesso tipo in più di due dimensioni
#Vettori -> una dimensione
#Matrici -> due dimensioni
#Array -> più dimensioni

a1 <- array(c(1:12), dim = c(2,3,2))
a1


#DATA-FRAME
#Il data frame è una struttura di dati bidimensionale che permette di memorizzare dati in forma tabellare

df1 <- data.frame(mount = c("casa", "caso", "casi"),
                height = c(284,3948, 2084),
                todo =c(TRUE, FALSE, TRUE))

?paste0()

ciao0 <- paste0("casa", "sorella")
ciao <- paste("casa", "sorella")



#Struttura di controllo if, ifelse
# Effettua un blocco di codice solo se la condizione è vera

x <- 10

if(x < 10){
    print("x è minore di 10")
}else if (x == 10) {
   print("x è 10")
}else {
   print("x è maggiore di 10")
}

voti <- c(6,8,10)
ifelse(voti > 8, yes = "Ottimo", no = "Sufficiente")


#Struttura di controllo for, while

for(i in 1:5){
    print(i^2)
}

x = 1
while(x <= 5){
    print(x)
    x = x+1
}


#--------------------------------------------#
#RAPPRESENTAZIONE GRAFICA -plot()

x <- c(1,2,3,4,5)
y <- c(1:5)

plot(x,y, xlab = "X values", ylab =" y values", main ="QUESTO é il TITOLO", col = "red")


# TIPI DI DGRAFICI
#GRAFICI A BARRE -> barplot()
#GRAFICI A LINEE -> plot(...,type = "I")
#ISTOGRAMMI -> hist()
#BOXPLOT -> boxplot()
#GRAFICI a DISPERSIONE -> (scatter plots, plot())
#GRAFICI DI DENSITA -> (plot(density()))


#ESEMPIO CON BARPLOT

ages = 20:29
students = c(2,1,5,3,4,2,0,2,1,0)
barplot(stu1dents, xlab = "Age of students", ylab = "Number of stuednts", names.arg = ages)

#ESEMPIO CON LINEPLOT

daily_income <- runif(100, min = 10, max = 20)

plot(daily_income, type = "l", xlab = "Day", ylab = "Daily Income", main= "Daily income over 100 days")



#ISTOGRAMMA
weights = runif(100, min = 40, max = 80)
head(weights)
hist(weights, breaks = c(40,50,60,70,80), main ="Calcolo generico")

#MOSTRARE Più GRAFICI CONTEMPORANEAMENTE

#...



#SALVARE ED ESPORTARE I GRAFI
pdf("./plots/myplot.pdf")
#creo grafico
x <- 1:10
y <- x^2

plot(x,y)
dev.off()


#Salvare e caricare dati tabulari
#read.csv()/write.csv() e read.table() / write.table() : funzioni usare per importare o esportare 



#Scrpt e funzioni

my_sum = function(x,y){
    z = x + y
    return(z)
}

my_sum(2,3)



#Breve introduzione a dplyr
#é importante saper gestire facilmente i dataset


my_fun = function(x){
    browser()
    y = x + 1
    return (y*2)
}

my_fun(4)
