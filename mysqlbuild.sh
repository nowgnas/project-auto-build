#!/bin/bash
mkdir back
cd back 
yarn init -y
yarn add express bcrypt cors uuid mysql2 sequelize
yarn add -D dotenv @babel/cli @babel/core @babel/node @babel/plugin-transform-runtime @babel/preset-env
touch .gitignore
echo node_modules >> .gitignore
touch babel.config.json
babel='
{
    "presets": [
        [
            "@babel/preset-env",
            {
                "targets": {
                    "node": "current"
                }
            }
        ]
    ],
    "plugins": [
        "@babel/plugin-transform-runtime"
    ]
}'
echo "$babel" > babel.config.json
touch index.js

index='
import { app } from "./src/app";

const PORT = process.env.SERVER_PORT || 5001;

app.listen(PORT, () => {
    console.log(`port ${PORT} is running`);
});
'
echo "$index" > index.js
touch .env
mkdir src
cd src

touch app.js
app='
import express from "express";
const app = express();
export { app }
'
echo "$app" > app.js

mkdir routes controllers services db middlewares
cd db 
yarn global add sequelize-cli 
sequelize init
cd ../../../
npx create-react-app front -y
cd front
yarn add axios
cd public
rm favicon.ico
rm *.png
cd ..
cd src
rm App.test.js
rm logo.svg