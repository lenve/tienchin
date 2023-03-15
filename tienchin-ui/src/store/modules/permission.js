import auth from '@/plugins/auth'
import router, {constantRoutes, dynamicRoutes} from '@/router'
import {getRouters} from '@/api/menu'
import Layout from '@/layout/index'
import ParentView from '@/components/ParentView'
import InnerLink from '@/layout/components/InnerLink'

// 匹配views里面所有的.vue文件
const modules = import.meta.glob('./../../views/**/*.vue')
const usePermissionStore = defineStore(
    'permission',
    {
        state: () => ({
            /**
             *这个保存了本地的公共路由和服务端返回的动态路由（菜单），这个 routes 将来主要是在两个地方使用：
             * 1。 首页搜索时使用
             * 2。 tagview 中使用
             *
             * 从 routes 的使用场景中，可以看到，routes 变量实际上并不涉及到页面渲染，单纯的只是处理页面的逻辑
             *
             * 这个 routes 有一个区别于下面三个变量的特点，这个 routes 中的 children 铺平了：就是把所有的 3-n 级菜单，全部变为 2 级菜单，这个铺平操作一共做了两件事：
             *
             * 1。 所有的 3-n 级菜单，全部变为 2 级菜单
             * 2。 在变的过程中，将组件的 path 改为 父组件的 path+子组件的 path
             *
             * 由于这个 routes 变量做的是幕后的工作，不影响菜单的渲染
             */
            routes: [],
            //暂无具体使用场景，可以删除之
            addRoutes: [],
            /**
             * 这个相当于是动态路由的一个备份，也可以理解为是完整的 sidebarRouters 的一个备份，无论什么情况，defaultRoutes 都表示 1-n 级菜单
             */
            defaultRoutes: [],
            /**
             * 如果开启了顶部导航菜单，那么相关的渲染就是由 topbarRouters 来完成的
             */
            topbarRouters: [],
            /**
             * 左侧的导航栏，正常来说，这个会参与左侧菜单的渲染，默认也是完整的 1-n 级菜单，但是如果开启了顶部菜单，那么这个变量就是 2-n 级菜单
             */
            sidebarRouters: []
        }),
        actions: {
            setRoutes(routes) {
                this.addRoutes = routes
                this.routes = constantRoutes.concat(routes)
            },
            setDefaultRoutes(routes) {
                this.defaultRoutes = constantRoutes.concat(routes)
            },
            setTopbarRoutes(routes) {
                this.topbarRouters = routes
            },
            setSidebarRouters(routes) {
                this.sidebarRouters = routes
            },
            generateRoutes(roles) {
                return new Promise(resolve => {
                    getRouters().then(res => {
                        //这个类似于 Java 中的深拷贝，如果直接将服务端返回的 JSON 变量赋值给三个不同的变量，那么三个变量会指向同一块内存地址，这样就导致了一个变量发生变化，另外两个变量会跟着变。
                        //将 JSON 转为字符串，再将字符串转为 JSON，这样三个变量就使用三块不同的内存地址，将来在具体应用的过程中就互不影响
                        //Object.assign
                        const sdata = JSON.parse(JSON.stringify(res.data))
                        const rdata = JSON.parse(JSON.stringify(res.data))
                        const defaultData = JSON.parse(JSON.stringify(res.data))
                        //这个变量保存的是服务端返回的动态 JSON 中的 component 字符串变为了对象
                        const sidebarRoutes = filterAsyncRouter(sdata)
                        //这是一个重写后的 routes，这个重写后的 routes 主要是将 3-n 级菜单统统变为 2 级菜单
                        const rewriteRoutes = filterAsyncRouter(rdata, false, true)
                        //这个变量保存的是服务端返回的动态 JSON 中的 component 字符串变为了对象
                        const defaultRoutes = filterAsyncRouter(defaultData)
                        //动态路由，根据用户权限查询出本地定义的可用的动态路由，这些动态路由都不涉及到菜单渲染，所以查询到之后，直接遍历，放到 router 对象中即可
                        const asyncRoutes = filterDynamicRoutes(dynamicRoutes)
                        asyncRoutes.forEach(route => {
                            router.addRoute(route)
                        })
                        //这个实际上是前端公共路由和服务端返回的动态路由，赋值给 routes
                        this.setRoutes(rewriteRoutes)
                        //左侧菜单栏渲染，这个也是公共路由+sidebarRoutes
                        this.setSidebarRouters(constantRoutes.concat(sidebarRoutes))
                        //这个中永远保存的是最最完整的菜单项数据，所以也是 constantRoutes+sidebarRoutes，只不过是在 set 方法中加的
                        this.setDefaultRoutes(sidebarRoutes)
                        //这个是顶部菜单数据源
                        this.setTopbarRoutes(defaultRoutes)
                        resolve(rewriteRoutes)
                    })
                })
            }
        }
    })

