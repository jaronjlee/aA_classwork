

Array.prototype.bubbleSort = function () {
    let isSorted = false; 

    while (!isSorted) {
        isSorted = true;

        for (let i = 0; i < (this.length - 1); i++) {
            if (this[i] > this[i+1]) {
                [this[i],this[i+1]] = [this[i+1],this[i]]
                isSorted = false;
            }
        }
    }
    return this;
}