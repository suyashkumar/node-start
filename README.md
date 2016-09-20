# node-start

A quick shell script I wrote to init very simple NodeJS/Express server projects as I like them. Simply clone to the directory of your choosing and run `./node-start`. You must have installed mongodb (and have it running) to run this server. To start up the server, simply: 

1. Set the port to listen on by setting the `PORT` environment variable:

  ```sh
  export PORT=9001
  ```
2. Run the server: `node server.js`
3. Test that the routes are in working order: 

  ```sh
  curl localhost:$PORT/hello
  ```
  The above should return 'hello'

Routes are located in `/config/rotues.js` and the MongoDB setup is in `/config/db.js`
