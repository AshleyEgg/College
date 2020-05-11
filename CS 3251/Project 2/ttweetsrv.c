/* Based on http://cs.baylor.edu/~donahoo/practical/CSockets/textcode.html TCP Echo Server-Select and https://www.geeksforgeeks.org/socket-programming-in-cc-handling-multiple-clients-on-server-without-multi-threading/*/
#include <stdio.h>      /* for printf() and fprintf() */
#include <sys/socket.h> /* for socket(), bind(), and connect() */
#include <arpa/inet.h>  /* for sockaddr_in and inet_ntoa() */
#include <stdlib.h>     /* for atoi() and exit() */
#include <string.h>     /* for memset() */
#include <unistd.h>     /* for close() */
#include <sys/time.h>   /* for struct timeval {} */
#include <fcntl.h>      /* for fcntl() */
#include <errno.h>

#define MAXPENDING 5    /* Maximum outstanding connection requests */ //Mabye needs to be adjusted as clients added?
#define RCVBUFSIZE 153   /* Size of receive buffer */                        //Needs to be changed
#define MAXCLIENTS 5	/* Maximum number of clients that can be connected */
#define BUFSIZE 1024

/* Global Variables */
int clientNum = 0;		/* Number of active clients */
struct clients {
	int id;				/* Location in client_sockets[] */
	int sd;				/* Socket Descriptor */
	char username[100];		/* Username of client */
	char *hashes[3];		/* The three hashtags the client is subscribed to */
};
struct clients Users[5]; //Maybe right

void DieWithError(char *errorMessage)  /* Error handling function */
{
    perror(errorMessage);
    exit(1);
}  

/* Creates TCP Server Socket */
int CreateTCPServerSocket(unsigned short port)
{
    int sock;                        /* socket to create */
    struct sockaddr_in echoServAddr; /* Local address */

    /* Create socket for incoming connections */
    if ((sock = socket(PF_INET, SOCK_STREAM, IPPROTO_TCP)) < 0)
        DieWithError("socket() failed");
      
    /* Construct local address structure */
    memset(&echoServAddr, 0, sizeof(echoServAddr));   /* Zero out structure */
    echoServAddr.sin_family = AF_INET;                /* Internet address family */
    echoServAddr.sin_addr.s_addr = htonl(INADDR_ANY); /* Any incoming interface */
    echoServAddr.sin_port = htons(port);              /* Local port */

    /* Bind to the local address */
    if (bind(sock, (struct sockaddr *) &echoServAddr, sizeof(echoServAddr)) < 0)
        DieWithError("bind() failed");

    /* Mark the socket so it will listen for incoming connections */
    if (listen(sock, MAXPENDING) < 0)
        DieWithError("listen() failed");

	puts("Finsihed making a socket. Now listening...\n");
    return sock;
} 

/* Accept TCP Connection */
int AcceptTCPConnection(int servSock)
{
    int clntSock;                    /* Socket descriptor for client */
    struct sockaddr_in echoClntAddr; /* Client address */
    unsigned int clntLen;            /* Length of client address data structure */

    /* Set the size of the in-out parameter */
    clntLen = sizeof(echoClntAddr);
    
    /* Wait for a client to connect */
    if ((clntSock = accept(servSock, (struct sockaddr *) &echoClntAddr, 
           &clntLen)) < 0)
        DieWithError("accept() failed");
    
    /* clntSock is connected to a client! */
    
    //printf("Handling client %s\n", inet_ntoa(echoClntAddr.sin_addr));

    return clntSock;
}

