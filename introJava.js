function madLib(word_1, word_2, word_3) {
    return `We shall ${word_1.toUpperCase()} the ${word_2.toUpperCase()} ${(word_3.toUpperCase())}`
}

function isSubstring(searchString, subString) {
    return phrase.includes(subphrase);
}

function fizzbuzz(array) {
    const fizz_num = [];

    array.forEach (num => {
        if ((num % 3 === 0) ^ (num % 5 === 0)) {
            fizz_num.push(num);
        }
    });

    return fizz_num;
}

function isPrime(num) {
    if (num < 2) {return false; }

    for (let i = 2; i < num; i++) {
        if (num % i === 0) {
            return false;
        }
    }

    return true;
}

function sumOfNPrime(n) {
    let sum = 0;
    let countNum = 0;

    let i = 2;

    while (countNum < n) {
        if (isPrime(i)) {
            sum += 1;
            countNum += 1;
        }

        i += 1;
    }

    return sum;
}

function sumOfNPrime(n) {
    let sum = 0;
    let countNum = 0;

    for (let i = 2; countNum < n; i++) {
        if (isPrime(i)) {
            sum += 1;
            countNum += 1;
        }
    }

    return sum;
}