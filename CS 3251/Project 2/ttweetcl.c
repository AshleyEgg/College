/* Based on http://cs.baylor.edu/~donahoo/practical/CSockets/textcode.html TCP Echo Client */
#include <stdio.h>      /* for printf() and fprintf() */
#include <sys/socket.h> /* for socket(), connect(), send(), and recv() */
#include <arpa/inet.h>  /* for sockaddr_in and inet_addr() */
#include <stdlib.h>     /* for atoi() and exit() */
#include <string.h>     /* for memset() */
#include <unistd.h>     /* for close() */

#define RCVBUFSIZE 151   /* Size of receive buffer */	
#define MAXHASH 3	 	 /* Maximum number of hashtags allowed */	

int hashNum = 0;		 /* Number of hashtags subscribed to */
char *hashes[] = {		 /* Hashtags subscribed to */
	"",
	"",
	""
};	

void DieWithError(char *errorMessage)  /* Error handling function */
{
    perror(errorMessage);
    exit(1);
}

/* Checks if hashtag is already subscribed to and if not subscribes to hashtag */
int CheckHash(char *tempHash)			
{
	int check = 0;
	for(int i = 0; i < MAXHASH; i++){
		if(!strcmp(tempHash,hashes[i])){
			check++;
		}
	}
	if(check == 0 && hashNum < 4){
		for(int i = 0; i < MAXHASH; i++){
			if(!strcmp(hashes[i],"")){
				hashes[i] = tempHash;
				hashNum ++;
				return i;
			}
						
		}
	}	
	return -1;
}

