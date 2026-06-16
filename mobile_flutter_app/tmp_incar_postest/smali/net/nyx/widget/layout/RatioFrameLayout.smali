.class public final Lnet/nyx/widget/layout/RatioFrameLayout;
.super Landroid/widget/FrameLayout;
.source "RatioFrameLayout.java"


# instance fields
.field public h:F

.field public i:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/layout/RatioFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/layout/RatioFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    const/4 v0, 0x0

    .line 3
    invoke-direct {p0, p1, p2, p3, v0}, Lnet/nyx/widget/layout/RatioFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 7

    .line 4
    invoke-direct {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 5
    sget-object p3, Ld/a/d/f;->RatioFrameLayout:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    sget p2, Ld/a/d/f;->RatioFrameLayout_sizeRatio:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p3

    if-nez p3, :cond_48

    const-string p3, ":"

    .line 8
    invoke-virtual {p2, p3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p2

    .line 9
    array-length p3, p2

    const/4 p4, 0x0

    const/4 v0, 0x1

    if-eq p3, v0, :cond_3c

    const/4 v1, 0x2

    if-ne p3, v1, :cond_34

    .line 10
    aget-object p3, p2, p4

    invoke-static {p3}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p3

    iput p3, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->h:F

    .line 11
    aget-object p2, p2, v0

    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p2

    iput p2, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->i:F

    goto :goto_48

    .line 12
    :cond_34
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "are you ok?"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 13
    :cond_3c
    aget-object p2, p2, p4

    invoke-static {p2}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    move-result p2

    iput p2, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->h:F

    const/high16 p2, 0x3f800000    # 1.0f

    .line 14
    iput p2, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->i:F

    .line 15
    :cond_48
    :goto_48
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public getHeightRatio()F
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->i:F

    return v0
.end method

.method public getSizeRatio()F
    .registers 3

    .line 1
    iget v0, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->h:F

    iget v1, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->i:F

    div-float/2addr v0, v1

    return v0
.end method

.method public getWidthRatio()F
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->h:F

    return v0
.end method

.method public onMeasure(II)V
    .registers 12

    .line 1
    iget v0, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->h:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_6e

    iget v0, p0, Lnet/nyx/widget/layout/RatioFrameLayout;->i:F

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_6e

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/layout/RatioFrameLayout;->getSizeRatio()F

    move-result v0

    .line 3
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v1

    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v2

    .line 5
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v3

    .line 6
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v4

    .line 7
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v5

    .line 8
    iget v6, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    const/4 v7, -0x2

    const/high16 v8, 0x40000000    # 2.0f

    if-eq v6, v7, :cond_4e

    iget v6, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v6, v7, :cond_4e

    if-ne v2, v8, :cond_4e

    if-ne v4, v8, :cond_4e

    int-to-float v1, v3

    div-float v2, v1, v0

    int-to-float v3, v5

    cmpg-float v4, v2, v3

    if-gtz v4, :cond_42

    float-to-int p2, v2

    .line 9
    invoke-static {p2, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    goto :goto_6e

    :cond_42
    mul-float v3, v3, v0

    cmpg-float v0, v3, v1

    if-gtz v0, :cond_6e

    float-to-int p1, v3

    .line 10
    invoke-static {p1, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    goto :goto_6e

    .line 11
    :cond_4e
    iget v6, v1, Landroid/view/ViewGroup$LayoutParams;->width:I

    if-eq v6, v7, :cond_5e

    if-ne v2, v8, :cond_5e

    if-eq v4, v8, :cond_5e

    int-to-float p2, v3

    div-float/2addr p2, v0

    float-to-int p2, p2

    .line 12
    invoke-static {p2, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    goto :goto_6e

    .line 13
    :cond_5e
    iget v1, v1, Landroid/view/ViewGroup$LayoutParams;->height:I

    if-eq v1, v7, :cond_6e

    if-ne v4, v8, :cond_6e

    if-eq v2, v8, :cond_6e

    int-to-float p1, v5

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 14
    invoke-static {p1, v8}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 15
    :cond_6e
    :goto_6e
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    return-void
.end method
