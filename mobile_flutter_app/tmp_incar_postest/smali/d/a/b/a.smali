.class public Ld/a/b/a;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field public static a:Ld/a/b/a;

.field public static b:Landroid/app/Application;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static a(Landroid/app/Application;)Ld/a/b/a;
    .registers 3

    .line 1
    invoke-static {}, Ld/a/b/a;->d()Ld/a/b/a;

    .line 2
    sget-object v0, Ld/a/b/a;->b:Landroid/app/Application;

    if-nez v0, :cond_13

    if-nez p0, :cond_10

    .line 3
    invoke-static {}, Ld/a/b/a;->c()Landroid/app/Application;

    move-result-object p0

    sput-object p0, Ld/a/b/a;->b:Landroid/app/Application;

    goto :goto_23

    .line 4
    :cond_10
    sput-object p0, Ld/a/b/a;->b:Landroid/app/Application;

    goto :goto_23

    :cond_13
    if-eqz p0, :cond_23

    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    sget-object v1, Ld/a/b/a;->b:Landroid/app/Application;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    if-eq v0, v1, :cond_23

    .line 6
    sput-object p0, Ld/a/b/a;->b:Landroid/app/Application;

    .line 7
    :cond_23
    :goto_23
    invoke-static {}, Ld/a/b/e/b;->a()V

    .line 8
    sget-object p0, Ld/a/b/a;->a:Ld/a/b/a;

    return-object p0
.end method

.method public static a()V
    .registers 1

    .line 9
    invoke-static {}, Ld/a/b/g/l/a;->r()Ld/a/b/g/l/a;

    move-result-object v0

    invoke-virtual {v0}, Ld/a/b/g/l/a;->a()V

    return-void
.end method

.method public static b()Landroid/app/Application;
    .registers 1

    .line 1
    sget-object v0, Ld/a/b/a;->b:Landroid/app/Application;

    if-eqz v0, :cond_5

    return-object v0

    .line 2
    :cond_5
    invoke-static {}, Ld/a/b/a;->c()Landroid/app/Application;

    move-result-object v0

    .line 3
    invoke-static {v0}, Ld/a/b/a;->a(Landroid/app/Application;)Ld/a/b/a;

    return-object v0
.end method

.method public static c()Landroid/app/Application;
    .registers 6

    const-string v0, "u should init first"

    :try_start_2
    const-string v1, "android.app.ActivityThread"

    .line 1
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "currentActivityThread"

    const/4 v3, 0x0

    new-array v4, v3, [Ljava/lang/Class;

    .line 2
    invoke-virtual {v1, v2, v4}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v2

    const/4 v4, 0x0

    new-array v5, v3, [Ljava/lang/Object;

    invoke-virtual {v2, v4, v5}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    const-string v4, "getApplication"

    new-array v5, v3, [Ljava/lang/Class;

    .line 3
    invoke-virtual {v1, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    new-array v3, v3, [Ljava/lang/Object;

    invoke-virtual {v1, v2, v3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eqz v1, :cond_2b

    .line 4
    check-cast v1, Landroid/app/Application;

    return-object v1

    .line 5
    :cond_2b
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_31} :catch_31

    :catch_31
    move-exception v1

    .line 6
    invoke-virtual {v1}, Ljava/lang/Exception;->printStackTrace()V

    .line 7
    new-instance v1, Ljava/lang/NullPointerException;

    invoke-direct {v1, v0}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static d()Ld/a/b/a;
    .registers 1

    .line 1
    sget-object v0, Ld/a/b/a;->a:Ld/a/b/a;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Ld/a/b/a;

    invoke-direct {v0}, Ld/a/b/a;-><init>()V

    sput-object v0, Ld/a/b/a;->a:Ld/a/b/a;

    .line 3
    :cond_b
    sget-object v0, Ld/a/b/a;->a:Ld/a/b/a;

    return-object v0
.end method

.method public static e()Ljava/lang/String;
    .registers 1

    const-string v0, "com.incar"

    return-object v0
.end method
