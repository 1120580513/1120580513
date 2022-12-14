start "" "E:\workspace\keedegroup.b2c.admin\src\B2C.Admin.sln"
start "" "C:\ProgramData\Microsoft\Windows\Start Menu\Programs\DBeaver Community\DBeaver"
start "C:\Program Files (x86)\Microsoft\Edge\Application\msedge.exe"
start "" "C:\Program Files\Sublime Text 3\sublime_text.exe"
start wt --title Ubuntu -p wsl-Ubuntu-22.04.1-LTS;^
new-tab --title temp.cmd -p cmd;^
  split-pane --title temp.bash -H -d E:\workspace -p git-bash;^
new-tab --title admin -d E:\workspace\keedegroup.b2c.admin -p git-bash;^
  split-pane --title promote -H -d E:\workspace\kedegroup.promote -p git-bash;^
  move-focus up;^
  split-pane --title jackoms -V -d E:\workspace\kedegroup.jackoms -p git-bash;^
  move-focus down;^
  split-pane --title customsinfo -V -d E:\workspace\kede.customsinfo -p git-bash;^
new-tab --title tpds -d E:\workspace\keedegroup.tpds -p git-bash;^
  split-pane --title thirdplatform -H -d E:\workspace\keedegroup.b2c.thirdplatform -p git-bash;^
  move-focus up;^
  split-pane --title jackoms -V -d E:\workspace\kedegroup.jackoms -p git-bash;^
  move-focus down;^
  split-pane --title goodsstock -V -d E:\workspace\keedegroup.goodsstock -p git-bash;^
new-tab --title third.api -d E:\workspace\keedegroup.third.api -p git-bash;^
  split-pane --title tmall.api -H -d E:\workspace\keedegroup.tmall.api -p git-bash;^
  move-focus up;^
  split-pane --title pdd.api -V -d E:\workspace\keedegroup.pdd.api -p git-bash;^
  move-focus down;^
  split-pane --title -V -d E:\workspace\keedegroup.weixin -p git-bash;^
new-tab --title promotioncenter -d E:\workspace\promotioncenter -p git-bash;^
  split-pane --title membercenter -H -d E:\workspace\membercenter -p git-bash;^
  move-focus up;^
  split-pane --title goodscenter -V -d E:\workspace\goodscenter -p git-bash;^
  move-focus down;^
  split-pane --title wms -V -d E:\workspace\wms -p git-bash;^
new-tab --title promote.bgUI -d E:\workspace\kedegroup.promote.backgroundui -p git-bash;^
  split-pane --title promote.frUI -H -d E:\workspace\kedegroup.promote.promoteui -p git-bash;^
  move-focus up;^
  split-pane --title promote.userUI -V -d E:\workspace\goodscenter -p git-bash;^
  move-focus down;^
  split-pane --title tpds.UI -V -d E:\workspace\keedegroup.tpds.ui -p git-bash;^
new-tab --title front -d E:\workspace\b2c.api.core -p git-bash;^
  split-pane --title pcfront -H -d E:\workspace\b2c.kede.pcfront -p git-bash;^
  move-focus up;^
  split-pane --title cartapi -V -d E:\workspace\b2c.kede.cart.api.core -p git-bash;^
  move-focus down;^
focus-tab -t 1
code "E:\summary"
