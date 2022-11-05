# Contextual Text Objects (CTO)

The main idea of this plugin is to extend vim |text-objects| functionnality to adapt to different programming languages.

## Installation

- Using vim default plugin manager.

```bash
mkdir -p ~/.vim/pack/RobinCamarasa/start
cd ~/.vim/pack/RobinCamarasa/start
git https://github.com/RobinCamarasa/cto.vim.git
vim -u NONE -c "helptags cto.vim/doc" -c q
```

- Using [vim-plug](https://github.com/junegunn/vim-plug) this plugin can be installed as follow:

```vimscript
Plug "RobinCamarasa/cto.vim"
```

## Dependencies

- [matchit](https://github.com/tmhedberg/matchit) (for latex support)

## Documentation

To check the documentation, launch the following command within vim: `:help cto`

## Text-Objects Overview

|Text-object|Python|Tex|Vim|
|---|---|---|---|
|function name (fn)|x||x|
|function argument (fa)|x||x|
|inner function (if)|x||x|
|around function (af)|x||x|
|class name (cn)|x|||
|inner class (ic)|x|||
|around class (ac)|x|||
|inner indent (ii)|x|||
|around indent (ai)|x|||
|inner $ environment (i$)||x||
|around $ environment (a$)||x||
|inner command (ic)||x||
|around command (ac)||x||
|inner environment (ie)||x||
|around environment (ae)||x||
|inner document (id)||x||
|around document (ad)||x||
|inner math (im)||x||
|around math (im)||x||

## Supported filetypes

### All filetypes

|text-object|meaning|
|---|---|
| il | inner line |

### python

|text-object|meaning|
|---|---|
| fn | function name |
| fa | function argument |
| if | inner function |
| af | around function |
| cn | class name |
| ic | inner class |
| ac | around class |
| ii | inner indent |
| ai | around indent |

### tex (latex)

|text-object|meaning|
|---|---|
| i$ | inner $ environment |
| a$ | around $ environment |
| ic | inner command |
| ac | around command |
| ie | inner environment |
| ae | around environment |
| id | inner document |
| ad | around document |
| im | inner math `\[\]` |
| am | around math `\[\]` |

### vim

|text-object|meaning|
|---|---|
| fn | function name |
| fa | function argument |
| if | inner function |
| af | around function |

## Author

- [RobinCamarasa](https://github.com/RobinCamarasa)
