<h1 align="center">Dashboard</h1>

<h3 align="center"> About the Dashboard</h3>
<h6 align="center">The Dashboard is one of the 6 components in the CG4002 Capstone project. It is a fullstack web application that utilises the MERN tech stack (MongoDB, Express, React and Node). This web application serves as a user interface for dancers using our application. The core component of this web application is to display real time data received directly from the dancers' sensors. The web application is run locally and not delpoyed not any hosting websites.</h6>

<h3 align="center"> Author</h3>
<h6 align="center">Amir Azhar</br>https://github.com/AmirAzhar</h6>

<h2 align="center">Quick Start Guide</h2>

```bash
# Install dependencies for server
npm install

# Install dependencies for client
npm install

# Run the client & server with concurrently
npm run dev

# Run the Express server only
npm run server

# Run the React client only
npm run client

# Server runs on http://localhost:5000 and client on http://localhost:3000
```
<h2 align="center">Folder Descriptions</h2>

### Backend
The Backend folder contains all the files that handles the behind-the-scenes of the website. For this application, the backend folder mainly holds the files for setting up of the web server and the connection to the database. The table below gives a brief description of all the child folders present within the Backend directory.

Folder / File | Description 
--- | --- | 
controller | Holds the files that defines all the POST and GET API requests
middleware | Holds a single file 'auth.js' which is used as the middleman between the client and the server for authentication when a user signs in, logs in and registers for a new account
models | Holds the files that defines the schemas and the models used for the MongoDB, primarily using mongoose
routes | Used the express router to create API routes, using Express, for use by the client.
server.js | A javascript script that is used to initiate the server for this web application. This file includes instantiating the MongoDB connection, setting up the server socket and watching fro changes in the the collections of MongoDB
data (for testing) | A group of files to create dummy data
logoutScript.js (for testing) | A script used for  logging out through the server side
seederScript.js (for testing) | A script used to get the dummy data, to be sent into the MongoDB

<br/>

### Frontend
The Frontend folder contains all the files pertaining to the website of the application that users will interact with. For this application, the frontend folder holds the files for the React JS UI Components. The table below gives a brief description of all the child folders present within the Frontend directory, but mainly from the src folder i.e. Dashboard/Frontend/src

Folder / File | Description 
--- | --- | 
components | Holds the React reusable child components that are being called from the main screens
context | Holds files that defines global variables that can be called from anywhere within the src directory
images | Holds SVGs and pictures used in the web application
redux | Holds the files that is used for the state management of the web application. It defines all the actions and reducers for when a user wants to sign in, log in and register for a new account
screens | Holds the files that defines the main React screens
App.* | The main (parent) React component
index.* | The entry point for the frontend
