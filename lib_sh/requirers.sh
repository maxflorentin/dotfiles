#!/usr/bin/env bash

function require_brew() {
  running "brew $1 $2"
  brew list $1 >/dev/null 2>&1 || true
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    action "brew install $1 $2"
    brew install $1 $2
    if [[ $? != 0 ]]; then
      error "failed to install $1! aborting..."
      # exit -1
    fi
  fi
  ok
}

function require_cask() {
  running "brew check for cask: $1"
  brew list --cask $1 >/dev/null 2>&1 || true
  if [[ ${PIPESTATUS[0]} != 0 ]]; then
    action "brew install --cask $1 $2"
    brew install --cask $1
    if [[ $? != 0 ]]; then
      error "failed to install $1! aborting..."
      # exit -1
    fi
  fi
  ok
}
