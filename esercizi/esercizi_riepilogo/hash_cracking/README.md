# Hash cracking

## Consegna
```
Trovare il sorgente dell'hash md5 fornito.
```

## Soluzione

Per fare questo esercizio, possiamo usare john o hashcat. Nel nostro caso useremo `hashcat`.

`hashcat` ci permette facilemente di definire il tipo di hash dato (che nel nostro caso è md5) e di dare usare una wordlist. 

Usiamo la wordlist che abbiamo creato nell'esercizio di password cracking (prima ho provato altre wordlist, ma funzionava questa).
```bash
hashcat -a 0 -m 0 md5_eser.txt wordlist_mia.txt
touch result.txt
hashcat --show md5_eser.txt > result.txt 
```
I flag `-a` definisce il nostro tipo di attacco, in questo caso usando una wordlist (standard), `-m` invece definisce il tipo di hash che si vuole craccare. 

Scopriamo così che l'hash è della parola "Giallorenzo".