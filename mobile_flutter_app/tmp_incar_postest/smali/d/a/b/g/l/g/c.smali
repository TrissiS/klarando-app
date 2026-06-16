.class public Ld/a/b/g/l/g/c;
.super Ljava/lang/Object;
.source "SafeDialogHandle.java"


# direct methods
.method public static a(Landroid/app/Dialog;)Landroid/app/Activity;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object p0

    .line 2
    :goto_4
    instance-of v0, p0, Landroid/app/Activity;

    if-eqz v0, :cond_b

    .line 3
    check-cast p0, Landroid/app/Activity;

    goto :goto_17

    .line 4
    :cond_b
    instance-of v0, p0, Landroid/view/ContextThemeWrapper;

    if-eqz v0, :cond_16

    .line 5
    check-cast p0, Landroid/view/ContextThemeWrapper;

    invoke-virtual {p0}, Landroid/view/ContextThemeWrapper;->getBaseContext()Landroid/content/Context;

    move-result-object p0

    goto :goto_4

    :cond_16
    const/4 p0, 0x0

    :goto_17
    return-object p0
.end method

.method public static b(Landroid/app/Dialog;)V
    .registers 2

    if-eqz p0, :cond_18

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_9

    goto :goto_18

    .line 2
    :cond_9
    invoke-static {p0}, Ld/a/b/g/l/g/c;->a(Landroid/app/Dialog;)Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_18

    .line 3
    invoke-virtual {v0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_18

    .line 4
    invoke-virtual {p0}, Landroid/app/Dialog;->dismiss()V

    :cond_18
    :goto_18
    return-void
.end method

.method public static c(Landroid/app/Dialog;)V
    .registers 3

    if-eqz p0, :cond_24

    .line 1
    invoke-virtual {p0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_9

    goto :goto_24

    .line 2
    :cond_9
    invoke-static {p0}, Ld/a/b/g/l/g/c;->a(Landroid/app/Dialog;)Landroid/app/Activity;

    move-result-object v0

    .line 3
    invoke-static {v0}, Ld/a/b/g/l/g/e;->a(Landroid/app/Activity;)Z

    move-result v0

    if-nez v0, :cond_21

    const/4 p0, 0x1

    new-array p0, p0, [Ljava/lang/Object;

    const/4 v0, 0x0

    const-string v1, "The Dialog bind\'s Activity was recycled or finished!"

    aput-object v1, p0, v0

    const-string v0, "Dialog shown failed:%s"

    .line 4
    invoke-static {v0, p0}, Ld/a/b/g/l/g/b;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    return-void

    .line 5
    :cond_21
    invoke-virtual {p0}, Landroid/app/Dialog;->show()V

    :cond_24
    :goto_24
    return-void
.end method
