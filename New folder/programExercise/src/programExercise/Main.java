/**
 * 
 */
package programExercise;
import java.util.Scanner;

public class Main {
	static Scanner scanner; //makes public
	
	public static void main(String[] args) {
		
		scanner = new Scanner(System.in);

		try {
			gatherInput(scanner);
			
		} catch (Exception e) {
			
			System.out.println("ERROR: Try again..");
		} finally {
			scanner.close();
		}
		
	}
	

	private static void gatherInput(Scanner scanner) {
		/*System.out.println("Lets find the distance between two points!\n"
				+ "Lets start with Point A");*/
		
		Point a = Point.inputPoint(scanner);
		
		System.out.println("\nOkay, how about Point B?");
		
		Point b = Point.inputPoint(scanner);
		
		System.out.println(String.format("The distance between your points is %f!", a.distanceBetween(b)));
	}
	
	
	
	
}
