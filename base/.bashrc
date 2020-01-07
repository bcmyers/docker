#!/usr/bin/env bash

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# aliases
alias c=clear
alias cat=bat
alias find=fd
alias gl="git log --decorate --graph --oneline"
alias grep=rg
alias ls="exa -agl"
alias nano=nvim
alias vi=nvim

# exports
export EDITOR=nvim
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export PAGER=less
export SHELL=/bin/bash
export VISUAL=nvim

# rust
export RUST_SRC_PATH=$(rustc --print sysroot)/lib/rustlib/src/rust/src

# vi mode
set -o vi
