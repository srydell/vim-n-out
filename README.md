# Vim-N-Out #

Vim-N-Out takes the heavy lifting out of detouring your workflow to open a file, make a small change and saving and quitting that file. Could we really make that easier than what it already is?

## Usage ##

Vim-N-Out only provides one command, `VimNOut`, and its pretty simple:

```vim
VimNOut edit todo.md
```

This will do two things:

* Open a new buffer with `todo.md`

* Set an `autocmd` so that when you leave `todo.md`, it will save that buffer (unless it's empty)

This allows you to quickly edit `todo.md` and get out, no need to save the buffer or have it in your `buffer list`.

Well, that you can still do that by hand. The real power comes from using the filter system built into `VimNOut`.

```vim
VimNOut edit ~/.vim/ftplugin/{filetype}.vim
```

This will replace the token `{filetype}` with your current filetype, and then do the same as for `todo.md`.

`VimNOut` has a multiple filters that you can pick and choose from:

* `{filetype}`, expanded to the current filetype.
* `{compiler}`, expanded to `b:current_compiler`.
* `{files}`, expanded to all the files in the supplied directory

It's also pretty stupid (in a good way) and does not try to guess what you mean. When there are multiple `filetypes` for example (separated by a dot `.`), `VimNOut` will simply give you an autocomplete prompt and let you choose:

![Filetype filter](https://imgur.com/GzozKt0.png "Filetype filter")

And you can even use multiple filters in one command!

![Multiple filters](https://imgur.com/1ZWNmIm.png "Multiple filters")

By default, `VimNOut` uses [`fzf`](https://github.com/junegunn/fzf#as-vim-plugin) for autocompletion, but if it's not installed it will fall back to using vims builtin autocompletion.

## Example mappings ##

`VimNOut` doesn't provide any default mappings, so to get your imagination flowing:

```vim
" All mappings start with <leader>e for edit
nnoremap <leader>ev :VimNOut edit ~/.vim/vimrc<CR>
nnoremap <leader>et :VimNOut edit ~/.tmux.conf<CR>

" Using the {filetype} filter
nnoremap <leader>ef :VimNOut edit ~/.vim/ftplugin/{filetype}.vim<CR>
nnoremap <leader>eaf :VimNOut edit ~/.vim/after/ftplugin/{filetype}.vim<CR>
nnoremap <leader>es :VimNOut UltiSnipsEdit {filetype}<CR>

" Using the {files} filter
nnoremap <leader>eap :VimNOut edit ~/.vim/plugin/{files}<CR>

" Using the {compiler} filter
nnoremap <leader>ec :VimNOut edit ~/.vim/compiler/{compiler}.vim<CR>
```

## I just want to use the cool filters and please don't delete the buffer ##

Just put

```vim
let g:vimnout_delete_on_leave = 0
```

in your `vimrc`.

## Installation ##

Install using your favorite package manager, or use Vim's built-in package support:

```shell
$ mkdir -p ~/.vim/pack/manager/start
$ cd ~/.vim/pack/manager/start
$ git clone https://github.com/srydell/vim-template.git
$ vim -u NONE -c "helptags vim-template/doc" -c q
```

## License ##

Distributed under the same terms as Vim itself. See `:help license.`
