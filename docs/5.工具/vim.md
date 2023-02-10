# vim

<img src="/img/vim_cheat_sheet_for_programmers_print.png" />

## buffer windows tabs quickfix netrw fold reg

- `buffers`
  - `:e {file-pattern} :badd {file-pattern}` : *打开文件*
  - `:bn :bp :buf {n}` : *切换缓冲区*
  - `:bd {fname} :bd {n}` : *关闭缓冲区*
  - `:qall :wqall` : *退出/并保存所有缓冲区*
  - `:%bd | e#` : *总装其他缓冲区*
  - `CTRL-^` : *跳转到先前编辑过的 buffer*
  - `:ls :files :buffers` : *缓冲区列表*
    - `-` : *非活动的缓冲区*
    - `=` : *只读缓冲区*
    - `a` : *活动缓冲区，显示在屏幕上* 
    - `h` : *隐藏缓冲区，未显示在屏幕上*
    - `+` : *已更改的缓冲区*
    - `x` : *读入时报错的缓冲区*
    - `%` : *当前缓冲区*
    - `#` : *交换缓冲区*
    - `u` : *只有使用，:ls! 才能看到的缓冲区*
- `windows` : *窗口*
  - `:split :new :vsplit :diffsplit :vert diffsplit` : *分割*
  - `CTRL-W h|H j|J k|K j|L` : *移动到某窗口*
  - `CTRL-W v s c o` : *分割 | 关闭 | 关闭其他*
  - `CTRL-W w t b p` : *循环移动/左上角/右下解/上一个*
  - `CTRL-W r R` : *向右下/左上交换*
  - `CTRL-W = |` : *平均分割窗口/将当前窗口调到最大*
  - `CTRL-W + - < >` : *调整窗口大小*
- `tabs` : *标签页*
  - `:tabs`
  - `:tabnew :tabc` : *打开关闭*
  - `gt gT {n}gt`
  - `:tabn :tabp :tabf :tabl :tabm`
- `quickfix` : *快速修复列表*
  - `:cope :ccl` : *打开关闭*
  - `:cn :cp :colder :cnewer` : *跳转*
- `netrw` : *内置的文件浏览器*
  - *使用 :bd 来关闭，视为一个缓冲区*
  - `:Explorer :Sexplorer :Vexplorer :Te`
    - `% d R D` : *创建文件 创建目录 重命名 删除*
- `fold` : *折叠*
  - `zf :fold` : *折叠命令，需要名词配合*
  - `zo zc za` : *打开/关闭/切换折叠*
  - `zR zM` : *打开/关闭所有折叠*
  - `set foldmethod=`
    - `syntax` : *语法折叠*
    - `indent` : *缩进折叠*
      - `:set shiftwidth=2`
    - `expr` : *表达式折叠*
      - `:set foldexpr=getline(v:lnum)[0]==\\"p\\"`
    - `foldmarker` : *标志折叠，默认将三个花括号为折叠指示器*
      - `:set foldmarker=coffee1,coffee2`
- `reg` : *"{name}*
  - `""` : * 匿名，最近一次复制、修改、删除的文本*
  - `"0` : * 最近一次复制的内容*
  - `"1-9` : * 修改或删除至少一行时，越近编号越小*
  - `"-` : * 小删除，不足一行的修改或删除*
  - `"a-z` : * 命名*
  - `": ". "%` : * 只读，上次输入的文本，上次执行的命令，当前文件名*
  - `"#` : * 交换*
  - `"=` : * 表达式，用来计算*
  - `"* "+` : * 连通系统剪贴板*
  - `"_` : * 黑洞，put _ 可插入空行*
  - `"/` : * 搜索*

## 编辑

> `verb + noun` # 动词 + 名词

### 常用

- `i I a A o O s S c d x X`
- `y p r R J`
- `w W e E b B ge gE`
- `v V C-V C-Q`
- `0 ^ g_ $ n|`
- `f F t T ; ,`
- `- + <Enter>`
- `( ) { }`
- `gg G {n}G %G G`
- `gu gU`
---
- `C-O C-I`
- `H M L nH nL` : "移动到屏幕上/中/下"
- `<C-E> <C-Y> <C-D> <C-U> <C-F> <C-B>` : *滚动*
- `zt zz zb` | `z<Enter> z. z-` : *将当前行移动到屏幕上/中/下*
- `zh zl zH zL` : *屏幕左/右移动*
---
- `u :undo U`
- `CTRL-R :redo`
- `:earlier {time} :later {time}` : *恢复到 time 前/后*
- `g+ g-` : *撤消树恢复*
- `gi gI gv`
---
- `? / n N`
- `* # gd gD g* g#` : *光标单词搜索
---
- `CTRL-Z :stop :suspend`
- `fg`
---
- `m{a-z} m{A-Z}` : *标记*
- 'a \`a : *转到标记行/位置*
- `:marks :delmarks`
  - `'` : *上次跳转行*
  - \` : *上次跳转的位置*
  - '[' : *上次修改的开头*
  - `]` : *上次修改的结尾*
  - `<` : *上次可视模式下选择的开头*
  - `>` : *上次可视模式下选择的结尾*
  - `0` : *上次退出vim前编辑的最后一个文件*
---
- `text-object` : *verb + (i | o) + (text-object | symbol)*
  - `v y c d`
  - `w s p t` : *word sentence paragraph tag*
---
- `--NORMAL--`
  - `df{char} d/{search-char} d/{n}{search-char}`
  - `搜索并删除`
    1. `/{search-str}<CR>`
    2. `cgn{new-str}` : *cgn 移动并替换*
    3. `.` : *重复把 search-str 替换为 new-str*
  - `gJ gq g?` : *拼接但保留空格/截断当前行/加密*
---
- `--INSERT--`
  - `C-H C-W C-U` : *删除字符/单词/行*
  - `C-O {normal-cmd}` : *使用普通模式的命令*
  - `C-N` : *自动补全*
  - `C-R {reg-name}` : *粘贴寄存器的值*
  - `C-X` : *^X 模式*
    - `C-E C-Y` : *滚动*
    - `C-L C-N `C-I C-F : *补全*
---
- `--VISUAL--`
  - `o O` : *可调整光标位置*
  - `C-X C-A` : *增加/减少*
  - `g C-A` : *递增*
---
- `--EX--`
  - `:his q:` : *历史记录*
  - `C-D` : *触发提示*
  - `C-F` : *编辑命令*
  - `C-R`
    - `C-W C-A C-L` : *获取光标下的单词/词组/行*
---
- `find replce`
  - `// & :s` : *重复上一次搜索/替换*
  - `\zs \ze {-}` : *magic/开始/结束/非贪婪0~n次*
  - `\l \u` : *小写字母/大写字母*
  - `:s@old@new` : *更换定界符*
  - **search-mode**
    - `\v`[ery magic]：所有 Ascii 中除了 数字、字母、下划线外都有特殊意义
    - `\V`[very nomagic]：除了反斜杠和模式起止的分隔符外均表示字符本身
    - `\m`[agic]：`^` `$` `.` `*` `~` `[]` 等具有特殊意义
    - `\M`[nomagic]：仅 `^` `$` 具有特殊含义