void HandleTCPClient(int clntSocket, char buffer[])   /* TCP client handling function */
{
	char *token;						/* Used to tokenize message */
	//char tempToken[100];
	char message[1024];					/* Message received */
	char *user;							/* Username of client */
	char tempUser[100];
	char *tweet;						/* Tweet text */
	int loc;							/* Location */

    char msgBuffer[RCVBUFSIZE];        /* Buffer for message string */
    int recvMsgSize;                    /* Size of received message */
	char resp[150];						/* Response to client */
	int respLen;						/* Length of response */
	int check;			


	//printf("%s\n", "Handeling client");	
	//printf("Buffer: %s\n", buffer);

	/* Breaks apart header and packet */
	token = strtok(buffer," ");
	//printf("Token is %s\n", token);
	memset(resp,0, 150);

	if (!strcmp(token, "user")){				/* Client is checking a username */  
		//printf("%s\n", "Checking username:");
		memset(tempUser,0,100);
		strcpy(tempUser,&buffer[5]);
		check = 0;

		printf("Checking username: %s\n", tempUser);
		for (int i = 0; i < MAXCLIENTS; i++){
			if(!strcmp(tempUser,Users[i].username)){
				check++;
				strcpy(resp, "NACK");

			}
		}
		for(int i = 0; i < MAXCLIENTS; i++){
			if (check == 0 && !(strcmp(Users[i].username, ""))){
				strcpy(Users[i].username, tempUser);	
				Users[i].sd = clntSocket;
				strcpy(resp, "Username valid. Connection Established.\n");	
				break;
			}	
		}

	}else if (!strcmp(token, "tw")){			/* Client is tweeting a message */
		memset(resp,0, 150);
		//printf("%s\n","Tweeting");
		user = strtok(NULL," ");				/* Get Username of Client that sent the tweet */
		printf("%s is tweeting.\n",user);

		tweet = strtok(NULL, "\"");				/* Get actual message being tweeted */
		//printf("Tweet is %s\n",tweet);

		token = strtok(NULL, " ");					/* Get hashtags associated with message */
		//printf("Token is %s\n",token);

		while(token != NULL){
			for(int i = 0; i < MAXCLIENTS; i++){
				for(int j = 0; j < 3; j++){
					if(!strcmp(Users[i].hashes[j],token) || !strcmp(Users[i].hashes[j],"ALL")){
						printf("Sending tweet(%s) with hashtag #%s to user %s\n",tweet,token,Users[i].username);
						send(Users[i].sd, tweet, strlen(tweet), 0); /* Sends message to users subscribed to hashtag */
					}
				}
			}
			token = strtok(NULL, " ");
		}
		strcpy(resp, "\nTweet Successful.");

	}else if (!strcmp(token, "hash")){			/* Client is subscribing to a hashtag */
		memset(resp,0, 150);
		//memset(tempToken,0, 150);
		//printf("%s\n","Subscribing");
		user = strtok(NULL," ");				/* Get Username of Client that sent the tweet */
		printf("%s is subscribing.\n",user);

		loc = atoi(strtok(NULL, " "));			/* Get which hashtag is new */
		token = strtok(NULL, " ");				/* Get the new hashtag */
		//strcpy(tempToken, token);
		//printf("Token is %s\n",token);
		for(int i = 0; i < MAXCLIENTS; i++){
			if(!strcmp(Users[i].username, user)){
				strcpy(Users[i].hashes[loc], token);
				strcpy(resp, "Subscribe sucessful.");
			}
		}
		for(int i = 0; i < MAXCLIENTS; i++){
			for(int j= 0; j <3; j++){
				//printf("User: %s, Hash %i:%s\n",Users[i].username,j,Users[i].hashes[j]);
			}
		}
	}else if (!strcmp(token, "unhash")){
		memset(resp,0, 150);
		//printf("%s\n","Unsubscribing");
		user = strtok(NULL," ");				/* Get Username of Client that sent the tweet */
		printf("%s is unsubscribing.\n",user);

		loc = atoi(strtok(NULL, " "));			/* Get which hashtag is new */
		token = strtok(NULL, " ");				/* Get the new hashtag */

		for(int i = 0; i < MAXCLIENTS; i++){
			if(!strcmp(Users[i].username, user)){
				Users[i].hashes[loc] = "";
				strcpy(resp, "Unsubscribe sucessful.");
			}
			
		}
	}else if (!strcmp(token, "exit")){			/* If user is exiting */
		user = strtok(NULL," ");
		printf("%s is exiting.\n",user);
		for(int i = 0; i < MAXCLIENTS; i++){
			if(!strcmp(Users[i].username, user)){
				close(Users[i].sd); 
					
			}
		}	
	}	
	//printf("Response: %s\n \n",resp);
    	/* Send response */
		respLen = strlen(resp);
    	send(clntSocket, resp, respLen, 0);

}



int main(int argc, char *argv[])
{
    int servSock;                    /* Socket descriptor for server */
    int clntSock;                    /* Socket descriptor for client */
    int maxDescriptor;               /* Maximum socket descriptor value */
    fd_set sockSet;                  /* Set of socket descriptors for select() */
    struct sockaddr_in servAddr; 	 /* Local address */					//Myabe not needed?
    struct sockaddr_in clntAddr;  	 /* Client address */					//Maybe not needed
    unsigned short servPort;     	 /* Server port */
    unsigned int clntLen;            /* Length of client address data structure */
	char buf[BUFSIZE];
	fd_set readfds;
	int client_sockets[5], sd, valread, newChild;
 

    if (argc != 2)     /* Test for correct number of arguments */
    {
        fprintf(stderr, "Usage:  %s <Server Port>\n", argv[0]);
        exit(1);
    }

    servPort = atoi(argv[1]);  /* First arg:  local port */

	for (int i = 0; i < MAXCLIENTS; i++){
		client_sockets[i] = 0;
	}

	for (int i = 0; i < MAXCLIENTS; i++){
		strcpy(Users[i].username, "");
		for (int j = 0; j < 3; j++){
			Users[i].hashes[j] = malloc(100);//Need to free
			strcpy(Users[i].hashes[j], "");
		}
	}

	/* Creates a socket, bind it to local address and listen for connections */
    servSock = CreateTCPServerSocket(servPort);		

    for (;;) /* Run forever */
    {
		FD_ZERO(&readfds); 	
		FD_SET(servSock, &readfds); 
		maxDescriptor = servSock;

		for (int i = 0; i < MAXCLIENTS; i++){			/* Adds child sockets to the set */
			sd = client_sockets[i];
			if (sd > 0){
				FD_SET(sd, &readfds);			
			}
			if (sd > maxDescriptor){
				maxDescriptor = sd;
			}
		}

		if (select(maxDescriptor + 1, &readfds, NULL, NULL, NULL) < 0)
		{ 
			DieWithError("Select Error."); 
		}


		if (FD_ISSET(servSock, &readfds)){
			newChild = AcceptTCPConnection(servSock);
			//printf("%s\n","Accepted");
			for (int i = 0; i < MAXCLIENTS; i++){
				if (client_sockets[i] == 0){
					client_sockets[i] = newChild;
					//printf("Adding to list of sockets as %d\n" , i);
					break;
				}
			}
		}

		for (int i = 0; i < MAXCLIENTS; i++){
			sd = client_sockets[i];
			if (FD_ISSET(sd, &readfds)){
				if ((valread = read(sd , buf, 1024)) == 0) 
				{ 
					close( sd ); 
					client_sockets[i] = 0; 
				} else{
					//printf("Valread:%i\n",valread);
					buf[valread] = '\0';
					//printf("Buffer: %s\n",buf);
					HandleTCPClient(client_sockets[i], buf);					
				}
			}
		}
    }
    /* NOT REACHED */
	return 0;
}

