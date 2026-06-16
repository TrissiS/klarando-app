.class public Landroidx/constraintlayout/widget/Barrier;
.super Landroidx/constraintlayout/widget/ConstraintHelper;
.source "Barrier.java"


# instance fields
.field public p:I

.field public q:I

.field public r:Lb/f/b/k/a;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Landroidx/constraintlayout/widget/ConstraintHelper;-><init>(Landroid/content/Context;)V

    const/16 p1, 0x8

    .line 2
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 3
    invoke-direct {p0, p1, p2}, Landroidx/constraintlayout/widget/ConstraintHelper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p1, 0x8

    .line 4
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 5
    invoke-direct {p0, p1, p2, p3}, Landroidx/constraintlayout/widget/ConstraintHelper;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p1, 0x8

    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method


# virtual methods
.method public a(Landroid/util/AttributeSet;)V
    .registers 8

    .line 16
    invoke-super {p0, p1}, Landroidx/constraintlayout/widget/ConstraintHelper;->a(Landroid/util/AttributeSet;)V

    .line 17
    new-instance v0, Lb/f/b/k/a;

    invoke-direct {v0}, Lb/f/b/k/a;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    if-eqz p1, :cond_4d

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lb/f/c/f;->ConstraintLayout_Layout:[I

    invoke-virtual {v0, p1, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 19
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_1c
    if-ge v2, v0, :cond_4d

    .line 20
    invoke-virtual {p1, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    .line 21
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_barrierDirection:I

    if-ne v3, v4, :cond_2e

    .line 22
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/widget/Barrier;->setType(I)V

    goto :goto_4a

    .line 23
    :cond_2e
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_barrierAllowsGoneWidgets:I

    if-ne v3, v4, :cond_3d

    .line 24
    iget-object v4, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    const/4 v5, 0x1

    invoke-virtual {p1, v3, v5}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-virtual {v4, v3}, Lb/f/b/k/a;->d(Z)V

    goto :goto_4a

    .line 25
    :cond_3d
    sget v4, Lb/f/c/f;->ConstraintLayout_Layout_barrierMargin:I

    if-ne v3, v4, :cond_4a

    .line 26
    invoke-virtual {p1, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    .line 27
    iget-object v4, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    invoke-virtual {v4, v3}, Lb/f/b/k/a;->u(I)V

    :cond_4a
    :goto_4a
    add-int/lit8 v2, v2, 0x1

    goto :goto_1c

    .line 28
    :cond_4d
    iget-object p1, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    iput-object p1, p0, Landroidx/constraintlayout/widget/ConstraintHelper;->k:Lb/f/b/k/i;

    .line 29
    invoke-virtual {p0}, Landroidx/constraintlayout/widget/ConstraintHelper;->b()V

    return-void
.end method

.method public final a(Lb/f/b/k/e;IZ)V
    .registers 9

    .line 1
    iput p2, p0, Landroidx/constraintlayout/widget/Barrier;->q:I

    .line 2
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x6

    const/4 v3, 0x5

    const/16 v4, 0x11

    if-ge p2, v4, :cond_18

    .line 3
    iget p2, p0, Landroidx/constraintlayout/widget/Barrier;->p:I

    if-ne p2, v3, :cond_13

    .line 4
    iput v1, p0, Landroidx/constraintlayout/widget/Barrier;->q:I

    goto :goto_31

    :cond_13
    if-ne p2, v2, :cond_31

    .line 5
    iput v0, p0, Landroidx/constraintlayout/widget/Barrier;->q:I

    goto :goto_31

    :cond_18
    if-eqz p3, :cond_26

    .line 6
    iget p2, p0, Landroidx/constraintlayout/widget/Barrier;->p:I

    if-ne p2, v3, :cond_21

    .line 7
    iput v0, p0, Landroidx/constraintlayout/widget/Barrier;->q:I

    goto :goto_31

    :cond_21
    if-ne p2, v2, :cond_31

    .line 8
    iput v1, p0, Landroidx/constraintlayout/widget/Barrier;->q:I

    goto :goto_31

    .line 9
    :cond_26
    iget p2, p0, Landroidx/constraintlayout/widget/Barrier;->p:I

    if-ne p2, v3, :cond_2d

    .line 10
    iput v1, p0, Landroidx/constraintlayout/widget/Barrier;->q:I

    goto :goto_31

    :cond_2d
    if-ne p2, v2, :cond_31

    .line 11
    iput v0, p0, Landroidx/constraintlayout/widget/Barrier;->q:I

    .line 12
    :cond_31
    :goto_31
    instance-of p2, p1, Lb/f/b/k/a;

    if-eqz p2, :cond_3c

    .line 13
    check-cast p1, Lb/f/b/k/a;

    .line 14
    iget p2, p0, Landroidx/constraintlayout/widget/Barrier;->q:I

    invoke-virtual {p1, p2}, Lb/f/b/k/a;->t(I)V

    :cond_3c
    return-void
.end method

.method public a(Lb/f/b/k/e;Z)V
    .registers 4

    .line 15
    iget v0, p0, Landroidx/constraintlayout/widget/Barrier;->p:I

    invoke-virtual {p0, p1, v0, p2}, Landroidx/constraintlayout/widget/Barrier;->a(Lb/f/b/k/e;IZ)V

    return-void
.end method

.method public a(Lb/f/c/c$a;Lb/f/b/k/j;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/f/c/c$a;",
            "Lb/f/b/k/j;",
            "Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;",
            "Landroid/util/SparseArray<",
            "Lb/f/b/k/e;",
            ">;)V"
        }
    .end annotation

    .line 30
    invoke-super {p0, p1, p2, p3, p4}, Landroidx/constraintlayout/widget/ConstraintHelper;->a(Lb/f/c/c$a;Lb/f/b/k/j;Landroidx/constraintlayout/widget/ConstraintLayout$LayoutParams;Landroid/util/SparseArray;)V

    .line 31
    instance-of p3, p2, Lb/f/b/k/a;

    if-eqz p3, :cond_29

    .line 32
    move-object p3, p2

    check-cast p3, Lb/f/b/k/a;

    .line 33
    invoke-virtual {p2}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object p2

    check-cast p2, Lb/f/b/k/f;

    .line 34
    invoke-virtual {p2}, Lb/f/b/k/f;->S()Z

    move-result p2

    .line 35
    iget-object p4, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget p4, p4, Lb/f/c/c$b;->b0:I

    invoke-virtual {p0, p3, p4, p2}, Landroidx/constraintlayout/widget/Barrier;->a(Lb/f/b/k/e;IZ)V

    .line 36
    iget-object p2, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget-boolean p2, p2, Lb/f/c/c$b;->j0:Z

    invoke-virtual {p3, p2}, Lb/f/b/k/a;->d(Z)V

    .line 37
    iget-object p1, p1, Lb/f/c/c$a;->d:Lb/f/c/c$b;

    iget p1, p1, Lb/f/c/c$b;->c0:I

    invoke-virtual {p3, p1}, Lb/f/b/k/a;->u(I)V

    :cond_29
    return-void
.end method

.method public c()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    invoke-virtual {v0}, Lb/f/b/k/a;->J()Z

    move-result v0

    return v0
.end method

.method public getMargin()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    invoke-virtual {v0}, Lb/f/b/k/a;->L()I

    move-result v0

    return v0
.end method

.method public getType()I
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/widget/Barrier;->p:I

    return v0
.end method

.method public setAllowsGoneWidget(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    invoke-virtual {v0, p1}, Lb/f/b/k/a;->d(Z)V

    return-void
.end method

.method public setDpMargin(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    int-to-float p1, p1

    mul-float p1, p1, v0

    const/high16 v0, 0x3f000000    # 0.5f

    add-float/2addr p1, v0

    float-to-int p1, p1

    .line 2
    iget-object v0, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    invoke-virtual {v0, p1}, Lb/f/b/k/a;->u(I)V

    return-void
.end method

.method public setMargin(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/Barrier;->r:Lb/f/b/k/a;

    invoke-virtual {v0, p1}, Lb/f/b/k/a;->u(I)V

    return-void
.end method

.method public setType(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/constraintlayout/widget/Barrier;->p:I

    return-void
.end method