---
- `command`
  - `:h :helpgrep`
  - `:0 :$`
  - `:set options?`: *查看选项的值*
  - `:r {fname}` : *读取文件到当前行*
  - `:left :center :right` : *设置文本对齐*
  - `:w !{external-cmd}` : *将当前内容输入外部命令*
  - `:g/TODO/t $` : *将所有 TODO 行复制到文件末*
---
- `宏 micro`
  1. `q{a-z}` : *开始录制*
  2. 执行操作
  3. `q` : *停止录制*
  4. `@{a=z}` : *播放*
  - `@@ @:` : *执行上次的宏/命令*

### 替换

- `:<range>s`[ubstitute]`/<pattern>/<str>/<flags> <count>`
  - 遍历所有行，把 range 内符合 pattern 的替换为 str，替换 count 次
- `:<range>s`[ubstitute]` <flags> <count>`
- `:&[&]<flags> <count>`
  - 重复上次替换，但使用当前的 flags 和 count
  - `:&&`：使用上次的 flags
- `:<range>~[&]<flags> <count>`
  - 重复上次替换，但使用当前的 flags 和 count，并且使用上次的搜索模式
  - `:~&`：使用上次的 flags
- `:<range>sno[magic]`：类似 subsitute 但使用 nomagic
- `:<range>sm[agic]`：类似 subsitute 但使用 magic
---
- `:<range>g[lobal]/<pattern>/<cmd>`：对匹配内容执行命令
- `:<range>g[lobal]!/<pattern>/<cmd>`
- `:<range>v[global]/<pattern>/<cmd>`
  - 对未匹配的内容执行命令
  - 默认为 Ex 模式的命令，如果需要其他模式则为 `<mode-name> <cmd>`
---
- `<range>`：均可使用 `+` 和 `-` 来设置偏移量
  - `<Empty>` | `.`：当前行
  - `{n}` | `$` | `%`：第 n 行 | 最后一行 | 所有行
  - `{m},{n}` | `1,.` | `.,$`：从 m 行到 n 行 | 第 1 行到当前行 | 当前行到最后
  - `'<char>`：标记 char 所在行
  - `?<pattern>?` | `/<pattern>/`：向上下搜索第一个匹配的所在行
- `<pattern>`：表达式，可以包含正则
  - `.` | `(` | `{` | `+`：这些符号都需要 \ 转义
  - `\<{str}\>`：必须完全匹配 str
- `<flags>`：可以组合使用
  - `<Empty>`：对第一个执行
  - `&`：必须是第一个，保留上次替换的 flags
  - `g` | `e` ：替换所有行 | 忽略错误
  - `n`：不执行替换，仅提示匹配数量
  - `r`：仅可为 `:&r` 和 `:sr` ，使用上次替换的搜索模式
  - `p` | `#`：匹配并提示最后匹配内容 | 且显示行号 | 类似 `p` 但显示所有
  - `c`：高亮且必须确认
    - `y` | `n` | `<Esc>` | `q`：是 | 下一个匹配 | 退出 | 停止替换
    - `l` `a`：替换并退出 | 替换当前和所有剩余匹配

### do

- `argdo` : *参数列表*
- `bufdo` : *缓冲区列表*
- `windo` : *窗口列表*
- `tabdo` : *tab列表*
- `cdo` : *快速修复列表，:copen :cclose*
- `cfdo` : *文件方式的快速修复列表，对文件执行命令*
- `ldo` : *位置列表，类似快速修复列表，但以 l 为前缀*
- `lfdo` : *文件方式的位置列表*

## Extend Vim 

```shell
# 更新 vim
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
# 与系统剪贴板交互
vim --version | grep clipboard
sudo apt install vim-gtk
# 安装 NeoVim
sudo apt-add-repository ppa:neovim-ppa/stable
sudo apt-get update
sudo apt-get install neovim
```

## 参考 

- [Learn-Vim_zh-cn](https://github.com/wsdjeg/Learn-Vim_zh_cn)