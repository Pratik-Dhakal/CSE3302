#Name - Pratik Dhakal
#Student ID - 1001637085
#OS - Linux (Computer Science VM)
#Version - (v5.30.0) built for x86_64-linux-gnu-thread-multi

#Used stricts and warnings for my code so that in case there is a problem
#the code first warns us about it.
use strict;
use warnings;
#Used the Cwd library to get the cwd sub-routine that lets one
#get the current working directory that the program is in
use Cwd; 

#This function calculatues the total size of the directory, including
#all the subdirectories inside it, using recursion
#No parameters are needed to be shown here
sub getDirSize 
{
    #Instead of showing the parameters, the "@_" takes the first parameter
    #sent to the sub-routine, and stores it inside the variable $directory
    my ($directory) = @_;

    my $str2 = "/";

    #the sub-routine glob opens the directory, and reads the list of all the files 
    #and the directories and then stories it inside the @contents array
    my @contents = glob($directory);

    #The size variable adds up the size of each file
    my $size = 0;

    #This for loop runs until the end of the @contents array 
    foreach(@contents)
    {
        if(-f $_) #If the "content" is a file then this if condition triggers
        {
            #if it is a file, then -s takes the size of the file and adds it to 
            #the variable $size. $_ represents each iteration of the loop
            $size += -s $_;
        }
        #If the "content" is not a file, which implies that it is a directory
        #then this else condition occurs
        else 
        {
            #If it is a directory, then we recurse back to the top of the sub-routine,
            #so that you can find out the size of each of the files inside the directory
            #and add it up and return it into the varibale $size
            $size += getDirSize("$_/*");
        }
    }

    #This returns the total size of the directory calculates throughout this sub-routine
    return $size;
}



my $directory = getcwd(); #storing the current directory into $directory variable

#Sending the current working directory to the sub-routine getDirSize and storing the 
#value that it returns into the variable $size
my $size = getDirSize($directory);

#printint out the size of the directory, returned by the getDirSize sub-routine
print"The size of the directory is $size bytes\n";





