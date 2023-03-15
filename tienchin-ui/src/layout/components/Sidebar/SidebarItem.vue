<template>
    <div v-if="!item.hidden">
        <template
                v-if="hasOneShowingChild(item.children, item) && (!onlyOneChild.children || onlyOneChild.noShowingChildren) && !item.alwaysShow">
            <app-link v-if="onlyOneChild.meta" :to="resolvePath(onlyOneChild.path, onlyOneChild.query)">
                <el-menu-item :index="resolvePath(onlyOneChild.path)" :class="{ 'submenu-title-noDropdown': !isNest }">
                    <svg-icon :icon-class="onlyOneChild.meta.icon || (item.meta && item.meta.icon)"/>
                    <template #title><span class="menu-title" :title="hasTitle(onlyOneChild.meta.title)">{{ onlyOneChild.meta.title }}</span>
                    </template>
                </el-menu-item>
            </app-link>
        </template>

        <el-sub-menu v-else ref="subMenu" :index="resolvePath(item.path)" popper-append-to-body>
            <template v-if="item.meta" #title>
                <svg-icon :icon-class="item.meta && item.meta.icon"/>
                <span class="menu-title" :title="hasTitle(item.meta.title)">{{ item.meta.title }}</span>
            </template>

            <sidebar-item
                    v-for="child in item.children"
                    :key="child.path"
                    :is-nest="true"
                    :item="child"
                    :base-path="resolvePath(child.path)"
                    class="nest-menu"
            />
        </el-sub-menu>
    </div>
</template>

<script setup>
    import {isExternal} from '@/utils/validate'
    import AppLink from './Link'
    import {getNormalPath} from '@/utils/ruoyi'

    const props = defineProps({
        // route object
        item: {
            type: Object,
            required: true
        },
        isNest: {
            type: Boolean,
            default: false
        },
        basePath: {
            type: String,
            default: ''
        }
    })

    const onlyOneChild = ref({});

    function hasOneShowingChild(children = [], parent) {
        if (!children) {
            children = [];
        }
        //过滤一级菜单的所有子菜单，返回的值是一个数组，这个有点像 Java 中的文件过滤，回调方法返回 true，表示这一项数据可用，否则表示这项数据不可用
        //这个代码块的目的是将这个一级菜单的所有需要展示的子菜单统统给过滤出来
        const showingChildren = children.filter(item => {
            if (item.hidden) {
                return false
            } else {
                // Temp set(will be used if only has one showing child)
                //如果这个子菜单需要展示出来，就将这个子菜单赋值给 onlyOneChild 变量
                onlyOneChild.value = item
                return true
            }
        })

        // When there is only one child router, the child router is displayed by default
        //如果需要展示的子菜单数量为 1，那就说明只有一个需要展示的子菜单
        if (showingChildren.length === 1) {
            return true
        }

        // Show parent if there are no child router to display
        //长度为 0，说明没有需要展示的子菜单
        if (showingChildren.length === 0) {
            //将当前这个 parent 赋给值 onlyOneChild，同时还加上了一个 noShowingChildren 为 true 表示没有需要展示的子菜单
            //{a:aa,b:bb}
            onlyOneChild.value = {...parent, path: '', noShowingChildren: true}
            //注意此时也返回一个 true，表示只有一个需要展示的菜单项
            //如果一个一级菜单压根就没有子菜单，例如展示外链的，就会进入到这个分支
            return true
        }

        return false
    };

    function resolvePath(routePath, routeQuery) {
        if (isExternal(routePath)) {
            return routePath
        }
        if (isExternal(props.basePath)) {
            return props.basePath
        }
        if (routeQuery) {
            let query = JSON.parse(routeQuery);
            return {path: getNormalPath(props.basePath + '/' + routePath), query: query}
        }
        return getNormalPath(props.basePath + '/' + routePath)
    }

    function hasTitle(title) {
        if (title.length > 5) {
            return title;
        } else {
            return "";
        }
    }
</script>
