const PATH = require('path')
const FS = require('fs')

const fileUtil = {
    getFiles: (dirpath, option) => {
        let files = []
        FS.readdirSync(dirpath).forEach(function (fname) {
            let path = PATH.join(dirpath, fname)
            let fileInfo = FS.statSync(path)
            if (fileInfo.isFile()) {
                files.push(fname)
            }
        });
        return files
    },
    getDirs: function getAllDirs(dirpath, option) {
        let ignoreDir = option.ignoreDir
        let dirs = []
        FS.readdirSync(dirpath).forEach(function (fname) {
            let path = PATH.join(dirpath, fname)
            let fileInfo = FS.statSync(path)
            if (fileInfo.isDirectory()) {
                let shouldIgnore = !!ignoreDir && ignoreDir.includes(fname)
                if (!shouldIgnore) {
                    dirs.push(PATH.join(dirpath, fname))
                }
            }
        });
        return dirs
    }
}
function isReadme(name) {
    if (!!name == false) return false;
    return name.toUpperCase() === 'README'
}
function buildSideBarObjPath(dirpath, fname) {
    let path = dirpath
    if (!dirpath.startsWith('/')) {
        path = '/' + path
    }
    if (!!fname) {
        // [以 / 结尾的路径将会被视为 */README.md](https://www.vuepress.cn/zh/theme/default-theme-config.html#%E4%BE%A7%E8%BE%B9%E6%A0%8F)
        path += '/' + (isReadme(fname) ? '' : fname)
    }
    return path
}
function genSideBarObj(title, path, children) {
    let item = {
        title: title,
        collapsable: true,
        sidebarDepth: 5,
        children: children
    }
    // 仅当无子节点时设置 path 属性（防止影响下拉事件）
    if (children.length === 0) {
        item.path = path
    }
    return item
}
function genSideBarChildren(parentPath, pdirName, option) {
    let tree = []
    let ignoreDir = option.ignoreDir
    FS.readdirSync(parentPath).forEach(function (fname) {
        let currentPath = PATH.join(parentPath, fname)
        let name = PATH.basename(fname, '.md')
        let pathOfSideBarObj = buildSideBarObjPath(pdirName, name)

        let ignore = false
        let fileInfo = FS.statSync(currentPath)
        let children = []
        let node = null
        if (fileInfo.isFile()) {
            node = genSideBarObj(name, pathOfSideBarObj, children)
        } else {
            let ignore = !!ignoreDir && ignoreDir.includes(fname)
            if (!ignore) {
                children = genSideBarChildren(currentPath, pathOfSideBarObj, option)
                node = genSideBarObj(name, pathOfSideBarObj, children)
            }
        }
        if (!ignore && !!node) {
            tree.push(node)
        }
    });
    return tree
}

const sideBarUtil = {
    genSideBar: (root, option) => {
        let sidebars = [{
            title: "README",
            collapsable: false,
            path: '/',
            children: []
        }]
        let allDirs = fileUtil.getDirs(root, option)
        allDirs.forEach((dname) => {
            let name = PATH.basename(dname)
            let path = buildSideBarObjPath(name, null)
            let children = genSideBarChildren(dname, path, option)
            let node = genSideBarObj(name, path, children)
            sidebars.push(node)
        })
        return sidebars
    }
}

module.exports = { sideBarUtil }
