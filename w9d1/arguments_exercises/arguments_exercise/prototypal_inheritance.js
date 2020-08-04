// Function.prototype.inherits = function (parent) {
//     function Surrogate () {};
//     Surrogate.prototype = parent.prototype;
//     this.prototype = new Surrogate();
//     this.prototype.constructor = this;
// }

Function.prototype.inherits = function(parent) {
  this.prototype = Object.create(parent.prototype);
  this.prototype.constructor = this;
}

// function MovingObject() { 
//     this.name = name;
//     this.size = size;
// }

// MovingObject.prototype.move = function(distance, direction) {
//     console.log(`${this.name} flies ${distance} light years ${direction}`);
// }

class MovingObject {
  constructor(name, size) {
    this.name = name;
    this.size = size;
  }


  move(distance, direction) {
    console.log(`${this.name} flies ${distance} light years ${direction}`);
  }

}

class Ship extends MovingObject {
  constructor(name, size, type) {
    super(name, size);
    this.type = this;
  }

  type() {
    console.log(`this ship is a ${this.type} ship`)
  }
}


// function Ship(name, size, type) { 
//     this.name = name;
//     this.size = size;
//     this.type = type;
// }
 
// Ship.prototype.type = function() {
//         console.log(`this ship is a ${this.type} ship`)
// }

// Ship.inherits(MovingObject);


function Asteroid(name, size) { 
      this.name = name;
      this.size = size;
}

Asteroid.prototype.smash = function (object) {
        console.log(`${this.name} smashes ${object}`);
}

Asteroid.inherits(MovingObject);


