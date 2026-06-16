.class public Lb/p/d/g;
.super Landroidx/recyclerview/widget/RecyclerView$x;
.source "LinearSmoothScroller.java"


# instance fields
.field public final i:Landroid/view/animation/LinearInterpolator;

.field public final j:Landroid/view/animation/DecelerateInterpolator;

.field public k:Landroid/graphics/PointF;

.field public final l:Landroid/util/DisplayMetrics;

.field public m:Z

.field public n:F

.field public o:I

.field public p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$x;-><init>()V

    .line 2
    new-instance v0, Landroid/view/animation/LinearInterpolator;

    invoke-direct {v0}, Landroid/view/animation/LinearInterpolator;-><init>()V

    iput-object v0, p0, Lb/p/d/g;->i:Landroid/view/animation/LinearInterpolator;

    .line 3
    new-instance v0, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v0}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iput-object v0, p0, Lb/p/d/g;->j:Landroid/view/animation/DecelerateInterpolator;

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lb/p/d/g;->m:Z

    .line 5
    iput v0, p0, Lb/p/d/g;->o:I

    iput v0, p0, Lb/p/d/g;->p:I

    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iput-object p1, p0, Lb/p/d/g;->l:Landroid/util/DisplayMetrics;

    return-void
.end method


# virtual methods
.method public a(Landroid/util/DisplayMetrics;)F
    .registers 3

    .line 12
    iget p1, p1, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float p1, p1

    const/high16 v0, 0x41c80000    # 25.0f

    div-float/2addr v0, p1

    return v0
.end method

.method public a(IIIII)I
    .registers 7

    const/4 v0, -0x1

    if-eq p5, v0, :cond_1c

    if-eqz p5, :cond_12

    const/4 p1, 0x1

    if-ne p5, p1, :cond_a

    sub-int/2addr p4, p2

    return p4

    .line 24
    :cond_a
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "snap preference should be one of the constants defined in SmoothScroller, starting with SNAP_"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_12
    sub-int/2addr p3, p1

    if-lez p3, :cond_16

    return p3

    :cond_16
    sub-int/2addr p4, p2

    if-gez p4, :cond_1a

    return p4

    :cond_1a
    const/4 p1, 0x0

    return p1

    :cond_1c
    sub-int/2addr p3, p1

    return p3
.end method

.method public a(Landroid/view/View;I)I
    .registers 13

    .line 25
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->b()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    if-eqz v0, :cond_38

    .line 26
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->a()Z

    move-result v1

    if-nez v1, :cond_d

    goto :goto_38

    .line 27
    :cond_d
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 28
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->f(Landroid/view/View;)I

    move-result v2

    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->leftMargin:I

    sub-int v5, v2, v3

    .line 29
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->i(Landroid/view/View;)I

    move-result p1

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->rightMargin:I

    add-int v6, p1, v1

    .line 30
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->o()I

    move-result v7

    .line 31
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->r()I

    move-result p1

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->p()I

    move-result v0

    sub-int v8, p1, v0

    move-object v4, p0

    move v9, p2

    .line 32
    invoke-virtual/range {v4 .. v9}, Lb/p/d/g;->a(IIIII)I

    move-result p1

    return p1

    :cond_38
    :goto_38
    const/4 p1, 0x0

    return p1
.end method

.method public a(IILandroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$x$a;)V
    .registers 5

    .line 6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->a()I

    move-result p3

    if-nez p3, :cond_a

    .line 7
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->h()V

    return-void

    .line 8
    :cond_a
    iget p3, p0, Lb/p/d/g;->o:I

    invoke-virtual {p0, p3, p1}, Lb/p/d/g;->b(II)I

    move-result p1

    iput p1, p0, Lb/p/d/g;->o:I

    .line 9
    iget p1, p0, Lb/p/d/g;->p:I

    invoke-virtual {p0, p1, p2}, Lb/p/d/g;->b(II)I

    move-result p1

    iput p1, p0, Lb/p/d/g;->p:I

    .line 10
    iget p2, p0, Lb/p/d/g;->o:I

    if-nez p2, :cond_23

    if-nez p1, :cond_23

    .line 11
    invoke-virtual {p0, p4}, Lb/p/d/g;->a(Landroidx/recyclerview/widget/RecyclerView$x$a;)V

    :cond_23
    return-void
