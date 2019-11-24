#!/bin/bash

# validate the web server
curl -v --silent localhost:80 2>&1 | grep conference