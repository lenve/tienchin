import router from './router'
import { ElMessage } from 'element-plus'
import NProgress from 'nprogress'
import 'nprogress/nprogress.css'
import { getToken } from '@/utils/auth'
import { isHttp } from '@/utils/validate'
import { isRelogin } from '@/utils/request'
import useUserStore from '@/store/modules/user'
import useSettingsStore from '@/store/modules/settings'
import usePermissionStore from '@/store/modules/permission'

NProgress.configure({ showSpinner: false });

const whiteList = ['/login', '/auth-redirect', '/bind', '/register'];

/**
 * 路由前置导航守卫
 * 在 Vue 中的所有页面跳转，都会被这个全局的前置导航守卫监听到，这个类似于 Java 中的 Filter
 * to：要去哪，去哪个页面：类似于 HttpServletResponse
 * from：从哪来，从哪个页面来，类似于 HttpServletRequest
 * next：一个继续向下执行的函数，类似于 FilterChain
 */
router.beforeEach((to, from, next) => {
  NProgress.start()
  //获取令牌，当用户登录成功之后，用户的登录令牌会被存入到 Cookie 中，所以这里其实就是从 Cookie 中获取登录令牌，以此作为判断用户是否已经登录的依据
  if (getToken()) {
    to.meta.title && useSettingsStore().setTitle(to.meta.title)
    /* has token*/
    //如果已经登录了，但是此时还想要跳转到登录页面，这个操作是不被允许的，此时默认就会跳转回到项目首页
    if (to.path === '/login') {
      next({ path: '/' })
      NProgress.done()
    } else {
      //如果去的不是登录页面，就是去普通页面，此时又分为两种情况：
      //useUserStore().roles.length === 0 表示此时 Pinia 中没有 保存用户信息，也没有保存菜单信息（意味着用户可能是点击了浏览器的刷新按钮）
      //两种情况下，这个 roles 的长度为 0：1，刚登录的时候，还没去服务端请求用户信息的时候（当然这个时候动态菜单信息也没请求）2，按浏览器刷新按钮的时候，这个长度会变为0
      //通过这个，可以判断出从服务端加载到的动态菜单是否还存在
      if (useUserStore().roles.length === 0) {
        isRelogin.show = true
        // 判断当前用户是否已拉取完user_info信息
        //加载用户基本信息
        useUserStore().getInfo().then(() => {
          isRelogin.show = false
          //加载路由信息
          usePermissionStore().generateRoutes().then(accessRoutes => {
            // 根据roles权限生成可访问的路由表
            accessRoutes.forEach(route => {
              if (!isHttp(route.path)) {
                router.addRoute(route) // 动态添加可访问路由表
              }
            })
            next({ ...to, replace: true }) // hack方法 确保addRoutes已完成
          })
        }).catch(err => {
          useUserStore().logOut().then(() => {
            ElMessage.error(err)
            next({ path: '/' })
          })
        })
      } else {
        //说明就是普普通通的页面跳转
        next()
      }
    }
  } else {
    // 没有token，没有登录
    if (whiteList.indexOf(to.path) !== -1) {
      // 在免登录白名单，直接进入
      next()
    } else {
      //否则说明你在未登录的情况下，想要跳转到一个需要登录成功后才能访问的页面，此时就统一重定向到登录页面
      next(`/login?redirect=${to.fullPath}`) // 否则全部重定向到登录页
      NProgress.done()
    }
  }
})

router.afterEach(() => {
  NProgress.done()
})
