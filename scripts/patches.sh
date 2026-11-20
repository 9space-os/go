#!/bin/bash
# The port as patches: go/'s branch plan9 since the release tag, to patches/go/
# (git format-patch), so this repository (toolchain/go, GO_DIR in paths.env) holds the
# port itself (go/ is the release archive as a repository of its own, ignored here).
# After a commit in go/: scripts/patches.sh, then commit patches/.
# fetch.sh applies them to a fresh go/ (git am on the branch plan9).
# usage: scripts/patches.sh
set -e
TOP=$(cd "$(dirname "$0")/.." && pwd)
BASE=$(cat "$TOP/go/VERSION" | head -1)
mkdir -p "$TOP/patches/go"
rm -f "$TOP/patches/go/"*.patch
git -C "$TOP/go" format-patch -q --no-signature -o "$TOP/patches/go" "$BASE..plan9"
ls "$TOP/patches/go"
