#Name - Pratik Dhakal
#Student ID - 1001637085
#OS - Windows
#Version - "Python 3.9.7"

#imports the os library, which consists of the 
#the functions that we use in this program
import os


#defines the function
def getDirSize(dir):
    #Local variable size created to add up the size of each file 
    #and store into it
    size = 0 
    #The method listdir makes a list of the names of all the files and directories 
    #inside the current directory and stores it inside the array files.
    files = os.listdir(dir)

    #This for loop itereates until the files array ends
    for x in files:

        #In this line, you take the current working directory "dir", and then concatenate a "/"
        #and the name of a file stored in variable "x". This is so that you create a path for that
        #certain file in the directory
        currentFile = dir + "/" + x

        if os.path.isdir(currentFile): #If what is stored in currentFile is a directory, this if statement triggers
            size += getDirSize(currentFile)#if it is a directory, then you recurse and get into that directory

        else: #if it is not a directory, but a file, then this else statement occurs
            size += os.path.getsize(currentFile) #if it is a file, then just take the size of the file and store it
                                                # in variable size

    #This returns the size of the directory that this method is currently given 
    return size



#Gets the current working directory that the file is in
currentDir = os.getcwd()
#This is variable declared to store the size of the directory
size = 0
#Calls upon the object getDirSize and sends it the current working directory.
#The function getDirSize returns the size of the directory, which is then stored
#inside the size variable
size = getDirSize(currentDir)

#Prints out the size of the current directory
print('The size of the directory is ' + str(size) + ' bytes')
