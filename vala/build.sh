#!/bin/bash

valac main.vala --directory builds -o ${1:-build}