/**
 * 这个方法主要是将服务端返回的 component 字符串转为 component 组件（对象）
 * @param asyncRouterMap 服务端返回的动态菜单 JSON
 * @param lastRouter 是否是最后一个路由对象
 * @param type 是否需要进行 children 铺平操作
 * @returns {*}
 */
function filterAsyncRouter(asyncRouterMap, lastRouter = false, type = false) {
    return asyncRouterMap.filter(route => {
        if (type && route.children) {
            route.children = filterChildren(route.children)
        }
        if (route.component) {
            // Layout ParentView 组件特殊处理
            if (route.component === 'Layout') {
                route.component = Layout
            } else if (route.component === 'ParentView') {
                route.component = ParentView
            } else if (route.component === 'InnerLink') {
                route.component = InnerLink
            } else {
                //说明是一些功能性的组件
                route.component = loadView(route.component)
            }
        }
        if (route.children != null && route.children && route.children.length) {
            //递归处理 children 中的 component，将 children 的 component 字符串也变为对象
            route.children = filterAsyncRouter(route.children, route, type)
        } else {
            delete route['children']
            delete route['redirect']
        }
        return true
    })
}

/**
 * 这个方法主要是做菜单铺平操作，菜单的铺平涉及到两件事：
 *
 * 1。将 3-n 级菜单变为 2 级菜单
 * 2。将 3-n 级菜单的 path 改为父组件的 path+子组件的 path
 *
 * @param childrenMap 要处理的菜单
 * @param lastRouter
 * @returns {[]}
 */
function filterChildren(childrenMap, lastRouter = false) {
    //将 2-n 级菜单，都装入 children 变量中
    var children = []
    childrenMap.forEach((el, index) => {
        if (el.children && el.children.length) {
            if (el.component === 'ParentView' && !lastRouter) {
                el.children.forEach(c => {
                    // 操作日志的 path = 日志管理 path（log）+ "/" + 操作日志的 path（operlog）
                    c.path = el.path + '/' + c.path
                    if (c.children && c.children.length) {
                        //如果操作日志还是有 children，那么就通过一个递归，将其 children 都过滤出来
                        children = children.concat(filterChildren(c.children, c))
                        return
                    }
                    children.push(c)
                })
                return
            }
        }
        if (lastRouter) {
            el.path = lastRouter.path + '/' + el.path
        }
        /**
         * 以 系统管理 为例，从用户管理到通知公告，上面两个 if 都不会进去，直接将之放到 children 中即可（因为这些本来就是二级菜单，并且没有 children）
         * @type {*[]}
         */
        children = children.concat(el)
    })
    return children
}

/**
 * 跟当前登录用户的权限，过滤出本地定义的动态路由中，有哪些是可用的
 * @param routes
 * @returns {[]}
 */
export function filterDynamicRoutes(routes) {
    const res = []
    routes.forEach(route => {
        if (route.permissions) {
            if (auth.hasPermiOr(route.permissions)) {
                res.push(route)
            }
        } else if (route.roles) {
            if (auth.hasRoleOr(route.roles)) {
                res.push(route)
            }
        }
    })
    return res
}

/**
 * 去动态加载功能性的组件
 *
 * modules 中保存了所有的功能性组件
 *
 * modules 中保存的数据类似如下格式，这是一种 key-value 格式，key 是路径，value 则是懒加载的函数。
 *
 * ./../../views/monitor/server/index.vue: () => import("/src/views/monitor/server/index.vue")
 *
 * @param view
 * @returns {function(): Promise<{[p: string]: any}>}
 */
export const loadView = (view) => {
    let res;
    for (const path in modules) {
        //   monitor/server/index
        const dir = path.split('views/')[1].split('.vue')[0];
        if (dir === view) {
            res = () => modules[path]();
        }
    }
    return res;
}

export default usePermissionStore
