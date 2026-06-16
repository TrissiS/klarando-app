.class public Lc/a/a/a/g0/b;
.super Lc/a/a/a/f0/c;
.source "NavigationRailMenuView.java"


# instance fields
.field public final C:Landroid/widget/FrameLayout$LayoutParams;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/f0/c;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x1

    const/4 v1, -0x2

    invoke-direct {p1, v0, v1}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    iput-object p1, p0, Lc/a/a/a/g0/b;->C:Landroid/widget/FrameLayout$LayoutParams;

    const/16 v0, 0x31

    .line 3
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public final a(III)I
    .registers 5

    const/4 v0, 0x1

    .line 2
    invoke-static {v0, p3}, Ljava/lang/Math;->max(II)I

    move-result p3

    div-int/2addr p2, p3

    .line 3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    const/4 p2, 0x0

    .line 4
    invoke-static {p1, p2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    return p1
.end method

.method public final a(IIILandroid/view/View;)I
    .registers 8

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/g0/b;->a(III)I

    const/4 v0, 0x0

    if-nez p4, :cond_b

    .line 6
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/g0/b;->a(III)I

    move-result p2

    goto :goto_13

    .line 7
    :cond_b
    invoke-virtual {p4}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 8
    :goto_13
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p3

    const/4 v1, 0x0

    :goto_18
    if-ge v0, p3, :cond_28

    .line 9
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    if-eq v2, p4, :cond_25

    .line 10
    invoke-virtual {p0, v2, p1, p2}, Lc/a/a/a/g0/b;->a(Landroid/view/View;II)I

    move-result v2

    add-int/2addr v1, v2

    :cond_25
    add-int/lit8 v0, v0, 0x1

    goto :goto_18

    :cond_28
    return v1
.end method

.method public final a(Landroid/view/View;II)I
    .registers 6

    .line 11
    invoke-virtual {p1}, Landroid/view/View;->getVisibility()I

    move-result v0

    const/16 v1, 0x8

    if-eq v0, v1, :cond_10

    .line 12
    invoke-virtual {p1, p2, p3}, Landroid/view/View;->measure(II)V

    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    move-result p1

    return p1

    :cond_10
    const/4 p1, 0x0

    return p1
.end method

.method public a(Landroid/content/Context;)Lc/a/a/a/f0/a;
    .registers 3

    .line 1
    new-instance v0, Lc/a/a/a/g0/a;

    invoke-direct {v0, p1}, Lc/a/a/a/g0/a;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public final b(III)I
    .registers 6

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/f0/c;->getSelectedItemPosition()I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_16

    .line 2
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/g0/b;->a(III)I

    move-result v1

    .line 3
    invoke-virtual {p0, v0, p1, v1}, Lc/a/a/a/g0/b;->a(Landroid/view/View;II)I

    move-result v1

    sub-int/2addr p2, v1

    add-int/lit8 p3, p3, -0x1

    goto :goto_17

    :cond_16
    const/4 v1, 0x0

    .line 4
    :goto_17
    invoke-virtual {p0, p1, p2, p3, v0}, Lc/a/a/a/g0/b;->a(IIILandroid/view/View;)I

    move-result p1

    add-int/2addr v1, p1

    return v1
.end method

.method public d()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/g0/b;->C:Landroid/widget/FrameLayout$LayoutParams;

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    and-int/lit8 v0, v0, 0x70

    const/16 v1, 0x30

    if-ne v0, v1, :cond_c

    const/4 v0, 0x1

    goto :goto_d

    :cond_c
    const/4 v0, 0x0

    :goto_d
    return v0
.end method

.method public getMenuGravity()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/g0/b;->C:Landroid/widget/FrameLayout$LayoutParams;

    iget v0, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    return v0
.end method

.method public onLayout(ZIIII)V
    .registers 9

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    sub-int/2addr p4, p2

    const/4 p2, 0x0

    const/4 p3, 0x0

    const/4 p5, 0x0

    :goto_8
    if-ge p3, p1, :cond_22

    .line 2
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getVisibility()I

    move-result v1

    const/16 v2, 0x8

    if-eq v1, v2, :cond_1f

    .line 4
    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v1

    add-int/2addr v1, p5

    .line 5
    invoke-virtual {v0, p2, p5, p4, v1}, Landroid/view/View;->layout(IIII)V

    move p5, v1

    :cond_1f
    add-int/lit8 p3, p3, 0x1

    goto :goto_8

    :cond_22
    return-void
.end method

.method public onMeasure(II)V
    .registers 6

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/f0/c;->getMenu()Lb/b/p/j/g;

    move-result-object v1

    invoke-virtual {v1}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-le v1, v2, :cond_22

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/f0/c;->getLabelVisibilityMode()I

    move-result v2

    invoke-virtual {p0, v2, v1}, Lc/a/a/a/f0/c;->a(II)Z

    move-result v2

    if-eqz v2, :cond_22

    .line 4
    invoke-virtual {p0, p1, v0, v1}, Lc/a/a/a/g0/b;->b(III)I

    move-result v0

    goto :goto_27

    :cond_22
    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, p1, v0, v1, v2}, Lc/a/a/a/g0/b;->a(IIILandroid/view/View;)I

    move-result v0

    .line 6
    :goto_27
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v1

    const/4 v2, 0x0

    .line 7
    invoke-static {v1, p1, v2}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result p1

    .line 8
    invoke-static {v0, p2, v2}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result p2

    .line 9
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    return-void
.end method

.method public setMenuGravity(I)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/g0/b;->C:Landroid/widget/FrameLayout$LayoutParams;

    iget v1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    if-eq v1, p1, :cond_b

    .line 2
    iput p1, v0, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 3
    invoke-virtual {p0, v0}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    :cond_b
    return-void
.end method
