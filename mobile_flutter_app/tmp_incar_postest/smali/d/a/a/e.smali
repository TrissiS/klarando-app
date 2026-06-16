.class public abstract Ld/a/a/e;
.super Landroidx/fragment/app/Fragment;
.source "BaseFragment.java"

# interfaces
.implements Ld/a/a/g/b;
.implements Ld/a/a/g/k;
.implements Ld/a/a/g/g;
.implements Ld/a/a/g/e;
.implements Ld/a/a/g/i;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<A:",
        "Lnet/nyx/base/BaseActivity;",
        ">",
        "Landroidx/fragment/app/Fragment;",
        "Ld/a/a/g/b;",
        "Ld/a/a/g/k;",
        "Ld/a/a/g/g;",
        "Ld/a/a/g/e;",
        "Ljava/lang/Object;",
        "Ld/a/a/g/i;"
    }
.end annotation


# instance fields
.field public f0:Lnet/nyx/base/BaseActivity;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TA;"
        }
    .end annotation
.end field

.field public g0:Landroid/view/View;

.field public h0:Z


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public A0()V
    .registers 1

    return-void
.end method

.method public M()Landroid/view/View;
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/a/e;->g0:Landroid/view/View;

    return-object v0
.end method

.method public Z()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->Z()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ld/a/a/e;->h0:Z

    .line 3
    invoke-interface {p0}, Ld/a/a/g/g;->h()V

    return-void
.end method

