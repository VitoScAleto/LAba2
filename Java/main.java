import java.util.*;

public class Main { public static void main(String[] args) { Scanner scanner = new Scanner(System.in); while (true) { System.out.println("Input Zadanie number"); System.out.println("1 - Zadanie1_1"); System.out.println("2 - Zadanie2_1"); System.out.println("3 - Zadanie3_21"); System.out.print("Enter number: "); char s = scanner.next().charAt(0); switch (s) { case '3': Zadanie3_21(); break; case '2': Zadanie2_1(); break; case '1': Zadanie1_1(); break; default: System.out.println("Error"); } } }

public static void Zadanie1_1() {
    int[] number = {76, 24, 614, 14, 1153};
    for (int i = 0; i < number.length; i++) {
        int a = number[i];
        int sum = 0;
        int mult = 1;
        while (a > 0) {
            int b = a % 10;
            sum += b;
            mult *= b;
            a /= 10;
        }
        if (sum < mult) {
            System.out.println("Index number = " + i);
        }
    }
}

public static void Zadanie3_21() {
    Scanner scanner = new Scanner(System.in);
    while (true) {
        int counterNull = 1;
        System.out.println("Enter the string:");
        String S = scanner.nextLine();
        for (int i = 0; i < S.length(); i++) {
            if (S.charAt(i) == '0' && S.charAt(i + 1) == '0') {
                counterNull++;
            }
            if (S.charAt(i + 1) == '1' && S.charAt(i) == '0') {
                if (S.charAt(i - counterNull) == '1' && S.charAt(i - counterNull + 1) == '0') {
                    System.out.print(S.substring(i - counterNull, i - counterNull + counterNull + 2));
                    counterNull = 1;
                }
            }
        }
    }
}

public static void Zadanie2_1() {
    Map<String, Integer> RomanNumeral = new HashMap<>();
    RomanNumeral.put("I", 1);
    RomanNumeral.put("V", 5);
    RomanNumeral.put("X", 10);
    RomanNumeral.put("L", 50);
    RomanNumeral.put("C", 100);
    RomanNumeral.put("D", 500);
    RomanNumeral.put("M", 1000);
    RomanNumeral.put("Q", 10000);

    Scanner scanner = new Scanner(System.in);
    String number;
    while (true) {
        do {
            System.out.println("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)");
            System.out.println("Enter roman number:");
            number = scanner.nextLine();
            if (!isValidRomanNumeral(number, RomanNumeral)) {
                System.out.println("Error roman number");
            }
        } while (!isValidRomanNumeral(number, RomanNumeral));
        System.out.println("Arabian number = " + translation(number, RomanNumeral));
    }
}

public static boolean isValidRomanNumeral(String romanNumber, Map<String, Integer> RomanNumeral) {
    int counterForTwo = 0;
    for (int i = 0; i < romanNumber.length(); i++) {
        if (!RomanNumeral.containsKey(String.valueOf(romanNumber.charAt(i)))) {
            return false;
        }
    }
    for (int i = 0; i < romanNumber.length(); i++) {
        if (romanNumber.charAt(i) == 'V' && romanNumber.charAt(i + 1) == 'V') {
            counterForTwo++;
        } else if (romanNumber.charAt(i) == 'L' && romanNumber.charAt(i + 1) == 'L') {
            counterForTwo++;
        } else if (romanNumber.charAt(i) == 'D' && romanNumber.charAt(i + 1) == 'D') {
            counterForTwo++;
        }
        if (counterForTwo > 0) {
            return false;
        }
        int repeatCount = 0;
        for (int j = 0; j < romanNumber.length(); j++) {
            if (romanNumber.charAt(i) == romanNumber.charAt(j)) {
                repeatCount++;
            } else {
                break;
            }
        }
        if (repeatCount > 3) {
            return false;
        }
    }
    return true;
}

public static int translation(String romanNumber, Map<String, Integer> RomanNumeral) {
    int total = 0;
    int prevValue = 0;
    for (int i = romanNumber.length() - 1; i >= 0; i--) {
        int value = RomanNumeral.get(String.valueOf(romanNumber.charAt(i)));
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