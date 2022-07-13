# iptables

## Consegna 

```
Realizzare tre estensioni degli esempi proposti:

1) scrivere il procedimento per riuscire a inserire, in FORWARD di R1 e R2, una regola di log nella posizione specifica subito prima delle regole DROP del traffico sulla porta 22, in modo da registrare i pacchetti che non vengono accettati dalle regole iniziali (che consentono le connessioni ssh da H10 a H20) 

2) rimuovere  da H20 la regola di routing che utilizza R2 come default gateway, e inserire su R2 una regola di NAT tale per cui il traffico ssh in arrivo attraverso la vpn e diretto a H20 venga mascherato perché appaia provienente da R2 stesso, impostando come indirizzo sorgente 192.168.20.254

3) inserire su H10 e H20 regole per imporre vincoli su ssh analoghi a quelli inseriti sui gateway: H10 si deve solamente poter collegare via ssh a "H20" (ricordate che in realtà avendo fatto i NAT si collegherà a R1), e H20 deve solo poter ricevere connessioni ssh da "host1" (che sembreranno provenire da R2)

Le virgolette ci ricordano che sono in azione i NAT... host1 e host2 avranno visione di una realtà di rete falsata, ma l'effetto finale è che si deve fare quanto di meglio possibile per ottenere l'obiettivo richiesto. Cosa non è possibile distinguere?
```

## Soluzione

### Esercizio 1

### Esercizio 2

### Esercizio 3