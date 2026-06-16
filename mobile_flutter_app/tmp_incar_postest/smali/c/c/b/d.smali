.class public final Lc/c/b/d;
.super Ljava/lang/Object;
.source "PermissionSettingPage.java"


# direct methods
.method public static a(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    .line 1
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.APPLICATION_DETAILS_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 2
    invoke-static {p0}, Lc/c/b/d;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    return-object v0
.end method

.method public static a(Landroid/content/Context;Landroid/content/Intent;)Z
    .registers 3

    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageManager()Landroid/content/pm/PackageManager;

    move-result-object p0

    const/high16 v0, 0x10000

    invoke-virtual {p0, p1, v0}, Landroid/content/pm/PackageManager;->queryIntentActivities(Landroid/content/Intent;I)Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public static b(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    .line 1
    invoke-static {}, Lc/c/b/e;->f()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_UNKNOWN_APP_SOURCES"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-static {p0}, Lc/c/b/d;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    if-eqz v0, :cond_1e

    .line 4
    invoke-static {p0, v0}, Lc/c/b/d;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_22

    .line 5
    :cond_1e
    invoke-static {p0}, Lc/c/b/d;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    :cond_22
    return-object v0
.end method

.method public static c(Landroid/content/Context;)Landroid/content/Intent;
    .registers 4

    .line 1
    invoke-static {}, Lc/c/b/e;->f()Z

    move-result v0

    if-eqz v0, :cond_17

    .line 2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.APP_NOTIFICATION_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "android.provider.extra.APP_PACKAGE"

    invoke-virtual {v0, v2, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    if-eqz v0, :cond_20

    .line 4
    invoke-static {p0, v0}, Lc/c/b/d;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_24

    .line 5
    :cond_20
    invoke-static {p0}, Lc/c/b/d;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    :cond_24
    return-object v0
.end method

.method public static d(Landroid/content/Context;)Landroid/net/Uri;
    .registers 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "package:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method public static e(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    .line 1
    invoke-static {}, Lc/c/b/e;->d()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.action.MANAGE_WRITE_SETTINGS"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-static {p0}, Lc/c/b/d;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    if-eqz v0, :cond_1e

    .line 4
    invoke-static {p0, v0}, Lc/c/b/d;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_22

    .line 5
    :cond_1e
    invoke-static {p0}, Lc/c/b/d;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    :cond_22
    return-object v0
.end method

.method public static f(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    .line 1
    invoke-static {}, Lc/c/b/e;->c()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.MANAGE_APP_ALL_FILES_ACCESS_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-static {p0}, Lc/c/b/d;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    if-eqz v0, :cond_1e

    .line 4
    invoke-static {p0, v0}, Lc/c/b/d;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_22

    .line 5
    :cond_1e
    invoke-static {p0}, Lc/c/b/d;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    :cond_22
    return-object v0
.end method

.method public static g(Landroid/content/Context;)Landroid/content/Intent;
    .registers 3

    .line 1
    invoke-static {}, Lc/c/b/e;->d()Z

    move-result v0

    if-eqz v0, :cond_15

    .line 2
    new-instance v0, Landroid/content/Intent;

    const-string v1, "android.settings.action.MANAGE_OVERLAY_PERMISSION"

    invoke-direct {v0, v1}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 3
    invoke-static {p0}, Lc/c/b/d;->d(Landroid/content/Context;)Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    goto :goto_16

    :cond_15
    const/4 v0, 0x0

    :goto_16
    if-eqz v0, :cond_1e

    .line 4
    invoke-static {p0, v0}, Lc/c/b/d;->a(Landroid/content/Context;Landroid/content/Intent;)Z

    move-result v1

    if-nez v1, :cond_22

    .line 5
    :cond_1e
    invoke-static {p0}, Lc/c/b/d;->a(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v0

    :cond_22
    return-object v0
.end method
