.class public abstract Lnet/nyx/postest/base/AppActivity;
.super Lnet/nyx/base/BaseActivity;
.source "AppActivity.java"

# interfaces
.implements Ld/a/b/b/e;
.implements Ld/a/b/b/c;


# instance fields
.field public A:I

.field public x:Lcom/hjq/bar/TitleBar;

.field public y:Lc/b/a/h;

.field public z:Ld/a/a/d;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lnet/nyx/base/BaseActivity;-><init>()V

    return-void
.end method


# virtual methods
.method public B()Lc/b/a/h;
    .registers 4

    .line 1
    invoke-static {p0}, Lc/b/a/h;->b(Landroid/app/Activity;)Lc/b/a/h;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->H()Z

    move-result v1

    invoke-virtual {v0, v1}, Lc/b/a/h;->b(Z)Lc/b/a/h;

    const v1, 0x7f0500fe

    .line 3
    invoke-virtual {v0, v1}, Lc/b/a/h;->c(I)Lc/b/a/h;

    const/4 v1, 0x1

    const v2, 0x3e4ccccd    # 0.2f

    .line 4
    invoke-virtual {v0, v1, v2}, Lc/b/a/h;->a(ZF)Lc/b/a/h;

    return-object v0
.end method

.method public C()I
    .registers 2

    const v0, 0x7f0f002b

    return v0
.end method

.method public D()Lc/b/a/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->y:Lc/b/a/h;

    if-nez v0, :cond_a

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->B()Lc/b/a/h;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/base/AppActivity;->y:Lc/b/a/h;

    .line 3
    :cond_a
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->y:Lc/b/a/h;

    return-object v0
.end method

.method public E()Lcom/hjq/bar/TitleBar;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->x:Lcom/hjq/bar/TitleBar;

    if-nez v0, :cond_e

    .line 2
    invoke-virtual {p0}, Lnet/nyx/base/BaseActivity;->v()Landroid/view/ViewGroup;

    move-result-object v0

    invoke-interface {p0, v0}, Ld/a/b/b/c;->a(Landroid/view/ViewGroup;)Lcom/hjq/bar/TitleBar;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/base/AppActivity;->x:Lcom/hjq/bar/TitleBar;

    .line 3
    :cond_e
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->x:Lcom/hjq/bar/TitleBar;

    return-object v0
.end method

.method public F()V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_29

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_29

    .line 2
    :cond_d
    iget v0, p0, Lnet/nyx/postest/base/AppActivity;->A:I

    if-lez v0, :cond_15

    add-int/lit8 v0, v0, -0x1

    .line 3
    iput v0, p0, Lnet/nyx/postest/base/AppActivity;->A:I

    .line 4
    :cond_15
    iget v0, p0, Lnet/nyx/postest/base/AppActivity;->A:I

    if-nez v0, :cond_29

    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->z:Ld/a/a/d;

    if-eqz v0, :cond_29

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_24

    goto :goto_29

    .line 5
    :cond_24
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->z:Ld/a/a/d;

    invoke-virtual {v0}, Ld/a/a/d;->dismiss()V

    :cond_29
    :goto_29
    return-void
.end method

