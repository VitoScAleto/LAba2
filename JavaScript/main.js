const readline = require('readline');
const rl = readline.createInterface({
    input: process.stdin,
    output: process.stdout
});

function zadanie1_1() {
    const numbers = [76, 24, 614, 14, 1153];
    for (let i = 0; i < numbers.length; i++) {
        if (numbers[i] < 0) break;
        let a = numbers[i];
        let sum = 0;
        let mult = 1;
        while (a > 0) {
            let b = a % 10;
            sum += b;
            mult *= b;
            a = Math.floor(a / 10);
        }
        if (sum < mult) console.log("Index number = " + i);
    }
}

function zadanie3_21() {
    rl.question("Enter the string: ", (S) => {
        let counterNull = 1;
        for (let i = 0; i < S.length - 1; i++) {
            if (S[i] === '0' && S[i + 1] === '0') {
                counterNull++;
            }
            if (i < S.length - 2 && S[i + 1] === '1' && S[i] === '0') {
                if (i - counterNull >= 0 && S[i - counterNull] === '1' && S[i - counterNull + 1] === '0') {
                    console.log(S.substring(i - counterNull, i - counterNull + counterNull + 2));
                    counterNull = 1;
                }
            }
        }
        zadanie3_21();
    });
}

function zadanie2_1() {
    const RomanNumeral = new Map([
        [1, "I"],
        [5, "V"],
        [10, "X"],
        [50, "L"],
        [100, "C"],
        [500, "D"],
        [1000, "M"],
        [10000, "Q"]
    ]);

    const RomanNumeralReverse = new Map([
        ["I", 1],
        ["V", 5],
        ["X", 10],
        ["L", 50],
        ["C", 100],
        ["D", 500],
        ["M", 1000],
        ["Q", 10000]
    ]);

    function askForRomanNumber() {
        rl.question("(I = 1, V = 5, X = 10, L = 50, C = 100, D = 500, M = 1000)\nEnter roman number: ", (number) => {
            if (!isValidRomanNumeral(number, RomanNumeral, RomanNumeralReverse)) {
                console.log("Error roman number");
                askForRomanNumber(); // Зацикливаем метод, запрашивая ввод снова в случае ошибки
            } else {
                console.log("Arabian number = " + translation(number, RomanNumeralReverse));
            }
        });
    }

    askForRomanNumber(); // Запускаем метод в первый раз
}

function isValidRomanNumeral(romanNumber, RomanNumeral, RomanNumeralReverse) {
    let counterForTwo = 0;
    for (let i = 0; i < romanNumber.length; i++) {
        let isValidCounter = 0;
        for (let [key, value] of RomanNumeral) {
            if (romanNumber[i] === value) {
                isValidCounter++;
                break;
            }
        }
        if (isValidCounter === 0) return false;
    }
    for (let i = 0; i < romanNumber.length - 1; i++) {
        if ((romanNumber[i] === RomanNumeral.get(5) && romanNumber[i + 1] === RomanNumeral.get(5)) ||
            (romanNumber[i] === RomanNumeral.get(50) && romanNumber[i + 1] === RomanNumeral.get(50)) ||
            (romanNumber[i] === RomanNumeral.get(500) && romanNumber[i + 1] === RomanNumeral.get(500))) {
            counterForTwo++;
        }
        if (counterForTwo > 0) return false;
        let repeatCountThreeTimes = 0;
        for (let j = i; j < romanNumber.length; j++) {
            if (romanNumber[i] === romanNumber[j]) repeatCountThreeTimes++;
            else break;
        }
        if (repeatCountThreeTimes > 3) return false;
    }
    return true;
}

function translation(romanNumber, RomanNumeralReverse) {
    let total = 0;
    let prevValue = 0;
    for (let i = romanNumber.length - 1; i >= 0; i--) {
        let value = RomanNumeralReverse.get(romanNumber[i]);
        if (value < prevValue) {
            total -= value;
        } else {
            total += value;
        }
        prevValue = value;
    }
    return total;
}

rl.question("Input Zadanie number\n1 - Zadanie1_1\n2 - Zadanie2_1\n3 - Zadanie3_21\nEnter number: ", (s) => {
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
            console.log("Error");
    }
});