.method public a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 5

    .line 3
    invoke-virtual {p0}, Ld/a/a/e;->x0()I

    move-result p3

    if-gtz p3, :cond_8

    const/4 p1, 0x0

    return-object p1

    :cond_8
    const/4 p3, 0x0

    .line 4
    iput-boolean p3, p0, Ld/a/a/e;->h0:Z

    .line 5
    invoke-virtual {p0}, Ld/a/a/e;->x0()I

    move-result v0

    invoke-virtual {p1, v0, p2, p3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Ld/a/a/e;->g0:Landroid/view/View;

    .line 6
    invoke-virtual {p0}, Ld/a/a/e;->z0()V

    .line 7
    iget-object p1, p0, Ld/a/a/e;->g0:Landroid/view/View;

    return-object p1
.end method

.method public a(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->a(Landroid/content/Context;)V

    .line 2
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->s0()Landroidx/fragment/app/FragmentActivity;

    move-result-object p1

    check-cast p1, Lnet/nyx/base/BaseActivity;

    iput-object p1, p0, Ld/a/a/e;->f0:Lnet/nyx/base/BaseActivity;

    return-void
.end method

.method public varargs synthetic a(Landroid/view/View$OnClickListener;[I)V
    .registers 3

    invoke-static {p0, p1, p2}, Ld/a/a/g/d;->a(Ld/a/a/g/e;Landroid/view/View$OnClickListener;[I)V

    return-void
.end method

.method public varargs synthetic a(Landroid/view/View$OnClickListener;[Landroid/view/View;)V
    .registers 3

    invoke-static {p0, p1, p2}, Ld/a/a/g/d;->a(Ld/a/a/g/e;Landroid/view/View$OnClickListener;[Landroid/view/View;)V

    return-void
.end method

.method public synthetic a(Ljava/lang/Class;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "+",
            "Landroid/app/Activity;",
            ">;)V"
        }
    .end annotation

    invoke-static {p0, p1}, Ld/a/a/g/a;->a(Ld/a/a/g/b;Ljava/lang/Class;)V

    return-void
.end method

.method public varargs synthetic a([I)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/d;->a(Ld/a/a/g/e;[I)V

    return-void
.end method

.method public varargs synthetic a([Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/d;->a(Ld/a/a/g/e;[Landroid/view/View;)V

    return-void
.end method

.method public a(ILandroid/view/KeyEvent;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public a(Landroid/view/KeyEvent;)Z
    .registers 7

    .line 8
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->o()Landroidx/fragment/app/FragmentManager;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->A()Ljava/util/List;

    move-result-object v0

    .line 9
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_c
    :goto_c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_33

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/fragment/app/Fragment;

    .line 10
    instance-of v3, v1, Ld/a/a/e;

    if-eqz v3, :cond_c

    .line 11
    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->a()Lb/n/e;

    move-result-object v3

    invoke-virtual {v3}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object v3

    sget-object v4, Lb/n/e$c;->RESUMED:Lb/n/e$c;

    if-eq v3, v4, :cond_2a

    goto :goto_c

    .line 12
    :cond_2a
    check-cast v1, Ld/a/a/e;

    invoke-virtual {v1, p1}, Ld/a/a/e;->a(Landroid/view/KeyEvent;)Z

    move-result v1

    if-eqz v1, :cond_c

    return v2

    .line 13
    :cond_33
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getAction()I

    move-result v0

    if-eqz v0, :cond_46

    if-eq v0, v2, :cond_3d

    const/4 p1, 0x0

    return p1

    .line 14
    :cond_3d
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Ld/a/a/e;->b(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1

    .line 15
    :cond_46
    invoke-virtual {p1}, Landroid/view/KeyEvent;->getKeyCode()I

    move-result v0

    invoke-virtual {p0, v0, p1}, Ld/a/a/e;->a(ILandroid/view/KeyEvent;)Z

    move-result p1

    return p1
.end method

.method public synthetic a(Ljava/lang/Runnable;)Z
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/f;->a(Ld/a/a/g/g;Ljava/lang/Runnable;)Z

    move-result p1

    return p1
.end method

.method public synthetic a(Ljava/lang/Runnable;J)Z
    .registers 4

    invoke-static {p0, p1, p2, p3}, Ld/a/a/g/f;->b(Ld/a/a/g/g;Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method

.method public synthetic b(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<S:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "TS;>;)TS;"
        }
    .end annotation

    invoke-static {p0, p1}, Ld/a/a/g/j;->a(Ld/a/a/g/k;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public synthetic b(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/h;->a(Ld/a/a/g/i;Landroid/view/View;)V

    return-void
.end method

.method public b(ILandroid/view/KeyEvent;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public synthetic b(Ljava/lang/Runnable;J)Z
    .registers 4

    invoke-static {p0, p1, p2, p3}, Ld/a/a/g/f;->a(Ld/a/a/g/g;Ljava/lang/Runnable;J)Z

    move-result p1

    return p1
.end method

.method public b0()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->b0()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ld/a/a/e;->g0:Landroid/view/View;

    return-void
.end method

.method public c0()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->c0()V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ld/a/a/e;->f0:Lnet/nyx/base/BaseActivity;

    return-void
.end method

.method public e0()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->e0()V

    .line 2
    iget-boolean v0, p0, Ld/a/a/e;->h0:Z

    if-nez v0, :cond_11

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Ld/a/a/e;->h0:Z

    .line 4
    invoke-virtual {p0}, Ld/a/a/e;->y0()V

    .line 5
    invoke-virtual {p0, v0}, Ld/a/a/e;->j(Z)V

    return-void

    .line 6
    :cond_11
    iget-object v0, p0, Ld/a/a/e;->f0:Lnet/nyx/base/BaseActivity;

    if-eqz v0, :cond_25

    invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->a()Lb/n/e;

    move-result-object v0

    invoke-virtual {v0}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object v0

    sget-object v1, Lb/n/e$c;->STARTED:Lb/n/e$c;

    if-ne v0, v1, :cond_25

    .line 7
    invoke-virtual {p0}, Ld/a/a/e;->A0()V

    goto :goto_29

    :cond_25
    const/4 v0, 0x0

    .line 8
    invoke-virtual {p0, v0}, Ld/a/a/e;->j(Z)V

    :goto_29
    return-void
.end method

.method public bridge synthetic f()Landroid/app/Activity;
    .registers 2

    .line 1
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->f()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    return-object v0
.end method

.method public findViewById(I)Landroid/view/View;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<V:",
            "Landroid/view/View;",
            ">(I)TV;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/a/e;->g0:Landroid/view/View;

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public synthetic h()V
    .registers 1

    invoke-static {p0}, Ld/a/a/g/f;->a(Ld/a/a/g/g;)V

    return-void
.end method

.method public j(Z)V
    .registers 2

    return-void
.end method

.method public synthetic onClick(Landroid/view/View;)V
    .registers 2

    invoke-static {p0, p1}, Ld/a/a/g/d;->a(Ld/a/a/g/e;Landroid/view/View;)V

    return-void
.end method

.method public abstract x0()I
.end method

.method public abstract y0()V
.end method

.method public abstract z0()V
.end method
