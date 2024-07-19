#! /usr/bin/env bash
set -uvx
set -e
PKG=`basename "$PWD"`
echo $PKG
raco pkg remove --force $PKG || true
raco pkg install --auto
