.class public Lc/b/a/s;
.super Ljava/lang/Object;
.source "SpecialBarFontUtils.java"


# static fields
.field public static a:Ljava/lang/reflect/Method;

.field public static b:Ljava/lang/reflect/Method;

.field public static c:Ljava/lang/reflect/Field;

.field public static d:I


# direct methods
.method public static constructor <clinit>()V
    .registers 6

    const-string v0, "setStatusBarDarkIcon"

    const/4 v1, 0x0

    const/4 v2, 0x1

    .line 1
    :try_start_4
    const-class v3, Landroid/app/Activity;

    new-array v4, v2, [Ljava/lang/Class;

    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v5, v4, v1

    invoke-virtual {v3, v0, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v3

    sput-object v3, Lc/b/a/s;->a:Ljava/lang/reflect/Method;
    :try_end_12
    .catch Ljava/lang/NoSuchMethodException; {:try_start_4 .. :try_end_12} :catch_12

    .line 2
    :catch_12
    :try_start_12
    const-class v3, Landroid/app/Activity;

    new-array v2, v2, [Ljava/lang/Class;

    sget-object v4, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    aput-object v4, v2, v1

    invoke-virtual {v3, v0, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    sput-object v0, Lc/b/a/s;->b:Ljava/lang/reflect/Method;
    :try_end_20
    .catch Ljava/lang/NoSuchMethodException; {:try_start_12 .. :try_end_20} :catch_20

    .line 3
    :catch_20
    :try_start_20
    const-class v0, Landroid/view/WindowManager$LayoutParams;

    const-string v1, "statusBarColor"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    sput-object v0, Lc/b/a/s;->c:Ljava/lang/reflect/Field;
    :try_end_2a
    .catch Ljava/lang/NoSuchFieldException; {:try_start_20 .. :try_end_2a} :catch_2a

    .line 4
    :catch_2a
    :try_start_2a
    const-class v0, Landroid/view/View;

    const-string v1, "SYSTEM_UI_FLAG_LIGHT_STATUS_BAR"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    const/4 v1, 0x0

    .line 5
    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v0

    sput v0, Lc/b/a/s;->d:I
    :try_end_39
    .catch Ljava/lang/NoSuchFieldException; {:try_start_2a .. :try_end_39} :catch_39
    .catch Ljava/lang/IllegalAccessException; {:try_start_2a .. :try_end_39} :catch_39

    :catch_39
    return-void
.end method

.method public static a(I)I
    .registers 4

    and-int/lit16 v0, p0, 0xff

    const v1, 0xff00

    and-int/2addr v1, p0

    shr-int/lit8 v1, v1, 0x8

    const/high16 v2, 0xff0000

    and-int/2addr p0, v2

    shr-int/lit8 p0, p0, 0x10

    mul-int/lit8 p0, p0, 0x26

    mul-int/lit8 v1, v1, 0x4b

    add-int/2addr p0, v1

    mul-int/lit8 v0, v0, 0xf

    add-int/2addr p0, v0

    shr-int/lit8 p0, p0, 0x7

    return p0
.end method

.method public static a(Landroid/app/Activity;I)V
    .registers 5

    .line 2
    sget-object v0, Lc/b/a/s;->a:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_1c

    const/4 v1, 0x1

    :try_start_5
    new-array v1, v1, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, v1, v2

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_11} :catch_17
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_11} :catch_12

    goto :goto_34

    :catch_12
    move-exception p0

    .line 4
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_34

    :catch_17
    move-exception p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_34

    :cond_1c
    const/16 v0, 0x32

    .line 6
    invoke-static {p1, v0}, Lc/b/a/s;->a(II)Z

    move-result v0

    .line 7
    sget-object v1, Lc/b/a/s;->c:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_31

    .line 8
    invoke-static {p0, v0, v0}, Lc/b/a/s;->a(Landroid/app/Activity;ZZ)V

    .line 9
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-static {p0, p1}, Lc/b/a/s;->b(Landroid/view/Window;I)V

    goto :goto_34

    .line 10
    :cond_31
    invoke-static {p0, v0}, Lc/b/a/s;->a(Landroid/app/Activity;Z)V

    :goto_34
    return-void
.end method

.method public static a(Landroid/app/Activity;Z)V
    .registers 3

    const/4 v0, 0x1

    .line 11
    invoke-static {p0, p1, v0}, Lc/b/a/s;->a(Landroid/app/Activity;ZZ)V

    return-void
.end method

.method public static a(Landroid/app/Activity;ZZ)V
    .registers 5

    .line 38
    sget-object v0, Lc/b/a/s;->b:Ljava/lang/reflect/Method;

    if-eqz v0, :cond_1c

    const/4 p2, 0x1

    :try_start_5
    new-array p2, p2, [Ljava/lang/Object;

    const/4 v1, 0x0

    .line 39
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    aput-object p1, p2, v1

    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_11
    .catch Ljava/lang/IllegalAccessException; {:try_start_5 .. :try_end_11} :catch_17
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_5 .. :try_end_11} :catch_12

    goto :goto_25

    :catch_12
    move-exception p0

    .line 40
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->printStackTrace()V

    goto :goto_25

    :catch_17
    move-exception p0

    .line 41
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_25

    :cond_1c
    if-eqz p2, :cond_25

    .line 42
    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-static {p0, p1}, Lc/b/a/s;->a(Landroid/view/Window;Z)V

    :cond_25
    :goto_25
    return-void
.end method

.method public static a(Landroid/view/View;Z)V
    .registers 3

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getSystemUiVisibility()I

    move-result v0

    if-eqz p1, :cond_a

    .line 24
    sget p1, Lc/b/a/s;->d:I

    or-int/2addr p1, v0

    goto :goto_e

    .line 25
    :cond_a
    sget p1, Lc/b/a/s;->d:I

    not-int p1, p1

    and-int/2addr p1, v0

    :goto_e
    if-eq p1, v0, :cond_13

    .line 26
    invoke-virtual {p0, p1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_13
    return-void
.end method

.method public static a(Landroid/view/Window;I)V
    .registers 4

    .line 27
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    .line 28
    sget-object v1, Lc/b/a/s;->c:Ljava/lang/reflect/Field;

    if-eqz v1, :cond_1f

    .line 29
    :try_start_8
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v1

    if-eq v1, p1, :cond_1f

    .line 30
    sget-object v1, Lc/b/a/s;->c:Ljava/lang/reflect/Field;

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {v1, v0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 31
    invoke-virtual {p0, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V
    :try_end_1a
    .catch Ljava/lang/IllegalAccessException; {:try_start_8 .. :try_end_1a} :catch_1b

    goto :goto_1f

    :catch_1b
    move-exception p0

    .line 32
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    :cond_1f
    :goto_1f
    return-void
.end method

.method public static a(Landroid/view/Window;Ljava/lang/String;Z)V
    .registers 10
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "PrivateApi"
        }
    .end annotation

    if-eqz p0, :cond_4c

    .line 43
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    :try_start_6
    const-string v1, "android.view.MiuiWindowManager$LayoutParams"

    .line 44
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    .line 45
    invoke-virtual {v1, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    .line 46
    invoke-virtual {p1, v1}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    const-string v1, "setExtraFlags"

    const/4 v2, 0x2

    new-array v3, v2, [Ljava/lang/Class;

    .line 47
    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    sget-object v4, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v6, 0x1

    aput-object v4, v3, v6

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    if-eqz p2, :cond_3b

    new-array p2, v2, [Ljava/lang/Object;

    .line 48
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p2, v5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p2, v6

    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4c

    :cond_3b
    new-array p2, v2, [Ljava/lang/Object;

    .line 49
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    aput-object v1, p2, v5

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    aput-object p1, p2, v6

    invoke-virtual {v0, p0, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_4c} :catch_4c

    :catch_4c
    :cond_4c
    :goto_4c
    return-void
.end method

.method public static a(Landroid/view/Window;Z)V
    .registers 4

    .line 33
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-ge v0, v1, :cond_10

    .line 34
    invoke-virtual {p0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object p0

    const-string v0, "MEIZU_FLAG_DARK_STATUS_BAR_ICON"

    invoke-static {p0, v0, p1}, Lc/b/a/s;->a(Landroid/view/WindowManager$LayoutParams;Ljava/lang/String;Z)Z

    goto :goto_1b

    .line 35
    :cond_10
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    .line 36
    invoke-static {v0, p1}, Lc/b/a/s;->a(Landroid/view/View;Z)V

    const/4 p1, 0x0

    .line 37
    invoke-static {p0, p1}, Lc/b/a/s;->a(Landroid/view/Window;I)V

    :goto_1b
    return-void
.end method

.method public static a(II)Z
    .registers 2

    .line 1
    invoke-static {p0}, Lc/b/a/s;->a(I)I

    move-result p0

    if-ge p0, p1, :cond_8

    const/4 p0, 0x1

    goto :goto_9

    :cond_8
    const/4 p0, 0x0

    :goto_9
    return p0
.end method

.method public static a(Landroid/view/WindowManager$LayoutParams;Ljava/lang/String;Z)Z
    .registers 6

    .line 12
    :try_start_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    const/4 v0, 0x1

    .line 13
    invoke-virtual {p1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 14
    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result p1

    .line 15
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    const-string v2, "meizuFlags"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    .line 16
    invoke-virtual {v1, v0}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 17
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    move-result v2

    if-eqz p2, :cond_25

    or-int/2addr p1, v2

    goto :goto_27

    :cond_25
    not-int p1, p1

    and-int/2addr p1, v2

    :goto_27
    if-eq v2, p1, :cond_40

    .line 18
    invoke-virtual {v1, p0, p1}, Ljava/lang/reflect/Field;->setInt(Ljava/lang/Object;I)V
    :try_end_2c
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_2c} :catch_3c
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_2c} :catch_37
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_2c} :catch_32
    .catchall {:try_start_0 .. :try_end_2c} :catchall_2d

    return v0

    :catchall_2d
    move-exception p0

    .line 19
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    goto :goto_40

    :catch_32
    move-exception p0

    .line 20
    invoke-virtual {p0}, Ljava/lang/IllegalArgumentException;->printStackTrace()V

    goto :goto_40

    :catch_37
    move-exception p0

    .line 21
    invoke-virtual {p0}, Ljava/lang/IllegalAccessException;->printStackTrace()V

    goto :goto_40

    :catch_3c
    move-exception p0

    .line 22
    invoke-virtual {p0}, Ljava/lang/NoSuchFieldException;->printStackTrace()V

    :cond_40
    :goto_40
    const/4 p0, 0x0

    return p0
.end method

.method public static b(Landroid/view/Window;I)V
    .registers 3

    .line 1
    :try_start_0
    invoke-static {p0, p1}, Lc/b/a/s;->a(Landroid/view/Window;I)V

    .line 2
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x16

    if-le p1, v0, :cond_16

    .line 3
    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const/4 p1, 0x1

    invoke-static {p0, p1}, Lc/b/a/s;->a(Landroid/view/View;Z)V
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_11} :catch_12

    goto :goto_16

    :catch_12
    move-exception p0

    .line 4
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_16
    :goto_16
    return-void
.end method
