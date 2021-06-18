const https = require("https");
const app = require("./app");
const http = require("http").createServer(app);

http.listen("7000", () => {
  console.log("Eco Bay server running on port 7000");
});
