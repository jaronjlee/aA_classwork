class Clock {
    constructor() {
      // 1. Create a Date object.
      // 2. Store the hours, minutes, and seconds.
      // 3. Call printTime.
      // 4. Schedule the tick at 1 second intervals.
      const currentTime = new Date();
      
      this.hours = currentTime.getHours();
      this.minutes = currentTime.getMinutes();
      this.seconds = currentTime.getSeconds();

      this.printTime();

      setInterval(this._tick.bind(this), 1000 );
    }
  
    printTime() {
      // Format the time in HH:MM:SS
      // Use console.log to print it.

      const printedTime = (`${this.hours}:${this.minutes}:${this.seconds}`);
      console.log(printedTime);
    }
  
    _tick() {
      // 1. Increment the time by one second.
      // 2. Call printTime.
      this._incrementTime();
      this.printTime();
    }
    
    _incrementTime() {
        this.seconds++;
        if (this.seconds === 60) {
            this.seconds = 0;
            this.minutes++;
        }
        if (this.minutes === 60) {
            this.minutes = 0;
            this.hours++;
        }
        if (this.hours === 25) {
            this.hours = 0;
        }
    }

    
  }
  
  const clock = new Clock();