Nolan's Dotfiles
===================

These are my dotfiles I've maintained over the last 12 years. They originally
started as a fork of [thoughtbot's dotfiles](https://github.com/thoughtbot/dotfiles).

I've since taken inspiration from other dotfiles:

- [https://github.com/CharlesChiuGit/nvimdots.lua](https://github.com/CharlesChiuGit/nvimdots.lua)
- [https://github.com/LazyVim/LazyVim](https://github.com/LazyVim/LazyVim)
- [https://github.com/LunarVim/LunarVim/tree/master](https://github.com/LunarVim/LunarVim/tree/master)

These dotfiles use [rcm](https://github.com/thoughtbot/rcm) to create system
links from `~/dotfiles` to your `$HOME` folder. System linking these files makes
it easy to add or remove configs and keep them updated from one place.

What's in it?
-------------

These are some highlights, not a full description.

[neovim](https://neovim.io) configuration:

* Full LUA based configs
* `config/nvim/lua/plugins/list.lua` for a list of all the plugins

[tmux](http://robots.thoughtbot.com/a-tmux-crash-course)
configuration:

* Improve color resolution.
* Remove administrative debris (session name, hostname, time) in status bar.
* Set prefix to `Ctrl+s`
* Soften status bar color from harsh green to light gray.

[git](http://git-scm.com/) configuration:

* Adds a `create-branch` alias to create feature branches.
* Adds a `delete-branch` alias to delete feature branches.
* Adds a `merge-branch` alias to merge feature branches into master.
* Adds an `up` alias to fetch and rebase `origin/master` into the feature
  branch. Use `git up -i` for interactive rebases.
* Adds `post-{checkout,commit,merge}` hooks to re-index your ctags.
* Adds `pre-commit` and `prepare-commit-msg` stubs that delegate to your local
  config.
* Adds `trust-bin` alias to append a project's `bin/` directory to `$PATH`.

Shell aliases and scripts:

* `b` for `bundle`.
* `g` with no arguments is `git status` and with arguments acts like `git`.
* `migrate` for `bin/rails db:migrate db:rollback && bin/rails db:migrate db:test:prepare`.
* `mcd` to make a directory and change into it.
* `replace foo bar **/*.rb` to find and replace within a given list of files.
* `tat` to attach to tmux session named the same as the current directory.
* `v` for `$VISUAL`.

Dynamic color scheming across apps with [flavours](https://github.com/Misterio77/flavours)

* Alacritty
* Conky
* Dunst
* i3
* nvim
* Polybar
* tmux
* Xresources

Dependencies
------------

## Linux (AUR)

- **alacritty**: OpenGL based terminal in Rust
- **firefox**
- **ranger**: Vim based file navigation
- **mise**: Programming language manager
- **flavours**: Dynamic theming
- **i3-scrot**: Screenshot utility for i3
- **neovim-git**
- **rcm-git**: manage dotfiles with system links
- **slack-desktop**
- **spotify-edge**
- **feh**: Sets wallpaper
- **polybar**: Customizable topbar for i3

Requirements
------------

Set zsh as your login shell:

    chsh -s $(which zsh)

Install
-------

Clone onto your laptop:

    git clone git://github.com/nolantait/dotfiles.git ~/dotfiles

Install [rcm](https://github.com/thoughtbot/rcm):

    brew install rcm

Install the dotfiles:

    env RCRC=$HOME/dotfiles/rcrc rcup -t git -t nvim

Install for a specific `host-`:

    env RCRC=$HOME/dotfiles/rcrc rcup -B linux -t git -t nvim
    env RCRC=$HOME/dotfiles/rcrc rcup -B macos -t git -t nvim

After the initial installation, you can run `rcup` without the one-time variable
`RCRC` being set (`rcup` will symlink the repo's `rcrc` to `~/.rcrc` for future
runs of `rcup`). [See example](https://github.com/thoughtbot/dotfiles/blob/master/rcrc).

This command will create symlinks for config files in your home directory.
Setting the `RCRC` environment variable tells `rcup` to use standard
configuration options:

* Give precedence to personal overrides which by default are placed in
  `~/dotfiles-local`
* Please configure the `rcrc` file if you'd like to make personal
  overrides in a different directory


Update
------

From time to time you should pull down any updates to these dotfiles, and run

    rcup -t git -t nvim

to link any new files and install new vim plugins. **Note** You _must_ run
`rcup` after pulling to ensure that all files in plugins are properly installed,
but you can safely run `rcup` multiple times so update early and update often!

Make your own customizations
----------------------------

Create a directory for your personal customizations:

    mkdir ~/dotfiles-local

Put your customizations in `~/dotfiles-local` appended with `.local`:

* `~/dotfiles-local/aliases.local`
* `~/dotfiles-local/git_template.local/*`
* `~/dotfiles-local/gitconfig.local`
* `~/dotfiles-local/psqlrc.local` (we supply a blank `.psqlrc.local` to prevent `psql` from
  throwing an error, but you should overwrite the file with your own copy)
* `~/dotfiles-local/tmux.conf.local`
* `~/dotfiles-local/vimrc.local`
* `~/dotfiles-local/vimrc.bundles.local`
* `~/dotfiles-local/zshrc.local`
* `~/dotfiles-local/zsh/configs/*`

For example, your `~/dotfiles-local/aliases.local` might look like this:

    # Productivity
    alias todo='$EDITOR ~/.todo'

Your `~/dotfiles-local/gitconfig.local` might look like this:

    [alias]
      l = log --pretty=colored
    [pretty]
      colored = format:%Cred%h%Creset %s %Cgreen(%cr) %C(bold blue)%an%Creset
    [user]
      name = Dan Croak
      email = dan@thoughtbot.com

Your `~/dotfiles-local/vimrc.local` might look like this:

    " Color scheme
    colorscheme github
    highlight NonText guibg=#060606
    highlight Folded  guibg=#0A0A0A guifg=#9090D0

If you don't wish to install a vim plugin from the default set of vim plugins in
`.vimrc.bundles`, you can ignore the plugin by calling it out with `UnPlug` in
your `~/.vimrc.bundles.local`.

    " Don't install vim-scripts/tComment
    UnPlug 'tComment'

`UnPlug` can be used to install your own fork of a plugin or to install a shared
plugin with different custom options.

    " Only load vim-coffee-script if a Coffeescript buffer is created
    UnPlug 'vim-coffee-script'
    Plug 'kchmck/vim-coffee-script', { 'for': 'coffee' }

    " Use a personal fork of vim-run-interactive
    UnPlug 'vim-run-interactive'
    Plug '$HOME/plugins/vim-run-interactive'

To extend your `git` hooks, create executable scripts in
`~/dotfiles-local/git_template.local/hooks/*` files.

Your `~/dotfiles-local/zshrc.local` might look like this:

    # load pyenv if available
    if which pyenv &>/dev/null ; then
      eval "$(pyenv init -)"
    fi

Your `~/dotfiles-local/vimrc.bundles.local` might look like this:

    Plug 'Lokaltog/vim-powerline'
    Plug 'stephenmckinney/vim-solarized-powerline'

zsh Configurations
------------------

Additional zsh configuration can go under the `~/dotfiles-local/zsh/configs` directory. This
has two special subdirectories: `pre` for files that must be loaded first, and
`post` for files that must be loaded last.

For example, `~/dotfiles-local/zsh/configs/pre/virtualenv` makes use of various shell
features which may be affected by your settings, so load it first:

    # Load the virtualenv wrapper
    . /usr/local/bin/virtualenvwrapper.sh

Setting a key binding can happen in `~/dotfiles-local/zsh/configs/keys`:

    # Grep anywhere with ^G
    bindkey -s '^G' ' | grep '

Some changes, like `chpwd`, must happen in `~/dotfiles-local/zsh/configs/post/chpwd`:

    # Show the entries in a directory whenever you cd in
    function chpwd {
      ls
    }

This directory is handy for combining dotfiles from multiple teams; one team
can add the `virtualenv` file, another `keys`, and a third `chpwd`.

The `~/dotfiles-local/zshrc.local` is loaded after `~/dotfiles-local/zsh/configs`.
