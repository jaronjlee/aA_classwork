//Array#uniq
Array.prototype.uniq = function () {
    let arrUniq = [];

    this.forEach(function (el) {
        if (!arrUniq.includes(el)) {
            arrUniq.push(el);
        }
    });

    // for (i=0; i < this.length; i++) {
    //     if (!arrUniq.includes(this[i])) {
    //         arrUniq.push(this[i]);
    //     }
    // }

    return arrUniq;
}

//TEST
// console.log([1, 2, 2, 3, 3, 4].uniq());



//Array#twoSum
Array.prototype.twoSum = function() {
    let positionArr = [];

    for (i = 0; i < this.length; i++) {
        for (j = (i + 1); j < this.length; j++) {
            if (this[i] + this[j] === 0) {
                positionArr.push([i, j]);
            }
        }
    }
    return positionArr;
}

//TEST
// console.log([-3, 0, 3, 1, -1].twoSum());




//Array#transpose
Array.prototype.transpose = function() {

    let result = [];

    for (i = 0; i < this.length; i++) {
        result.push([]);
    };

    for (i = 0; i < this.length; i++) {
        for (j = 0; j < this.length; j ++) {
            result[i].push(this[j][i]);
        };
    };
    return result;
}

//TEST

let testArr = [
    [1, 2, 3],
    [1, 2, 3],
    [1, 2, 3]
];

console.log(testArr.transpose());