#!/bin/sh
truffle deploy --reset
cd frontend
npm install
npm run serve