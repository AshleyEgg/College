Author: Ashley Eggart
Email: aeggart6@gatech.edu
Class: CS 3251-A 
Due Date: 2/14/2019
Assignment: Programming Assignment 1

ttweetcl.c - Client side of ttweeet program based off of TCP Echo Client from http://cs.baylor.edu/~donahoo/practical/CSockets/textcode.html. Uploads a message to be stored on the server with the command: ttweetcl -u <ServerIP> <ServerPort> "message".Or downloads the current message stored in the server with the command: ttweetcl -d <ServerIP> <ServerPort>. The message sent to the server can not be more than 150 characters and must be at least 1 character. Each time that the Client is run it will display the message it recieved in response from the server. If the client sucessfully uploads a message to the server it will recieve the message 'Upload Successful' in the response. If the client downloads a message from the server it will recieve the current message that is stored in response.

ttweetsrv.c - Server side of ttweet program based off of TCP Echo Server from http://cs.baylor.edu/~donahoo/practical/CSockets/textcode.html. Stores the most recent message sent to it by the client and returns the stored message when the client requests it. Server intilized with the command: ttweetsrv <ServerPort>. Once the server starts running it should not stop running and will continue to handle clients as they come, however the server can only handle one client at a time. When run the server will print several status statements while handling the current client. It will start by specifying the IP address of the client it is handling. It will then display the current message that it has stored and the response that it is sending to the client before closing the connection.

sample.txt - Sample output from the server and clinet for a variety of test cases.

README.txt - File containing important information about the project and files it contains.

To compile:
	Client: gcc -o ttweetcl ttweetcl.c
	Server: gcc -o ttweetsrv ttweetsrv.c

To run: Start the server first and then the client
	Server: ./ttweetsrv <ServerPort>
	Client: ./ttweetcl -u <ServerIP> <ServerPort> "message"
			./ttweetcl -d <ServerIP> <ServerPort>

Protocol Description
	The messages exchanged between the server and client are fairly straight forward. If the client is uploading to the server it attaches the '-u ' flag to the front of the message so that the server is aware that it should store the message following the flag. In this case the response from the server is simply the string 'Upload Successfull'. If the client is downloading from the server it sends a packet only containg the '-d ' flag so that the server can recognize that it should respond with the stored message. The response from the server in this case would simply be the string that the server currently had stored.

Known Bugs: For some reason the client will occasionally print the message ': Success' after the client closes due to an error in the length of the message. This ': Success' does not mean that the message was successfully uploaded to the server and I was unable to determine where the phrase was coming from.
