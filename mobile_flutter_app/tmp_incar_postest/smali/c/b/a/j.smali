.class public Lc/b/a/j;
.super Ljava/lang/Object;
.source "ImmersionDelegate.java"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public h:Lc/b/a/h;

.field public i:Lc/b/a/d;

.field public j:Lc/b/a/n;

.field public k:I


# direct methods
.method public constructor <init>(Ljava/lang/Object;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    instance-of v0, p1, Landroid/app/Activity;

    if-eqz v0, :cond_15

    .line 3
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    if-nez v0, :cond_54

    .line 4
    new-instance v0, Lc/b/a/h;

    check-cast p1, Landroid/app/Activity;

    invoke-direct {v0, p1}, Lc/b/a/h;-><init>(Landroid/app/Activity;)V

    iput-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    goto :goto_54

    .line 5
    :cond_15
    instance-of v0, p1, Landroidx/fragment/app/Fragment;

    if-eqz v0, :cond_35

    .line 6
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    if-nez v0, :cond_54

    .line 7
    instance-of v0, p1, Lb/l/d/c;

    if-eqz v0, :cond_2b

    .line 8
    new-instance v0, Lc/b/a/h;

    check-cast p1, Lb/l/d/c;

    invoke-direct {v0, p1}, Lc/b/a/h;-><init>(Lb/l/d/c;)V

    iput-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    goto :goto_54

    .line 9
    :cond_2b
    new-instance v0, Lc/b/a/h;

    check-cast p1, Landroidx/fragment/app/Fragment;

    invoke-direct {v0, p1}, Lc/b/a/h;-><init>(Landroidx/fragment/app/Fragment;)V

    iput-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    goto :goto_54

    .line 10
    :cond_35
    instance-of v0, p1, Landroid/app/Fragment;

    if-eqz v0, :cond_54

    .line 11
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    if-nez v0, :cond_54

    .line 12
    instance-of v0, p1, Landroid/app/DialogFragment;

    if-eqz v0, :cond_4b

    .line 13
    new-instance v0, Lc/b/a/h;

    check-cast p1, Landroid/app/DialogFragment;

    invoke-direct {v0, p1}, Lc/b/a/h;-><init>(Landroid/app/DialogFragment;)V

    iput-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    goto :goto_54

    .line 14
    :cond_4b
    new-instance v0, Lc/b/a/h;

    check-cast p1, Landroid/app/Fragment;

    invoke-direct {v0, p1}, Lc/b/a/h;-><init>(Landroid/app/Fragment;)V

    iput-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    :cond_54
    :goto_54
    return-void
.end method


# virtual methods
.method public a()Lc/b/a/h;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    return-object v0
.end method

.method public final a(Landroid/content/res/Configuration;)V
    .registers 6

    .line 2
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    if-eqz v0, :cond_77

    invoke-virtual {v0}, Lc/b/a/h;->y()Z

    move-result v0

    if-eqz v0, :cond_77

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x13

    if-lt v0, v1, :cond_77

    .line 3
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->o()Lc/b/a/c;

    move-result-object v0

    iget-object v0, v0, Lc/b/a/c;->R:Lc/b/a/n;

    iput-object v0, p0, Lc/b/a/j;->j:Lc/b/a/n;

    if-eqz v0, :cond_77

    .line 4
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->m()Landroid/app/Activity;

    move-result-object v0

    .line 5
    iget-object v1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    if-nez v1, :cond_2d

    .line 6
    new-instance v1, Lc/b/a/d;

    invoke-direct {v1}, Lc/b/a/d;-><init>()V

    iput-object v1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    .line 7
    :cond_2d
    iget-object v1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    iget p1, p1, Landroid/content/res/Configuration;->orientation:I

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne p1, v3, :cond_37

    const/4 p1, 0x1

    goto :goto_38

    :cond_37
    const/4 p1, 0x0

    :goto_38
    invoke-virtual {v1, p1}, Lc/b/a/d;->e(Z)V

    .line 8
    invoke-virtual {v0}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    move-result-object p1

    invoke-interface {p1}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Display;->getRotation()I

    move-result p1

    if-ne p1, v3, :cond_54

    .line 9
    iget-object p1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {p1, v3}, Lc/b/a/d;->a(Z)V

    .line 10
    iget-object p1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {p1, v2}, Lc/b/a/d;->b(Z)V

    goto :goto_6c

    :cond_54
    const/4 v1, 0x3

    if-ne p1, v1, :cond_62

    .line 11
    iget-object p1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {p1, v2}, Lc/b/a/d;->a(Z)V

    .line 12
    iget-object p1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {p1, v3}, Lc/b/a/d;->b(Z)V

    goto :goto_6c

    .line 13
    :cond_62
    iget-object p1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {p1, v2}, Lc/b/a/d;->a(Z)V

    .line 14
    iget-object p1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {p1, v2}, Lc/b/a/d;->b(Z)V

    .line 15
    :goto_6c
    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_77
    return-void
.end method

.method public b()V
    .registers 3

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lc/b/a/j;->i:Lc/b/a/d;

    .line 3
    iget-object v1, p0, Lc/b/a/j;->h:Lc/b/a/h;

    if-eqz v1, :cond_c

    .line 4
    invoke-virtual {v1}, Lc/b/a/h;->A()V

    .line 5
    iput-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    :cond_c
    return-void
.end method

.method public b(Landroid/content/res/Configuration;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lc/b/a/j;->a(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public c()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0}, Lc/b/a/h;->B()V

    :cond_7
    return-void
.end method

.method public c(Landroid/content/res/Configuration;)V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    if-eqz v0, :cond_a

    .line 4
    invoke-virtual {v0, p1}, Lc/b/a/h;->a(Landroid/content/res/Configuration;)V

    .line 5
    invoke-virtual {p0, p1}, Lc/b/a/j;->a(Landroid/content/res/Configuration;)V

    :cond_a
    return-void
.end method

.method public run()V
    .registers 5

    .line 1
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    if-eqz v0, :cond_63

    invoke-virtual {v0}, Lc/b/a/h;->m()Landroid/app/Activity;

    move-result-object v0

    if-eqz v0, :cond_63

    .line 2
    iget-object v0, p0, Lc/b/a/j;->h:Lc/b/a/h;

    invoke-virtual {v0}, Lc/b/a/h;->m()Landroid/app/Activity;

    move-result-object v0

    .line 3
    new-instance v1, Lc/b/a/a;

    invoke-direct {v1, v0}, Lc/b/a/a;-><init>(Landroid/app/Activity;)V

    .line 4
    iget-object v2, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {v1}, Lc/b/a/a;->d()I

    move-result v3

    invoke-virtual {v2, v3}, Lc/b/a/d;->e(I)V

    .line 5
    iget-object v2, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {v1}, Lc/b/a/a;->e()Z

    move-result v3

    invoke-virtual {v2, v3}, Lc/b/a/d;->c(Z)V

    .line 6
    iget-object v2, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {v1}, Lc/b/a/a;->b()I

    move-result v3

    invoke-virtual {v2, v3}, Lc/b/a/d;->b(I)V

    .line 7
    iget-object v2, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {v1}, Lc/b/a/a;->c()I

    move-result v3

    invoke-virtual {v2, v3}, Lc/b/a/d;->c(I)V

    .line 8
    iget-object v2, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {v1}, Lc/b/a/a;->a()I

    move-result v1

    invoke-virtual {v2, v1}, Lc/b/a/d;->a(I)V

    .line 9
    invoke-static {v0}, Lc/b/a/l;->d(Landroid/app/Activity;)Z

    move-result v1

    .line 10
    iget-object v2, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {v2, v1}, Lc/b/a/d;->d(Z)V

    if-eqz v1, :cond_5c

    .line 11
    iget v1, p0, Lc/b/a/j;->k:I

    if-nez v1, :cond_5c

    .line 12
    invoke-static {v0}, Lc/b/a/l;->b(Landroid/app/Activity;)I

    move-result v0

    iput v0, p0, Lc/b/a/j;->k:I

    .line 13
    iget-object v1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-virtual {v1, v0}, Lc/b/a/d;->d(I)V

    .line 14
    :cond_5c
    iget-object v0, p0, Lc/b/a/j;->j:Lc/b/a/n;

    iget-object v1, p0, Lc/b/a/j;->i:Lc/b/a/d;

    invoke-interface {v0, v1}, Lc/b/a/n;->a(Lc/b/a/d;)V

    :cond_63
    return-void
.end method
