# CREAZIONE DELLE 3 RETI DOCKER

docker network create --subnet 192.168.10.0/24 -o com.docker.network.bridge.name=br-lan10 lan10 

docker network create --subnet 192.168.20.0/24 -o com.docker.network.bridge.name=br-lan20 lan20 

docker network create --subnet 10.12.12.0/24 -o com.docker.network.bridge.name=br-net12 net12 

# ESEGUO IL CONTAINER R1 CHE SARÀ IL PRIMO GATEWAY

docker run -dit --hostname R1 --name R1 --network net12 --ip 10.12.12.10 --cap-add=NET_ADMIN giditre/frr

# COLLEGO IL PRIMO CONTAINER ALLE CORRISPETTIVE RETI

docker network connect --ip 192.168.10.254 lan10 R1
docker network connect bridge R1

# ESEGUO IL CONTAINER R2 CHE SARÀ IL SECONDO GATEWAY

docker run -dit --hostname R2 --name R2 --network net12 --ip 10.12.12.20 --cap-add=NET_ADMIN giditre/frr

# COLLEGO IL SECONDO CONTAINER ALLE CORRISPETTIVE RETI

docker network connect --ip 192.168.20.254 lan20 R2
docker network connect bridge R2

# CREO IL PRIMO HOST ATTRAVERSO IL PRIMO NAMESPACE

ip netns add h10
ip link add veth10 type veth peer name v-h10
ip link set veth10 netns h10
ip netns exec h10 ip link set veth10 up
ip link set v-h10 up
ip link set v-h10 master br-lan10

# CREO IL SECONDO HOST ATTRAVERSO IL SECONDO NAMESPACE

ip netns add h20
ip link add veth20 type veth peer name v-h20
ip link set veth20 netns h20
ip netns exec h20 ip link set veth20 up
ip link set v-h20 up
ip link set v-h20 master br-lan20

# AGGIUNGO REGOLE DI ROUTING PER H10
ip netns exec h10 ip addr add 192.168.10.10/24 dev veth10
ip netns exec h10 ip route add default via 192.168.10.254


# AGGIUNGO REGOLE DI ROUTING PER H20
ip netns exec h20 ip addr add 192.168.20.20/24 dev veth20
ip netns exec h20 ip route add default via 192.168.20.254



