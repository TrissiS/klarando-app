.class public Lb/h/d/a;
.super Lb/h/e/a;
.source "ActivityCompat.java"


# direct methods
.method public static a(Landroid/app/Activity;)V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x10

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->finishAffinity()V

    goto :goto_d

    .line 3
    :cond_a
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :goto_d
    return-void
.end method

.method public static b(Landroid/app/Activity;)V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-lt v0, v1, :cond_a

    .line 2
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    goto :goto_29

    :cond_a
    const/16 v1, 0x17

    if-gt v0, v1, :cond_20

    .line 3
    new-instance v0, Landroid/os/Handler;

    invoke-virtual {p0}, Landroid/app/Activity;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    new-instance v1, Lb/h/d/a$a;

    invoke-direct {v1, p0}, Lb/h/d/a$a;-><init>(Landroid/app/Activity;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_29

    .line 5
    :cond_20
    invoke-static {p0}, Lb/h/d/b;->a(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_29

    .line 6
    invoke-virtual {p0}, Landroid/app/Activity;->recreate()V

    :cond_29
    :goto_29
    return-void
.end method
