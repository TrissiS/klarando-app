.class public Lc/b/a/l;
.super Ljava/lang/Object;
.source "NotchUtils.java"


# direct methods
.method public static a(Landroid/content/Context;I)I
    .registers 3

    int-to-float p1, p1

    .line 10
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {v0, p1, p0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p0

    float-to-int p0, p0

    return p0
.end method

.method public static a(Landroid/app/Activity;)Landroid/view/DisplayCutout;
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_1d

    if-eqz p0, :cond_1d

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    if-eqz p0, :cond_1d

    .line 3
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/View;->getRootWindowInsets()Landroid/view/WindowInsets;

    move-result-object p0

    if-eqz p0, :cond_1d

    .line 4
    invoke-virtual {p0}, Landroid/view/WindowInsets;->getDisplayCutout()Landroid/view/DisplayCutout;

    move-result-object p0

    return-object p0

    :cond_1d
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a(Landroid/content/Context;)[I
    .registers 5

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 5
    fill-array-data v0, :array_24

    .line 6
    :try_start_6
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    const-string v1, "com.huawei.android.util.HwNotchSizeUtil"

    .line 7
    invoke-virtual {p0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v1, "getNotchSize"

    const/4 v2, 0x0

    new-array v3, v2, [Ljava/lang/Class;

    .line 8
    invoke-virtual {p0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    .line 9
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [I
    :try_end_21
    .catch Ljava/lang/ClassNotFoundException; {:try_start_6 .. :try_end_21} :catch_22
    .catch Ljava/lang/NoSuchMethodException; {:try_start_6 .. :try_end_21} :catch_22
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_21} :catch_22

    return-object p0

    :catch_22
    return-object v0

    nop

    :array_24
    .array-data 4
        0x0
        0x0
    .end array-data
.end method

.method public static b(Landroid/app/Activity;)I
    .registers 6

    .line 1
    invoke-static {p0}, Lc/b/a/h;->a(Landroid/app/Activity;)I

    move-result v0

    .line 2
    invoke-static {p0}, Lc/b/a/l;->a(Landroid/app/Activity;)Landroid/view/DisplayCutout;

    move-result-object v1

    .line 3
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v3, 0x1

    const/16 v4, 0x1c

    if-lt v2, v4, :cond_32

    if-eqz v1, :cond_32

    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    if-ne p0, v3, :cond_22

    .line 5
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getSafeInsetTop()I

    move-result v0

    goto :goto_68

    .line 6
    :cond_22
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    move-result p0

    if-nez p0, :cond_2d

    .line 7
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getSafeInsetRight()I

    move-result v0

    goto :goto_68

    .line 8
    :cond_2d
    invoke-virtual {v1}, Landroid/view/DisplayCutout;->getSafeInsetLeft()I

    move-result v0

    goto :goto_68

    .line 9
    :cond_32
    invoke-static {p0}, Lc/b/a/l;->f(Landroid/content/Context;)Z

    move-result v1

    if-eqz v1, :cond_3d

    .line 10
    invoke-static {p0}, Lc/b/a/l;->b(Landroid/content/Context;)I

    move-result v1

    goto :goto_3e

    :cond_3d
    const/4 v1, 0x0

    .line 11
    :goto_3e
    invoke-static {p0}, Lc/b/a/l;->c(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_4a

    .line 12
    invoke-static {p0}, Lc/b/a/l;->a(Landroid/content/Context;)[I

    move-result-object v1

    aget v1, v1, v3

    .line 13
    :cond_4a
    invoke-static {p0}, Lc/b/a/l;->e(Landroid/content/Context;)Z

    move-result v2

    if-eqz v2, :cond_59

    const/16 v1, 0x20

    .line 14
    invoke-static {p0, v1}, Lc/b/a/l;->a(Landroid/content/Context;I)I

    move-result v1

    if-ge v1, v0, :cond_59

    move v1, v0

    .line 15
    :cond_59
    invoke-static {p0}, Lc/b/a/l;->d(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_67

    const/16 p0, 0x50

    if-ge p0, v0, :cond_64

    goto :goto_68

    :cond_64
    const/16 v0, 0x50

    goto :goto_68

    :cond_67
    move v0, v1

    :goto_68
    return v0
.end method

.method public static b(Landroid/content/Context;)I
    .registers 5

    .line 16
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const-string v1, "notch_height"

    const-string v2, "dimen"

    const-string v3, "android"

    invoke-virtual {v0, v1, v2, v3}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    move-result v0

    if-lez v0, :cond_19

    .line 17
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p0

    return p0

    :cond_19
    const/4 p0, 0x0

    return p0
.end method

.method public static c(Landroid/app/Activity;)Z
    .registers 1

    .line 1
    invoke-static {p0}, Lc/b/a/l;->a(Landroid/app/Activity;)Landroid/view/DisplayCutout;

    move-result-object p0

    if-eqz p0, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    return p0
.end method

.method public static c(Landroid/content/Context;)Z
    .registers 4

    const/4 v0, 0x0

    .line 2
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    const-string v1, "com.huawei.android.util.HwNotchSizeUtil"

    .line 3
    invoke-virtual {p0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v1, "hasNotchInScreen"

    new-array v2, v0, [Ljava/lang/Class;

    .line 4
    invoke-virtual {p0, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v0, [Ljava/lang/Object;

    .line 5
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0
    :try_end_1f
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_1f} :catch_1f
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_1f} :catch_1f
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1f} :catch_1f

    :catch_1f
    return v0
.end method

.method public static d(Landroid/app/Activity;)Z
    .registers 2

    if-eqz p0, :cond_22

    .line 1
    invoke-static {p0}, Lc/b/a/l;->f(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 2
    invoke-static {p0}, Lc/b/a/l;->c(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 3
    invoke-static {p0}, Lc/b/a/l;->d(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 4
    invoke-static {p0}, Lc/b/a/l;->e(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_20

    .line 5
    invoke-static {p0}, Lc/b/a/l;->c(Landroid/app/Activity;)Z

    move-result p0

    if-eqz p0, :cond_22

    :cond_20
    const/4 p0, 0x1

    goto :goto_23

    :cond_22
    const/4 p0, 0x0

    :goto_23
    return p0
.end method

.method public static d(Landroid/content/Context;)Z
    .registers 2

    .line 6
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const-string v0, "com.oppo.feature.screen.heteromorphism"

    invoke-virtual {p0, v0}, Landroid/content/pm/PackageManager;->hasSystemFeature(Ljava/lang/String;)Z

    move-result p0
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_a} :catch_b

    return p0

    :catch_b
    const/4 p0, 0x0

    return p0
.end method

.method public static e(Landroid/content/Context;)Z
    .registers 6

    const/4 v0, 0x0

    .line 1
    :try_start_1
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    const-string v1, "android.util.FtFeature"

    .line 2
    invoke-virtual {p0, v1}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v1, "isFeatureSupport"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    .line 3
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v4, v3, v0

    invoke-virtual {p0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v2, v2, [Ljava/lang/Object;

    const/16 v3, 0x20

    .line 4
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v2, v0

    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0
    :try_end_2c
    .catch Ljava/lang/ClassNotFoundException; {:try_start_1 .. :try_end_2c} :catch_2c
    .catch Ljava/lang/NoSuchMethodException; {:try_start_1 .. :try_end_2c} :catch_2c
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_2c} :catch_2c

    :catch_2c
    return v0
.end method

.method public static f(Landroid/content/Context;)Z
    .registers 7

    .line 1
    sget-object v0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    const-string v1, "Xiaomi"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_3e

    .line 2
    :try_start_c
    invoke-virtual {p0}, Landroid/content/Context;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object p0

    const-string v0, "android.os.SystemProperties"

    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/ClassLoader;->loadClass(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p0

    const-string v0, "getInt"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    .line 4
    const-class v5, Ljava/lang/String;

    aput-object v5, v4, v2

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {p0, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v3, v3, [Ljava/lang/Object;

    const-string v4, "ro.miui.notch"

    aput-object v4, v3, v2

    .line 5
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    aput-object v4, v3, v1

    invoke-virtual {v0, p0, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_3d
    .catch Ljava/lang/NoSuchMethodException; {:try_start_c .. :try_end_3d} :catch_3e
    .catch Ljava/lang/IllegalAccessException; {:try_start_c .. :try_end_3d} :catch_3e
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_c .. :try_end_3d} :catch_3e
    .catch Ljava/lang/ClassNotFoundException; {:try_start_c .. :try_end_3d} :catch_3e

    goto :goto_3f

    :catch_3e
    :cond_3e
    const/4 p0, 0x0

    :goto_3f
    if-ne p0, v1, :cond_42

    goto :goto_43

    :cond_42
    const/4 v1, 0x0

    :goto_43
    return v1
.end method
