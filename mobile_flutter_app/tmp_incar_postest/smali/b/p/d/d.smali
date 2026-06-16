.class public Lb/p/d/d;
.super Landroidx/recyclerview/widget/RecyclerView$n;
.source "FastScroller.java"

# interfaces
.implements Landroidx/recyclerview/widget/RecyclerView$r;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/p/d/d$d;,
        Lb/p/d/d$c;
    }
.end annotation


# static fields
.field public static final D:[I

.field public static final E:[I


# instance fields
.field public A:I

.field public final B:Ljava/lang/Runnable;

.field public final C:Landroidx/recyclerview/widget/RecyclerView$s;

.field public final a:I

.field public final b:I

.field public final c:Landroid/graphics/drawable/StateListDrawable;

.field public final d:Landroid/graphics/drawable/Drawable;

.field public final e:I

.field public final f:I

.field public final g:Landroid/graphics/drawable/StateListDrawable;

.field public final h:Landroid/graphics/drawable/Drawable;

.field public final i:I

.field public final j:I

.field public k:I

.field public l:I

.field public m:F

.field public n:I

.field public o:I

.field public p:F

.field public q:I

.field public r:I

.field public s:Landroidx/recyclerview/widget/RecyclerView;

.field public t:Z

.field public u:Z

.field public v:I

.field public w:I

.field public final x:[I

.field public final y:[I

.field public final z:Landroid/animation/ValueAnimator;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const v1, 0x10100a7

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 1
    sput-object v0, Lb/p/d/d;->D:[I

    new-array v0, v2, [I

    .line 2
    sput-object v0, Lb/p/d/d;->E:[I

    return-void
.end method

.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Landroid/graphics/drawable/StateListDrawable;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/StateListDrawable;Landroid/graphics/drawable/Drawable;III)V
    .registers 12

    .line 1
    invoke-direct {p0}, Landroidx/recyclerview/widget/RecyclerView$n;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lb/p/d/d;->q:I

    .line 3
    iput v0, p0, Lb/p/d/d;->r:I

    .line 4
    iput-boolean v0, p0, Lb/p/d/d;->t:Z

    .line 5
    iput-boolean v0, p0, Lb/p/d/d;->u:Z

    .line 6
    iput v0, p0, Lb/p/d/d;->v:I

    .line 7
    iput v0, p0, Lb/p/d/d;->w:I

    const/4 v1, 0x2

    new-array v2, v1, [I

    .line 8
    iput-object v2, p0, Lb/p/d/d;->x:[I

    new-array v2, v1, [I

    .line 9
    iput-object v2, p0, Lb/p/d/d;->y:[I

    new-array v1, v1, [F

    .line 10
    fill-array-data v1, :array_8c

    .line 11
    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v1

    iput-object v1, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    .line 12
    iput v0, p0, Lb/p/d/d;->A:I

    .line 13
    new-instance v0, Lb/p/d/d$a;

    invoke-direct {v0, p0}, Lb/p/d/d$a;-><init>(Lb/p/d/d;)V

    iput-object v0, p0, Lb/p/d/d;->B:Ljava/lang/Runnable;

    .line 14
    new-instance v0, Lb/p/d/d$b;

    invoke-direct {v0, p0}, Lb/p/d/d$b;-><init>(Lb/p/d/d;)V

    iput-object v0, p0, Lb/p/d/d;->C:Landroidx/recyclerview/widget/RecyclerView$s;

    .line 15
    iput-object p2, p0, Lb/p/d/d;->c:Landroid/graphics/drawable/StateListDrawable;

    .line 16
    iput-object p3, p0, Lb/p/d/d;->d:Landroid/graphics/drawable/Drawable;

    .line 17
    iput-object p4, p0, Lb/p/d/d;->g:Landroid/graphics/drawable/StateListDrawable;

    .line 18
    iput-object p5, p0, Lb/p/d/d;->h:Landroid/graphics/drawable/Drawable;

    .line 19
    invoke-virtual {p2}, Landroid/graphics/drawable/StateListDrawable;->getIntrinsicWidth()I

    move-result p2

    invoke-static {p6, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lb/p/d/d;->e:I

    .line 20
    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    invoke-static {p6, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lb/p/d/d;->f:I

    .line 21
    invoke-virtual {p4}, Landroid/graphics/drawable/StateListDrawable;->getIntrinsicWidth()I

    move-result p2

    invoke-static {p6, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lb/p/d/d;->i:I

    .line 22
    invoke-virtual {p5}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    invoke-static {p6, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    iput p2, p0, Lb/p/d/d;->j:I

    .line 23
    iput p7, p0, Lb/p/d/d;->a:I

    .line 24
    iput p8, p0, Lb/p/d/d;->b:I

    .line 25
    iget-object p2, p0, Lb/p/d/d;->c:Landroid/graphics/drawable/StateListDrawable;

    const/16 p3, 0xff

    invoke-virtual {p2, p3}, Landroid/graphics/drawable/StateListDrawable;->setAlpha(I)V

    .line 26
    iget-object p2, p0, Lb/p/d/d;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2, p3}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 27
    iget-object p2, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    new-instance p3, Lb/p/d/d$c;

    invoke-direct {p3, p0}, Lb/p/d/d$c;-><init>(Lb/p/d/d;)V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 28
    iget-object p2, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    new-instance p3, Lb/p/d/d$d;

    invoke-direct {p3, p0}, Lb/p/d/d$d;-><init>(Lb/p/d/d;)V

    invoke-virtual {p2, p3}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 29
    invoke-virtual {p0, p1}, Lb/p/d/d;->a(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void

    :array_8c
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method


# virtual methods
.method public final a(FF[IIII)I
    .registers 9

    const/4 v0, 0x1

    .line 58
    aget v0, p3, v0

    const/4 v1, 0x0

    aget p3, p3, v1

    sub-int/2addr v0, p3

    if-nez v0, :cond_a

    return v1

    :cond_a
    sub-float/2addr p2, p1

    int-to-float p1, v0

    div-float/2addr p2, p1

    sub-int/2addr p4, p6

    int-to-float p1, p4

    mul-float p2, p2, p1

    float-to-int p1, p2

    add-int/2addr p5, p1

    if-ge p5, p4, :cond_18

    if-ltz p5, :cond_18

    return p1

    :cond_18
    return v1
.end method

.method public final a()V
    .registers 3

    .line 11
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lb/p/d/d;->B:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/view/ViewGroup;->removeCallbacks(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public final a(F)V
    .registers 10

    .line 49
    invoke-virtual {p0}, Lb/p/d/d;->c()[I

    move-result-object v3

    const/4 v7, 0x0

    .line 50
    aget v0, v3, v7

    int-to-float v0, v0

    const/4 v1, 0x1

    aget v1, v3, v1

    int-to-float v1, v1

    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 51
    iget v0, p0, Lb/p/d/d;->o:I

    int-to-float v0, v0

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_23

    return-void

    .line 52
    :cond_23
    iget v1, p0, Lb/p/d/d;->p:F

    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 53
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollRange()I

    move-result v4

    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 54
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollOffset()I

    move-result v5

    iget v6, p0, Lb/p/d/d;->q:I

    move-object v0, p0

    move v2, p1

    .line 55
    invoke-virtual/range {v0 .. v6}, Lb/p/d/d;->a(FF[IIII)I

    move-result v0

    if-eqz v0, :cond_40

    .line 56
    iget-object v1, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0, v7}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 57
    :cond_40
    iput p1, p0, Lb/p/d/d;->p:F

    return-void
.end method

.method public a(I)V
    .registers 7

    .line 5
    iget v0, p0, Lb/p/d/d;->A:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eq v0, v2, :cond_9

    if-eq v0, v1, :cond_e

    goto :goto_33

    .line 6
    :cond_9
    iget-object v0, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_e
    const/4 v0, 0x3

    .line 7
    iput v0, p0, Lb/p/d/d;->A:I

    .line 8
    iget-object v0, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    new-array v1, v1, [F

    const/4 v3, 0x0

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    aput v4, v1, v3

    const/4 v3, 0x0

    aput v3, v1, v2

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 9
    iget-object v0, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    int-to-long v1, p1

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 10
    iget-object p1, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->start()V

    :goto_33
    return-void
.end method

.method public a(II)V
    .registers 11

    .line 23
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    move-result v0

    .line 24
    iget v1, p0, Lb/p/d/d;->r:I

    sub-int v2, v0, v1

    const/4 v3, 0x0

    const/4 v4, 0x1

    if-lez v2, :cond_14

    .line 25
    iget v2, p0, Lb/p/d/d;->a:I

    if-lt v1, v2, :cond_14

    const/4 v2, 0x1

    goto :goto_15

    :cond_14
    const/4 v2, 0x0

    :goto_15
    iput-boolean v2, p0, Lb/p/d/d;->t:Z

    .line 26
    iget-object v2, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->computeHorizontalScrollRange()I

    move-result v2

    .line 27
    iget v5, p0, Lb/p/d/d;->q:I

    sub-int v6, v2, v5

    if-lez v6, :cond_29

    .line 28
    iget v6, p0, Lb/p/d/d;->a:I

    if-lt v5, v6, :cond_29

    const/4 v6, 0x1

    goto :goto_2a

    :cond_29
    const/4 v6, 0x0

    :goto_2a
    iput-boolean v6, p0, Lb/p/d/d;->u:Z

    .line 29
    iget-boolean v7, p0, Lb/p/d/d;->t:Z

    if-nez v7, :cond_3a

    if-nez v6, :cond_3a

    .line 30
    iget p1, p0, Lb/p/d/d;->v:I

    if-eqz p1, :cond_39

    .line 31
    invoke-virtual {p0, v3}, Lb/p/d/d;->c(I)V

    :cond_39
    return-void

    .line 32
    :cond_3a
    iget-boolean v3, p0, Lb/p/d/d;->t:Z

    const/high16 v6, 0x40000000    # 2.0f

    if-eqz v3, :cond_55

    int-to-float p2, p2

    int-to-float v3, v1

    div-float v7, v3, v6

    add-float/2addr p2, v7

    mul-float v3, v3, p2

    int-to-float p2, v0

    div-float/2addr v3, p2

    float-to-int p2, v3

    .line 33
    iput p2, p0, Lb/p/d/d;->l:I

    mul-int p2, v1, v1

    .line 34
    div-int/2addr p2, v0

    invoke-static {v1, p2}, Ljava/lang/Math;->min(II)I

    move-result p2

    iput p2, p0, Lb/p/d/d;->k:I

    .line 35
    :cond_55
    iget-boolean p2, p0, Lb/p/d/d;->u:Z

    if-eqz p2, :cond_6e

    int-to-float p1, p1

    int-to-float p2, v5

    div-float v0, p2, v6

    add-float/2addr p1, v0

    mul-float p2, p2, p1

    int-to-float p1, v2

    div-float/2addr p2, p1

    float-to-int p1, p2

    .line 36
    iput p1, p0, Lb/p/d/d;->o:I

    mul-int p1, v5, v5

    .line 37
    div-int/2addr p1, v2

    invoke-static {v5, p1}, Ljava/lang/Math;->min(II)I

    move-result p1

    iput p1, p0, Lb/p/d/d;->n:I

    .line 38
    :cond_6e
    iget p1, p0, Lb/p/d/d;->v:I

    if-eqz p1, :cond_74

    if-ne p1, v4, :cond_77

    .line 39
    :cond_74
    invoke-virtual {p0, v4}, Lb/p/d/d;->c(I)V

    :cond_77
    return-void
.end method

.method public final a(Landroid/graphics/Canvas;)V
    .registers 8

    .line 12
    iget v0, p0, Lb/p/d/d;->r:I

    .line 13
    iget v1, p0, Lb/p/d/d;->i:I

    sub-int/2addr v0, v1

    .line 14
    iget v2, p0, Lb/p/d/d;->o:I

    iget v3, p0, Lb/p/d/d;->n:I

    div-int/lit8 v4, v3, 0x2

    sub-int/2addr v2, v4

    .line 15
    iget-object v4, p0, Lb/p/d/d;->g:Landroid/graphics/drawable/StateListDrawable;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v5, v3, v1}, Landroid/graphics/drawable/StateListDrawable;->setBounds(IIII)V

    .line 16
    iget-object v1, p0, Lb/p/d/d;->h:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lb/p/d/d;->q:I

    iget v4, p0, Lb/p/d/d;->j:I

    .line 17
    invoke-virtual {v1, v5, v5, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    int-to-float v1, v0

    const/4 v3, 0x0

    .line 18
    invoke-virtual {p1, v3, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 19
    iget-object v1, p0, Lb/p/d/d;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    int-to-float v1, v2

    .line 20
    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 21
    iget-object v1, p0, Lb/p/d/d;->g:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/StateListDrawable;->draw(Landroid/graphics/Canvas;)V

    neg-int v1, v2

    int-to-float v1, v1

    neg-int v0, v0

    int-to-float v0, v0

    .line 22
    invoke-virtual {p1, v1, v0}, Landroid/graphics/Canvas;->translate(FF)V

    return-void
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    if-ne v0, p1, :cond_5

    return-void

    :cond_5
    if-eqz v0, :cond_a

    .line 2
    invoke-virtual {p0}, Lb/p/d/d;->b()V

    .line 3
    :cond_a
    iput-object p1, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz p1, :cond_11

    .line 4
    invoke-virtual {p0}, Lb/p/d/d;->g()V

    :cond_11
    return-void
.end method

.method public a(Z)V
    .registers 2

    return-void
.end method

.method public a(FF)Z
    .registers 5

    .line 59
    iget v0, p0, Lb/p/d/d;->r:I

    iget v1, p0, Lb/p/d/d;->i:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float p2, p2, v0

    if-ltz p2, :cond_21

    iget p2, p0, Lb/p/d/d;->o:I

    iget v0, p0, Lb/p/d/d;->n:I

    div-int/lit8 v1, v0, 0x2

    sub-int v1, p2, v1

    int-to-float v1, v1

    cmpl-float v1, p1, v1

    if-ltz v1, :cond_21

    div-int/lit8 v0, v0, 0x2

    add-int/2addr p2, v0

    int-to-float p2, p2

    cmpg-float p1, p1, p2

    if-gtz p1, :cond_21

    const/4 p1, 0x1

    goto :goto_22

    :cond_21
    const/4 p1, 0x0

    :goto_22
    return p1
.end method

.method public a(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)Z
    .registers 8

    .line 40
    iget p1, p0, Lb/p/d/d;->v:I

    const/4 v0, 0x0

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne p1, v2, :cond_46

    .line 41
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p0, p1, v3}, Lb/p/d/d;->b(FF)Z

    move-result p1

    .line 42
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v3

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v4

    invoke-virtual {p0, v3, v4}, Lb/p/d/d;->a(FF)Z

    move-result v3

    .line 43
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result v4

    if-nez v4, :cond_49

    if-nez p1, :cond_29

    if-eqz v3, :cond_49

    :cond_29
    if-eqz v3, :cond_36

    .line 44
    iput v2, p0, Lb/p/d/d;->w:I

    .line 45
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lb/p/d/d;->p:F

    goto :goto_42

    :cond_36
    if-eqz p1, :cond_42

    .line 46
    iput v1, p0, Lb/p/d/d;->w:I

    .line 47
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lb/p/d/d;->m:F

    .line 48
    :cond_42
    :goto_42
    invoke-virtual {p0, v1}, Lb/p/d/d;->c(I)V

    goto :goto_48

    :cond_46
    if-ne p1, v1, :cond_49

    :goto_48
    const/4 v0, 0x1

    :cond_49
    return v0
.end method

.method public final b()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->b(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 2
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->b(Landroidx/recyclerview/widget/RecyclerView$r;)V

    .line 3
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lb/p/d/d;->C:Landroidx/recyclerview/widget/RecyclerView$s;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->b(Landroidx/recyclerview/widget/RecyclerView$s;)V

    .line 4
    invoke-virtual {p0}, Lb/p/d/d;->a()V

    return-void
.end method

.method public final b(F)V
    .registers 10

    .line 55
    invoke-virtual {p0}, Lb/p/d/d;->d()[I

    move-result-object v3

    const/4 v7, 0x0

    .line 56
    aget v0, v3, v7

    int-to-float v0, v0

    const/4 v1, 0x1

    aget v1, v3, v1

    int-to-float v1, v1

    invoke-static {v1, p1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    invoke-static {v0, p1}, Ljava/lang/Math;->max(FF)F

    move-result p1

    .line 57
    iget v0, p0, Lb/p/d/d;->l:I

    int-to-float v0, v0

    sub-float/2addr v0, p1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_23

    return-void

    .line 58
    :cond_23
    iget v1, p0, Lb/p/d/d;->m:F

    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 59
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollRange()I

    move-result v4

    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 60
    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->computeVerticalScrollOffset()I

    move-result v5

    iget v6, p0, Lb/p/d/d;->r:I

    move-object v0, p0

    move v2, p1

    .line 61
    invoke-virtual/range {v0 .. v6}, Lb/p/d/d;->a(FF[IIII)I

    move-result v0

    if-eqz v0, :cond_40

    .line 62
    iget-object v1, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v7, v0}, Landroidx/recyclerview/widget/RecyclerView;->scrollBy(II)V

    .line 63
    :cond_40
    iput p1, p0, Lb/p/d/d;->m:F

    return-void
.end method

.method public final b(I)V
    .registers 6

    .line 5
    invoke-virtual {p0}, Lb/p/d/d;->a()V

    .line 6
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lb/p/d/d;->B:Ljava/lang/Runnable;

    int-to-long v2, p1

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/ViewGroup;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .registers 8

    .line 17
    iget v0, p0, Lb/p/d/d;->q:I

    .line 18
    iget v1, p0, Lb/p/d/d;->e:I

    sub-int/2addr v0, v1

    .line 19
    iget v2, p0, Lb/p/d/d;->l:I

    iget v3, p0, Lb/p/d/d;->k:I

    div-int/lit8 v4, v3, 0x2

    sub-int/2addr v2, v4

    .line 20
    iget-object v4, p0, Lb/p/d/d;->c:Landroid/graphics/drawable/StateListDrawable;

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v5, v1, v3}, Landroid/graphics/drawable/StateListDrawable;->setBounds(IIII)V

    .line 21
    iget-object v1, p0, Lb/p/d/d;->d:Landroid/graphics/drawable/Drawable;

    iget v3, p0, Lb/p/d/d;->f:I

    iget v4, p0, Lb/p/d/d;->r:I

    .line 22
    invoke-virtual {v1, v5, v5, v3, v4}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 23
    invoke-virtual {p0}, Lb/p/d/d;->e()Z

    move-result v1

    if-eqz v1, :cond_46

    .line 24
    iget-object v0, p0, Lb/p/d/d;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 25
    iget v0, p0, Lb/p/d/d;->e:I

    int-to-float v0, v0

    int-to-float v1, v2

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v0, -0x40800000    # -1.0f

    const/high16 v1, 0x3f800000    # 1.0f

    .line 26
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 27
    iget-object v0, p0, Lb/p/d/d;->c:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/StateListDrawable;->draw(Landroid/graphics/Canvas;)V

    .line 28
    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->scale(FF)V

    .line 29
    iget v0, p0, Lb/p/d/d;->e:I

    neg-int v0, v0

    int-to-float v0, v0

    neg-int v1, v2

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    goto :goto_60

    :cond_46
    int-to-float v1, v0

    const/4 v3, 0x0

    .line 30
    invoke-virtual {p1, v1, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 31
    iget-object v1, p0, Lb/p/d/d;->d:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    int-to-float v1, v2

    .line 32
    invoke-virtual {p1, v3, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 33
    iget-object v1, p0, Lb/p/d/d;->c:Landroid/graphics/drawable/StateListDrawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/StateListDrawable;->draw(Landroid/graphics/Canvas;)V

    neg-int v0, v0

    int-to-float v0, v0

    neg-int v1, v2

    int-to-float v1, v1

    .line 34
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    :goto_60
    return-void
.end method

.method public b(Landroid/graphics/Canvas;Landroidx/recyclerview/widget/RecyclerView;Landroidx/recyclerview/widget/RecyclerView$y;)V
    .registers 4

    .line 7
    iget p2, p0, Lb/p/d/d;->q:I

    iget-object p3, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p3}, Landroid/view/ViewGroup;->getWidth()I

    move-result p3

    if-ne p2, p3, :cond_28

    iget p2, p0, Lb/p/d/d;->r:I

    iget-object p3, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    .line 8
    invoke-virtual {p3}, Landroid/view/ViewGroup;->getHeight()I

    move-result p3

    if-eq p2, p3, :cond_15

    goto :goto_28

    .line 9
    :cond_15
    iget p2, p0, Lb/p/d/d;->A:I

    if-eqz p2, :cond_27

    .line 10
    iget-boolean p2, p0, Lb/p/d/d;->t:Z

    if-eqz p2, :cond_20

    .line 11
    invoke-virtual {p0, p1}, Lb/p/d/d;->b(Landroid/graphics/Canvas;)V

    .line 12
    :cond_20
    iget-boolean p2, p0, Lb/p/d/d;->u:Z

    if-eqz p2, :cond_27

    .line 13
    invoke-virtual {p0, p1}, Lb/p/d/d;->a(Landroid/graphics/Canvas;)V

    :cond_27
    return-void

    .line 14
    :cond_28
    :goto_28
    iget-object p1, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getWidth()I

    move-result p1

    iput p1, p0, Lb/p/d/d;->q:I

    .line 15
    iget-object p1, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p1}, Landroid/view/ViewGroup;->getHeight()I

    move-result p1

    iput p1, p0, Lb/p/d/d;->r:I

    const/4 p1, 0x0

    .line 16
    invoke-virtual {p0, p1}, Lb/p/d/d;->c(I)V

    return-void
.end method

.method public b(Landroidx/recyclerview/widget/RecyclerView;Landroid/view/MotionEvent;)V
    .registers 7

    .line 35
    iget p1, p0, Lb/p/d/d;->v:I

    if-nez p1, :cond_5

    return-void

    .line 36
    :cond_5
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    const/4 v0, 0x1

    const/4 v1, 0x2

    if-nez p1, :cond_46

    .line 37
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v2

    invoke-virtual {p0, p1, v2}, Lb/p/d/d;->b(FF)Z

    move-result p1

    .line 38
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result v2

    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result v3

    invoke-virtual {p0, v2, v3}, Lb/p/d/d;->a(FF)Z

    move-result v2

    if-nez p1, :cond_29

    if-eqz v2, :cond_7f

    :cond_29
    if-eqz v2, :cond_36

    .line 39
    iput v0, p0, Lb/p/d/d;->w:I

    .line 40
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lb/p/d/d;->p:F

    goto :goto_42

    :cond_36
    if-eqz p1, :cond_42

    .line 41
    iput v1, p0, Lb/p/d/d;->w:I

    .line 42
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    float-to-int p1, p1

    int-to-float p1, p1

    iput p1, p0, Lb/p/d/d;->m:F

    .line 43
    :cond_42
    :goto_42
    invoke-virtual {p0, v1}, Lb/p/d/d;->c(I)V

    goto :goto_7f

    .line 44
    :cond_46
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v0, :cond_5c

    iget p1, p0, Lb/p/d/d;->v:I

    if-ne p1, v1, :cond_5c

    const/4 p1, 0x0

    .line 45
    iput p1, p0, Lb/p/d/d;->m:F

    .line 46
    iput p1, p0, Lb/p/d/d;->p:F

    .line 47
    invoke-virtual {p0, v0}, Lb/p/d/d;->c(I)V

    const/4 p1, 0x0

    .line 48
    iput p1, p0, Lb/p/d/d;->w:I

    goto :goto_7f

    .line 49
    :cond_5c
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    move-result p1

    if-ne p1, v1, :cond_7f

    iget p1, p0, Lb/p/d/d;->v:I

    if-ne p1, v1, :cond_7f

    .line 50
    invoke-virtual {p0}, Lb/p/d/d;->h()V

    .line 51
    iget p1, p0, Lb/p/d/d;->w:I

    if-ne p1, v0, :cond_74

    .line 52
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p0, p1}, Lb/p/d/d;->a(F)V

    .line 53
    :cond_74
    iget p1, p0, Lb/p/d/d;->w:I

    if-ne p1, v1, :cond_7f

    .line 54
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getY()F

    move-result p1

    invoke-virtual {p0, p1}, Lb/p/d/d;->b(F)V

    :cond_7f
    :goto_7f
    return-void
.end method

.method public b(FF)Z
    .registers 5

    .line 64
    invoke-virtual {p0}, Lb/p/d/d;->e()Z

    move-result v0

    if-eqz v0, :cond_10

    iget v0, p0, Lb/p/d/d;->e:I

    div-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    cmpg-float p1, p1, v0

    if-gtz p1, :cond_31

    goto :goto_1a

    :cond_10
    iget v0, p0, Lb/p/d/d;->q:I

    iget v1, p0, Lb/p/d/d;->e:I

    sub-int/2addr v0, v1

    int-to-float v0, v0

    cmpl-float p1, p1, v0

    if-ltz p1, :cond_31

    :goto_1a
    iget p1, p0, Lb/p/d/d;->l:I

    iget v0, p0, Lb/p/d/d;->k:I

    div-int/lit8 v1, v0, 0x2

    sub-int v1, p1, v1

    int-to-float v1, v1

    cmpl-float v1, p2, v1

    if-ltz v1, :cond_31

    div-int/lit8 v0, v0, 0x2

    add-int/2addr p1, v0

    int-to-float p1, p1

    cmpg-float p1, p2, p1

    if-gtz p1, :cond_31

    const/4 p1, 0x1

    goto :goto_32

    :cond_31
    const/4 p1, 0x0

    :goto_32
    return p1
.end method

.method public c(I)V
    .registers 5

    const/4 v0, 0x2

    if-ne p1, v0, :cond_11

    .line 1
    iget v1, p0, Lb/p/d/d;->v:I

    if-eq v1, v0, :cond_11

    .line 2
    iget-object v1, p0, Lb/p/d/d;->c:Landroid/graphics/drawable/StateListDrawable;

    sget-object v2, Lb/p/d/d;->D:[I

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    .line 3
    invoke-virtual {p0}, Lb/p/d/d;->a()V

    :cond_11
    if-nez p1, :cond_17

    .line 4
    invoke-virtual {p0}, Lb/p/d/d;->f()V

    goto :goto_1a

    .line 5
    :cond_17
    invoke-virtual {p0}, Lb/p/d/d;->h()V

    .line 6
    :goto_1a
    iget v1, p0, Lb/p/d/d;->v:I

    if-ne v1, v0, :cond_2d

    if-eq p1, v0, :cond_2d

    .line 7
    iget-object v0, p0, Lb/p/d/d;->c:Landroid/graphics/drawable/StateListDrawable;

    sget-object v1, Lb/p/d/d;->E:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/StateListDrawable;->setState([I)Z

    const/16 v0, 0x4b0

    .line 8
    invoke-virtual {p0, v0}, Lb/p/d/d;->b(I)V

    goto :goto_35

    :cond_2d
    const/4 v0, 0x1

    if-ne p1, v0, :cond_35

    const/16 v0, 0x5dc

    .line 9
    invoke-virtual {p0, v0}, Lb/p/d/d;->b(I)V

    .line 10
    :cond_35
    :goto_35
    iput p1, p0, Lb/p/d/d;->v:I

    return-void
.end method

.method public final c()[I
    .registers 4

    .line 11
    iget-object v0, p0, Lb/p/d/d;->y:[I

    iget v1, p0, Lb/p/d/d;->b:I

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 12
    iget v2, p0, Lb/p/d/d;->q:I

    sub-int/2addr v2, v1

    const/4 v1, 0x1

    aput v2, v0, v1

    return-object v0
.end method

.method public final d()[I
    .registers 4

    .line 1
    iget-object v0, p0, Lb/p/d/d;->x:[I

    iget v1, p0, Lb/p/d/d;->b:I

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 2
    iget v2, p0, Lb/p/d/d;->r:I

    sub-int/2addr v2, v1

    const/4 v1, 0x1

    aput v2, v0, v1

    return-object v0
.end method

.method public final e()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {v0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    return v1
.end method

.method public f()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroid/view/ViewGroup;->invalidate()V

    return-void
.end method

.method public final g()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$n;)V

    .line 2
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$r;)V

    .line 3
    iget-object v0, p0, Lb/p/d/d;->s:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v1, p0, Lb/p/d/d;->C:Landroidx/recyclerview/widget/RecyclerView$s;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->a(Landroidx/recyclerview/widget/RecyclerView$s;)V

    return-void
.end method

.method public h()V
    .registers 6

    .line 1
    iget v0, p0, Lb/p/d/d;->A:I

    if-eqz v0, :cond_d

    const/4 v1, 0x3

    if-eq v0, v1, :cond_8

    goto :goto_3c

    .line 2
    :cond_8
    iget-object v0, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_d
    const/4 v0, 0x1

    .line 3
    iput v0, p0, Lb/p/d/d;->A:I

    .line 4
    iget-object v1, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    invoke-virtual {v1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Float;

    invoke-virtual {v4}, Ljava/lang/Float;->floatValue()F

    move-result v4

    aput v4, v2, v3

    const/high16 v3, 0x3f800000    # 1.0f

    aput v3, v2, v0

    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->setFloatValues([F)V

    .line 5
    iget-object v0, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x1f4

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 6
    iget-object v0, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setStartDelay(J)V

    .line 7
    iget-object v0, p0, Lb/p/d/d;->z:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    :goto_3c
    return-void
.end method
