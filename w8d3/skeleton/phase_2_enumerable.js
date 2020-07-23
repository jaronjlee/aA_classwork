Array.prototype.myEach = function(myFunction) {
    for(i = 0; i < this.length; i++) {
        myFunction(this[i])
    };
};


//TEST
// ['a', 'b', 'c'].myEach(function(el) {
//     console.log(el);
// });




Array.prototype.myMap = function(myFunction(el)) {
    let result = [];

    this.my_each(function(el) {
        result.push(myFunction(el))

    return result;
});

//TEST

[1, 2, 3].myMap(myFunction) 
function myFunction(el) {
    return el * 2;
};


