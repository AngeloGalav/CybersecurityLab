# iptables dell'esame fac-simile 1

## Consegna
```
L'esercitazione di iptables consiste nel creare una serie di regole.
Scrivete nel file di testo i comandi che si devono impartire per 
ottenere i risultati richiesti. Si consiglia di leggere tutta la lista
per determinare correttamente i requisiti.

Le regole saranno testate per verificarne la correttezza.

Le regole devono essere applicate nell'ordine in cui vengono proposte.

Partiamo da un flush delle regole esistenti con:
iptables -F
```

### es1
```
1) Consentire qualsiasi traffico sull'interfaccia di loopback
```
### es2
```
2) Consentire il traffico delle connessioni HTTP entranti
```
### es3
```
3) Consentire connessioni SSH uscenti verso la rete host-only 192.168.56.0/24
```
### es4
```
4) Bloccare l'inoltro del traffico proveniente dalla rete host-only verso altre destinazioni
```
### es5
```
5) Consentire la risoluzione dei nomi DNS
```
### es6
```
6) Infine bloccare tutto il traffico in entrata
```

## Soluzioni

Siccome li vuole in ordine di esercizio, dobbiamo inserire i pacchetti in coda, quindi usiamo (quasi) sempre il flag `-A`.

### es1
Nel caso della nostra VM, dobbiamo contrallare quale sia l'interfaccia di loopback con `ip a`, e nel nostro caso si chiama `lo`.
A questo punto, semplicemente sciriviamo il comando:
```
iptables -A INPUT -i lo -j ACCEPT
iptables -A INPUT -o lo -j ACCEPT
```
che ci accetta tutti i pacchetti in input e output.

### es2
Intuitivamente, siccome non esiste una regola per il protocollo http, possiamo accettare tcp sulla porta 80. Le connessioni sono _entranti_, quindi dobbiamo fare in modo che si connetti alla nostra porta 80.
```
iptables -A INPUT -p tcp --dport 80 -j ACCEPT
```

### es3
Consentiamo le connessione di tipo tcp alla porta 22 (solitamente destinata a SSH):
```
iptables -A OUTPUT -p tcp -d 192.168.56.0/24 --dport 22 -j ACCEPT 
```

### es4
Siccome dobbiamo bloccare l'inoltro, lavoriamo sulla catena FORWARD.
```
iptables -A FORWARD -s 192.168.56.0/24 ! -d 192.168.56.0/24 -j DROP
```
PS: ho aggiunto la parte `! -d 192.168.56.0/24` siccome il prof l'ha fatto e in questo modo siamo sicuri che possiamo per esempio inoltrare i pacchetti provenienti dalla rete stessa alla rete senza problemi. 

### es5
Per questo, apriamo tutte le comunicazioni sulla porta 53, destinata al DNS.
Teniamo a mente che DNS usa udp per address resolution.
```
iptables -A OUTPUT -p udp --dport 53 -j ACCEPT
iptables -A INPUT -p udp --sport 53 -j ACCEPT
```

### es6
Blocchiamo tutti i pacchetti in entrata. Per farlo, cambiamo la main policy della catena input a DROP, in modo che se un pacchetto non fa match con nessuna delle regole, viene droppato di default. 
```
iptables -P INPUT DROP
```