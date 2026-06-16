.class public Lb/s/i;
.super Landroid/view/ViewGroup;
.source "GhostViewPort.java"

# interfaces
.implements Lb/s/f;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "ViewConstructor"
    }
.end annotation


# instance fields
.field public h:Landroid/view/ViewGroup;

.field public i:Landroid/view/View;

.field public final j:Landroid/view/View;

.field public k:I

.field public l:Landroid/graphics/Matrix;

.field public final m:Landroid/view/ViewTreeObserver$OnPreDrawListener;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/view/ViewGroup;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance v0, Lb/s/i$a;

    invoke-direct {v0, p0}, Lb/s/i$a;-><init>(Lb/s/i;)V

    iput-object v0, p0, Lb/s/i;->m:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    .line 3
    iput-object p1, p0, Lb/s/i;->j:Landroid/view/View;

    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setWillNotDraw(Z)V

    const/4 p1, 0x2

    const/4 v0, 0x0

    .line 5
    invoke-virtual {p0, p1, v0}, Landroid/view/ViewGroup;->setLayerType(ILandroid/graphics/Paint;)V

    return-void
.end method

.method public static a(Landroid/view/View;)Lb/s/i;
    .registers 2

    .line 9
    sget v0, Lb/s/p;->ghost_view:I

    invoke-virtual {p0, v0}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lb/s/i;

    return-object p0
.end method

.method public static a(Landroid/view/View;Landroid/view/ViewGroup;Landroid/graphics/Matrix;)Lb/s/i;
    .registers 7

    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    instance-of v0, v0, Landroid/view/ViewGroup;

    if-eqz v0, :cond_58

    .line 12
    invoke-static {p1}, Lb/s/g;->a(Landroid/view/ViewGroup;)Lb/s/g;

    move-result-object v0

    .line 13
    invoke-static {p0}, Lb/s/i;->a(Landroid/view/View;)Lb/s/i;

    move-result-object v1

    const/4 v2, 0x0

    if-eqz v1, :cond_21

    .line 14
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    check-cast v3, Lb/s/g;

    if-eq v3, v0, :cond_21

    .line 15
    iget v2, v1, Lb/s/i;->k:I

    .line 16
    invoke-virtual {v3, v1}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    const/4 v1, 0x0

    :cond_21
    if-nez v1, :cond_4c

    if-nez p2, :cond_2d

    .line 17
    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    .line 18
    invoke-static {p0, p1, p2}, Lb/s/i;->b(Landroid/view/View;Landroid/view/ViewGroup;Landroid/graphics/Matrix;)V

    .line 19
    :cond_2d
    new-instance v1, Lb/s/i;

    invoke-direct {v1, p0}, Lb/s/i;-><init>(Landroid/view/View;)V

    .line 20
    invoke-virtual {v1, p2}, Lb/s/i;->a(Landroid/graphics/Matrix;)V

    if-nez v0, :cond_3d

    .line 21
    new-instance v0, Lb/s/g;

    invoke-direct {v0, p1}, Lb/s/g;-><init>(Landroid/view/ViewGroup;)V

    goto :goto_40

    .line 22
    :cond_3d
    invoke-virtual {v0}, Lb/s/g;->a()V

    .line 23
    :goto_40
    invoke-static {p1, v0}, Lb/s/i;->a(Landroid/view/View;Landroid/view/View;)V

    .line 24
    invoke-static {p1, v1}, Lb/s/i;->a(Landroid/view/View;Landroid/view/View;)V

    .line 25
    invoke-virtual {v0, v1}, Lb/s/g;->a(Lb/s/i;)V

    .line 26
    iput v2, v1, Lb/s/i;->k:I

    goto :goto_51

    :cond_4c
    if-eqz p2, :cond_51

    .line 27
    invoke-virtual {v1, p2}, Lb/s/i;->a(Landroid/graphics/Matrix;)V

    .line 28
    :cond_51
    :goto_51
    iget p0, v1, Lb/s/i;->k:I

    add-int/lit8 p0, p0, 0x1

    iput p0, v1, Lb/s/i;->k:I

    return-object v1

    .line 29
    :cond_58
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Ghosted views must be parented by a ViewGroup"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static a(Landroid/view/View;Landroid/view/View;)V
    .registers 6

    .line 4
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v0

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v1

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getLeft()I

    move-result v2

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    add-int/2addr v2, v3

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getTop()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    add-int/2addr v3, p0

    .line 8
    invoke-static {p1, v0, v1, v2, v3}, Lb/s/j0;->a(Landroid/view/View;IIII)V

    return-void
.end method

