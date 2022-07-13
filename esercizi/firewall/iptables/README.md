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

Prima di tutto, l'esercizio non lo specifica, ma si fa riferimento all'architettura delle slides sulla VPN/IPSec. Dunque, dobbiamo tirare su l'architettura. Consiglio inoltre di lavorare direttamente sulla VM per questi esercizi, siccome si possono fare dei casini con iptables, eliminando per esempio le regole tirate su da Docker.  

Dunque, cominciamo. 
Eseguiamo lo script nella cartella (come root, se non ti fidi puoi controllare il codice di cosa fa esattamente lo script):
```bash
./crea_rete.sh
```
Dentro entrare nel container R1 e R2:
```bash
# da una shell
docker exec -it R1 sh
# da un'altra shell
docker exec -it R2 sh
```
eseguire questi comandi, che servono per installare dipendenze varie: 
``` bash
apk add strongswan
apk add openvpn
```

Per testare, eseguire i seguenti comandi:
```
deve funzionare da h10 a GW1 e viceversa
(da host) ip netns exec h10 ping 192.168.10.254
(da R1) ping 192.168.10.10

deve funzionare da h20 a GW2 e viceversa	
(da host)ip netns exec h20 ping 192.168.20.254
(da R2) ping 192.168.20.20

deve funzionare da GW1 a GW2 e viceversa
(da R1) ping 10.12.12.20
(da R2) ping 10.12.12.10

non deve funzionare per le altre coppie possibili
(da host) ip netns exec h10 ping 192.168.20.20 
(da R1) ping 192.168.20.20
```

Se i test vanno, allora abbiamo creato la rete, e possiamo continuare con l'esercizio. 
Consiglio di fare il flushing delle regole con `` per iniziare. 


### Esercizio 1

### Esercizio 2

### Esercizio 3