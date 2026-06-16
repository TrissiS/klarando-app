.class public final Lc/c/b/e;
.super Ljava/lang/Object;
.source "PermissionUtils.java"


# direct methods
.method public static a()I
    .registers 5

    .line 50
    new-instance v0, Ljava/util/Random;

    invoke-direct {v0}, Ljava/util/Random;-><init>()V

    const-wide/high16 v1, 0x4000000000000000L    # 2.0

    const-wide/high16 v3, 0x4020000000000000L    # 8.0

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v1

    double-to-int v1, v1

    invoke-virtual {v0, v1}, Ljava/util/Random;->nextInt(I)I

    move-result v0

    return v0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)I
    .registers 2

    .line 15
    invoke-static {p0, p1}, Lc/c/b/e;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_8

    const/4 p0, 0x0

    goto :goto_9

    :cond_8
    const/4 p0, -0x1

    :goto_9
    return p0
.end method

.method public static varargs a([Ljava/lang/Object;)Ljava/util/ArrayList;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    if-eqz p0, :cond_19

    .line 46
    array-length v0, p0

    if-nez v0, :cond_6

    goto :goto_19

    .line 47
    :cond_6
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p0

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 48
    array-length v1, p0

    const/4 v2, 0x0

    :goto_e
    if-ge v2, v1, :cond_18

    aget-object v3, p0, v2

    .line 49
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_e

    :cond_18
    return-object v0

    :cond_19
    :goto_19
    const/4 p0, 0x0

    return-object p0
.end method

.method public static a([Ljava/lang/String;[I)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 43
    :goto_6
    array-length v2, p1

    if-ge v1, v2, :cond_16

    .line 44
    aget v2, p1, v1

    const/4 v3, -0x1

    if-ne v2, v3, :cond_13

    .line 45
    aget-object v2, p0, v1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_13
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_16
    return-object v0
.end method

.method public static a(Landroid/app/Activity;Ljava/lang/String;)Z
    .registers 7

    .line 18
    invoke-static {}, Lc/c/b/e;->d()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_8

    return v1

    .line 19
    :cond_8
    invoke-static {p1}, Lc/c/b/e;->a(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_f

    return v1

    .line 20
    :cond_f
    invoke-static {}, Lc/c/b/e;->b()Z

    move-result v0

    const-string v2, "android.permission.ACCESS_BACKGROUND_LOCATION"

    const-string v3, "android.permission.ACCESS_FINE_LOCATION"

    const/4 v4, 0x1

    if-eqz v0, :cond_32

    .line 21
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_32

    .line 22
    invoke-static {p0, v2}, Lc/c/b/e;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_32

    .line 23
    invoke-static {p0, v3}, Lc/c/b/e;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_32

    .line 24
    invoke-virtual {p0, v3}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result p0

    xor-int/2addr p0, v4

    return p0

    .line 25
    :cond_32
    invoke-static {}, Lc/c/b/e;->b()Z

    move-result v0

    if-nez v0, :cond_6d

    .line 26
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4c

    .line 27
    invoke-static {p0, v3}, Lc/c/b/e;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_4b

    .line 28
    invoke-virtual {p0, v3}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_4b

    const/4 v1, 0x1

    :cond_4b
    return v1

    :cond_4c
    const-string v0, "android.permission.ACTIVITY_RECOGNITION"

    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_64

    const-string p1, "android.permission.BODY_SENSORS"

    .line 30
    invoke-static {p0, p1}, Lc/c/b/e;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_63

    .line 31
    invoke-virtual {p0, p1}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_63

    const/4 v1, 0x1

    :cond_63
    return v1

    :cond_64
    const-string v0, "android.permission.ACCESS_MEDIA_LOCATION"

    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6d

    return v1

    .line 33
    :cond_6d
    invoke-static {}, Lc/c/b/e;->g()Z

    move-result v0

    if-nez v0, :cond_7c

    const-string v0, "android.permission.ACCEPT_HANDOVER"

    .line 34
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7c

    return v1

    .line 35
    :cond_7c
    invoke-static {}, Lc/c/b/e;->f()Z

    move-result v0

    if-nez v0, :cond_a3

    const-string v0, "android.permission.ANSWER_PHONE_CALLS"

    .line 36
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8b

    return v4

    :cond_8b
    const-string v0, "android.permission.READ_PHONE_NUMBERS"

    .line 37
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_a3

    const-string p1, "android.permission.READ_PHONE_STATE"

    .line 38
    invoke-static {p0, p1}, Lc/c/b/e;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_a2

    .line 39
    invoke-virtual {p0, p1}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_a2

    const/4 v1, 0x1

    :cond_a2
    return v1

    .line 40
    :cond_a3
    invoke-static {p0, p1}, Lc/c/b/e;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_b0

    .line 41
    invoke-virtual {p0, p1}, Landroid/app/Activity;->shouldShowRequestPermissionRationale(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_b0

    const/4 v1, 0x1

    :cond_b0
    return v1
.end method

.method public static a(Landroid/app/Activity;Ljava/util/List;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 16
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 17
    invoke-static {p0, v0}, Lc/c/b/e;->a(Landroid/app/Activity;Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public static a(Landroid/content/Context;)Z
    .registers 2

    .line 1
    invoke-static {}, Lc/c/b/e;->f()Z

    move-result v0

    if-eqz v0, :cond_f

    .line 2
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/pm/PackageManager;->canRequestPackageInstalls()Z

    move-result p0

    return p0

    :cond_f
    const/4 p0, 0x1

    return p0
.end method

.method public static a(Landroid/content/Context;Ljava/util/List;)Z
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    .line 11
    invoke-static {}, Lc/c/b/e;->d()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_8

    return v1

    :cond_8
    const/4 v0, 0x0

    if-eqz p1, :cond_2a

    .line 12
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_12

    goto :goto_2a

    .line 13
    :cond_12
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_16
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_29

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 14
    invoke-static {p0, v2}, Lc/c/b/e;->b(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_16

    return v0

    :cond_29
    return v1

    :cond_2a
    :goto_2a
    return v0
.end method

.method public static a(Ljava/lang/String;)Z
    .registers 2

    const-string v0, "android.permission.MANAGE_EXTERNAL_STORAGE"

    .line 6
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b

    const-string v0, "android.permission.REQUEST_INSTALL_PACKAGES"

    .line 7
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b

    const-string v0, "android.permission.SYSTEM_ALERT_WINDOW"

    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b

    const-string v0, "android.permission.NOTIFICATION_SERVICE"

    .line 9
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2b

    const-string v0, "android.permission.WRITE_SETTINGS"

    .line 10
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_29

    goto :goto_2b

    :cond_29
    const/4 p0, 0x0

    goto :goto_2c

    :cond_2b
    :goto_2b
    const/4 p0, 0x1

    :goto_2c
    return p0
.end method

.method public static a(Ljava/util/List;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)Z"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p0, :cond_22

    .line 3
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_a

    goto :goto_22

    .line 4
    :cond_a
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_e
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_22

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 5
    invoke-static {v1}, Lc/c/b/e;->a(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_22
    :goto_22
    return v0
.end method

.method public static b([Ljava/lang/String;[I)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/String;",
            "[I)",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 35
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    .line 36
    :goto_6
    array-length v2, p1

    if-ge v1, v2, :cond_15

    .line 37
    aget v2, p1, v1

    if-nez v2, :cond_12

    .line 38
    aget-object v2, p0, v1

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_12
    add-int/lit8 v1, v1, 0x1

    goto :goto_6

    :cond_15
    return-object v0
.end method

.method public static b()Z
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public static b(Landroid/content/Context;)Z
    .registers 10

    .line 2
    invoke-static {}, Lc/c/b/e;->e()Z

    move-result v0

    if-eqz v0, :cond_13

    .line 3
    const-class v0, Landroid/app/NotificationManager;

    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    invoke-virtual {p0}, Landroid/app/NotificationManager;->areNotificationsEnabled()Z

    move-result p0

    return p0

    .line 4
    :cond_13
    invoke-static {}, Lc/c/b/e;->d()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_88

    const-string v0, "appops"

    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/AppOpsManager;

    .line 6
    :try_start_22
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    const-string v3, "checkOpNoThrow"

    const/4 v4, 0x3

    new-array v5, v4, [Ljava/lang/Class;

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    const/4 v7, 0x0

    aput-object v6, v5, v7

    sget-object v6, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    aput-object v6, v5, v1

    const-class v6, Ljava/lang/String;

    const/4 v8, 0x2

    aput-object v6, v5, v8

    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    const-string v5, "OP_POST_NOTIFICATION"

    invoke-virtual {v3, v5}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v3

    .line 8
    const-class v5, Ljava/lang/Integer;

    invoke-virtual {v3, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    new-array v4, v4, [Ljava/lang/Object;

    .line 9
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v7

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v3

    iget v3, v3, Landroid/content/pm/ApplicationInfo;->uid:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    aput-object v3, v4, v1

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    aput-object p0, v4, v8

    invoke-virtual {v2, v0, v4}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Integer;

    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    move-result p0
    :try_end_77
    .catch Ljava/lang/NoSuchMethodException; {:try_start_22 .. :try_end_77} :catch_84
    .catch Ljava/lang/NoSuchFieldException; {:try_start_22 .. :try_end_77} :catch_82
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_22 .. :try_end_77} :catch_80
    .catch Ljava/lang/IllegalAccessException; {:try_start_22 .. :try_end_77} :catch_7e
    .catch Ljava/lang/RuntimeException; {:try_start_22 .. :try_end_77} :catch_7c

    if-nez p0, :cond_7a

    goto :goto_7b

    :cond_7a
    const/4 v1, 0x0

    :goto_7b
    return v1

    :catch_7c
    move-exception p0

    goto :goto_85

    :catch_7e
    move-exception p0

    goto :goto_85

    :catch_80
    move-exception p0

    goto :goto_85

    :catch_82
    move-exception p0

    goto :goto_85

    :catch_84
    move-exception p0

    .line 10
    :goto_85
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_88
    return v1
.end method

.method public static b(Landroid/content/Context;Ljava/lang/String;)Z
    .registers 5

    .line 11
    invoke-static {}, Lc/c/b/e;->d()Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_8

    return v1

    :cond_8
    const-string v0, "android.permission.MANAGE_EXTERNAL_STORAGE"

    .line 12
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_15

    .line 13
    invoke-static {p0}, Lc/c/b/e;->d(Landroid/content/Context;)Z

    move-result p0

    return p0

    :cond_15
    const-string v0, "android.permission.REQUEST_INSTALL_PACKAGES"

    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_22

    .line 15
    invoke-static {p0}, Lc/c/b/e;->a(Landroid/content/Context;)Z

    move-result p0

    return p0

    :cond_22
    const-string v0, "android.permission.SYSTEM_ALERT_WINDOW"

    .line 16
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2f

    .line 17
    invoke-static {p0}, Lc/c/b/e;->e(Landroid/content/Context;)Z

    move-result p0

    return p0

    :cond_2f
    const-string v0, "android.permission.NOTIFICATION_SERVICE"

    .line 18
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3c

    .line 19
    invoke-static {p0}, Lc/c/b/e;->b(Landroid/content/Context;)Z

    move-result p0

    return p0

    :cond_3c
    const-string v0, "android.permission.WRITE_SETTINGS"

    .line 20
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_49

    .line 21
    invoke-static {p0}, Lc/c/b/e;->c(Landroid/content/Context;)Z

    move-result p0

    return p0

    .line 22
    :cond_49
    invoke-static {}, Lc/c/b/e;->b()Z

    move-result v0

    const/4 v2, 0x0

    if-nez v0, :cond_7f

    const-string v0, "android.permission.ACCESS_BACKGROUND_LOCATION"

    .line 23
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_63

    const-string p1, "android.permission.ACCESS_FINE_LOCATION"

    .line 24
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_61

    goto :goto_62

    :cond_61
    const/4 v1, 0x0

    :goto_62
    return v1

    :cond_63
    const-string v0, "android.permission.ACTIVITY_RECOGNITION"

    .line 25
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_76

    const-string p1, "android.permission.BODY_SENSORS"

    .line 26
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_74

    goto :goto_75

    :cond_74
    const/4 v1, 0x0

    :goto_75
    return v1

    :cond_76
    const-string v0, "android.permission.ACCESS_MEDIA_LOCATION"

    .line 27
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7f

    return v1

    .line 28
    :cond_7f
    invoke-static {}, Lc/c/b/e;->g()Z

    move-result v0

    if-nez v0, :cond_8e

    const-string v0, "android.permission.ACCEPT_HANDOVER"

    .line 29
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_8e

    return v1

    .line 30
    :cond_8e
    invoke-static {}, Lc/c/b/e;->f()Z

    move-result v0

    if-nez v0, :cond_b0

    const-string v0, "android.permission.ANSWER_PHONE_CALLS"

    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9d

    return v1

    :cond_9d
    const-string v0, "android.permission.READ_PHONE_NUMBERS"

    .line 32
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b0

    const-string p1, "android.permission.READ_PHONE_STATE"

    .line 33
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_ae

    goto :goto_af

    :cond_ae
    const/4 v1, 0x0

    :goto_af
    return v1

    .line 34
    :cond_b0
    invoke-virtual {p0, p1}, Landroid/content/Context;->checkSelfPermission(Ljava/lang/String;)I

    move-result p0

    if-nez p0, :cond_b7

    goto :goto_b8

    :cond_b7
    const/4 v1, 0x0

    :goto_b8
    return v1
.end method

.method public static c()Z
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public static c(Landroid/content/Context;)Z
    .registers 2

    .line 2
    invoke-static {}, Lc/c/b/e;->d()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 3
    invoke-static {p0}, Landroid/provider/Settings$System;->canWrite(Landroid/content/Context;)Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x1

    return p0
.end method

.method public static d()Z
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x17

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public static d(Landroid/content/Context;)Z
    .registers 2

    .line 2
    invoke-static {}, Lc/c/b/e;->c()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 3
    invoke-static {}, Landroid/os/Environment;->isExternalStorageManager()Z

    move-result p0

    return p0

    .line 4
    :cond_b
    sget-object v0, Lc/c/b/c;->a:[Ljava/lang/String;

    invoke-static {v0}, Lc/c/b/e;->a([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v0

    invoke-static {p0, v0}, Lc/c/b/e;->a(Landroid/content/Context;Ljava/util/List;)Z

    move-result p0

    return p0
.end method

.method public static e()Z
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x18

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public static e(Landroid/content/Context;)Z
    .registers 2

    .line 2
    invoke-static {}, Lc/c/b/e;->d()Z

    move-result v0

    if-eqz v0, :cond_b

    .line 3
    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result p0

    return p0

    :cond_b
    const/4 p0, 0x1

    return p0
.end method

.method public static f()Z
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1a

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method

.method public static g()Z
    .registers 2

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_8

    const/4 v0, 0x1

    goto :goto_9

    :cond_8
    const/4 v0, 0x0

    :goto_9
    return v0
.end method
