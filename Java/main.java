import java.util.*;

public class Main {
    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            System.out.println("Input Zadanie number");
            System.out.println("1 - Zadanie1_1");
            System.out.println("2 - Zadanie2_1");
            System.out.println("3 - Zadanie3_21");
            System.out.print("Enter number: ");
            char s = scanner.next().charAt(0);
            switch (s) {
                case '3':
                    Zadanie3_21();
                    break;
                case '2':
                    Zadanie2_1();
                    break;
                case '1':
                    Zadanie1_1();
                    break;
                default:
                    System.out.println("Error");
            }
        }
    }

    public static void Zadanie1_1() {
        List<Integer> number = Arrays.asList(76, 24, 614, 14, 1153);
        int a = 0, b = 0, sum = 0, mult = 1;
        for (int i = 0; i < number.size(); i++) {
            if (number.get(i) < 0) break;
            a = number.get(i);
            while (a > 0) {
                b = a % 10;
                sum = sum + b;
                mult = mult * b;
                a = a / 10;
            }
            if (sum < mult) System.out.println("Index number = " + i);
            sum = 0;
            mult = 1;
        }
    }

    public static void Zadanie3_21() {
        Scanner scanner = new Scanner(System.in);
        while (true) {
            int counterNull = 1;
            System.out.println("Enter the string:");
            String S = scanner.nextLine();
            for (int i = 0; i < S.length(); i++) {
                if (S.substring(i, i + 1).equals("0") && S.substring(i + 1, i + 2).equals("0")) {
                    counterNull++;
                }
                if (S.substring(i + 1, i + 2).equals("1") && S.substring(i, i + 1).equals("0")) {
                    if (S.substring(i - counterNull, i - counterNull + 1).equals("1") && S.substring(i - counterNull + 1, i - counterNull + 2).equals("0")) {
                        System.out.println(S.substring(i - counterNull, i - counterNull + counterNull + 2));
                        counterNull = 1;
                    }
                }
            }
        }
    }

    public static void Zadanie2_1() {
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

        Scanner scanner = new Scanner(System.in);
        String number;
        while (true) {
            do {
                System.out.println("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)");
                System.out.println("Enter roman number:");
                number = scanner.nextLine();
                if (!isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse)) {
                    System.out.println("Error roman number");
                }
            } while (!isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse));
            System.out.println("Arabian number = " + translation(number, RomanNumeralReverse));
        }
    }

    public static boolean isValidRomanNumeral(String romanNumber, Map<Integer, String> RomanNumeral, Map<String, Integer> RomanNumeralReverse) {
        int counterForTwo = 0;
        for (int i = 0; i < romanNumber.length(); i++) {
            int isValidCounter = 0;
            for (int j = 0; j < RomanNumeral.size(); j++) {
                if (romanNumber.substring(i, i + 1).equals(RomanNumeral.get(j))) {
                    isValidCounter++;
                    break;
                }
            }
            if (isValidCounter == 0) return false;
        }
        for (int i = 0; i < romanNumber.length(); i++) {
            if (romanNumber.substring(i, i + 1).equals(RomanNumeral.get(5)) && romanNumber.substring(i + 1, i + 2).equals(RomanNumeral.get(5))) {
                counterForTwo++;
            } else if (romanNumber.substring(i, i + 1).equals(RomanNumeral.get(50)) && romanNumber.substring(i + 1, i + 2).equals(RomanNumeral.get(50))) {
                counterForTwo++;
            } else if (romanNumber.substring(i, i + 1).equals(RomanNumeral.get(500)) && romanNumber.substring(i + 1, i + 2).equals(RomanNumeral.get(500))) {
                counterForTwo++;
            }
            if (counterForTwo > 0) return false;
            int repeatCountThreeTimes = 0;
            for (int j = 0; j < romanNumber.length(); j++) {
                if (romanNumber.substring(i, i + 1).equals(romanNumber.substring(j, j + 1))) repeatCountThreeTimes++;
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