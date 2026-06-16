.class public abstract Lb/p/d/m;
.super Landroidx/recyclerview/widget/RecyclerView$l;
.source "SimpleItemAnimator.java"


# instance fields
.field public g:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$l;-><init>()V

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/p/d/m;->g:Z

    return-void
.end method


# virtual methods
.method public final a(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V
    .registers 3

    .line 13
    invoke-virtual {p0, p1, p2}, Lb/p/d/m;->c(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V

    .line 14
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$l;->b(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$b0;)Z
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/p/d/m;->g:Z

    if-eqz v0, :cond_d

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->p()Z

    move-result p1

    if-eqz p1, :cond_b

    goto :goto_d

    :cond_b
    const/4 p1, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 p1, 0x1

    :goto_e
    return p1
.end method

.method public abstract a(Landroidx/recyclerview/widget/RecyclerView$b0;IIII)Z
.end method

.method public abstract a(Landroidx/recyclerview/widget/RecyclerView$b0;Landroidx/recyclerview/widget/RecyclerView$b0;IIII)Z
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$b0;Landroidx/recyclerview/widget/RecyclerView$b0;Landroidx/recyclerview/widget/RecyclerView$l$c;Landroidx/recyclerview/widget/RecyclerView$l$c;)Z
    .registers 12

    .line 5
    iget v3, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    .line 6
    iget v4, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    .line 7
    invoke-virtual {p2}, Landroidx/recyclerview/widget/RecyclerView$b0;->z()Z

    move-result v0

    if-eqz v0, :cond_11

    .line 8
    iget p4, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    .line 9
    iget p3, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    move v6, p3

    move v5, p4

    goto :goto_17

    .line 10
    :cond_11
    iget p3, p4, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    .line 11
    iget p4, p4, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    move v5, p3

    move v6, p4

    :goto_17
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    .line 12
    invoke-virtual/range {v0 .. v6}, Lb/p/d/m;->a(Landroidx/recyclerview/widget/RecyclerView$b0;Landroidx/recyclerview/widget/RecyclerView$b0;IIII)Z

    move-result p1

    return p1
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$b0;Landroidx/recyclerview/widget/RecyclerView$l$c;Landroidx/recyclerview/widget/RecyclerView$l$c;)Z
    .registers 12

    if-eqz p2, :cond_1d

    .line 2
    iget v0, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    iget v1, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    if-ne v0, v1, :cond_e

    iget v0, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    iget v1, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    if-eq v0, v1, :cond_1d

    .line 3
    :cond_e
    iget v4, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    iget v5, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    iget v6, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    iget v7, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    move-object v2, p0

    move-object v3, p1

    invoke-virtual/range {v2 .. v7}, Lb/p/d/m;->a(Landroidx/recyclerview/widget/RecyclerView$b0;IIII)Z

    move-result p1

    return p1

    .line 4
    :cond_1d
    invoke-virtual {p0, p1}, Lb/p/d/m;->f(Landroidx/recyclerview/widget/RecyclerView$b0;)Z

    move-result p1

    return p1
.end method

.method public final b(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V
    .registers 3

    .line 12
    invoke-virtual {p0, p1, p2}, Lb/p/d/m;->d(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V

    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView$b0;Landroidx/recyclerview/widget/RecyclerView$l$c;Landroidx/recyclerview/widget/RecyclerView$l$c;)Z
    .registers 10

    .line 1
    iget v2, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    .line 2
    iget v3, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    .line 3
    iget-object p2, p1, Landroidx/recyclerview/widget/RecyclerView$b0;->h:Landroid/view/View;

    if-nez p3, :cond_d

    .line 4
    invoke-virtual {p2}, Landroid/view/View;->getLeft()I

    move-result v0

    goto :goto_f

    :cond_d
    iget v0, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    :goto_f
    move v4, v0

    if-nez p3, :cond_17

    .line 5
    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p3

    goto :goto_19

    :cond_17
    iget p3, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    :goto_19
    move v5, p3

    .line 6
    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView$b0;->r()Z

    move-result p3

    if-nez p3, :cond_38

    if-ne v2, v4, :cond_24

    if-eq v3, v5, :cond_38

    .line 7
    :cond_24
    invoke-virtual {p2}, Landroid/view/View;->getWidth()I

    move-result p3

    add-int/2addr p3, v4

    .line 8
    invoke-virtual {p2}, Landroid/view/View;->getHeight()I

    move-result v0

    add-int/2addr v0, v5

    .line 9
    invoke-virtual {p2, v4, v5, p3, v0}, Landroid/view/View;->layout(IIII)V

    move-object v0, p0

    move-object v1, p1

    .line 10
    invoke-virtual/range {v0 .. v5}, Lb/p/d/m;->a(Landroidx/recyclerview/widget/RecyclerView$b0;IIII)Z

    move-result p1

    return p1

    .line 11
    :cond_38
    invoke-virtual {p0, p1}, Lb/p/d/m;->g(Landroidx/recyclerview/widget/RecyclerView$b0;)Z

    move-result p1

    return p1
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V
    .registers 3

    return-void
.end method

.method public c(Landroidx/recyclerview/widget/RecyclerView$b0;Landroidx/recyclerview/widget/RecyclerView$l$c;Landroidx/recyclerview/widget/RecyclerView$l$c;)Z
    .registers 10

    .line 1
    iget v0, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    iget v1, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    if-ne v0, v1, :cond_12

    iget v0, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    iget v1, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    if-eq v0, v1, :cond_d

    goto :goto_12

    .line 2
    :cond_d
    invoke-virtual {p0, p1}, Lb/p/d/m;->j(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    const/4 p1, 0x0

    return p1

    .line 3
    :cond_12
    :goto_12
    iget v2, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    iget v3, p2, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    iget v4, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->a:I

    iget v5, p3, Landroidx/recyclerview/widget/RecyclerView$l$c;->b:I

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Lb/p/d/m;->a(Landroidx/recyclerview/widget/RecyclerView$b0;IIII)Z

    move-result p1

    return p1
.end method

.method public d(Landroidx/recyclerview/widget/RecyclerView$b0;Z)V
    .registers 3

    return-void
.end method

.method public abstract f(Landroidx/recyclerview/widget/RecyclerView$b0;)Z
.end method

.method public abstract g(Landroidx/recyclerview/widget/RecyclerView$b0;)Z
.end method

.method public final h(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/p/d/m;->n(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$l;->b(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public final i(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/p/d/m;->o(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public final j(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/p/d/m;->p(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$l;->b(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/p/d/m;->q(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public final l(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/p/d/m;->r(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    .line 2
    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView$l;->b(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public final m(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/p/d/m;->s(Landroidx/recyclerview/widget/RecyclerView$b0;)V

    return-void
.end method

.method public n(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    return-void
.end method

.method public o(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    return-void
.end method

.method public p(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    return-void
.end method

.method public q(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    return-void
.end method

.method public r(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    return-void
.end method

.method public s(Landroidx/recyclerview/widget/RecyclerView$b0;)V
    .registers 2

    return-void
.end method