int main(int argc, char *argv[])
{
    char *servIP;                    /* Server IP address (dotted quad) */
    unsigned short servPort;     	 /* Server port */
	char *user;						 /* Client username */
    int sock;                        /* Socket descriptor */	
	struct sockaddr_in servAddr;	 /* Server address */
    char *message;			         /* Tweet to send to server */
	char message1[1024];			 /* Full formatted message to send to server */
    unsigned int msgLength;		     /* Length of message */
    char buffer[RCVBUFSIZE];    	 /* Buffer for response */
	int running = 1;				 /* If the client is still runnning */
	char input[1024];				 /* User input */
	char *command;					 /* Command the client is using */
	int inLength;					 /* Length of the input string */
	int check;						 /* Used to check random values */
	char *tok;						 /* Used to tokenize a string */
	char *tempHash;					 /* Temporary value */
    int bytesRcvd, totalBytesRcvd;   /* Bytes read in single recv() 
                                        and total bytes read */


	/* Test for correct number of arguments */	
    if ((argc != 4))    					
    {
       fprintf(stderr, "Usage: %s <Server IP> <Server Port> <Username>\n",
               argv[0]);
       exit(1);
    }

    servIP = argv[1];             /* First arg: server IP address (dotted quad) */
	servPort = atoi(argv[2]);	  /* Second arg: server port number */
	user = argv[3];				  /* Third arg: client username */

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


	/* Check if username is unique */   					
	sprintf(message1,"%s %s","user",user);
	msgLength = strlen(message1);

	//printf("User: %s\n",user);
	/* Send the username to the server */
   	if (send(sock, message1, msgLength, 0) != msgLength)
       	DieWithError("send() sent a different number of bytes than expected");

	memset(buffer, 0, 150);
	/* Recieve ACK from the server */								
	if(recv(sock, buffer, RCVBUFSIZE-1, 0) <= 0)
       	DieWithError("recv() failed or connection closed prematurely!");

   	printf("%s\n",buffer);

	/* Alert user if username is not unique */
	if(!strcmp(buffer,"NACK")){
		DieWithError("That username is already taken, please choose another.");
	}


	while(running){
		/* Get input from user */
		printf("%s","Command: ");
		scanf(" %[^\n]", input);
		inLength = strlen(input);
		//printf("Input is %s, length is %d\n",input, inLength);


		/* Determine the command the user entered */
		command = strtok(input," ");					
		//printf("Command is %s\n",command);
		//printf("Input is %s\n \n",input);

		
		if(!strcmp(command,"tweet")){				/* If client is sending a tweet */ 
			//puts("Tweeting");
			memset(message1,0, 1024);
			message = strtok(NULL, "\""); 
			//printf("Message is %s\n",message);

			/* Enforce 150 char limit */
			msgLength = strlen(message);
			if(msgLength > 150)				
				DieWithError("Error: Message must be less than 150 characters.\n");
			else if(msgLength <= 0)
				DieWithError("Error: Message can not be empty.\n");

			sprintf(message1,"tw %s %s\"",user,message);				/* Format message */

			/*Seperate Hashtags */
			input[inLength] = '#';
			input[inLength + 1] = '\0';
			//printf("Input is %s\n",input);

			tok = strtok(NULL, "#");
			tok = strtok(NULL, "#");
			//printf("Hash is %s\n", tok);

			while(tok != NULL)
			{
				sprintf(message1,"%s %s",message1, tok);
				tok = strtok(NULL, "#");
			}

			
			//printf("Message to send is: %s\n", message1);
			msgLength = strlen(message1);
	    	/* Send the string to the server */
    		if (send(sock, message1, msgLength, 0) != msgLength)
        		DieWithError("send() sent a different number of bytes than expected");

			memset(buffer, 0, 150);
			/* Recieve ACK from the server */								
			if(recv(sock, buffer, RCVBUFSIZE-1, 0) <= 0)
        	  	DieWithError("recv() failed or connection closed prematurely!");
			printf("%s\n",buffer);

		}else if(!strcmp(command,"subscribe")){						/* Client is subscribing to a hashtag */
			//puts("Subscribing");
			if(hashNum == 3){
				DieWithError("You can only be subscribed to 3 hashtags at time.");
			}

			tok = strtok(NULL,"\n");			
			tempHash = tok + 1;
			//printf("New Hash is %s\n", tempHash);
			check = CheckHash(tempHash);			
			//printf("Location is %i\n", check);

			memset(message1,0, 1024);
			if(check >= 0){									
				sprintf(message1,"hash %s %i %s ",user,check,tempHash);
				//printf("Message to send is: %s\n", message1);
				msgLength = strlen(message1);
	    		/* Send hashtag to the server */
    			if (send(sock, message1, msgLength, 0) != msgLength)
        			DieWithError("send() sent a different number of bytes than expected");

				memset(buffer, 0, 150);
				/* Recieve ACK from the server */								
				if(recv(sock, buffer, RCVBUFSIZE-1, 0) <= 0)
        		  	DieWithError("recv() failed or connection closed prematurely!");
				printf("%s\n",buffer);
			}

		}else if(!strcmp(command,"unsubscribe")){
			//puts("Unsubscribing");
			memset(message1,0, 1024);
			tok = strtok(NULL,"\n");	
			tempHash = tok + 1;		
			//printf("New Hash is %s", tempHash);
			for(int i = 0; i < MAXHASH; i++){
				if(!strcmp(hashes[i],tempHash)){	
					hashes[i] = "";						
					hashNum--;

					sprintf(message1,"unhash %s %i %s ",user,i,tempHash);
					//printf("Message to send is: %s\n", message1);
					msgLength = strlen(message1);
	    			/* Send hashtag to the server */
    				if (send(sock, message1, msgLength, 0) != msgLength)
        				DieWithError("send() sent a different number of bytes than expected");

					memset(buffer, 0, 150);
					/* Recieve ACK from the server */								
					if(recv(sock, buffer, RCVBUFSIZE-1, 0) <= 0)
        			  	DieWithError("recv() failed or connection closed prematurely!");
					printf("%s\n",buffer);
					
				}
			}

		
		}else if(!strcmp(command,"timeline")){
			puts("Timeline");
		//stores all messages in mem that was sent to client
		// clears after it was called
		// check documentation for formatting

		//Not right for sure

		}else if(!strcmp(command,"exit")){		
			//puts("Exiting");
			memset(message1,0, 1024);
			sprintf(message1,"exit %s",user);
			msgLength = strlen(message1);
			if (send(sock, message1, msgLength, 0) != msgLength)
        				DieWithError("send() sent a different number of bytes than expected");
			running = 0;
			close(sock);
    		exit(0);
		}else{
			puts("Please enter a valid command.");
		}
		memset(input,0, 1024);
	}
}
