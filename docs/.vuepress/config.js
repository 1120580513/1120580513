const PATH = require('path')
const { sideBarUtil } = require(PATH.join(__dirname, './utils/index.js'))

let rootPath = PATH.join(__dirname, '../')// ~/docs

let option = {
  ignoreDir: ['.vuepress'],
}
let sidebar = sideBarUtil.genSideBar(rootPath, option)

var json = JSON.stringify(sidebar)

module.exports = {
  title: 'Note',
  description: 'Shao Note',
  themeConfig: {
    sidebar: sidebar
  },
  markdown: {
    lineNumbers: true,
  },
  plugins: {
    '@vuepress/medium-zoom': {
      selector: 'img',
      options: {
        margin: 16
      }
    }
  }
}