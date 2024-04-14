import java.util.Scanner;
import java.util.HashMap;
import java.util.Map;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Input Zadanie number");
        System.out.println("1 - Zadanie1_1");
        System.out.println("2 - Zadanie2_1");
        System.out.println("3 - Zadanie3_21");
        System.out.print("Enter number: ");
        char s = scanner.next().charAt(0);
        switch (s) {
            case '3':
                zadanie3_21();
                break;
            case '2':
                zadanie2_1();
                break;
            case '1':
                zadanie1_1();
                break;
            default:
                System.out.println("Error");
                break;
        }
    }

    public static void zadanie3_21() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the number of numbers:");
        int size = scanner.nextInt();
        int[] number = new int[size];
        for (int i = 0; i < size; i++) {
            System.out.println("Enter " + (i + 1) + " number:");
            number[i] = scanner.nextInt();
        }
        int a, b, sum, mult;
        for (int i = 0; i < size; i++) {
            if (number[i] >= 0) {
                a = number[i];
                sum = 0;
                mult = 1;
                while (a > 0) {
                    b = a % 10;
                    sum = sum + b;
                    mult = mult * b;
                    a = a / 10;
                }
                if (sum < mult) System.out.println("Index number = " + i);
            }
        }
    }

    public static void zadanie1_1() {
        Scanner scanner = new Scanner(System.in);
        System.out.println("Enter the string:");
        String S = scanner.nextLine();
        int counterNull = 1;
        for (int i = 0; i < S.length() - 1; i++) {
            if (S.charAt(i) == '0' && S.charAt(i + 1) == '0') {
                counterNull++;
            }
            if (i < S.length() - 2 && S.charAt(i + 1) == '1' && S.charAt(i) == '0') {
                if (i - counterNull >= 0 && S.charAt(i - counterNull) == '1' && S.charAt(i - counterNull + 1) == '0') {
                    System.out.println(S.substring(i - counterNull, i - counterNull + counterNull + 2));
                    counterNull = 1;
                }
            }
        }
        zadanie3_21();
    }

    public static void zadanie2_1() {
        Scanner scanner = new Scanner(System.in);
        Map<Integer, String> RomanNumeral = new HashMap<>();
        RomanNumeral.put(1, "I");
        RomanNumeral.put(5, "V");
        RomanNumeral.put(10, "X");
        RomanNumeral.put(50, "L");
        RomanNumeral.put(100, "C");
        RomanNumeral.put(500, "D");
        RomanNumeral.put(1000, "M");
        RomanNumeral.put(10000, "Q");

        Map<String, Integer> RomanNumeralReverse = new HashMap<>();
        RomanNumeralReverse.put("I", 1);
        RomanNumeralReverse.put("V", 5);
        RomanNumeralReverse.put("X", 10);
        RomanNumeralReverse.put("L", 50);
        RomanNumeralReverse.put("C", 100);
        RomanNumeralReverse.put("D", 500);
        RomanNumeralReverse.put("M", 1000);
        RomanNumeralReverse.put("Q", 10000);

        askForRomanNumber(scanner, RomanNumeral, RomanNumeralReverse);
    }

    public static void askForRomanNumber(Scanner scanner, Map<Integer, String> RomanNumeral, Map<String, Integer> RomanNumeralReverse) {
        System.out.println("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)");
        System.out.print("Enter roman number: ");
        String number = scanner.nextLine();
        if (!isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse)) {
            System.out.println("Error roman number");
            askForRomanNumber(scanner, RomanNumeral, RomanNumeralReverse);
        } else {
            System.out.println("Arabian number = " + translation(number, RomanNumeralReverse));
        }
    }

    public static boolean isValidRomanNumeral(String romanNumber, Map<Integer, String> RomanNumeral, Map<String, Integer> RomanNumeralReverse) {
        int counterForTwo = 0;
        for (int i = 0; i < romanNumber.length(); i++) {
            int isValidCounter = 0;
            for (Map.Entry<Integer, String> entry : RomanNumeral.entrySet()) {
                if (romanNumber.charAt(i) == entry.getValue().charAt(0)) {
                    isValidCounter++;
                    break;
                }
            }
            if (isValidCounter == 0) return false;
        }
        for (int i = 0; i < romanNumber.length() - 1; i++) {
            if ((romanNumber.charAt(i) == RomanNumeral.get(5).charAt(0) && romanNumber.charAt(i + 1) == RomanNumeral.get(5).charAt(0)) ||
                (romanNumber.charAt(i) == RomanNumeral.get(50).charAt(0) && romanNumber.charAt(i + 1) == RomanNumeral.get(50).charAt(0)) ||
                (romanNumber.charAt(i) == RomanNumeral.get(500).charAt(0) && romanNumber.charAt(i + 1) == RomanNumeral.get(500).charAt(0))) {
                counterForTwo++;
            }
            if (counterForTwo > 0) return false;
            int repeatCountThreeTimes = 0;
            for (int j = i; j < romanNumber.length(); j++) {
                if (romanNumber.charAt(i) == romanNumber.charAt(j)) repeatCountThreeTimes++;
                else break;
            }
            if (repeatCountThreeTimes > 3) return false;
        }
        return true;
    }

    public static int translation(String romanNumber, Map<String, Integer> RomanNumeralReverse) {
        int total = 0;
        int prevValue = 0;
        for (int i = romanNumber.length() - 1; i >= 0; i--) {
            int value = RomanNumeralReverse.get(romanNumber.substring(i, i + 1));
            if (value < prevValue) {
                total -= value;
            } else {
                total += value;
            }
            prevValue = value;
        }
        return total;
    }
}