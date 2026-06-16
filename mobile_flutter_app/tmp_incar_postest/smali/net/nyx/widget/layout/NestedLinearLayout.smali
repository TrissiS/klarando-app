.class public Lnet/nyx/widget/layout/NestedLinearLayout;
.super Landroid/widget/LinearLayout;
.source "NestedLinearLayout.java"

# interfaces
.implements Lb/h/m/m;
.implements Lb/h/m/q;


# instance fields
.field public final h:Lb/h/m/n;

.field public final i:Lb/h/m/r;

.field public final j:[I

.field public final k:[I

.field public final l:F

.field public final m:F

.field public final n:F

.field public o:I

.field public p:I

.field public q:Landroid/view/VelocityTracker;

.field public r:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, p1, v0, v1}, Lnet/nyx/widget/layout/NestedLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/layout/NestedLinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p1, 0x2

    new-array p2, p1, [I

    .line 4
    iput-object p2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->j:[I

    new-array p1, p1, [I

    .line 5
    iput-object p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->k:[I

    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Landroid/widget/LinearLayout;->setWillNotDraw(Z)V

    .line 7
    new-instance p1, Lb/h/m/n;

    invoke-direct {p1, p0}, Lb/h/m/n;-><init>(Landroid/view/View;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    .line 8
    new-instance p1, Lb/h/m/r;

    invoke-direct {p1, p0}, Lb/h/m/r;-><init>(Landroid/view/ViewGroup;)V

    iput-object p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->i:Lb/h/m/r;

    const/4 p1, 0x1

    .line 9
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/NestedLinearLayout;->setNestedScrollingEnabled(Z)V

    .line 10
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledTouchSlop()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->l:F

    .line 11
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMaximumFlingVelocity()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->m:F

    .line 12
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-static {p1}, Landroid/view/ViewConfiguration;->get(Landroid/content/Context;)Landroid/view/ViewConfiguration;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/ViewConfiguration;->getScaledMinimumFlingVelocity()I

    move-result p1

    int-to-float p1, p1

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->n:F

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->r:Z

    .line 9
    invoke-virtual {p0}, Lnet/nyx/widget/layout/NestedLinearLayout;->c()V

    .line 10
    invoke-virtual {p0}, Lnet/nyx/widget/layout/NestedLinearLayout;->stopNestedScroll()V

    return-void
.end method

.method public final a(I)V
    .registers 4

    int-to-float p1, p1

    const/4 v0, 0x0

    .line 11
    invoke-virtual {p0, v0, p1}, Lnet/nyx/widget/layout/NestedLinearLayout;->dispatchNestedPreFling(FF)Z

    move-result v1

    if-nez v1, :cond_c

    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, v0, p1, v1}, Lnet/nyx/widget/layout/NestedLinearLayout;->dispatchNestedFling(FFZ)Z

    :cond_c
    return-void
.end method

.method public final a(Landroid/view/MotionEvent;)V
    .registers 5

    .line 1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const v1, 0xff00

    and-int/2addr v0, v1

    shr-int/lit8 v0, v0, 0x8

    .line 2
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result v1

    .line 3
    iget v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->p:I

    if-ne v1, v2, :cond_2b

    if-nez v0, :cond_16

    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    .line 4
    :goto_17
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    .line 5
    invoke-virtual {p1, v0}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->p:I

    .line 6
    iget-object p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    if-eqz p1, :cond_2b

    .line 7
    invoke-virtual {p1}, Landroid/view/VelocityTracker;->clear()V

    :cond_2b
    return-void
.end method

.method public final b()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    if-nez v0, :cond_a

    .line 2
    invoke-static {}, Landroid/view/VelocityTracker;->obtain()Landroid/view/VelocityTracker;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    :cond_a
    return-void
.end method

.method public final c()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    if-eqz v0, :cond_a

    .line 2
    invoke-virtual {v0}, Landroid/view/VelocityTracker;->recycle()V

    const/4 v0, 0x0

    .line 3
    iput-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    :cond_a
    return-void
.end method

.method public dispatchNestedFling(FFZ)Z
    .registers 5

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/n;->a(FFZ)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreFling(FF)Z
    .registers 4

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    invoke-virtual {v0, p1, p2}, Lb/h/m/n;->a(FF)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedPreScroll(II[I[I)Z
    .registers 6

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    invoke-virtual {v0, p1, p2, p3, p4}, Lb/h/m/n;->a(II[I[I)Z

    move-result p1

    return p1
.end method

.method public dispatchNestedScroll(IIII[I)Z
    .registers 12

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move-object v5, p5

    invoke-virtual/range {v0 .. v5}, Lb/h/m/n;->a(IIII[I)Z

    move-result p1

    return p1
.end method

.method public getNestedScrollAxes()I
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->i:Lb/h/m/r;

    invoke-virtual {v0}, Lb/h/m/r;->a()I

    move-result v0

    return v0
.end method

.method public hasNestedScrollingParent()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->b()Z

    move-result v0

    return v0
.end method

.method public isNestedScrollingEnabled()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->c()Z

    move-result v0

    return v0
.end method

.method public onNestedFling(Landroid/view/View;FFZ)Z
    .registers 5

    .line 1
    invoke-virtual {p0, p2, p3, p4}, Lnet/nyx/widget/layout/NestedLinearLayout;->dispatchNestedFling(FFZ)Z

    move-result p1

    return p1
.end method

.method public onNestedPreFling(Landroid/view/View;FF)Z
    .registers 4

    .line 1
    invoke-virtual {p0, p2, p3}, Lnet/nyx/widget/layout/NestedLinearLayout;->dispatchNestedPreFling(FF)Z

    move-result p1

    return p1
.end method

.method public onNestedPreScroll(Landroid/view/View;II[I)V
    .registers 5

    const/4 p1, 0x0

    .line 1
    invoke-virtual {p0, p2, p3, p4, p1}, Lnet/nyx/widget/layout/NestedLinearLayout;->dispatchNestedPreScroll(II[I[I)Z

    return-void
.end method

.method public onNestedScroll(Landroid/view/View;IIII)V
    .registers 12

    const/4 v5, 0x0

    move-object v0, p0

    move v1, p2

    move v2, p3

    move v3, p4

    move v4, p5

    .line 1
    invoke-virtual/range {v0 .. v5}, Lnet/nyx/widget/layout/NestedLinearLayout;->dispatchNestedScroll(IIII[I)Z

    return-void
.end method

.method public onNestedScrollAccepted(Landroid/view/View;Landroid/view/View;I)V
    .registers 5

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->i:Lb/h/m/r;

    invoke-virtual {v0, p1, p2, p3}, Lb/h/m/r;->a(Landroid/view/View;Landroid/view/View;I)V

    const/4 p1, 0x2

    .line 2
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/NestedLinearLayout;->startNestedScroll(I)Z

    return-void
.end method

.method public onStartNestedScroll(Landroid/view/View;Landroid/view/View;I)Z
    .registers 4

    and-int/lit8 p1, p3, 0x2

    if-eqz p1, :cond_6

    const/4 p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    :goto_7
    return p1
.end method

.method public onStopNestedScroll(Landroid/view/View;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->i:Lb/h/m/r;

    invoke-virtual {v0, p1}, Lb/h/m/r;->a(Landroid/view/View;)V

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/layout/NestedLinearLayout;->stopNestedScroll()V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 14
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Landroid/view/MotionEvent;->obtain(Landroid/view/MotionEvent;)Landroid/view/MotionEvent;

    move-result-object v0

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/layout/NestedLinearLayout;->b()V

    .line 3
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getActionMasked()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v1, :cond_ee

    const/4 v5, -0x1

    if-eq v1, v4, :cond_c3

    if-eq v1, v3, :cond_45

    const/4 p1, 0x3

    if-eq v1, p1, :cond_c3

    const/4 p1, 0x5

    if-eq v1, p1, :cond_32

    const/4 p1, 0x6

    if-eq v1, p1, :cond_20

    goto/16 :goto_103

    .line 4
    :cond_20
    invoke-virtual {p0, v0}, Lnet/nyx/widget/layout/NestedLinearLayout;->a(Landroid/view/MotionEvent;)V

    .line 5
    iget p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->p:I

    invoke-virtual {v0, p1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/MotionEvent;->getY(I)F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    goto/16 :goto_103

    .line 6
    :cond_32
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getActionIndex()I

    move-result p1

    .line 7
    invoke-virtual {v0, p1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    float-to-int v1, v1

    iput v1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    .line 8
    invoke-virtual {v0, p1}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->p:I

    goto/16 :goto_103

    .line 9
    :cond_45
    iget v1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->p:I

    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->findPointerIndex(I)I

    move-result v1

    if-ne v1, v5, :cond_4f

    goto/16 :goto_103

    .line 10
    :cond_4f
    invoke-virtual {v0, v1}, Landroid/view/MotionEvent;->getY(I)F

    move-result v1

    float-to-int v1, v1

    .line 11
    iget v3, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    sub-int/2addr v3, v1

    .line 12
    iget-object v5, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->j:[I

    iget-object v6, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->k:[I

    invoke-virtual {p0, v2, v3, v5, v6}, Lnet/nyx/widget/layout/NestedLinearLayout;->dispatchNestedPreScroll(II[I[I)Z

    move-result v2

    const/4 v5, 0x0

    if-eqz v2, :cond_6f

    .line 13
    iget-object v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->j:[I

    aget v2, v2, v4

    sub-int/2addr v3, v2

    .line 14
    iget-object v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->k:[I

    aget v2, v2, v4

    int-to-float v2, v2

    invoke-virtual {v0, v5, v2}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    .line 15
    :cond_6f
    iget-boolean v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->r:Z

    if-nez v2, :cond_98

    iget v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    sub-int/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Math;->abs(I)I

    move-result v2

    int-to-float v2, v2

    iget v6, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->l:F

    cmpl-float v2, v2, v6

    if-lez v2, :cond_98

    .line 16
    invoke-virtual {p0}, Landroid/widget/LinearLayout;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    if-eqz v2, :cond_8a

    .line 17
    invoke-interface {v2, v4}, Landroid/view/ViewParent;->requestDisallowInterceptTouchEvent(Z)V

    .line 18
    :cond_8a
    iput-boolean v4, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->r:Z

    if-lez v3, :cond_93

    int-to-float v2, v3

    .line 19
    iget v3, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->l:F

    sub-float/2addr v2, v3

    goto :goto_97

    :cond_93
    int-to-float v2, v3

    .line 20
    iget v3, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->l:F

    add-float/2addr v2, v3

    :goto_97
    float-to-int v3, v2

    :cond_98
    move v10, v3

    .line 21
    iget-boolean v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->r:Z

    if-eqz v2, :cond_103

    .line 22
    iget-object v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    invoke-virtual {v2, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 23
    iget-object v11, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->k:[I

    aget p1, v11, v4

    sub-int/2addr v1, p1

    iput v1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    move-object v6, p0

    .line 24
    invoke-virtual/range {v6 .. v11}, Lnet/nyx/widget/layout/NestedLinearLayout;->dispatchNestedScroll(IIII[I)Z

    move-result p1

    if-eqz p1, :cond_103

    .line 25
    iget p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    iget-object v1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->k:[I

    aget v2, v1, v4

    sub-int/2addr p1, v2

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    .line 26
    aget p1, v1, v4

    int-to-float p1, p1

    invoke-virtual {v0, v5, p1}, Landroid/view/MotionEvent;->offsetLocation(FF)V

    goto :goto_103

    .line 27
    :cond_c3
    iget-boolean p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->r:Z

    if-eqz p1, :cond_e8

    .line 28
    iget-object p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    const/16 v1, 0x3e8

    iget v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->m:F

    invoke-virtual {p1, v1, v2}, Landroid/view/VelocityTracker;->computeCurrentVelocity(IF)V

    .line 29
    iget-object p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    iget v1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->p:I

    invoke-virtual {p1, v1}, Landroid/view/VelocityTracker;->getYVelocity(I)F

    move-result p1

    float-to-int p1, p1

    .line 30
    invoke-static {p1}, Ljava/lang/Math;->abs(I)I

    move-result v1

    int-to-float v1, v1

    iget v2, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->n:F

    cmpl-float v1, v1, v2

    if-lez v1, :cond_e8

    neg-int p1, p1

    .line 31
    invoke-virtual {p0, p1}, Lnet/nyx/widget/layout/NestedLinearLayout;->a(I)V

    .line 32
    :cond_e8
    iput v5, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->p:I

    .line 33
    invoke-virtual {p0}, Lnet/nyx/widget/layout/NestedLinearLayout;->a()V

    goto :goto_103

    .line 34
    :cond_ee
    iget-object v1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->q:Landroid/view/VelocityTracker;

    invoke-virtual {v1, p1}, Landroid/view/VelocityTracker;->addMovement(Landroid/view/MotionEvent;)V

    .line 35
    invoke-virtual {v0}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->o:I

    .line 36
    invoke-virtual {v0, v2}, Landroid/view/MotionEvent;->getPointerId(I)I

    move-result p1

    iput p1, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->p:I

    .line 37
    invoke-virtual {p0, v3}, Lnet/nyx/widget/layout/NestedLinearLayout;->startNestedScroll(I)Z

    .line 38
    :cond_103
    :goto_103
    invoke-virtual {v0}, Landroid/view/MotionEvent;->recycle()V

    return v4
.end method

.method public requestDisallowInterceptTouchEvent(Z)V
    .registers 2

    if-eqz p1, :cond_5

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/layout/NestedLinearLayout;->c()V

    .line 2
    :cond_5
    invoke-super {p0, p1}, Landroid/widget/LinearLayout;->requestDisallowInterceptTouchEvent(Z)V

    return-void
.end method

.method public setNestedScrollingEnabled(Z)V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    invoke-virtual {v0, p1}, Lb/h/m/n;->a(Z)V

    return-void
.end method

.method public startNestedScroll(I)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    invoke-virtual {v0, p1}, Lb/h/m/n;->c(I)Z

    move-result p1

    return p1
.end method

.method public stopNestedScroll()V
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/layout/NestedLinearLayout;->h:Lb/h/m/n;

    invoke-virtual {v0}, Lb/h/m/n;->d()V

    return-void
.end method
