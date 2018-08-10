# My dotfiles

## URXVT 

I use `urxvt` as terminal emulator. I've configured it with `dracula` colors in the `.Xdefaults`
Some tips, you can reload your `.Xdefaults` with this command: `xrdb -merge ~/.Xdefaults`
then you can launch a new shell.

I've disabled scrolling bar and added the font resize plugin.
Binds are:

```
Ctrl+up <bigger font size>
Ctrl+down <smaller font size>
```

I use the font called: `SauceCodePro Nerd Font Mono`


## FISH
I use fish instead of bash or zsh. The theme used is `bobthefish`
## Vim

All you need to know about my vim config.
I use `dracula` colorsheme and my leader key is `,`.

I use `vim-plug` for managing my plugin. 
After editing your `.vimrc` use `:source %` to reload it.

Then you can use these commands:

```
" Install lugins
:PlugInstall

" Update installed plugins
:PlugUpdate

" Clean unused plugins
:PlugClean

" Upgrade vim-Plug
:PlugUpgrade
```

I use YouCompleteMe and Ultisnips. To make theme work together I remaped the expand trigger of Ultisnips to `<tab>`.
When you want to expand a snipped listed you just have to tape `<tab>`

My key bindings are:

```
<tab>               When inserting snippets
<C-t>               NerdTree
<C-p>               FZF Tags
<C-f>               FZF Files
<C-g>c              Git commits
<C-g>s              Git status
<C-b>n              Buffer Next
<C-b>p              Buffer Previous
<C-b>d              Buffer Delete
<C-b>i              Bugger Select
<leader><space>     Zen mode (Use Goyo)
<leader>w           vimwiki
<leader>wi          Vimwiki Diary Index
<leader>w,w         Vimwiki Make Diary Note
<leader>w,i         Vimwiki Diary GenerateLinks
<leader>w,y         Vimwiki Make Yesterday Diary Note
<leader>w,m         Vimwiki Make Tomorrow Diary Note
<leader>w,t         Vimwiki Tab Make Diary Note
<leader>ws          Vimwiki UI Select
<leader>wt          Vimwiki Tab Index
<leader>ww          Vimwiki Index
```

## I3
I use `i3-gaps`
To use the same configuration as my you will need:
  - nitrogen (wallpaper manager)
  - urxvt (Terminal emulator and because I run it as a server for ssh-agent)
  - polybar (Top status bar)
  - Rofi (app launcher)

```
# Mod key
win

# Start a shell
Mod+Enter

# Close a window
Mod+Shift+q

# Goto Workspace
Mod+[0-9]

# Goto active left/right workspace
Mod+Left
Mod+Right

# Make window fload
Mod+Shift+Space

# Move Window
Mod+Shift+[Left, Up, Right, Down]

# Split [h]orizontal/[v]ertical
Mod+h
Mod+v

# Make window fullscreen
Mod+f

# Resize window
Mod+R

# Resize gaps
# After the key bind you choose between [i]nner and [o]uter gaps
# Then use +/- keys to adjust, use Shift for global adjustments
Mod+Shift+g

# Launch Rofi
Mod+d

```

Since I virtualise my Linux distro you can comment the line (I use it to make life easier with WMWare Workstation):

```
exec --no-startup-id /usr/bin/vmware-user-suid-wrapper
``` 

## Polybar

I have a simple polybar config.
Fonts used are:
  - Source Code Pro Semibold
  - Font Awesome 5 Free (For icons in the bar)
  - Font Awesome 5 Brands (Same)

You have to edit the `eth` setting to get network status.

```
[module/eth]
type = internal/network
interface = ens33 <- put your main interface name (eth0 or else)
```

## ROFI
I have a basic rofi theme, it is included in my `.Xdefaults`:
```
rofi.color-window: #34343e, #759496, #759496
rofi.color-normal: #34343e, #b0c4bb, #759496, #b0c4bb, #78824B
rofi.color-active: #34343e, #b0c4bb, #759496, #b0c4bb, #78824B
rofi.color-urgent: #34343e, #b0c4bb, #759496, #b0c4bb, #78824B
```
