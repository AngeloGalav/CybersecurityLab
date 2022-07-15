# WEBAPP

## Consegna
```
Collegarsi all'indirizzo 137.204.57.184

Obbiettivo dello studente è sfruttare la vulnerabilità di tipo path traversal e recuperare la flag.

Non è possibile utilizzare tool di scansione automatica e non è consentito alcun tipo di "bruteforce".

Seguire le istruzioni presenti sul sito che si apre all'indirizzo fornito.

Modalità di consegna.

Lo studente dovrà consegnare:
- Uno screenshot payload.png (o jpg) che mostra l'esecuzione del payload e relativo alert
- Un file flag.txt con la flag.
- Un file web.txt che descrive:
   - I passi eseguiti che vi hanno portato a scoprire la vulnerabilità
   - Un piccola descrizione di come, ponendovi dal punto di vista del sys admin mitighereste e/o risolvereste questa vulnerabilità.
Il livello di dettaglio e precisione della descrizione sarà utilizzato come valutazione della prova.
```

## Soluzione

In questa prova essenzialmente bisognava fare path traversal nella webapp, per trovare il flag nella posizione `../flag/flag.txt`.

Ci viene anche detto che questa era il codice che stava dietro al webserver. 
```python 
f'./root/{filename}'.replace('../', '').replace('..\\', '').rstrip('/').rstrip('\\')
```

Se proviamo inserire direttamente nell'URL il path `../flag/flag.txt`, allora il webserver ci dirà che il path `/../flag/flag.txt` non esiste nella macchina. Mmmh...
Allora, per confonderti, il sito aggiunge '../' in testa stringa ogni volta che bisogna mostrare la locazione interna (mossa davvero da stronzi da parte del prof). Tuttavia, se ci atteniamo a quanto detto nel codice fornito dal prof, allora semplicemente sappiamo che possiamo mettere qualcosa come `....//flag/flag.txt` e dovrebbe funzionare.  


Alla fine il payload finale da usare è `....//flag/flag.txt`, e infatti così otteniamo il flag. 


