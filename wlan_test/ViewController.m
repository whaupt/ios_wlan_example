//
//  ViewController.m
//  wlan_test
//
//  Created by Wolfgang Haupt on 24.04.14.
//  Copyright (c) 2014 at-visions. All rights reserved.
//

#import "ViewController.h"
#include <stdio.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <string.h>
#include <unistd.h>
#include <stdlib.h>
#include <netdb.h>

int sockfd;
int portno;

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    struct sockaddr_in serv_addr;
    struct hostent *server;

    printf("Started client.\n\n");
    portno = 5001;
    /* Create a socket point */
    sockfd = socket(AF_INET, SOCK_STREAM, 0);
    if (sockfd < 0)
    {
        perror("ERROR opening socket");
        exit(1);
    }
    server = gethostbyname("your.server.com");
    if (server == NULL) {
        fprintf(stderr,"ERROR, no such host\n");
        exit(0);
    }
    
    bzero((char *) &serv_addr, sizeof(serv_addr));
    serv_addr.sin_family = AF_INET;
    bcopy((char *)server->h_addr,
          (char *)&serv_addr.sin_addr.s_addr,
          server->h_length);
    serv_addr.sin_port = htons(portno);
    
    /* Now connect to the server */
    if (connect(sockfd,(struct sockaddr*)&serv_addr,sizeof(serv_addr)) < 0)
    {
        perror("ERROR connecting");
        exit(1);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)touched:(id)sender {
    close(sockfd);
}

@end

