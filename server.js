const express = require('express');
const shell = require('shelljs');
const bodyParser = require('body-parser')

const app = express();

app.use(bodyParser.json());

const port = 8080;
app.listen(port, () => {
  console.log(`Listening on http://localhost:${port}`);
});

app.post('/', (req, res) => {

  const body = req.body;
  branch = body["ref"].split("/").pop();
  console.log(branch)
  if(branch == "dev"){
    console.log("Run Dev Script");
    shell.exec('./deploy-dev.sh');
  }
  else if (branch == "exp"){
    console.log("Run Exp Script");
    shell.exec('./deploy-exp.sh');
  }
  else if (branch == "master"){
    console.log("Run MASTER Script");
    shell.exec('./deploy-master.sh');
  }
  else {
    console.log("Do nothing. BRANCH: " + str(branch))
  }
  res.send({
    'statusCode' : 200,
    'body' : 'Finished Request From: ' + branch
  });
});
