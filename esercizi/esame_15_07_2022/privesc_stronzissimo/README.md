# Privilege Escalation con FS dell'OS modificato

### Consegna
```
Leggete tutto prima di agire!

Scaricare il file change e renderlo eseguibile

$ chmod +x ./change
Il comando apporta una modifica a un file dentro /usr/bin

Fase 1:
- ideare un modo di identificare il file modificato e il tipo di modifica apportata.
- lanciare sudo ./change
- attuare la strategia ideata al punto 1 per identificare il file modificato e il tipo di modifica apportata.
- documentare tutti i passi svolti in modo dettagliato nel file integrity.txt

Fase 2:
- catturate i comandi seguenti e l'output in uno screenshot privesc.png
- usate come utente sec il file modificato dal comando change per inserire nei file in /etc/passwd ed /etc/shadow le righe opportune per "creare" un utente di nome toor con  privilegi di root e senza password (ricordate che esistono le man page) da sec diventare toor e lanciare id
```

### Soluzione

Tutt'ora non so come si faccia. rip.
So solo che il programma modificato è `usr/bin/tee`, e lo possiamo vedere usando `strace` sull'eseguibile.  

Questo esercizio è inoltre molto stronzo siccome se usiamo l'eseguibile `change` e non riusciamo a cattarurare la modifica del FS, dobbiamo reinstallare TUTTA la VM da capo.   