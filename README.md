# My Linux's shell environment

配置：

- zsh
- neovim
- tmux
- fzf



#Step1 运行脚本

`sh run.sh`

> 1. 确保环境通畅，必要时挂个代理
> 2. `.zshrc`中第五行用户名是我的用户名sirius，必要时自己改一下
> 3. `coc-settings.json`的第41行是conda的python路径
> 4. 安装完后直接起个新的终端，重新进入一下  source有点麻烦，下载的配置文件太多了

## Step2 nvim插件下载

输入`vim`进入nvim（.zshrc已经alias vim=nvim）

输入`:PlugInstall`（可能需要代理，不然会遇到git 443） 

> 可能需要多进入几次vim，coc-nvim会下载插件

## Step3 tmux插件下载

输入`tmux`进入tmux

`prefix+I`下载插件（prefix 已经修改成了ctrl+x)

> 按了`prefix+I` 下载插件后界面不会有任何提示，没事，后台已经在下载插件了。
>
> 插件位置：`~/.tmux/plugins`

## Step4 (option)fzf设置

具体配置可以查看`.fzf.zsh`文件，想要的粘进去

## Step5 (option)powerline字体下载

如果要在linux环境中使用终端的话，而不是远程ssh，那么Linux本地环境中还需要下载powerline字体

`https://github.com/ryanoasis/nerd-fonts`
