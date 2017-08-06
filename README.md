# rphan's dotfiles

## Usage

Don't. :)  I have done nothing to make these usable by others.  I intend to,
but I haven't yet.  Feel free to browse around for ideas.

## Technology

I had a homebrew solution for a while that I used to sync and version control
my dotfiles across hosts and platforms.  For this git repository, I am managing it with
[homeshick](https://github.com/andsens/homeshick) which is compatible with and influenced by
[homesick](https://github.com/technicalpickles/homesick).

## History

The way my old system worked was that it:

  * Cloned into $HOME/home/
  * Backed up all old dotfiles
  * Had an installer shell script that would:
    * symlink all the dotfiles in the current directory
    * generate a _host specific_ rc file (so I could maintain env vars or overrides on a per host basis)
    * detect OS and generate some OS specific aliases (mostly to compensate for gnu vs. bsd differences)
  * Allowed you to modify the files inline in your home directory and perform git operations locally (you could delete the original clone dir)

I'll try and work in some of those features that still seem useful.
