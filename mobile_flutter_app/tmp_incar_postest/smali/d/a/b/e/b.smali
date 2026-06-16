.class public Ld/a/b/e/b;
.super Ljava/lang/Object;
.source "LibsConfig.java"


# direct methods
.method public static a()V
    .registers 1

    .line 1
    new-instance v0, Lf/a/a$b;

    invoke-direct {v0}, Lf/a/a$b;-><init>()V

    invoke-static {v0}, Lf/a/a;->a(Lf/a/a$c;)V

    .line 2
    invoke-static {}, Ld/a/b/e/b;->b()V

    .line 3
    invoke-static {}, Ld/a/b/e/b;->c()V

    return-void
.end method

.method public static b()V
    .registers 3

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-static {v0}, Lc/c/d/i;->a(Landroid/app/Application;)V

    .line 2
    new-instance v0, Lc/c/d/l/c;

    invoke-direct {v0}, Lc/c/d/l/c;-><init>()V

    invoke-static {v0}, Lc/c/d/i;->a(Lc/c/d/k/f;)V

    .line 3
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Application;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    const/4 v1, 0x1

    const/high16 v2, 0x42480000    # 50.0f

    invoke-static {v1, v2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result v0

    float-to-int v0, v0

    const/16 v1, 0x50

    const/4 v2, 0x0

    invoke-static {v1, v2, v0}, Lc/c/d/i;->a(III)V

    return-void
.end method

.method public static c()V
    .registers 6

    const-string v0, "A13"

    .line 1
    invoke-static {v0}, Ld/a/b/g/e;->a(Ljava/lang/String;)Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_c

    move-object v0, v1

    goto :goto_e

    :cond_c
    const-string v0, "-A13"

    .line 2
    :goto_e
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v3

    invoke-static {v3}, Ld/a/b/g/g;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/16 v2, 0x9e

    .line 3
    new-instance v3, Ljava/util/HashMap;

    invoke-direct {v3}, Ljava/util/HashMap;-><init>()V

    .line 4
    invoke-static {}, Ld/a/b/g/k;->n()Ljava/lang/String;

    move-result-object v4

    const-string v5, "sn"

    invoke-virtual {v3, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v4, "name"

    .line 5
    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "com.incar.postest"

    const-string v4, "pkgName"

    .line 6
    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const-string v0, "1.5.8"

    const-string v4, "versionName"

    .line 7
    invoke-virtual {v3, v4, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "versionCode"

    invoke-virtual {v3, v1, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Object;

    const/4 v2, 0x0

    .line 9
    invoke-virtual {v3}, Ljava/util/HashMap;->toString()Ljava/lang/String;

    move-result-object v4

    aput-object v4, v1, v2

    const-string v2, "CheckUpdate params: %s"

    invoke-static {v2, v1}, Lf/a/a;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 10
    new-instance v1, Ld/a/b/g/l/f/a;

    invoke-direct {v1}, Ld/a/b/g/l/f/a;-><init>()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "https://mdm.sznyx.net/api"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v4, Ld/a/b/e/a;->a:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 11
    invoke-virtual {v1, v2}, Ld/a/b/g/l/f/a;->b(Ljava/lang/String;)Ld/a/b/g/l/f/a;

    const-string v2, "POST"

    .line 12
    invoke-virtual {v1, v2}, Ld/a/b/g/l/f/a;->a(Ljava/lang/String;)Ld/a/b/g/l/f/a;

    .line 13
    invoke-virtual {v1, v0}, Ld/a/b/g/l/f/a;->a(Z)Ld/a/b/g/l/f/a;

    .line 14
    invoke-virtual {v1, v3}, Ld/a/b/g/l/f/a;->a(Ljava/util/Map;)Ld/a/b/g/l/f/a;

    .line 15
    invoke-static {}, Ld/a/b/g/l/b;->p()Ld/a/b/g/l/b;

    move-result-object v0

    .line 16
    invoke-virtual {v0, v1}, Ld/a/b/g/l/b;->a(Ld/a/b/g/l/f/a;)Ld/a/b/g/l/b;

    new-instance v1, Ld/a/b/e/b$c;

    invoke-direct {v1}, Ld/a/b/e/b$c;-><init>()V

    .line 17
    invoke-virtual {v0, v1}, Ld/a/b/g/l/b;->a(Ld/a/b/g/l/c/m;)Ld/a/b/g/l/b;

    new-instance v1, Ld/a/b/e/b$b;

    invoke-direct {v1}, Ld/a/b/e/b$b;-><init>()V

    .line 18
    invoke-virtual {v0, v1}, Ld/a/b/g/l/b;->a(Ld/a/b/g/l/c/i;)Ld/a/b/g/l/b;

    new-instance v1, Ld/a/b/e/b$a;

    invoke-direct {v1}, Ld/a/b/e/b$a;-><init>()V

    .line 19
    invoke-virtual {v0, v1}, Ld/a/b/g/l/b;->a(Ld/a/b/g/l/c/j;)Ld/a/b/g/l/b;

    return-void
.end method

.method public static d()Z
    .registers 5

    .line 1
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v0

    const-string v1, "activity"

    invoke-virtual {v0, v1}, Landroid/app/Application;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    .line 2
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_14

    return v1

    .line 3
    :cond_14
    invoke-static {}, Ld/a/b/a;->b()Landroid/app/Application;

    move-result-object v2

    invoke-virtual {v2}, Landroid/app/Application;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v2

    iget-object v2, v2, Landroid/content/pm/ApplicationInfo;->packageName:Ljava/lang/String;

    .line 4
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_22
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 5
    iget-object v4, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_22

    iget v3, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->importance:I

    const/16 v4, 0x64

    if-ne v3, v4, :cond_22

    const/4 v0, 0x1

    return v0

    :cond_3e
    return v1
.end method
