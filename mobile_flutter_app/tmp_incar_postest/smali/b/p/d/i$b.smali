.class public final Lb/p/d/i$b;
.super Lb/p/d/i;
.source "OrientationHelper.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lb/p/d/i;->b(Landroidx/recyclerview/widget/RecyclerView$o;)Lb/p/d/i;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = null
.end annotation


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView$o;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lb/p/d/i;-><init>(Landroidx/recyclerview/widget/RecyclerView$o;Lb/p/d/i$a;)V

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->h()I

    move-result v0

    return v0
.end method

.method public a(Landroid/view/View;)I
    .registers 4

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 4
    iget-object v1, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->e(Landroid/view/View;)I

    move-result p1

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr p1, v0

    return p1
.end method

.method public a(I)V
    .registers 3

    .line 2
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->f(I)V

    return-void
.end method

.method public b()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->h()I

    move-result v0

    iget-object v1, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$o;->n()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public b(Landroid/view/View;)I
    .registers 4

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 3
    iget-object v1, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->g(Landroid/view/View;)I

    move-result p1

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    add-int/2addr p1, v1

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int/2addr p1, v0

    return p1
.end method

.method public c()I
    .registers 2

    .line 3
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->n()I

    move-result v0

    return v0
.end method

.method public c(Landroid/view/View;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 2
    iget-object v1, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->h(Landroid/view/View;)I

    move-result p1

    iget v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    add-int/2addr p1, v1

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int/2addr p1, v0

    return p1
.end method

.method public d()I
    .registers 2

    .line 3
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->i()I

    move-result v0

    return v0
.end method

.method public d(Landroid/view/View;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    check-cast v0, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 2
    iget-object v1, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v1, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->j(Landroid/view/View;)I

    move-result p1

    iget v0, v0, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int/2addr p1, v0

    return p1
.end method

.method public e()I
    .registers 2

    .line 3
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->s()I

    move-result v0

    return v0
.end method

.method public e(Landroid/view/View;)I
    .registers 5

    .line 1
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    iget-object v1, p0, Lb/p/d/i;->c:Landroid/graphics/Rect;

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v2, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;ZLandroid/graphics/Rect;)V

    .line 2
    iget-object p1, p0, Lb/p/d/i;->c:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    return p1
.end method

.method public f()I
    .registers 2

    .line 1
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->q()I

    move-result v0

    return v0
.end method

.method public f(Landroid/view/View;)I
    .registers 5

    .line 2
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    iget-object v1, p0, Lb/p/d/i;->c:Landroid/graphics/Rect;

    const/4 v2, 0x1

    invoke-virtual {v0, p1, v2, v1}, Landroidx/recyclerview/widget/RecyclerView$o;->a(Landroid/view/View;ZLandroid/graphics/Rect;)V

    .line 3
    iget-object p1, p0, Lb/p/d/i;->c:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    return p1
.end method

.method public g()I
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->h()I

    move-result v0

    iget-object v1, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$o;->q()I

    move-result v1

    sub-int/2addr v0, v1

    iget-object v1, p0, Lb/p/d/i;->a:Landroidx/recyclerview/widget/RecyclerView$o;

    .line 2
    invoke-virtual {v1}, Landroidx/recyclerview/widget/RecyclerView$o;->n()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method
