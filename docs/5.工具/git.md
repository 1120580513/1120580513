# Git

---

- `git checkout -b <branch_name>`：_创建分支_
- `git checkout <branch_name>`：_切换分支_
- `git status`：_查看状态_
- `git add .`：_将工作区的内容放入暂存区_
- `git commit`：_将暂存区的内容提交到当前本地分支_

---

- `git commit -- .`：_丢弃工作区的修改_
- `git reset HEAD -- .`：_将暂存区的内容回退到工作区_
- `git commit --amend`：_修改上一次本地提交的说明_
- `git reset --hard <commit_hash>`：_回退至某一次提交_
- `git revert <commit_hash>`：_撤销提交(产生一个 commit)_
- `git fsck --lost-found`：_用来显示看不到的 hash(找回 reset 有用)_
- `git cherry-pick <commit_hash>`：_将某个提交移到增加到 HEAD_

---

- `git clone <url>`：_克隆远程仓库_
- `git pull`：_从远程仓库同步到本地远程分支然后合并至本地分支_
- `git pull --rebase`：_从远程仓库同步到本地远程分支然后变基至本地分支_
- `git push`：_将本地分支推送至远程仓库_
- `git push <origin> <tag>`：_推送 tag 至远程仓库_

---

- `git mrege <branch_name>`：_合并_
- `git rebase`：_变基_
- `git rebase -i <commit_hash>`：_从HEAD到指定提交之间的若干提交进行变基_

---

- `git stash save "<name>"`：_将未提交的修改保存供以后使用_
- `git stash list`：_查看保存_
- `git stash pop`：_回到上次的修改，并删除该保存_


## git commit 示例

```
<type>(<scope>): <subject>
 <BLANK LINE>
 <body>
 <BLANK LINE>
 <footer>
```
- scope(范围)：代码的影响面，一般使用业务维度，例：`user`、`order`
- subject(主题)：概括提交了什么
- body(正文)：一般列出 1 2 3 4
- footer(尾部)：自定义，一般用来触发 gitlab 的一些勾子

### 类型

| &lt;type&gt; | 说明 | 
| :-----| :---- | 
| feat | feature：功能变更 |
| fix | 修复 bug |
| docs | 更新了文档或注释 |
| style | 代码格式的调整 |
| refactor | 重构代码 |
| perf | 性能优化 |
| test | 增加了测试或自动化相关代码 |
| build | 影响编译 |
| ci | 持续集成 |
| chore | 其他改动，如梦清理注释或文件清理 |  
| revert | 回滚 |

## Workflow

### Forking

> 每个开发者自己 push 到自己的服务器仓库，然后向主仓库提交 pull request，只有项目维护人员才能直接 push 代码到官方仓库

### Gitflow

> 使用两个并行的、长期运行的分支来记录项目的历史记录，分别是 master 和 develop 分支

- `master`：_随时准备发布线上版本的分支_
  - `hotfix`：_用于快速给生产版本打补丁_
- `develop`：_合并所有功能(feature)的分支_
  - `feature`：_每个功能的分支_

## 链接

- [Git 面试题](http://blog.jobbole.com/114297/)
- [Git 在线教程](https://learngitbranching.js.org/)

## 备注

### Workspace：工作区
### Index / Stage：暂存区
### Repository：仓库区（或本地仓库）
### Remote：远程仓库