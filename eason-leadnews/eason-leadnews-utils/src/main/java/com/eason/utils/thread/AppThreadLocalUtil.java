package com.eason.utils.thread;

import com.eason.model.user.pojos.ApUser;
import com.eason.model.wemedia.pojos.WmUser;

public class AppThreadLocalUtil {
    private final static ThreadLocal<ApUser> WM_USER_THREAD_LOCAL = new ThreadLocal<>();

    // 存入线程
    public static void setUser(ApUser apUser) {
        WM_USER_THREAD_LOCAL.set(apUser);
    }

    // 从线程中取出
    public static ApUser getUser() {
        return WM_USER_THREAD_LOCAL.get();
    }

    // 清理
    public static void clear() {
        WM_USER_THREAD_LOCAL.remove();
    }
}