.method public static a(Landroid/view/View;Lb/s/i;)V
    .registers 3

    .line 10
    sget v0, Lb/s/p;->ghost_view:I

    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    return-void
.end method

.method public static b(Landroid/view/View;)V
    .registers 2

    .line 6
    invoke-static {p0}, Lb/s/i;->a(Landroid/view/View;)Lb/s/i;

    move-result-object p0

    if-eqz p0, :cond_17

    .line 7
    iget v0, p0, Lb/s/i;->k:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lb/s/i;->k:I

    if-gtz v0, :cond_17

    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Lb/s/g;

    .line 9
    invoke-virtual {v0, p0}, Landroid/widget/FrameLayout;->removeView(Landroid/view/View;)V

    :cond_17
    return-void
.end method

.method public static b(Landroid/view/View;Landroid/view/ViewGroup;Landroid/graphics/Matrix;)V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p0

    check-cast p0, Landroid/view/ViewGroup;

    .line 2
    invoke-virtual {p2}, Landroid/graphics/Matrix;->reset()V

    .line 3
    invoke-static {p0, p2}, Lb/s/j0;->b(Landroid/view/View;Landroid/graphics/Matrix;)V

    .line 4
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollX()I

    move-result v0

    neg-int v0, v0

    int-to-float v0, v0

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getScrollY()I

    move-result p0

    neg-int p0, p0

    int-to-float p0, p0

    invoke-virtual {p2, v0, p0}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 5
    invoke-static {p1, p2}, Lb/s/j0;->c(Landroid/view/View;Landroid/graphics/Matrix;)V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Matrix;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lb/s/i;->l:Landroid/graphics/Matrix;

    return-void
.end method

.method public a(Landroid/view/ViewGroup;Landroid/view/View;)V
    .registers 3

    .line 2
    iput-object p1, p0, Lb/s/i;->h:Landroid/view/ViewGroup;

    .line 3
    iput-object p2, p0, Lb/s/i;->i:Landroid/view/View;

    return-void
.end method

.method public onAttachedToWindow()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/view/ViewGroup;->onAttachedToWindow()V

    .line 2
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-static {v0, p0}, Lb/s/i;->a(Landroid/view/View;Lb/s/i;)V

    .line 3
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lb/s/i;->m:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->addOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 4
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    const/4 v1, 0x4

    invoke-static {v0, v1}, Lb/s/j0;->a(Landroid/view/View;I)V

    .line 5
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_2c

    .line 6
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    :cond_2c
    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object v0

    iget-object v1, p0, Lb/s/i;->m:Landroid/view/ViewTreeObserver$OnPreDrawListener;

    invoke-virtual {v0, v1}, Landroid/view/ViewTreeObserver;->removeOnPreDrawListener(Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    .line 2
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lb/s/j0;->a(Landroid/view/View;I)V

    .line 3
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lb/s/i;->a(Landroid/view/View;Lb/s/i;)V

    .line 4
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    if-eqz v0, :cond_2a

    .line 5
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 6
    :cond_2a
    invoke-super {p0}, Landroid/view/ViewGroup;->onDetachedFromWindow()V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 6

    const/4 v0, 0x1

    .line 1
    invoke-static {p1, v0}, Lb/s/b;->a(Landroid/graphics/Canvas;Z)V

    .line 2
    iget-object v0, p0, Lb/s/i;->l:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 3
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Lb/s/j0;->a(Landroid/view/View;I)V

    .line 4
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    .line 5
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    const/4 v2, 0x4

    invoke-static {v0, v2}, Lb/s/j0;->a(Landroid/view/View;I)V

    .line 6
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/ViewGroup;->getDrawingTime()J

    move-result-wide v2

    invoke-virtual {p0, p1, v0, v2, v3}, Landroid/view/ViewGroup;->drawChild(Landroid/graphics/Canvas;Landroid/view/View;J)Z

    .line 7
    invoke-static {p1, v1}, Lb/s/b;->a(Landroid/graphics/Canvas;Z)V

    return-void
.end method

.method public onLayout(ZIIII)V
    .registers 6

    return-void
.end method

.method public setVisibility(I)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Landroid/view/ViewGroup;->setVisibility(I)V

    .line 2
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-static {v0}, Lb/s/i;->a(Landroid/view/View;)Lb/s/i;

    move-result-object v0

    if-ne v0, p0, :cond_15

    if-nez p1, :cond_f

    const/4 p1, 0x4

    goto :goto_10

    :cond_f
    const/4 p1, 0x0

    .line 3
    :goto_10
    iget-object v0, p0, Lb/s/i;->j:Landroid/view/View;

    invoke-static {v0, p1}, Lb/s/j0;->a(Landroid/view/View;I)V

    :cond_15
    return-void
.end method
