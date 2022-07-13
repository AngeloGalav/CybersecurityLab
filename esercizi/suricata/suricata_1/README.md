# Suricata Es. 1

## Consegna

```
Lo studente deve costruire ( e validare ) una regola suricata che identifichi il traffico in uscita per il portale netflix.com

Nota bene:

La regola va generata con un certo criterio. Che significa? Significa che una richiesta a netflix.com comporta più richieste a più domini!

Analizzare quindi con wireshark, o altro tool tutti domini coinvolti… Ricordate la lezione su Web Sec!

Modalità di Consegna:
- Consegnare il file netflix.rules con la/le regola/e suricata.
- Consegnare uno screenshot che mostra i log di suricata che mostrano l'alert sui diversi domini.
```

## Soluzione

**ATTENZIONE!!**: Ricorda che `fast.log` è il luogo dove si trovano i log più semplici e "veloci", se vogliamo avere un log espressivo, dobbiamo usare `eve.json`. 

Prima di tutto, dobbiamo andare su wireshark e collegarci su netflix.com, ed inserire l'opzione `resolve names` nelle impostazioni di wireshark, in modo da catturare l'url delle CDN di netflix e ricevere gli alert quando abbiamo un video stream.

A questo punto, prendiamo alcuni degli url di queste CDN, ed inseriamole in una regola in un files `seclab.rules`, sottoforma di regola di suricata. 
```
alert tls any any -> any any (msg:"Netflix video stream 1"; tls_sni; content:"oca.nflxso.net"; isdataat:!1,relative; flow:to_server,established; flowbits: set,traffic/id/netflix; flowbits:set,traffic/label/social-network; sid:303080301; rev:1;)

```
**RICORDA**: devi cambiare il `sid` di ogni regola in modo che non ci siano due regole con lo stesso `sid`!!
In questo modo, ci dovrebbe avvisare ogni volta che si fa una chiamata a `oca.nflxso.net`, che il suffisso di uno degli hostname del CDN.

Dunque, testiamo il tutto.
Carichiamo il file di configurazione e il file delle regole su suricata in questo modo:
```
suricata -c suricata.yaml -l logs -s seclab.rules -i enp0s31f6
```

I log compariranno nella cartella `logs`.