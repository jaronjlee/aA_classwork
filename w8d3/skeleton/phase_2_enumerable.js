Array.prototype.myEach = function(myFunction) {
    for(let i = 0; i < this.length; i++) {
        myFunction(this[i])
    };
};


//TEST
// ['a', 'b', 'c'].myEach(function(el) {
//     console.log(el);
// });





Array.prototype.myMap = function(cb) {
    let result = [];

    this.myEach(function(el) {
        result.push(cb(el));
    });
    return console.log(result);
};

//TEST

[1, 2, 3].myMap(myFunction) 
function myFunction(el) {
    return el * 2;
};


