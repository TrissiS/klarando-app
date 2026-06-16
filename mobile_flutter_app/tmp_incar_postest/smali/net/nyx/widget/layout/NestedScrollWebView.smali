.class public Lnet/nyx/widget/layout/NestedScrollWebView;
.super Landroid/webkit/WebView;
.source "NestedScrollWebView.java"

# interfaces
.implements Lb/h/m/m;


# instance fields
.field public final h:Lb/h/m/n;

.field public i:I

.field public final j:[I

.field public final k:[I

.field public l:I

.field public m:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x2

    new-array v0, p1, [I

    .line 2
    iput-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    new-array p1, p1, [I

    .line 3
    iput-object p1, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->k:[I

    .line 4
    new-instance p1, Lb/h/m/n;

    invoke-direct {p1, p0}, Lb/h/m/n;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/NestedScrollWebView;->setNestedScrollingEnabled(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 6
    invoke-direct {p0, p1, p2}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 p1, 0x2

    new-array p2, p1, [I

    .line 7
    iput-object p2, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    new-array p1, p1, [I

    .line 8
    iput-object p1, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->k:[I

    .line 9
    new-instance p1, Lb/h/m/n;

    invoke-direct {p1, p0}, Lb/h/m/n;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    const/4 p1, 0x1

    .line 10
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/NestedScrollWebView;->setNestedScrollingEnabled(Z)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 11
    invoke-direct {p0, p1, p2, p3}, Landroid/webkit/WebView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x2

    new-array p2, p1, [I

    .line 12
    iput-object p2, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    new-array p1, p1, [I

    .line 13
    iput-object p1, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->k:[I

    .line 14
    new-instance p1, Lb/h/m/n;

    invoke-direct {p1, p0}, Lb/h/m/n;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    const/4 p1, 0x1

    .line 15
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/NestedScrollWebView;->setNestedScrollingEnabled(Z)V

    return-void
.end method


# virtual methods
.method public dispatchNestedFling(FFZ)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/n;->a(FFZ)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreFling(FF)Z
    .registers 4

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    invoke-virtual {v0, p1, p2}, Lb/h/m/n;->a(FF)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .registers 6

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    invoke-virtual {v0, p1, p2, p3, p4}, Lb/h/m/n;->a(II[I[I)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .registers 12

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lb/h/m/n;->a(IIII[I)Z

    move-result p1

    return p1
.end method

.method public hasNestedScrollingParent()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->b()Z

    move-result v0

    return v0
.end method

.method public isNestedScrollingEnabled()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->c()Z

    move-result v0

    return v0
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 21
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    move-object/from16 v6, p0

    .line 1
    invoke-static/range {p1 .. p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v7

    .line 2
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v0

    const/4 v8, 0x0

    if-nez v0, :cond_f

    .line 3
    iput v8, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->l:I

    .line 4
    :cond_f
    invoke-virtual/range {p1 .. p1}, Landroid/view/MotionEvent;->getY()F

    move-result v1

    float-to-int v1, v1

    .line 5
    iget v2, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->l:I

    int-to-float v2, v2

    const/4 v9, 0x0

    move-object/from16 v3, p1

    invoke-virtual {v3, v9, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    const/4 v2, 0x2

    if-eqz v0, :cond_cd

    const/4 v10, 0x1

    if-eq v0, v10, :cond_c5

    if-eq v0, v2, :cond_30

    const/4 v1, 0x3

    if-eq v0, v1, :cond_c5

    const/4 v1, 0x5

    if-eq v0, v1, :cond_c5

    const/4 v1, 0x6

    if-eq v0, v1, :cond_c5

    goto/16 :goto_d8

    .line 6
    :cond_30
    iget v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->i:I

    sub-int/2addr v0, v1

    .line 7
    iget-object v2, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->k:[I

    iget-object v3, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    invoke-virtual {v6, v8, v0, v2, v3}, Lnet/nyx/widget/layout/NestedScrollWebView;->dispatchNestedPreScroll(II[I[I)Z

    move-result v2

    if-eqz v2, :cond_53

    .line 8
    iget-object v2, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->k:[I

    aget v2, v2, v10

    sub-int/2addr v0, v2

    .line 9
    iget-object v2, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    aget v2, v2, v10

    int-to-float v2, v2

    invoke-virtual {v7, v9, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 10
    iget v2, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->l:I

    iget-object v3, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    aget v3, v3, v10

    add-int/2addr v2, v3

    iput v2, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->l:I

    .line 11
    :cond_53
    iget-object v2, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    aget v2, v2, v10

    sub-int/2addr v1, v2

    iput v1, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->i:I

    .line 12
    invoke-virtual/range {p0 .. p0}, Landroid/webkit/WebView;->getScrollY()I

    move-result v1

    add-int v2, v1, v0

    .line 13
    invoke-static {v8, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    sub-int/2addr v2, v1

    sub-int v4, v0, v2

    const/4 v1, 0x0

    const/4 v3, 0x0

    .line 14
    iget-object v5, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    move-object/from16 v0, p0

    invoke-virtual/range {v0 .. v5}, Lnet/nyx/widget/layout/NestedScrollWebView;->dispatchNestedScroll(IIII[I)Z

    move-result v0

    if-eqz v0, :cond_8b

    .line 15
    iget v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->i:I

    iget-object v1, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    aget v2, v1, v10

    sub-int/2addr v0, v2

    iput v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->i:I

    .line 16
    aget v0, v1, v10

    int-to-float v0, v0

    invoke-virtual {v7, v9, v0}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 17
    iget v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->l:I

    iget-object v1, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    aget v1, v1, v10

    add-int/2addr v0, v1

    iput v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->l:I

    .line 18
    :cond_8b
    iget-object v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->k:[I

    aget v0, v0, v10

    if-nez v0, :cond_ac

    iget-object v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->j:[I

    aget v0, v0, v10

    if-nez v0, :cond_ac

    .line 19
    iget-boolean v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->m:Z

    if-eqz v0, :cond_a4

    .line 20
    iput-boolean v8, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->m:Z

    .line 21
    invoke-virtual {v7, v8}, Landroid/view/MotionEvent;->setAction(I)V

    .line 22
    invoke-super {v6, v7}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_a8

    .line 23
    :cond_a4
    invoke-super {v6, v7}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v8

    .line 24
    :goto_a8
    invoke-virtual {v7}, Landroid/view/MotionEvent;->recycle()V

    goto :goto_d8

    .line 25
    :cond_ac
    iget-boolean v0, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->m:Z

    if-nez v0, :cond_d8

    .line 26
    iput-boolean v10, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->m:Z

    const-wide/16 v11, 0x0

    const-wide/16 v13, 0x0

    const/4 v15, 0x3

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    .line 27
    invoke-static/range {v11 .. v18}, Landroid/view/MotionEvent;->obtain(JJIFFI)Landroid/view/MotionEvent;

    move-result-object v0

    invoke-super {v6, v0}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    goto :goto_d8

    .line 28
    :cond_c5
    invoke-virtual/range {p0 .. p0}, Lnet/nyx/widget/layout/NestedScrollWebView;->stopNestedScroll()V

    .line 29
    invoke-super/range {p0 .. p1}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v8

    goto :goto_d8

    .line 30
    :cond_cd
    iput-boolean v8, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->m:Z

    .line 31
    iput v1, v6, Lnet/nyx/widget/layout/NestedScrollWebView;->i:I

    .line 32
    invoke-virtual {v6, v2}, Lnet/nyx/widget/layout/NestedScrollWebView;->startNestedScroll(I)Z

    .line 33
    invoke-super/range {p0 .. p1}, Landroid/webkit/WebView;->onTouchEvent(Landroid/view/MotionEvent;)Z

    move-result v8

    :cond_d8
    :goto_d8
    return v8
.end method

.method public setNestedScrollingEnabled(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    invoke-virtual {v0, p1}, Lb/h/m/n;->a(Z)V

    return-void
.end method

.method public startNestedScroll(I)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    invoke-virtual {v0, p1}, Lb/h/m/n;->c(I)Z

    move-result p1

    return p1
.end method

.method public stopNestedScroll()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedScrollWebView;->h:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->d()V

    return-void
.end method
