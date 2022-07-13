# GPG 

## Consegna

```
- Salvare in un file di nome esgpg.txt l'output del comando uname -a della vm del corso
- Salvare in un file di nome esgpg.sha l'hash del file esgpg.txt calcolato con l'algoritmo sha512 (man sha512sum)
- Cercare sul sito web http://pgp.mit.edu le chiavi pubbliche di Marco Prandini e Andrea Melis
- Importare in gpg da pgp.mit.edu le chiavi pubbliche dei suddetti destinatari
- Generare una coppia di chiavi RSA con GPG associate al vostro indirizzo @studio.unibo.it
- Caricare l'identificativo della chiave qui come consegna dell'esercizio
- Caricare la chiave pubblica sul server pgp.mit.edu
- Cifrare per i suddetti destinatari il file esgpg.sha
- Firmarlo
- Spedirlo via mail ai suddetti destinatari

```

## Soluzione

Prima di tutto, scriviamo uname su un file esgpg.txt.

```bash
touch esgpg.txt; uname -a > esgpg.txt 
```
Usando sha512, creiamo l'hash del file.

```bash
touch esgpg.sha; sha512sum esgpg.sha > esgpg.txt 
```

Creiamo la nostra chiave GPG

```bash
gpg --full-generate-key 
```

Ci chiederà una serie di passaggi da fare, tra cui mettere una password (che sarebbe da inviare al prof). 
Alla fine di questi, creiamo un file con la chiave pubblica. Usiamo l'id della nostra chiave per scerglierlo, che possiamo vedere con `gpg --list-private-keys`:
```
gpg --export -a CF2CCF11EAEDD4B0E88A9FBC47E258A82DC18790 > publicname.key
```

Ora, usiamo la chiave pubblica del prof per cifrare il file. 
```
gpg --keyserver pgp.mit.edu --search-keys "[Nome Prof]"
```
Anche qui, ci diranno degli input. 

Infine, finiamo crittando e firmando il file:
```
gpg --encrypt --sign --armor -r "[Nome prof]" espgp.sha
```
oppure
```
gpg -se -r "[Nome prof]" esgpg.sha 
```

Inviamo la nostra chiave pubblica nel keyserver:
```
gpg --keyserver pgp.mit.edu --send-key CF2CCF11EAEDD4B0E88A9FBC47E258A82DC18790
```