.end method

.method public a(Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView$y;Landroidx/recyclerview/widget/RecyclerView$x$a;)V
    .registers 6

    .line 1
    invoke-virtual {p0}, Lb/p/d/g;->i()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lb/p/d/g;->a(Landroid/view/View;I)I

    move-result p2

    .line 2
    invoke-virtual {p0}, Lb/p/d/g;->k()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lb/p/d/g;->b(Landroid/view/View;I)I

    move-result p1

    mul-int v0, p2, p2

    mul-int v1, p1, p1

    add-int/2addr v0, v1

    int-to-double v0, v0

    .line 3
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v0

    double-to-int v0, v0

    .line 4
    invoke-virtual {p0, v0}, Lb/p/d/g;->d(I)I

    move-result v0

    if-lez v0, :cond_28

    neg-int p2, p2

    neg-int p1, p1

    .line 5
    iget-object v1, p0, Lb/p/d/g;->j:Landroid/view/animation/DecelerateInterpolator;

    invoke-virtual {p3, p2, p1, v0, v1}, Landroidx/recyclerview/widget/RecyclerView$x$a;->a(IIILandroid/view/animation/Interpolator;)V

    :cond_28
    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView$x$a;)V
    .registers 6

    .line 13
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->c()I

    move-result v0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$x;->a(I)Landroid/graphics/PointF;

    move-result-object v0

    if-eqz v0, :cond_4d

    .line 14
    iget v1, v0, Landroid/graphics/PointF;->x:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-nez v1, :cond_18

    iget v1, v0, Landroid/graphics/PointF;->y:F

    cmpl-float v1, v1, v2

    if-nez v1, :cond_18

    goto :goto_4d

    .line 15
    :cond_18
    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView$x;->a(Landroid/graphics/PointF;)V

    .line 16
    iput-object v0, p0, Lb/p/d/g;->k:Landroid/graphics/PointF;

    .line 17
    iget v1, v0, Landroid/graphics/PointF;->x:F

    const v2, 0x461c4000    # 10000.0f

    mul-float v1, v1, v2

    float-to-int v1, v1

    iput v1, p0, Lb/p/d/g;->o:I

    .line 18
    iget v0, v0, Landroid/graphics/PointF;->y:F

    mul-float v0, v0, v2

    float-to-int v0, v0

    iput v0, p0, Lb/p/d/g;->p:I

    const/16 v0, 0x2710

    .line 19
    invoke-virtual {p0, v0}, Lb/p/d/g;->e(I)I

    move-result v0

    .line 20
    iget v1, p0, Lb/p/d/g;->o:I

    int-to-float v1, v1

    const v2, 0x3f99999a    # 1.2f

    mul-float v1, v1, v2

    float-to-int v1, v1

    iget v3, p0, Lb/p/d/g;->p:I

    int-to-float v3, v3

    mul-float v3, v3, v2

    float-to-int v3, v3

    int-to-float v0, v0

    mul-float v0, v0, v2

    float-to-int v0, v0

    iget-object v2, p0, Lb/p/d/g;->i:Landroid/view/animation/LinearInterpolator;

    invoke-virtual {p1, v1, v3, v0, v2}, Landroidx/recyclerview/widget/RecyclerView$x$a;->a(IIILandroid/view/animation/Interpolator;)V

    return-void

    .line 21
    :cond_4d
    :goto_4d
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->c()I

    move-result v0

    .line 22
    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView$x$a;->a(I)V

    .line 23
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->h()V

    return-void
.end method

.method public final b(II)I
    .registers 3

    sub-int p2, p1, p2

    mul-int p1, p1, p2

    if-gtz p1, :cond_8

    const/4 p1, 0x0

    return p1

    :cond_8
    return p2