.method public G()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->z:Ld/a/a/d;

    if-eqz v0, :cond_c

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-eqz v0, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public H()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public I()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public synthetic J()V
    .registers 3

    .line 1
    iget v0, p0, Lnet/nyx/postest/base/AppActivity;->A:I

    if-lez v0, :cond_3a

    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_3a

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_11

    goto :goto_3a

    .line 2
    :cond_11
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->z:Ld/a/a/d;

    if-nez v0, :cond_2d

    .line 3
    new-instance v0, Ld/a/b/f/b/l;

    invoke-direct {v0, p0}, Ld/a/b/f/b/l;-><init>(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 4
    invoke-virtual {v0, v1}, Ld/a/a/d$b;->b(Z)Ld/a/a/d$b;

    check-cast v0, Ld/a/b/f/b/l;

    .line 5
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->C()I

    move-result v1

    invoke-virtual {v0, v1}, Ld/a/b/f/b/l;->g(I)Ld/a/b/f/b/l;

    .line 6
    invoke-virtual {v0}, Ld/a/a/d$b;->a()Ld/a/a/d;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/postest/base/AppActivity;->z:Ld/a/a/d;

    .line 7
    :cond_2d
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->z:Ld/a/a/d;

    invoke-virtual {v0}, Landroid/app/Dialog;->isShowing()Z

    move-result v0

    if-nez v0, :cond_3a

    .line 8
    iget-object v0, p0, Lnet/nyx/postest/base/AppActivity;->z:Ld/a/a/d;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    :cond_3a
    :goto_3a
    return-void
.end method

.method public K()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_1d

    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    move-result v0

    if-eqz v0, :cond_d

    goto :goto_1d

    .line 2
    :cond_d
    iget v0, p0, Lnet/nyx/postest/base/AppActivity;->A:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lnet/nyx/postest/base/AppActivity;->A:I

    .line 3
    new-instance v0, Ld/a/b/d/a;

    invoke-direct {v0, p0}, Ld/a/b/d/a;-><init>(Lnet/nyx/postest/base/AppActivity;)V

    const-wide/16 v1, 0x64

    invoke-interface {p0, v0, v1, v2}, Ld/a/a/g/g;->a(Ljava/lang/Runnable;J)Z

    :cond_1d
    :goto_1d
    return-void
.end method

.method public synthetic a(Landroid/view/ViewGroup;)Lcom/hjq/bar/TitleBar;
    .registers 2

    invoke-static {p0, p1}, Ld/a/b/b/b;->a(Ld/a/b/b/c;Landroid/view/ViewGroup;)Lcom/hjq/bar/TitleBar;

    move-result-object p1

    return-object p1
.end method

.method public synthetic a(I)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/b/b/d;->a(Ld/a/b/b/e;I)V

    return-void
.end method

.method public synthetic a(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/b/b/b;->b(Ld/a/b/b/c;Landroid/view/View;)V

    return-void
.end method

.method public synthetic a(Ljava/lang/CharSequence;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/b/b/d;->a(Ld/a/b/b/e;Ljava/lang/CharSequence;)V

    return-void
.end method

.method public finish()V
    .registers 3

    .line 1
    invoke-super {p0}, Lnet/nyx/base/BaseActivity;->finish()V

    const v0, 0x7f010023

    const v1, 0x7f010024

    .line 2
    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    return-void
.end method

.method public onDestroy()V
    .registers 2

    .line 1
    invoke-super {p0}, Lnet/nyx/base/BaseActivity;->onDestroy()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->G()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 3
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->F()V

    :cond_c
    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lnet/nyx/postest/base/AppActivity;->z:Ld/a/a/d;

    return-void
.end method

.method public onLeftClick(Landroid/view/View;)V
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/activity/ComponentActivity;->onBackPressed()V

    return-void
.end method

.method public synthetic onRightClick(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/b/b/b;->a(Ld/a/b/b/c;Landroid/view/View;)V

    return-void
.end method

.method public setTitle(I)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Landroid/app/Activity;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnet/nyx/postest/base/AppActivity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public setTitle(Ljava/lang/CharSequence;)V
    .registers 3

    .line 2
    invoke-super {p0, p1}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    .line 3
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->E()Lcom/hjq/bar/TitleBar;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 4
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->E()Lcom/hjq/bar/TitleBar;

    move-result-object v0

    invoke-virtual {v0, p1}, Lcom/hjq/bar/TitleBar;->c(Ljava/lang/CharSequence;)Lcom/hjq/bar/TitleBar;

    :cond_10
    return-void
.end method

.method public startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V
    .registers 4

    .line 1
    invoke-super {p0, p1, p2, p3}, Lnet/nyx/base/BaseActivity;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    const p1, 0x7f010028

    const p2, 0x7f010029

    .line 2
    invoke-virtual {p0, p1, p2}, Landroid/app/Activity;->overridePendingTransition(II)V

    return-void
.end method

.method public y()V
    .registers 4

    .line 1
    invoke-super {p0}, Lnet/nyx/base/BaseActivity;->y()V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->E()Lcom/hjq/bar/TitleBar;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 3
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->E()Lcom/hjq/bar/TitleBar;

    move-result-object v0

    invoke-virtual {v0, p0}, Lcom/hjq/bar/TitleBar;->a(Lc/c/a/b;)Lcom/hjq/bar/TitleBar;

    .line 4
    :cond_10
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->I()Z

    move-result v0

    if-eqz v0, :cond_30

    .line 5
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->D()Lc/b/a/h;

    move-result-object v0

    invoke-virtual {v0}, Lc/b/a/h;->w()V

    .line 6
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->E()Lcom/hjq/bar/TitleBar;

    move-result-object v0

    if-eqz v0, :cond_30

    const/4 v0, 0x1

    new-array v0, v0, [Landroid/view/View;

    const/4 v1, 0x0

    .line 7
    invoke-virtual {p0}, Lnet/nyx/postest/base/AppActivity;->E()Lcom/hjq/bar/TitleBar;

    move-result-object v2

    aput-object v2, v0, v1

    invoke-static {p0, v0}, Lc/b/a/h;->a(Landroid/app/Activity;[Landroid/view/View;)V

    :cond_30
    return-void
.end method
