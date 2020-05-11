Author: Ashley Eggart
Email: aeggart6@gatech.edu
Class: CS 3251-A 
Due Date: 4/13/2019
Assignment: Programming Assignment 2

ttweetcl.c - Client side of ttweeet program based off of TCP Echo Client from http://cs.baylor.edu/~donahoo/practical/CSockets/textcode.html. Can send messages to the server with the following command: tweet "<150 char max tweet>" <Hashtag>. The tweet sent should be uploaded to the server and then delivered to all the clients who are subscribed to the hashtag.
	The client can also subscribe to a hashtag with the command: subscribe <Hashtag> . This allows the client to receive 	any and all tweets sent with this hashtag attached.
	The client may unsubscribe from a hashtag and stop receiving tweets sent with the hashtag with the command: unsubscribe <Hashtag>
	The client can request all of the tweets that have been sent to it and that are currently being stored in its cache by running the following command: timeline. This will output data about all the tweets received since the last time the timeline command was called in the following format: <client_username><sender_username>: <tweet_message> <origin_hashtag>. Each time the timeline command is called it clears the cache.(This command does not work with my code.)
	Finally the client can close the connection with the server with the command: exit.

ttweetsrv.c - Server side of ttweet program based off of TCP Echo Server-Select from http://cs.baylor.edu/~donahoo/practical/CSockets/textcode.html and https://www.geeksforgeeks.org/socket-programming-in-cc-handling-multiple-clients-on-server-without-multi-threading/. 
	The server is able to manage up to 5 different concurrent client connections. The server's primary job is to receive tweets from the client and forward them to the correct clients that are subscribed to the hashtag used in the message. 

Makefile- Simple file responsible for compiling all code used in project.

sample.txt - Sample output from the server and clinet for a test case.

README.txt - File containing important information about the project and files it contains.

To compile:
	make

	OR

	Client: gcc -o ttweetcl ttweetcl.c
	Server: gcc -o ttweetsrv ttweetsrv.c

To run: Start the server first and then the client
	Server: ./ttweetsrv <ServerPort>
	Client: ./ttweetcl  <ServerIP> <ServerPort> <Username>


Protocol Description
	I worked on this project on my own and did all of the work on the client and the server. Unfortanatley, I underestimated the ammount of time this project would take as well as the ammount of time of my other responsibiliites these past couple weeks, as a result I did not leave myself enough time to finish the project and there are still several bugs in the code and all of the functionality is not quite there. The timeline command does not work and the program will occasionally seg fault for various reasons. The client is unable to send and receive at the same time and as a result a client subscribed to a hashtag will not receive the tweet when it is supposed to. In terms of implementation the server makes uses of the select() method as opposed threading, to handle up to five clients at a time.
While the functionality is not all there I tried to add parts of it in where I could. Throughout the running of the program the server prints updates as to what should be occuring. 
Known Bugs: For some reason the client will occasionally print the message ': Success' after the client closes due to an error in the length of the message. This ': Success' does not mean that the message was successfully uploaded to the server and I was unable to determine where the phrase was coming from. There are many other bugs that I have not had time to identify.
