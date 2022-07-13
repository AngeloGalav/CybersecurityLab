# Password cracking

## Consegna
```
Creare una wordlist per craccare le password del file accounts.txt.
Dire quali sono le password trovate.
```

## Soluzione

Per eseguire questo esercizio, dobbiamo prima di tutto andare a creare appunto un opportuna wordlist. 
Per farlo, usiamo la suite `cewl`, e andiamo ad esaminare alcuni siti collegati con il nostro corso.
Dunque:
```bash
touch wordlist_mia.txt
cewl [sito_prof] > wordlist_mia.txt
cewl [curriculum_vitae_prof] >> wordlist_mia.txt 
cewl [sito_del_corso] >> wordlist_mia.txt
cewl [sito_ulisse] >> wordlist_mia.txt
```

A questo punto, abbiamo creato la nostra wordlist, e la diamo in pasto a `john`.
```bash
john --wordlist="wordlist_mia.txt" accounts.txt
touch password_trovate
john --show accounts.txt > password_trovate 
```
**WARNING**: Se il comando da "command not found", è perché la suite può essere eseguita esclusivamente da root.  

Una delle password craccate (e penso sia l'unica che possiamo effettivamente craccare, siccome anche la wordlist creata dal prof trova solo questa) è "Giallorenzo" per l'utente eser1.
