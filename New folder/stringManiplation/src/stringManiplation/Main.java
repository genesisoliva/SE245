/**
 * 
 */
package stringManiplation;

import java.util.Scanner;

public class Main {
	static Scanner scanner; //Allows scanner to be public

	public static void main(String[] args) {
		
		scanner = new Scanner(System.in); //Creates Scanner object
		
		try {
			gatherInput(scanner); //Grabs functions
			
		}  finally {
			scanner.close();
		}
	}
	
	private static void gatherInput(Scanner scanner) {
		//Prompts user to enter a sentence
		System.out.println("Enter a line of text. No punctuation please.");
		String userSentence = scanner.nextLine();
		int spaceFinder = userSentence.indexOf(' ');
		
		//If user doesnt type anything and hits enter
		if(userSentence.equals("") && spaceFinder == -1) {
			System.out.println("ERROR: String is empty. TRY AGAIN...");
			return;
		}
		
		//If there's not a space
		else if(spaceFinder == -1) {
			System.out.println("ERROR: 0 SPACES where found... TRY AGAIN.");
			return;
		}
		//If user doesnt put a word after a space
		else if( userSentence.charAt(userSentence.length()-1) == ' ') {
			System.out.println("ERROR: 0 WORDS where found after space... TRY AGAIN.");
			return;
		}
		//Passes all the errors
		else if(userSentence.charAt(userSentence.length()-1) != ' ') {
			userSentence += ' ';
		}
		
		userSentence = userSentence.substring(spaceFinder+1, spaceFinder+2).toUpperCase() + userSentence.substring(spaceFinder+2) + userSentence.substring(0, spaceFinder);
		
		System.out.println("I have rephrased that line to read: ");
		System.out.println(userSentence);
		
	}
	
	
	
}