
" ==============================================================================
" DOCUMENTATION
" ==============================================================================
" https://github.com/junegunn/fzf.vim

" | Command           | List                                                                    |
" | ---               | ---                                                                     |
" | `Files [PATH]`    | Files (similar to `:FZF`)                                               |
" | `GFiles [OPTS]`   | Git files (`git ls-files`)                                              |
" | `GFiles?`         | Git files (`git status`)                                                |
" | `Buffers`         | Open buffers                                                            |
" | `Colors`          | Color schemes                                                           |
" | `Ag [PATTERN]`    | [ag][ag] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
" | `Rg [PATTERN]`    | [rg][rg] search result (`ALT-A` to select all, `ALT-D` to deselect all) |
" | `Lines [QUERY]`   | Lines in loaded buffers                                                 |
" | `BLines [QUERY]`  | Lines in the current buffer                                             |
" | `Tags [QUERY]`    | Tags in the project (`ctags -R`)                                        |
" | `BTags [QUERY]`   | Tags in the current buffer                                              |
" | `Marks`           | Marks                                                                   |
" | `Windows`         | Windows                                                                 |
" | `Locate PATTERN`  | `locate` command output                                                 |
" | `History`         | `v:oldfiles` and open buffers                                           |
" | `History:`        | Command history                                                         |
" | `History/`        | Search history                                                          |
" | `Snippets`        | Snippets ([UltiSnips][us])                                              |
" | `Commits`         | Git commits (requires [fugitive.vim][f])                                |
" | `BCommits`        | Git commits for the current buffer                                      |
" | `Commands`        | Commands                                                                |
" | `Maps`            | Normal mode mappings                                                    |
" | `Helptags`        | Help tags <sup id="a1">[1](#helptags)</sup>                             |
" | `Filetypes`       | File types


" ==============================================================================
" KEY MAPPINGS
" ==============================================================================
nnoremap <silent><unique> <Space>/b :Buffers<CR>
nnoremap <silent><unique> <Space>/f :Files<CR>
nnoremap <silent><unique> <Space>/g :GFiles<CR>
nnoremap <silent><unique> <Space>/l :Lines<CR>
nnoremap <silent><unique> <Space>// :BLines<CR>

