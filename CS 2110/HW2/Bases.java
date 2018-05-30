/**
 * CS 2110 Spring 2018 HW2
 * Part 2 - Coding with bases
 *
 * @author Ashley Eggart
 *
 * Global rules for this file:
 * - You may not use more than 2 conditionals per method. Conditionals are
 *   if-statements, if-else statements, or ternary expressions. The else block
 *   associated with an if-statement does not count toward this sum.
 * - You may not use more than 2 looping constructs per method. Looping
 *   constructs include for loops, while loops and do-while loops.
 * - You may not use nested loops.
 * - You may not declare any file-level variables.
 * - You may not declare any objects, other than String in select methods.
 * - You may not use switch statements.
 * - You may not use the unsigned right shift operator (>>>)
 * - You may not write any helper methods, or call any other method from this or
 *   another file to implement any method.
 * - The only Java API methods you are allowed to invoke are:
 *     String.length()
 *     String.charAt()
 * - You may not invoke the above methods from string literals.
 *     Example: "12345".length()
 * - When concatenating numbers with Strings, you may only do so if the number
 *   is a single digit.
 *
 * Method-specific rules for this file:
 * - You may not use multiplication, division or modulus in any method, EXCEPT
 *   decimalStringToInt.
 * - You may declare exactly one String variable each in intToBinaryString and
 *   and intToHexString.
 */
public class Bases
{
    /**
     * Convert a string containing ASCII characters (in binary) to an int.
     * You do not need to handle negative numbers. The Strings we will pass in will be
     * valid binary numbers, and able to fit in a 32-bit signed integer.
     *
     * Example: binaryStringToInt("111"); // => 7
     */
    public static int binaryStringToInt(String binary)
    {
        int hold;
        int result = 0;
        int place = binary.length()-1;
        for(int i = 0; i < binary.length(); i++){
            hold = (int) binary.charAt(i) -48;
            result = result + (hold << place);
            place = place - 1;
        }
        return result;
    }

    /**
     * Convert a string containing ASCII characters (in decimal) to an int.
     * You do not need to handle negative numbers. The Strings we will pass in will be
     * valid decimal numbers, and able to fit in a 32-bit signed integer.
     *
     * Example: decimalStringToInt("123"); // => 123
     */
    public static int decimalStringToInt(String decimal)
    {
        int one = 1;
        int hold;
        int result = 0;
        for(int i = decimal.length()-1; i >= 0; i--){
            hold = (int) decimal.charAt(i) - 48;
            result = result + one * hold;
            one = one * 10;
        }
        return result;
    }

    /**
     * Convert a string containing ASCII characters (in hex) to an int.
     * The input string will only contain numbers and uppercase letters A-F.
     * You do not need to handle negative numbers. The Strings we will pass in will be
     * valid hexadecimal numbers, and able to fit in a 32-bit signed integer.
     *
     * Example: hexStringToInt("A6"); // => 166
     */
    public static int hexStringToInt(String hex)
    {
        char temp;
        int hold;
        int result = 0;
        for(int i = 0; i < hex.length(); i++){
            temp = hex.charAt(i);
            if(temp > 60){ //if it is a letter
                hold = (int) temp - 55;
            } else {
                hold = (int) temp - '0';
            }
            result = (result << 4) | hold;
        }

        return result;
    }

    /**
     * Convert a int into a String containing ASCII characters (in binary).
     * You do not need to handle negative numbers.
     * The String returned should contain the minimum number of characters necessary to
     * represent the number that was passed in.
     *
     * Example: intToBinaryString(7); // => "111"
     */
    public static String intToBinaryString(int binary)
    {
        String result = "";
        int temp = binary;
        char hold;
        while(temp !=0){
            hold = (char)((temp & 1) + '0');
            result = hold + result;
            temp = temp >> 1;
        }
        if(binary == 0){
            result = "0";
        }
        return result;
    }

    /**
     * Convert a int into a String containing ASCII characters (in hexadecimal).
     * The output string should only contain numbers and uppercase letters A-F.
     * You do not need to handle negative numbers.
     * The String returned should contain the minimum number of characters necessary to
     * represent the number that was passed in.
     *
     * Example: intToHexString(166); // => "A6"
     */
    public static String intToHexString(int hex)
    {
        String result = "";
        int hold = hex;
        int hold2;
        char temp;
        while(hold != 0){
            hold2 = hold & 15;
            if(hold2 >= 10){
                temp = (char)(hold2 + 55);
            } else {
                temp = (char)(hold2 + '0');
            }
            result = temp + result;
            hold = hold >> 4;
        }
        if(hex == 0){
            result = "0";
        }
        return result;
    }
}
