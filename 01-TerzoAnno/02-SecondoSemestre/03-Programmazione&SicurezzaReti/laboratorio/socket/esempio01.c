#include "network.h"

int main(void) {
   socketif_t socket;
   char request[] = "Ciao sono il client!\n";
   char response[MTU];
   char hostAdress[MAXADDRESSLEN];
   int port;
   
   socket = createUDPInterface(200000);
   UDPSend(socket, request, strlen(request), "127.0.0.1", 35000);
   UDPReceive(socket, response, MTU, hostAdress, &port);
   printf("[CLIENT] Ho ricevuto un messaggio da host/porta %s/%d\n", hostAdress, port);
   printf("[CLIENT] Contenuto %s\n", response);
}