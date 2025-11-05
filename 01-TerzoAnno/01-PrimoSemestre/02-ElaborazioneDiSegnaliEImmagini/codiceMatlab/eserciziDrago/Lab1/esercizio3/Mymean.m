function valoreMedio = Mymean (valore)

    dim=numel(valore) %calcolo il numero di elementi
    totale=sum(valore)
    valoreMedio=totale/dim

end