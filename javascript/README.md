# JavaScript (Node.js)

Because plain [JavaScript](https://developer.mozilla.org/en-US/docs/Web/JavaScript) is a scripting language for Web pages it can't be used to create non-browser applications. That's why you need [Node.js](https://nodejs.org/en/) to run this program.

## Run

At the repository root:
```
node javascript/pomodoro.js
```

## Notes

- I decided to do without, but JavaScript can be write with semicolon as terminator (in fact I used one in the sleep function so I don't need to write an empty body for the while loop).

- JavaScript's equivalent to a sleep function is [setTimeout()](https://javascript.info/settimeout-setinterval) and I think it should be use [like that](https://stackoverflow.com/questions/951021/what-is-the-javascript-version-of-sleep). But it only can be used in an asynchronous function, which is not possible for us unless if you update the current structure. So I wrote a sleep function which use Date comparison.

- JavaScript variables can't be statically typed. I you want to statically type your JavaScript variables take a look at [TypeScript](https://www.typescriptlang.org/).
