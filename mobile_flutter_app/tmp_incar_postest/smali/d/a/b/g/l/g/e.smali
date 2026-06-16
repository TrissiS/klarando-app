.class public Ld/a/b/g/l/g/e;
.super Ljava/lang/Object;
.source "Utils.java"


# static fields
.field public static a:Landroid/os/Handler;


# direct methods
.method public static a()Landroid/os/Handler;
    .registers 2

    .line 1
    sget-object v0, Ld/a/b/g/l/g/e;->a:Landroid/os/Handler;

    if-nez v0, :cond_f

    .line 2
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Ld/a/b/g/l/g/e;->a:Landroid/os/Handler;

    .line 3
    :cond_f
    sget-object v0, Ld/a/b/g/l/g/e;->a:Landroid/os/Handler;

    return-object v0
.end method

.method public static a(Landroid/app/Activity;)Z
    .registers 1

    if-eqz p0, :cond_a

    .line 4
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result p0

    if-nez p0, :cond_a

    const/4 p0, 0x1

    goto :goto_b

    :cond_a
    const/4 p0, 0x0

    :goto_b
    return p0
.end method
