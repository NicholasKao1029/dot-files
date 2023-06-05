dot and config files for stuff

## Process for new machine

- Downloading apps
	- Slack
	- Firefox / Chrome
	- Docker
	- Spotify
	- Vscode
        - settings sync extension
	- iTerm2
        - Install theme (Gruvbox currently)
        - NerdFonts
        

- Installing stuff
	- install [brew](https://brew.sh/)
        - brew install tmux
        - brew install npm 
        - brew install node
        - brew install yarn
        - brew install nvim ?
        - brew install fzf
        - brew install rg
	- install [nvim](https://github.com/neovim/neovim/wiki/Installing-Neovim)
        - need to install Language servers
        - https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
            - pyright
            - tsserver
            - html 
            - jsonls
        - Need to TS install for TreeSitter syntax highlighting [link](https://github.com/nvim-treesitter/nvim-treesitter#language-parsers)
        - need to install RG for telescope to work 
	- sym link approrpriate dot files inside these repo
		- ln -s ~/.../dot-files/zsh/.zshrc ~/.zshrc
			- zsh
				- zsh comes with iTerm2 automatically
                - when exporting $ZSH inside of .zshrc the user is hard coded which causes problems if not the same
			- nvim
				- download
				- install [plug](https://github.com/junegunn/vim-plug)
				- :PlugInstall
				- TECH DEBT
                    - currently you're symlinking from the ~/.config/nvim/init.vim which is the method when transfering from vim to nvim
                    - When you move everything to LUA to take advantage of nvim fully you should symlink to .config instead or have 2 symlinks
			- bash
				- already installed
			- tmux
				- brew install
			- Git
				- author change
				- have to add personal token.
    - install [NerdFont](https://www.nerdfonts.com/font-downloads)
    - install Haskell
        - TODO 
    

- Repos
	- from harddrive
	- maybe determine a protocol to store files in the hard drive
	- 

- Logins
	- Download lastpass extension for whichever browser choosen
	- should I right a script for each of the logins? so I don't have to manually open all that shit
	- Gmail
		kobenkao@gmail.com
		etc.
	- Github



## TODOs
- Think about moving from oh my zsh and running zsh by itself to understand zsh shell more
- Update nvim to lua and organize plugins and configs in a neater file format structure


### nvim 
- command to complete brackets without pressing enter
- look into this plugin 
    - https://github.com/romgrk/barbar.nvim
    - https://github.com/weilbith/nvim-code-action-menu
    - https://github.com/crivotz/nv-ide
