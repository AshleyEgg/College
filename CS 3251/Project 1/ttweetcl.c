/* Based on http://cs.baylor.edu/~donahoo/practical/CSockets/textcode.html TCP Echo Client */
#include <stdio.h>      /* for printf() and fprintf() */
#include <sys/socket.h> /* for socket(), connect(), send(), and recv() */
#include <arpa/inet.h>  /* for sockaddr_in and inet_addr() */
#include <stdlib.h>     /* for atoi() and exit() */
#include <string.h>     /* for memset() */
#include <unistd.h>     /* for close() */

#define RCVBUFSIZE 151   /* Size of receive buffer */								

void DieWithError(char *errorMessage)  /* Error handling function */
{
    perror(errorMessage);
    exit(1);
}

int main(int argc, char *argv[])
{
    int sock;                        /* Socket descriptor */						
    struct sockaddr_in servAddr;	 /* Server address */
    unsigned short servPort;     	 /* Server port */
	char *flag;						 /* Flag for download or upload */
    char *servIP;                    /* Server IP address (dotted quad) */
    char *message;			         /* Message to send to server */
	char message1[153];
    char buffer[RCVBUFSIZE];    	 /* Buffer for response */
    unsigned int msgLength;		     /* Length of message */
    int bytesRcvd, totalBytesRcvd;   /* Bytes read in single recv() 
                                        and total bytes read */


    if ((argc < 4) || (argc > 5))    /* Test for correct number of arguments */						
    {
       fprintf(stderr, "Usage: %s <Flag> <Server IP> <Server Port> <Message>\n",
               argv[0]);
       exit(1);
    }
	flag = argv[1];				  /* First arg: flag for upload or download */
    servIP = argv[2];             /* Second arg: server IP address (dotted quad) */
	servPort = atoi(argv[3]);	  /* Third arg: server port number */
    if (argc == 5){
        message = argv[4];         /* Fourth arg: message to send to server */
		msgLength = strlen(message);          	/* Determine message length */
    }else{
        message = NULL;
		msgLength = 3;          		/* Determine message length */
	}
	/* Enforce 150 char limit */
	if(msgLength > 150)				
		DieWithError("Error: Message must be less than 150 characters.\n");
	else if(msgLength <= 0)
		DieWithError("Error: Message can not be empty.\n");

    /* Create a reliable, stream socket using TCP */
    if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
        DieWithError("socket() failed");

    /* Construct the server address structure */
    memset(&servAddr, 0, sizeof(servAddr));     		/* Zero out structure */
    servAddr.sin_family      = AF_INET;             	/* Internet address family */
    servAddr.sin_addr.s_addr = inet_addr(servIP);   	/* Server IP address */
    servAddr.sin_port        = htons(servPort);   		/* Server port */

    /* Establish the connection to the server */
    if (connect(sock, (struct sockaddr *) &servAddr, sizeof(servAddr)) < 0)
        DieWithError("connect() failed");

	if(argc == 5 && !strcmp(flag,"-u")){			/* Client is uploading */	
		sprintf(message1,"%s %s",flag,message);
		msgLength = strlen(message1);

	    /* Send the string to the server */
    	if (send(sock, message1, msgLength, 0) != msgLength)
        	DieWithError("send() sent a different number of bytes than expected");

		memset(buffer, 0, 150);
		/* Recieve ACK from the server */								
		if(recv(sock, buffer, RCVBUFSIZE-1, 0) <= 0)
          	DieWithError("recv() failed or connection closed prematurely!");

	}else if(argc == 4 && !strcmp(flag,"-d")){		/* Client is downloading */		
		message = strcat(flag, " ");

		/* Send the string to the server */
		msgLength = strlen(message);
    	if (send(sock, message, msgLength, 0) != msgLength)		
        	DieWithError("send() sent a different number of bytes than expected");

		memset(buffer, 0, 150);
		/* Recieve message from the server */										
		if(recv(sock, buffer, RCVBUFSIZE-1, 0) <= 0)
          	DieWithError("recv() failed or connection closed prematurely!");
	}else{
		fprintf(stderr, "Usage: %s -u <Server IP> <Server Port> <Message>\n",argv[0]);
		fprintf(stderr, "Usage: %s -d <Server IP> <Server Port> \n",argv[0]);
		exit(1);
	}

   	printf("Recieved: %s",buffer);
    printf("\n");    /* Print a final linefeed */

    close(sock);
    exit(0);
}
