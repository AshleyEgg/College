/* Based on http://cs.baylor.edu/~donahoo/practical/CSockets/textcode.html TCP Echo Server */
#include <stdio.h>      /* for printf() and fprintf() */
#include <sys/socket.h> /* for socket(), bind(), and connect() */
#include <arpa/inet.h>  /* for sockaddr_in and inet_ntoa() */
#include <stdlib.h>     /* for atoi() and exit() */
#include <string.h>     /* for memset() */
#include <unistd.h>     /* for close() */

#define MAXPENDING 5    /* Maximum outstanding connection requests */
#define RCVBUFSIZE 153   /* Size of receive buffer */
char message[150];
void DieWithError(char *errorMessage)  /* Error handling function */
{
    perror(errorMessage);
    exit(1);
}   

void HandleTCPClient(int clntSocket)   /* TCP client handling function */
{
    char msgBuffer[RCVBUFSIZE];        /* Buffer for message string */
    int recvMsgSize;                    /* Size of received message */
	char *token;						/* Used to tokenize message */
	char resp[150];						/* Response to client */
	int respLen;						/* Length of response */

	memset(msgBuffer,0, 153);
    /* Receive message from client */
    if ((recvMsgSize = recv(clntSocket, msgBuffer, RCVBUFSIZE, 0)) < 0)
        DieWithError("recv() failed");

	/* Breaks apart header and packet */
	token = strtok(msgBuffer," ");

	memset(resp,0, 150);
	if(!strcmp(token, "-u")){				/* Client is uploading a message */
		memset(message,0, 150);
		strcpy(message, &msgBuffer[3]);		/*Copy message into more permanent location */
		strcpy(resp, "Upload Successful");
	}else if(!strcmp(token, "-d")){			/* Client is downloading the message */
		strcpy(resp, message);
	}	

	printf("Current Message: %s\n",message);
	printf("Response: %s\n",resp);

	respLen = strlen(resp);
    /* Send response and receive again until end of transmission */
    while (recvMsgSize > 0)      /* zero indicates end of transmission */					
    {
        /* Send response back to client */
        if (send(clntSocket, resp, respLen, 0) != respLen)
            DieWithError("send() failed");

        /* See if there is more data to receive */
        if ((recvMsgSize = recv(clntSocket, msgBuffer, RCVBUFSIZE, 0)) < 0)
            DieWithError("recv() failed");
    }

	printf("Closing Connection.\n\n");
    close(clntSocket);    /* Close client socket */
}

int main(int argc, char *argv[])
{
    int servSock;                    /* Socket descriptor for server */
    int clntSock;                    /* Socket descriptor for client */
    struct sockaddr_in servAddr; 	 /* Local address */
    struct sockaddr_in clntAddr;  	 /* Client address */
    unsigned short servPort;     	 /* Server port */
    unsigned int clntLen;            /* Length of client address data structure */

    if (argc != 2)     /* Test for correct number of arguments */
    {
        fprintf(stderr, "Usage:  %s <Server Port>\n", argv[0]);
        exit(1);
    }

    servPort = atoi(argv[1]);  /* First arg:  local port */

    /* Create socket for incoming connections */
    if ((servSock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
        DieWithError("socket() failed");
      
    /* Construct local address structure */
    memset(&servAddr, 0, sizeof(servAddr));   		/* Zero out structure */
    servAddr.sin_family = AF_INET;                	/* Internet address family */
    servAddr.sin_addr.s_addr = htonl(INADDR_ANY); 	/* Any incoming interface */
    servAddr.sin_port = htons(servPort);      		/* Local port */

    /* Bind to the local address */
    if (bind(servSock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0)
        DieWithError("bind() failed");

    /* Mark the socket so it will listen for incoming connections */
    if (listen(servSock, MAXPENDING) < 0)
        DieWithError("listen() failed");

	memset(message,0, 150);
	strcpy(message,"Empty Message");

    for (;;) /* Run forever */
    {
        /* Set the size of the in-out parameter */
        clntLen = sizeof(clntAddr);

        /* Wait for a client to connect */
        if ((clntSock = accept(servSock, (struct sockaddr *) &clntAddr, 
                               &clntLen)) < 0)
            DieWithError("accept() failed");

        /* clntSock is connected to a client! */

        printf("Handling client %s\n", inet_ntoa(clntAddr.sin_addr));

        HandleTCPClient(clntSock);
    }
    /* NOT REACHED */
}
