.class public final Lc/b/a/t;
.super Landroidx/fragment/app/Fragment;
.source "SupportRequestManagerFragment.java"


# instance fields
.field public f0:Lc/b/a/j;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public Z()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->Z()V

    .line 2
    iget-object v0, p0, Lc/b/a/t;->f0:Lc/b/a/j;

    if-eqz v0, :cond_d

    .line 3
    invoke-virtual {v0}, Lc/b/a/j;->b()V

    const/4 v0, 0x0

    .line 4
    iput-object v0, p0, Lc/b/a/t;->f0:Lc/b/a/j;

    :cond_d
    return-void
.end method

.method public a(Ljava/lang/Object;)Lc/b/a/h;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/b/a/t;->f0:Lc/b/a/j;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Lc/b/a/j;

    invoke-direct {v0, p1}, Lc/b/a/j;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lc/b/a/t;->f0:Lc/b/a/j;

    .line 3
    :cond_b
    iget-object p1, p0, Lc/b/a/t;->f0:Lc/b/a/j;

    invoke-virtual {p1}, Lc/b/a/j;->a()Lc/b/a/h;

    move-result-object p1

    return-object p1
.end method

.method public b(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->b(Landroid/os/Bundle;)V

    .line 2
    iget-object p1, p0, Lc/b/a/t;->f0:Lc/b/a/j;

    if-eqz p1, :cond_12

    .line 3
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->d()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc/b/a/j;->b(Landroid/content/res/Configuration;)V

    :cond_12
    return-void
.end method

.method public e0()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->e0()V

    .line 2
    iget-object v0, p0, Lc/b/a/t;->f0:Lc/b/a/j;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0}, Lc/b/a/j;->c()V

    :cond_a
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    .line 2
    iget-object v0, p0, Lc/b/a/t;->f0:Lc/b/a/j;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0, p1}, Lc/b/a/j;->c(Landroid/content/res/Configuration;)V

    :cond_a
    return-void
.end method
