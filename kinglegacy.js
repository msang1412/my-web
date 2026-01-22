const fs = require("fs");

const data = JSON.parse(fs.readFileSync("kingleagcy.json", "utf8"));

if (data.server?.jobId) {
  console.log("JobId:", data.server.jobId);
}
