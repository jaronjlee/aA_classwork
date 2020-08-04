// function sum

// function sum() {
//   const nums = Array.from(arguments);
//   let sums = 0;
//   nums.forEach( function (ele) {
//     sums += ele;
//   })
//   return sums;
// }

// // console.log(sum(1,2,3));

// function sum2(...nums) {
//   let sums = 0;
//   nums.forEach(function (ele) {
//     sums += ele;
//   })
//   return sums;
// }

// console.log(sum2(1,2,3));




Function.prototype.myBind = function(context) {
    const bindArgs = Array.from(arguments).slice(1);

    const that = this;
    return function () {
        const callArgs = Array.from(arguments);
        const allArgs = bindArgs.concat(callArgs);  
        return that.apply(context, allArgs);
    }
}

Function.prototype.myBind2 = function(context, ...args) {
    const that = this;

    return function (...args2) {
        const allArgs = args.concat(args2);  
        return that.apply(context, allArgs);
    }
}

class Cat {
    constructor(name) {
        this.name = name;
    }

    says(sound, person) {
        console.log(`${this.name} says ${sound} to ${person}!`);
        return true;
    }
}

class Dog {
    constructor(name) {
        this.name = name;
    }
}

const markov = new Cat("Markov");
const pavlov = new Dog("Pavlov");

markov.says("meow", "Ned");
// Markov says meow to Ned!
// true

// bind time args are "meow" and "Kush", no call time args
markov.says.myBind2(pavlov, "meow", "Kush")();
// Pavlov says meow to Kush!
// true

// no bind time args (other than context), call time args are "meow" and "a tree"
markov.says.myBind2(pavlov)("meow", "a tree"); // markov.says(context, (meow, a tree))
// Pavlov says meow to a tree!
// true

// bind time arg is "meow", call time arg is "Markov"
markov.says.myBind2(pavlov, "meow")("Markov");
// Pavlov says meow to Markov!
// true

// no bind time args (other than context), call time args are "meow" and "me"
const notMarkovSays = markov.says.myBind2(pavlov);
notMarkovSays("meow", "me");
// Pavlov says meow to me!
// true


// curriedSum

function curriedSum(minimum) {

    const numbers = [];

    return function _curriedSum (num) {
    //   debugger;
        numbers.push(num);

        if (numbers.length === minimum) {
            let sum = 0;
            numbers.forEach ((ele) => {sum += ele});
            return sum;
        } else {
          return _curriedSum;
        };
    }
}


const sumOf = curriedSum(4);
console.log(sumOf(5)(30)(20)(1)); // => 56
// const sumOf = curriedSum(1);
// console.log(sumOf(5)); // => 56

Function.prototype.curry = function(numArgs) {
  const args = [];
  const that = this;

  return function _curry (arg2) {
    args.push(arg2);
    if (args.length === numArgs) {
      return that(...args);
    } else {
      return _curry;
    }
  }
}

Function.prototype.curry1 = function (numArgs) {
  const args = [];
  const fn = this;
  function _curriedFn(arg) {
    args.push(arg);
    if (args.length === numArgs) {
      return fn.apply(null, args);
    } else {
      return _curriedFn;
    }
  }
  return _curriedFn;
};