#!/bin/sh
# Add binaries to PATH if they aren't added yet
case ":${PATH:-}:" in
    *:"$HOME/.local/bin":*) ;;
    *) export PATH="$HOME/.local/bin${PATH:+:$PATH}" ;;
esac
