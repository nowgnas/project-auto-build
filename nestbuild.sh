#!/bin/bash
yarn global add @nestjs/cli
nest new back -p yarn  
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