.end method

.method public b(Landroid/view/View;I)I
    .registers 13

    .line 1
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$x;->b()Landroidx/recyclerview/widget/RecyclerView$o;

    move-result-object v0

    if-eqz v0, :cond_38

    .line 2
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->b()Z

    move-result v1

    if-nez v1, :cond_d

    goto :goto_38

    .line 3
    :cond_d
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    check-cast v1, Landroidx/recyclerview/widget/RecyclerView$LayoutParams;

    .line 4
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->j(Landroid/view/View;)I

    move-result v2

    iget v3, v1, Landroid/view/ViewGroup$MarginLayoutParams;->topMargin:I

    sub-int v5, v2, v3

    .line 5
    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView$o;->e(Landroid/view/View;)I

    move-result p1

    iget v1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    add-int v6, p1, v1

    .line 6
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->q()I

    move-result v7

    .line 7
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->h()I

    move-result p1

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView$o;->n()I

    move-result v0

    sub-int v8, p1, v0

    move-object v4, p0

    move v9, p2

    .line 8
    invoke-virtual/range {v4 .. v9}, Lb/p/d/g;->a(IIIII)I

    move-result p1

    return p1

    :cond_38
    :goto_38
    const/4 p1, 0x0

    return p1
.end method

.method public d(I)I
    .registers 6

    .line 1
    invoke-virtual {p0, p1}, Lb/p/d/g;->e(I)I

    move-result p1

    int-to-double v0, p1

    const-wide v2, 0x3fd57a786c22680aL    # 0.3356

    div-double/2addr v0, v2

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    return p1
.end method

.method public e(I)I
    .registers 4

    .line 1
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Lb/p/d/g;->j()F

    move-result v0

    mul-float p1, p1, v0

    float-to-double v0, p1

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int p1, v0

    return p1
.end method

.method public f()V
    .registers 1

    return-void
.end method

.method public g()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    iput v0, p0, Lb/p/d/g;->p:I

    iput v0, p0, Lb/p/d/g;->o:I

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/p/d/g;->k:Landroid/graphics/PointF;

    return-void
.end method

.method public i()I
    .registers 4

    .line 1
    iget-object v0, p0, Lb/p/d/g;->k:Landroid/graphics/PointF;

    if-eqz v0, :cond_14

    iget v0, v0, Landroid/graphics/PointF;->x:F

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-nez v2, :cond_c

    goto :goto_14

    :cond_c
    cmpl-float v0, v0, v1

    if-lez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_15

    :cond_12
    const/4 v0, -0x1

    goto :goto_15

    :cond_14
    :goto_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method

.method public final j()F
    .registers 2

    .line 1
    iget-boolean v0, p0, Lb/p/d/g;->m:Z

    if-nez v0, :cond_f

    .line 2
    iget-object v0, p0, Lb/p/d/g;->l:Landroid/util/DisplayMetrics;

    invoke-virtual {p0, v0}, Lb/p/d/g;->a(Landroid/util/DisplayMetrics;)F

    move-result v0

    iput v0, p0, Lb/p/d/g;->n:F

    const/4 v0, 0x1

    .line 3
    iput-boolean v0, p0, Lb/p/d/g;->m:Z

    .line 4
    :cond_f
    iget v0, p0, Lb/p/d/g;->n:F

    return v0
.end method

.method public k()I
    .registers 4

    .line 1
    iget-object v0, p0, Lb/p/d/g;->k:Landroid/graphics/PointF;

    if-eqz v0, :cond_14

    iget v0, v0, Landroid/graphics/PointF;->y:F

    const/4 v1, 0x0

    cmpl-float v2, v0, v1

    if-nez v2, :cond_c

    goto :goto_14

    :cond_c
    cmpl-float v0, v0, v1

    if-lez v0, :cond_12

    const/4 v0, 0x1

    goto :goto_15

    :cond_12
    const/4 v0, -0x1

    goto :goto_15

    :cond_14
    :goto_14
    const/4 v0, 0x0

    :goto_15
    return v0
.end method
