## Environment variables widely used by other programs
if command -v nvim &>/dev/null ; then
  export EDITOR="nvim" VISUAL="nvim"
elif command -v vim &>/dev/null ; then
  export EDITOR="vim" VISUAL="vim"
elif command -v vi &>/dev/null ; then
  export EDITOR="vi" VISUAL="vi"
fi
