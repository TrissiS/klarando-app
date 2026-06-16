.class public Lc/a/a/a/q/b;
.super Lc/a/a/a/f0/c;
.source "BottomNavigationMenuView.java"


# instance fields
.field public final C:I

.field public final D:I

.field public final E:I

.field public final F:I

.field public final G:I

.field public H:Z

.field public I:[I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/f0/c;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Landroid/widget/FrameLayout$LayoutParams;

    const/4 v0, -0x2

    invoke-direct {p1, v0, v0}, Landroid/widget/FrameLayout$LayoutParams;-><init>(II)V

    const/16 v0, 0x11

    .line 3
    iput v0, p1, Landroid/widget/FrameLayout$LayoutParams;->gravity:I

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 5
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    .line 6
    sget v0, Lc/a/a/a/d;->design_bottom_navigation_item_max_width:I

    .line 7
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lc/a/a/a/q/b;->C:I

    .line 8
    sget v0, Lc/a/a/a/d;->design_bottom_navigation_item_min_width:I

    .line 9
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lc/a/a/a/q/b;->D:I

    .line 10
    sget v0, Lc/a/a/a/d;->design_bottom_navigation_active_item_max_width:I

    .line 11
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lc/a/a/a/q/b;->E:I

    .line 12
    sget v0, Lc/a/a/a/d;->design_bottom_navigation_active_item_min_width:I

    .line 13
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    iput v0, p0, Lc/a/a/a/q/b;->F:I

    .line 14
    sget v0, Lc/a/a/a/d;->design_bottom_navigation_height:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    iput p1, p0, Lc/a/a/a/q/b;->G:I

    const/4 p1, 0x5

    new-array p1, p1, [I

    .line 15
    iput-object p1, p0, Lc/a/a/a/q/b;->I:[I

    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)Lc/a/a/a/f0/a;
    .registers 3

    .line 1
    new-instance v0, Lc/a/a/a/q/a;

    invoke-direct {v0, p1}, Lc/a/a/a/q/a;-><init>(Landroid/content/Context;)V

    return-object v0
.end method

.method public d()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Lc/a/a/a/q/b;->H:Z

    return v0
.end method

.method public onLayout(ZIIII)V
    .registers 10

    .line 1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result p1

    sub-int/2addr p4, p2

    sub-int/2addr p5, p3

    const/4 p2, 0x0

    const/4 p3, 0x0

    const/4 v0, 0x0

    :goto_9
    if-ge p3, p1, :cond_3b

    .line 2
    invoke-virtual {p0, p3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    .line 3
    invoke-virtual {v1}, Landroid/view/View;->getVisibility()I

    move-result v2

    const/16 v3, 0x8

    if-ne v2, v3, :cond_18

    goto :goto_38

    .line 4
    :cond_18
    invoke-static {p0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v2

    const/4 v3, 0x1

    if-ne v2, v3, :cond_2b

    sub-int v2, p4, v0

    .line 5
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    sub-int v3, v2, v3

    invoke-virtual {v1, v3, p2, v2, p5}, Landroid/view/View;->layout(IIII)V

    goto :goto_33

    .line 6
    :cond_2b
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v2

    add-int/2addr v2, v0

    invoke-virtual {v1, v0, p2, v2, p5}, Landroid/view/View;->layout(IIII)V

    .line 7
    :goto_33
    invoke-virtual {v1}, Landroid/view/View;->getMeasuredWidth()I

    move-result v1

    add-int/2addr v0, v1

    :goto_38
    add-int/lit8 p3, p3, 0x1

    goto :goto_9

    :cond_3b
    return-void
.end method

.method public onMeasure(II)V
    .registers 13

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/f0/c;->getMenu()Lb/b/p/j/g;

    move-result-object p2

    .line 2
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 3
    invoke-virtual {p2}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object p2

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p2

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v0

    .line 5
    iget v1, p0, Lc/a/a/a/q/b;->G:I

    const/high16 v2, 0x40000000    # 2.0f

    invoke-static {v1, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v1

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/f0/c;->getLabelVisibilityMode()I

    move-result v3

    invoke-virtual {p0, v3, p2}, Lc/a/a/a/f0/c;->a(II)Z

    move-result v3

    const/16 v4, 0x8

    const/4 v5, 0x1

    const/4 v6, 0x0

    if-eqz v3, :cond_ab

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/q/b;->d()Z

    move-result v3

    if-eqz v3, :cond_ab

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/f0/c;->getSelectedItemPosition()I

    move-result v3

    invoke-virtual {p0, v3}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 9
    iget v7, p0, Lc/a/a/a/q/b;->F:I

    .line 10
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v8

    if-eq v8, v4, :cond_53

    .line 11
    iget v8, p0, Lc/a/a/a/q/b;->E:I

    const/high16 v9, -0x80000000

    .line 12
    invoke-static {v8, v9}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v8

    .line 13
    invoke-virtual {v3, v8, v1}, Landroid/view/View;->measure(II)V

    .line 14
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v8

    invoke-static {v7, v8}, Ljava/lang/Math;->max(II)I

    move-result v7

    .line 15
    :cond_53
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v3

    if-eq v3, v4, :cond_5b

    const/4 v3, 0x1

    goto :goto_5c

    :cond_5b
    const/4 v3, 0x0

    :goto_5c
    sub-int/2addr p2, v3

    .line 16
    iget v3, p0, Lc/a/a/a/q/b;->D:I

    mul-int v3, v3, p2

    sub-int v3, p1, v3

    .line 17
    iget v8, p0, Lc/a/a/a/q/b;->E:I

    .line 18
    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    sub-int/2addr p1, v3

    if-nez p2, :cond_72

    const/4 v7, 0x1

    goto :goto_73

    :cond_72
    move v7, p2

    .line 19
    :goto_73
    div-int v7, p1, v7

    .line 20
    iget v8, p0, Lc/a/a/a/q/b;->C:I

    invoke-static {v7, v8}, Ljava/lang/Math;->min(II)I

    move-result v7

    mul-int p2, p2, v7

    sub-int/2addr p1, p2

    const/4 p2, 0x0

    :goto_7f
    if-ge p2, v0, :cond_dd

    .line 21
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v8

    invoke-virtual {v8}, Landroid/view/View;->getVisibility()I

    move-result v8

    if-eq v8, v4, :cond_a4

    .line 22
    iget-object v8, p0, Lc/a/a/a/q/b;->I:[I

    invoke-virtual {p0}, Lc/a/a/a/f0/c;->getSelectedItemPosition()I

    move-result v9

    if-ne p2, v9, :cond_95

    move v9, v3

    goto :goto_96

    :cond_95
    move v9, v7

    :goto_96
    aput v9, v8, p2

    if-lez p1, :cond_a8

    .line 23
    iget-object v8, p0, Lc/a/a/a/q/b;->I:[I

    aget v9, v8, p2

    add-int/2addr v9, v5

    aput v9, v8, p2

    add-int/lit8 p1, p1, -0x1

    goto :goto_a8

    .line 24
    :cond_a4
    iget-object v8, p0, Lc/a/a/a/q/b;->I:[I

    aput v6, v8, p2

    :cond_a8
    :goto_a8
    add-int/lit8 p2, p2, 0x1

    goto :goto_7f

    :cond_ab
    if-nez p2, :cond_af

    const/4 v3, 0x1

    goto :goto_b0

    :cond_af
    move v3, p2

    .line 25
    :goto_b0
    div-int v3, p1, v3

    .line 26
    iget v7, p0, Lc/a/a/a/q/b;->E:I

    invoke-static {v3, v7}, Ljava/lang/Math;->min(II)I

    move-result v3

    mul-int p2, p2, v3

    sub-int/2addr p1, p2

    const/4 p2, 0x0

    :goto_bc
    if-ge p2, v0, :cond_dd

    .line 27
    invoke-virtual {p0, p2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v7

    invoke-virtual {v7}, Landroid/view/View;->getVisibility()I

    move-result v7

    if-eq v7, v4, :cond_d6

    .line 28
    iget-object v7, p0, Lc/a/a/a/q/b;->I:[I

    aput v3, v7, p2

    if-lez p1, :cond_da

    .line 29
    aget v8, v7, p2

    add-int/2addr v8, v5

    aput v8, v7, p2

    add-int/lit8 p1, p1, -0x1

    goto :goto_da

    .line 30
    :cond_d6
    iget-object v7, p0, Lc/a/a/a/q/b;->I:[I

    aput v6, v7, p2

    :cond_da
    :goto_da
    add-int/lit8 p2, p2, 0x1

    goto :goto_bc

    :cond_dd
    const/4 p1, 0x0

    const/4 p2, 0x0

    :goto_df
    if-ge p1, v0, :cond_109

    .line 31
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v3

    .line 32
    invoke-virtual {v3}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-ne v5, v4, :cond_ec

    goto :goto_106

    .line 33
    :cond_ec
    iget-object v5, p0, Lc/a/a/a/q/b;->I:[I

    aget v5, v5, p1

    .line 34
    invoke-static {v5, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result v5

    .line 35
    invoke-virtual {v3, v5, v1}, Landroid/view/View;->measure(II)V

    .line 36
    invoke-virtual {v3}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v5

    .line 37
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    iput v7, v5, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 38
    invoke-virtual {v3}, Landroid/view/View;->getMeasuredWidth()I

    move-result v3

    add-int/2addr p2, v3

    :goto_106
    add-int/lit8 p1, p1, 0x1

    goto :goto_df

    .line 39
    :cond_109
    invoke-static {p2, v2}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 40
    invoke-static {p2, p1, v6}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result p1

    iget p2, p0, Lc/a/a/a/q/b;->G:I

    .line 41
    invoke-static {p2, v1, v6}, Landroid/view/View;->resolveSizeAndState(III)I

    move-result p2

    .line 42
    invoke-virtual {p0, p1, p2}, Landroid/view/ViewGroup;->setMeasuredDimension(II)V

    return-void
.end method

.method public setItemHorizontalTranslationEnabled(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lc/a/a/a/q/b;->H:Z

    return-void
.end method
