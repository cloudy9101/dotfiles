#!/bin/zsh

[ -f "$ZDOTDIR/func.zsh" ] && source "$ZDOTDIR/func.zsh"

include_source "path.zsh"
include_source "alias.zsh"
include_source "zim.zsh"
include_source "zstyle.zsh"
include_source "misc.zsh"

is_tmux_enabled && include_source "tmux.zsh"
