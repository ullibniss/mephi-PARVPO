#!/bin/bash

valac main.vala --directory builds
mv builds/main builds/${1:-build}
