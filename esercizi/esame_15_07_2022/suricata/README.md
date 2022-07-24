# Suricata del 15 luglio

## Consegna
```
L'esercitazione di suricata consiste nel creare una serie di regole per l'IDS visto a lezione, Suricata.

Le regole saranno testate per verificarne la correttezza.

È stato rilasciato un file compresso di tipo 7z.

Scompattare il file con il comando

7z x esame_15_luglio.7z
Il contenuto dello zip è un file pcap esame_15_luglio.pcapng

Il file rappresenta il tracciato di traffico di diversi protocolli.

In mezzo alle varie richieste c'è una richiesta con la flag che lo studente dovrà recuperare.

Compito dello studente sarà:
Analizzare il traffico e capire quale protocollo/richiesta è stata usata/o per inviare la flag.
Scrivere una (o più di una se necessario) regola suricata in modalità alert per il traffico del protocollo in questione, specifiche per gli IP trovati precedentemente.
Se creata correttamente la regola e configurato correttamente suricata (si ricordi l'esercitazione in classe su MQTT) nei log (eve?) dovrebbe essere possibile leggere il contenuto del tracciato di traffico.

Parsare a piacimento il contenuto in modo tale che venga stampata la flag.

HINT IMPORTANTE:

La flag è la seguente: SEC{flagesame15luglio} (attenzione alle parentesi graffe)

Qualsiasi altra variazione della flag SEC{qualcosa} non è corretta.

La flag può essere anche in formato encodato, in questo eventuale caso lo studente dovrà essere in grado di decodificare la flag.

Lo studente dovrà consegnare un unico file suricata.txt con le soluzioni degli esercizi. Dettagli e descrizioni che motivano una determinata soluzione saranno valutati positivamente.
```

## Soluzione 
Possiamo subito trovare la soluzione usando wireshark, siccome ci basta cercare il pacchetto che inizia per `SEC`, facendo attenzione ad eliminare i caretteri {, } codificati in unicode correttamente (sono `%7B` e `%7D` rispettivamente). Possiamo notare come il flag sia codificato in base64, quindi usando facilmente google possiamo decificarlo e ottenere il flag richiesto. Il flag è `ZmxhZ2VzYW1lMTVsdWdsaW8=`, che corrisponde a `flagesame15luglio`.

Inoltre, facendo la ricerca, notiamo come tutti i pacchetti interessanti siano delle richieste HTTP. 
Scriviamo quindi la regola, che corrisponde a:
```
alert http any any -> any any (msg:"Flag_fragm"; sid:300000301; rev:1;)
```
e il gioco è fatto. 