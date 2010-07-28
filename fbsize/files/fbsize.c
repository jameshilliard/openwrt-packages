#include <sys/ioctl.h> 
#include <string.h> 
#include <errno.h> 
#include <stdlib.h> 
#include <stdio.h> 

int 
main(int argc,char **argv) 
{ 
struct winsize ws; 

if (ioctl(0,TIOCGWINSZ,&ws)!=0) { 
fprintf(stderr,"TIOCGWINSZ:%s\n",strerror(errno)); 
exit(1); 
} 
printf("row=%d, col=%d, xpixel=%d, ypixel=%d\n", 
ws.ws_row,ws.ws_col,ws.ws_xpixel,ws.ws_ypixel); 
return 0; 
}
