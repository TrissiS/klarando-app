.class public Lb/b/p/e;
.super Lb/b/p/b;
.source "StandaloneActionMode.java"

# interfaces
.implements Lb/b/p/j/g$a;


# instance fields
.field public j:Landroid/content/Context;

.field public k:Landroidx/appcompat/widget/ActionBarContextView;

.field public l:Lb/b/p/b$a;

.field public m:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/view/View;",
            ">;"
        }
    .end annotation
.end field

.field public n:Z

.field public o:Lb/b/p/j/g;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroidx/appcompat/widget/ActionBarContextView;Lb/b/p/b$a;Z)V
    .registers 5

    .line 1
    invoke-direct {p0}, Lb/b/p/b;-><init>()V

    .line 2
    iput-object p1, p0, Lb/b/p/e;->j:Landroid/content/Context;

    .line 3
    iput-object p2, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    .line 4
    iput-object p3, p0, Lb/b/p/e;->l:Lb/b/p/b$a;

    .line 5
    new-instance p1, Lb/b/p/j/g;

    invoke-virtual {p2}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-direct {p1, p2}, Lb/b/p/j/g;-><init>(Landroid/content/Context;)V

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Lb/b/p/j/g;->c(I)Lb/b/p/j/g;

    iput-object p1, p0, Lb/b/p/e;->o:Lb/b/p/j/g;

    .line 6
    invoke-virtual {p1, p0}, Lb/b/p/j/g;->a(Lb/b/p/j/g$a;)V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 3

    .line 7
    iget-boolean v0, p0, Lb/b/p/e;->n:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lb/b/p/e;->n:Z

    .line 9
    iget-object v0, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->sendAccessibilityEvent(I)V

    .line 10
    iget-object v0, p0, Lb/b/p/e;->l:Lb/b/p/b$a;

    invoke-interface {v0, p0}, Lb/b/p/b$a;->a(Lb/b/p/b;)V

    return-void
.end method

.method public a(I)V
    .registers 3

    .line 2
    iget-object v0, p0, Lb/b/p/e;->j:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/b/p/e;->a(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    .line 5
    iget-object v0, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setCustomView(Landroid/view/View;)V

    if-eqz p1, :cond_d

    .line 6
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    iput-object v0, p0, Lb/b/p/e;->m:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lb/b/p/j/g;)V
    .registers 2

    .line 12
    invoke-virtual {p0}, Lb/b/p/e;->i()V

    .line 13
    iget-object p1, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {p1}, Landroidx/appcompat/widget/ActionBarContextView;->e()Z

    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setSubtitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public a(Z)V
    .registers 3

    .line 3
    invoke-super {p0, p1}, Lb/b/p/b;->a(Z)V

    .line 4
    iget-object v0, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setTitleOptional(Z)V

    return-void
.end method

.method public a(Lb/b/p/j/g;Landroid/view/MenuItem;)Z
    .registers 3

    .line 11
    iget-object p1, p0, Lb/b/p/e;->l:Lb/b/p/b$a;

    invoke-interface {p1, p0, p2}, Lb/b/p/b$a;->a(Lb/b/p/b;Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public b()Landroid/view/View;
    .registers 2

    .line 3
    iget-object v0, p0, Lb/b/p/e;->m:Ljava/lang/ref/WeakReference;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    return-object v0
.end method

.method public b(I)V
    .registers 3

    .line 2
    iget-object v0, p0, Lb/b/p/e;->j:Landroid/content/Context;

    invoke-virtual {v0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lb/b/p/e;->b(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public b(Ljava/lang/CharSequence;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/ActionBarContextView;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public c()Landroid/view/Menu;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/e;->o:Lb/b/p/j/g;

    return-object v0
.end method

.method public d()Landroid/view/MenuInflater;
    .registers 3

    .line 1
    new-instance v0, Lb/b/p/g;

    iget-object v1, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lb/b/p/g;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public e()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarContextView;->getSubtitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public g()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarContextView;->getTitle()Ljava/lang/CharSequence;

    move-result-object v0

    return-object v0
.end method

.method public i()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/p/e;->l:Lb/b/p/b$a;

    iget-object v1, p0, Lb/b/p/e;->o:Lb/b/p/j/g;

    invoke-interface {v0, p0, v1}, Lb/b/p/b$a;->a(Lb/b/p/b;Landroid/view/Menu;)Z

    return-void
.end method

.method public j()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/e;->k:Landroidx/appcompat/widget/ActionBarContextView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/ActionBarContextView;->c()Z

    move-result v0

    return v0
.end method
