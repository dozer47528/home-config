```
cd ~ #到根目录
git init #初始化git
git remote add origin [your url] #帮顶远程分支
git fetch origin #拉一下远程代码
git reset --hard origin/master #强制把本地文件还原成和远程一致
git branch --set-upstream master origin/master #绑定本地和远程的分支
```
