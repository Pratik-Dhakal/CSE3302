//Name - Pratik Dhakal
//Student ID - 1001637085
//OS - Linux (Computer Science VM)
// Version - "openjdk 11.0.8 2020-07-14"
import java.io.File;

public class pxd7085_lab01
{
    public static void main(String[] args)
    {   
        String path = System.getProperty("user.dir"); //Gets the current directory 

        //Sends the current directory to getDirSize method to get the size of the directory
        //getDirSize returns a the size of the directory in a long variable called size
        long size = getDirSize(path); 

        //prints the size of the directory
        System.out.println( "The size of the directory is " + size + " bytes");   
    }

    /*
        This is the method that will recurse and get the size of the whole folder
    */
    public static long getDirSize(String path) 
    {
        //CurrentDir gets the path to the current directory
        //I created a separate variable for the current path because
        //this method will be recursed, hence the current Directory will keep changing
        File currentDir = new File(path);

        long size = 0; //saves the size of each file as it goes through the directory

        //An array to save the name of all the files and subdirectories in a given directory
        String files [] = currentDir.list(); 

        //this for loop goes through a directory and checks the indexes of the files array to see
        //if the given string is a directory or a file
        for(int x = 0; x < files.length; x++)
        {
            //This file is for storing the path of each file from the files array
            //This was created because you you don't want to change currentDir as you see through each files
            File currentFile = new File(path + "/" + files[x]);
            
            //checks if a given string is a directory or not
            if(!currentFile.isDirectory())
            {
                //if it is not a directory, it is a file, whose size is stored in the variable size
                size += currentFile.length(); 
            }
            else
            {
                //if it IS a directory, then recurse to the same function, but use that directory name
                //as path, and then return the size of all the files inside that directory
                size += getDirSize(path + "/" + files[x]);
            }
        }

        
        return size; //return the size of the directory
    }
}

