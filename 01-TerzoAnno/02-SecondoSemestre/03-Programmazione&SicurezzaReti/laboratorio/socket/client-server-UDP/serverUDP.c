#include "../network.h"

int main(void) {
    socketif_t socket;
    char response[] = "Sono il server: ho ricvuto correttamente il tuo messaggio!\n";
    char request[MTU];
    char hostAddress[MAXADDRESSLEN];
    int port;

    socket = createUDPInterface(35000); //istanziazione dell'interfaccia socket
    printf("[SERVER] Sono in attesa di richieste da qualche client\n");

    UDPReceive(socket, request, MTU, hostAddress, &port); //ricezione dati
    printf("[SERVER] Ho ricevuto un messaggio da host/porta %s/%d\n", hostAddress, port);
    printf("[SERVER] Contenuto: %s\n", request);

    UDPSend(socket, response, strlen(response), hostAddress, port); //invio dati
}