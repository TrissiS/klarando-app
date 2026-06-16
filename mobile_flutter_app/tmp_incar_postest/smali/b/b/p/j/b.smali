.class public abstract Lb/b/p/j/b;
.super Ljava/lang/Object;
.source "BaseMenuPresenter.java"

# interfaces
.implements Lb/b/p/j/m;


# instance fields
.field public h:Landroid/content/Context;

.field public i:Landroid/content/Context;

.field public j:Lb/b/p/j/g;

.field public k:Landroid/view/LayoutInflater;

.field public l:Lb/b/p/j/m$a;

.field public m:I

.field public n:I

.field public o:Lb/b/p/j/n;

.field public p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;II)V
    .registers 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/b/p/j/b;->h:Landroid/content/Context;

    .line 3
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lb/b/p/j/b;->k:Landroid/view/LayoutInflater;

    .line 4
    iput p2, p0, Lb/b/p/j/b;->m:I

    .line 5
    iput p3, p0, Lb/b/p/j/b;->n:I

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 35
    iget v0, p0, Lb/b/p/j/b;->p:I

    return v0
.end method

.method public a(Lb/b/p/j/i;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    .line 26
    instance-of v0, p2, Lb/b/p/j/n$a;

    if-eqz v0, :cond_7

    .line 27
    check-cast p2, Lb/b/p/j/n$a;

    goto :goto_b

    .line 28
    :cond_7
    invoke-virtual {p0, p3}, Lb/b/p/j/b;->a(Landroid/view/ViewGroup;)Lb/b/p/j/n$a;

    move-result-object p2

    .line 29
    :goto_b
    invoke-virtual {p0, p1, p2}, Lb/b/p/j/b;->a(Lb/b/p/j/i;Lb/b/p/j/n$a;)V

    .line 30
    check-cast p2, Landroid/view/View;

    return-object p2
.end method

.method public a(Landroid/view/ViewGroup;)Lb/b/p/j/n$a;
    .registers 5

    .line 25
    iget-object v0, p0, Lb/b/p/j/b;->k:Landroid/view/LayoutInflater;

    iget v1, p0, Lb/b/p/j/b;->n:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lb/b/p/j/n$a;

    return-object p1
.end method

.method public a(I)V
    .registers 2

    .line 36
    iput p1, p0, Lb/b/p/j/b;->p:I

    return-void
.end method

.method public a(Landroid/content/Context;Lb/b/p/j/g;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lb/b/p/j/b;->i:Landroid/content/Context;

    .line 2
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 3
    iput-object p2, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    return-void
.end method

.method public a(Landroid/view/View;I)V
    .registers 4

    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_b

    .line 21
    invoke-virtual {v0, p1}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 22
    :cond_b
    iget-object v0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast v0, Landroid/view/ViewGroup;

    invoke-virtual {v0, p1, p2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;I)V

    return-void
.end method

.method public a(Lb/b/p/j/g;Z)V
    .registers 4

    .line 31
    iget-object v0, p0, Lb/b/p/j/b;->l:Lb/b/p/j/m$a;

    if-eqz v0, :cond_7

    .line 32
    invoke-interface {v0, p1, p2}, Lb/b/p/j/m$a;->a(Lb/b/p/j/g;Z)V

    :cond_7
    return-void
.end method

.method public abstract a(Lb/b/p/j/i;Lb/b/p/j/n$a;)V
.end method

.method public a(Lb/b/p/j/m$a;)V
    .registers 2

    .line 24
    iput-object p1, p0, Lb/b/p/j/b;->l:Lb/b/p/j/m$a;

    return-void
.end method

.method public a(Z)V
    .registers 11

    .line 4
    iget-object p1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    check-cast p1, Landroid/view/ViewGroup;

    if-nez p1, :cond_7

    return-void

    .line 5
    :cond_7
    iget-object v0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    const/4 v1, 0x0

    if-eqz v0, :cond_51

    .line 6
    invoke-virtual {v0}, Lb/b/p/j/g;->b()V

    .line 7
    iget-object v0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    const/4 v4, 0x0

    :goto_1b
    if-ge v3, v2, :cond_50

    .line 9
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lb/b/p/j/i;

    .line 10
    invoke-virtual {p0, v4, v5}, Lb/b/p/j/b;->a(ILb/b/p/j/i;)Z

    move-result v6

    if-eqz v6, :cond_4d

    .line 11
    invoke-virtual {p1, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v6

    .line 12
    instance-of v7, v6, Lb/b/p/j/n$a;

    if-eqz v7, :cond_39

    .line 13
    move-object v7, v6

    check-cast v7, Lb/b/p/j/n$a;

    invoke-interface {v7}, Lb/b/p/j/n$a;->getItemData()Lb/b/p/j/i;

    move-result-object v7

    goto :goto_3a

    :cond_39
    const/4 v7, 0x0

    .line 14
    :goto_3a
    invoke-virtual {p0, v5, v6, p1}, Lb/b/p/j/b;->a(Lb/b/p/j/i;Landroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;

    move-result-object v8

    if-eq v5, v7, :cond_46

    .line 15
    invoke-virtual {v8, v1}, Landroid/view/View;->setPressed(Z)V

    .line 16
    invoke-virtual {v8}, Landroid/view/View;->jumpDrawablesToCurrentState()V

    :cond_46
    if-eq v8, v6, :cond_4b

    .line 17
    invoke-virtual {p0, v8, v4}, Lb/b/p/j/b;->a(Landroid/view/View;I)V

    :cond_4b
    add-int/lit8 v4, v4, 0x1

    :cond_4d
    add-int/lit8 v3, v3, 0x1

    goto :goto_1b

    :cond_50
    move v1, v4

    .line 18
    :cond_51
    :goto_51
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    if-ge v1, v0, :cond_60

    .line 19
    invoke-virtual {p0, p1, v1}, Lb/b/p/j/b;->a(Landroid/view/ViewGroup;I)Z

    move-result v0

    if-nez v0, :cond_51

    add-int/lit8 v1, v1, 0x1

    goto :goto_51

    :cond_60
    return-void
.end method

.method public abstract a(ILb/b/p/j/i;)Z
.end method

.method public a(Landroid/view/ViewGroup;I)Z
    .registers 3

    .line 23
    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->removeViewAt(I)V

    const/4 p1, 0x1

    return p1
.end method

.method public a(Lb/b/p/j/g;Lb/b/p/j/i;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public a(Lb/b/p/j/r;)Z
    .registers 3

    .line 33
    iget-object v0, p0, Lb/b/p/j/b;->l:Lb/b/p/j/m$a;

    if-eqz v0, :cond_e

    if-eqz p1, :cond_7

    goto :goto_9

    .line 34
    :cond_7
    iget-object p1, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    :goto_9
    invoke-interface {v0, p1}, Lb/b/p/j/m$a;->a(Lb/b/p/j/g;)Z

    move-result p1

    return p1

    :cond_e
    const/4 p1, 0x0

    return p1
.end method

.method public b()Lb/b/p/j/m$a;
    .registers 2

    .line 6
    iget-object v0, p0, Lb/b/p/j/b;->l:Lb/b/p/j/m$a;

    return-object v0
.end method

.method public b(Landroid/view/ViewGroup;)Lb/b/p/j/n;
    .registers 5

    .line 1
    iget-object v0, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    if-nez v0, :cond_1a

    .line 2
    iget-object v0, p0, Lb/b/p/j/b;->k:Landroid/view/LayoutInflater;

    iget v1, p0, Lb/b/p/j/b;->m:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lb/b/p/j/n;

    iput-object p1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    .line 3
    iget-object v0, p0, Lb/b/p/j/b;->j:Lb/b/p/j/g;

    invoke-interface {p1, v0}, Lb/b/p/j/n;->a(Lb/b/p/j/g;)V

    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lb/b/p/j/b;->a(Z)V

    .line 5
    :cond_1a
    iget-object p1, p0, Lb/b/p/j/b;->o:Lb/b/p/j/n;

    return-object p1
.end method

.method public b(Lb/b/p/j/g;Lb/b/p/j/i;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method
