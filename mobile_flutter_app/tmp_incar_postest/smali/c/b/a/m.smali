.class public Lc/b/a/m;
.super Ljava/lang/Object;
.source "OSUtils.java"


# direct methods
.method public static a()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/m;->e()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_e

    const-string v0, "ro.build.version.emui"

    invoke-static {v0, v1}, Lc/b/a/m;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_e
    return-object v1
.end method

.method public static a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 9

    .line 2
    const-class v0, Ljava/lang/String;

    :try_start_2
    const-string v1, "android.os.SystemProperties"

    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "get"

    const/4 v3, 0x2

    new-array v4, v3, [Ljava/lang/Class;

    const/4 v5, 0x0

    aput-object v0, v4, v5

    const/4 v6, 0x1

    aput-object v0, v4, v6

    .line 3
    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v2, v3, [Ljava/lang/Object;

    aput-object p0, v2, v5

    aput-object p1, v2, v6

    .line 4
    invoke-virtual {v0, v1, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_23} :catch_24

    return-object p0

    :catch_24
    move-exception p0

    .line 5
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    return-object p1
.end method

.method public static b()Ljava/lang/String;
    .registers 2

    const-string v0, "ro.build.display.id"

    const-string v1, ""

    .line 1
    invoke-static {v0, v1}, Lc/b/a/m;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static c()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/m;->i()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_e

    const-string v0, "ro.build.display.id"

    invoke-static {v0, v1}, Lc/b/a/m;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_e
    return-object v1
.end method

.method public static d()Ljava/lang/String;
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/m;->k()Z

    move-result v0

    const-string v1, ""

    if-eqz v0, :cond_e

    const-string v0, "ro.miui.ui.version.name"

    invoke-static {v0, v1}, Lc/b/a/m;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :cond_e
    return-object v1
.end method

.method public static e()Z
    .registers 2

    const-string v0, "ro.build.version.emui"

    const-string v1, ""

    .line 1
    invoke-static {v0, v1}, Lc/b/a/m;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static f()Z
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/m;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "EmotionUI_3.0"

    .line 2
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_e

    const/4 v0, 0x1

    return v0

    :cond_e
    const/4 v0, 0x0

    return v0
.end method

.method public static g()Z
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/m;->a()Ljava/lang/String;

    move-result-object v0

    const-string v1, "EmotionUI 3"

    .line 2
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_17

    const-string v1, "EmotionUI_3.1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_17

    :cond_15
    const/4 v0, 0x0

    return v0

    :cond_17
    :goto_17
    const/4 v0, 0x1

    return v0
.end method

.method public static h()Z
    .registers 1

    .line 1
    invoke-static {}, Lc/b/a/m;->f()Z

    move-result v0

    if-nez v0, :cond_f

    invoke-static {}, Lc/b/a/m;->g()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_f

    :cond_d
    const/4 v0, 0x0

    goto :goto_10

    :cond_f
    :goto_f
    const/4 v0, 0x1

    :goto_10
    return v0
.end method

.method public static i()Z
    .registers 2

    .line 1
    invoke-static {}, Lc/b/a/m;->b()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v0

    const-string v1, "flyme"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    return v0
.end method

.method public static j()Z
    .registers 4

    .line 1
    invoke-static {}, Lc/b/a/m;->c()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_3a

    .line 3
    :try_start_b
    invoke-virtual {v0}, Ljava/lang/String;->toLowerCase()Ljava/lang/String;

    move-result-object v1

    const-string v3, "os"

    invoke-virtual {v1, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_28

    const/16 v1, 0x9

    const/16 v3, 0xa

    .line 4
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    goto :goto_36

    :cond_28
    const/4 v1, 0x6

    const/4 v3, 0x7

    .line 5
    invoke-virtual {v0, v1, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_36
    .catch Ljava/lang/NumberFormatException; {:try_start_b .. :try_end_36} :catch_3a

    :goto_36
    const/4 v1, 0x4

    if-lt v0, v1, :cond_3a

    const/4 v2, 0x1

    :catch_3a
    :cond_3a
    return v2
.end method

.method public static k()Z
    .registers 2

    const-string v0, "ro.miui.ui.version.name"

    const-string v1, ""

    .line 1
    invoke-static {v0, v1}, Lc/b/a/m;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    xor-int/lit8 v0, v0, 0x1

    return v0
.end method

.method public static l()Z
    .registers 4

    .line 1
    invoke-static {}, Lc/b/a/m;->d()Ljava/lang/String;

    move-result-object v0

    .line 2
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_1c

    const/4 v1, 0x1

    .line 3
    :try_start_c
    invoke-virtual {v0, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0
    :try_end_18
    .catch Ljava/lang/NumberFormatException; {:try_start_c .. :try_end_18} :catch_1c

    const/4 v3, 0x6

    if-lt v0, v3, :cond_1c

    const/4 v2, 0x1

    :catch_1c
    :cond_1c
    return v2
.end method
