.class public final Lnet/nyx/widget/view/SimpleRatingBar;
.super Landroid/view/View;
.source "SimpleRatingBar.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnet/nyx/widget/view/SimpleRatingBar$b;,
        Lnet/nyx/widget/view/SimpleRatingBar$a;
    }
.end annotation


# instance fields
.field public h:Landroid/graphics/drawable/Drawable;

.field public i:Landroid/graphics/drawable/Drawable;

.field public j:Landroid/graphics/drawable/Drawable;

.field public k:F

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:Lnet/nyx/widget/view/SimpleRatingBar$a;

.field public q:Lnet/nyx/widget/view/SimpleRatingBar$b;

.field public final r:Landroid/graphics/Rect;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/SimpleRatingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/SimpleRatingBar;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 5

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->r:Landroid/graphics/Rect;

    .line 5
    sget-object p3, Ld/a/d/f;->SimpleRatingBar:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Ld/a/d/f;->SimpleRatingBar_normalDrawable:I

    sget v0, Ld/a/d/d;->rating_star_off_ic:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    invoke-static {p2, p3}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->h:Landroid/graphics/drawable/Drawable;

    .line 7
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Ld/a/d/f;->SimpleRatingBar_halfDrawable:I

    sget v0, Ld/a/d/d;->rating_star_half_ic:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    invoke-static {p2, p3}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->j:Landroid/graphics/drawable/Drawable;

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    sget p3, Ld/a/d/f;->SimpleRatingBar_fillDrawable:I

    sget v0, Ld/a/d/d;->rating_star_fill_ic:I

    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p3

    invoke-static {p2, p3}, Lb/h/e/a;->c(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p2

    iput-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->i:Landroid/graphics/drawable/Drawable;

    .line 9
    iget-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    iget-object p3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    if-ne p2, p3, :cond_d2

    iget-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->h:Landroid/graphics/drawable/Drawable;

    .line 10
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p2

    iget-object p3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->j:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    if-ne p2, p3, :cond_d2

    iget-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->h:Landroid/graphics/drawable/Drawable;

    .line 11
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    iget-object p3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p3

    if-ne p2, p3, :cond_d2

    iget-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->h:Landroid/graphics/drawable/Drawable;

    .line 12
    invoke-virtual {p2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p2

    iget-object p3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->j:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p3

    if-ne p2, p3, :cond_d2

    .line 13
    sget p2, Ld/a/d/f;->SimpleRatingBar_grade:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    .line 14
    sget p2, Ld/a/d/f;->SimpleRatingBar_gradeCount:I

    const/4 p3, 0x5

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->l:I

    .line 15
    sget p2, Ld/a/d/f;->SimpleRatingBar_gradeWidth:I

    iget-object p3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->m:I

    .line 16
    sget p2, Ld/a/d/f;->SimpleRatingBar_gradeHeight:I

    iget-object p3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {p3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->n:I

    .line 17
    sget p2, Ld/a/d/f;->SimpleRatingBar_gradeSpace:I

    iget p3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->m:I

    int-to-float p3, p3

    const/high16 v0, 0x40800000    # 4.0f

    div-float/2addr p3, v0

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p2

    float-to-int p2, p2

    iput p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->o:I

    .line 18
    sget p2, Ld/a/d/f;->SimpleRatingBar_gradeStep:I

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    const/4 p3, 0x1

    if-eq p2, p3, :cond_ca

    .line 19
    sget-object p2, Lnet/nyx/widget/view/SimpleRatingBar$a;->HALF:Lnet/nyx/widget/view/SimpleRatingBar$a;

    iput-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->p:Lnet/nyx/widget/view/SimpleRatingBar$a;

    goto :goto_ce

    .line 20
    :cond_ca
    sget-object p2, Lnet/nyx/widget/view/SimpleRatingBar$a;->ONE:Lnet/nyx/widget/view/SimpleRatingBar$a;

    iput-object p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->p:Lnet/nyx/widget/view/SimpleRatingBar$a;

    .line 21
    :goto_ce
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    .line 22
    :cond_d2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "The width and height of the picture do not agree"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public getGrade()F
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    return v0
.end method

.method public getGradeCount()I
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->l:I

    return v0
.end method

.method public getGradeStep()Lnet/nyx/widget/view/SimpleRatingBar$a;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->p:Lnet/nyx/widget/view/SimpleRatingBar$a;

    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 8

    const/4 v0, 0x0

    .line 1
    :goto_1
    iget v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->l:I

    if-ge v0, v1, :cond_6e

    .line 2
    iget v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->o:I

    iget v2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->m:I

    add-int/2addr v2, v1

    mul-int v2, v2, v0

    add-int/2addr v1, v2

    .line 3
    iget-object v2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->r:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v3

    add-int/2addr v3, v1

    iput v3, v2, Landroid/graphics/Rect;->left:I

    .line 4
    iget-object v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->r:Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    iput v2, v1, Landroid/graphics/Rect;->top:I

    .line 5
    iget-object v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->r:Landroid/graphics/Rect;

    iget v2, v1, Landroid/graphics/Rect;->left:I

    iget v3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->m:I

    add-int/2addr v2, v3

    iput v2, v1, Landroid/graphics/Rect;->right:I

    .line 6
    iget v2, v1, Landroid/graphics/Rect;->top:I

    iget v3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->n:I

    add-int/2addr v2, v3

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    .line 7
    iget v2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    int-to-float v3, v0

    cmpl-float v3, v2, v3

    if-lez v3, :cond_61

    .line 8
    iget-object v3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->j:Landroid/graphics/drawable/Drawable;

    if-eqz v3, :cond_54

    iget-object v4, p0, Lnet/nyx/widget/view/SimpleRatingBar;->p:Lnet/nyx/widget/view/SimpleRatingBar$a;

    sget-object v5, Lnet/nyx/widget/view/SimpleRatingBar$a;->HALF:Lnet/nyx/widget/view/SimpleRatingBar$a;

    if-ne v4, v5, :cond_54

    float-to-int v4, v2

    if-ne v4, v0, :cond_54

    float-to-int v4, v2

    int-to-float v4, v4

    sub-float/2addr v2, v4

    const/high16 v4, 0x3f000000    # 0.5f

    cmpl-float v2, v2, v4

    if-nez v2, :cond_54

    .line 9
    invoke-virtual {v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 10
    iget-object v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->j:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_6b

    .line 11
    :cond_54
    iget-object v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->i:Landroid/graphics/drawable/Drawable;

    iget-object v2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->r:Landroid/graphics/Rect;

    invoke-virtual {v1, v2}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 12
    iget-object v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->i:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    goto :goto_6b

    .line 13
    :cond_61
    iget-object v2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(Landroid/graphics/Rect;)V

    .line 14
    iget-object v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->h:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v1, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    :goto_6b
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_6e
    return-void
.end method

.method public onMeasure(II)V
    .registers 4

    .line 1
    iget p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->m:I

    iget p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->l:I

    mul-int p1, p1, p2

    iget v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->o:I

    add-int/lit8 p2, p2, 0x1

    mul-int v0, v0, p2

    add-int/2addr p1, v0

    .line 2
    iget p2, p0, Lnet/nyx/widget/view/SimpleRatingBar;->n:I

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    add-int/2addr p1, v0

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    add-int/2addr p2, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    add-int/2addr p2, v0

    .line 5
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public onTouchEvent(Landroid/view/MotionEvent;)Z
    .registers 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 2
    :cond_8
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_13

    const/4 v2, 0x2

    if-eq v0, v2, :cond_13

    goto :goto_66

    .line 3
    :cond_13
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    int-to-float v0, v0

    sub-float/2addr p1, v0

    iget v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->o:I

    int-to-float v2, v0

    sub-float/2addr p1, v2

    const/4 v2, 0x0

    cmpl-float v3, p1, v2

    if-lez v3, :cond_2c

    .line 4
    iget v3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->m:I

    add-int/2addr v3, v0

    int-to-float v0, v3

    div-float/2addr p1, v0

    goto :goto_2d

    :cond_2c
    const/4 p1, 0x0

    .line 5
    :goto_2d
    invoke-static {p1, v2}, Ljava/lang/Math;->max(FF)F

    move-result p1

    iget v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->l:I

    int-to-float v0, v0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(FF)F

    move-result p1

    float-to-int v0, p1

    int-to-float v0, v0

    sub-float v3, p1, v0

    cmpl-float v2, v3, v2

    if-lez v2, :cond_4c

    const/high16 v2, 0x3f000000    # 0.5f

    cmpl-float v3, v3, v2

    if-lez v3, :cond_4a

    add-float/2addr p1, v2

    float-to-int p1, p1

    int-to-float p1, p1

    goto :goto_4c

    :cond_4a
    add-float p1, v0, v2

    :cond_4c
    :goto_4c
    const/high16 v0, 0x41200000    # 10.0f

    mul-float v2, p1, v0

    .line 6
    iget v3, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    mul-float v3, v3, v0

    cmpl-float v0, v2, v3

    if-eqz v0, :cond_66

    .line 7
    iput p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    iget-object p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->q:Lnet/nyx/widget/view/SimpleRatingBar$b;

    if-eqz p1, :cond_66

    .line 10
    iget v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    invoke-interface {p1, p0, v0, v1}, Lnet/nyx/widget/view/SimpleRatingBar$b;->a(Lnet/nyx/widget/view/SimpleRatingBar;FZ)V

    :cond_66
    :goto_66
    return v1
.end method

.method public setGrade(F)V
    .registers 4

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->l:I

    int-to-float v1, v0

    cmpl-float v1, p1, v1

    if-lez v1, :cond_8

    int-to-float p1, v0

    :cond_8
    float-to-int v0, p1

    int-to-float v0, v0

    sub-float v0, p1, v0

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float v1, v0, v1

    if-nez v1, :cond_27

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-gtz v0, :cond_27

    .line 2
    iput p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    iget-object p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->q:Lnet/nyx/widget/view/SimpleRatingBar$b;

    if-eqz p1, :cond_26

    .line 5
    iget v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    const/4 v1, 0x0

    invoke-interface {p1, p0, v0, v1}, Lnet/nyx/widget/view/SimpleRatingBar$b;->a(Lnet/nyx/widget/view/SimpleRatingBar;FZ)V

    :cond_26
    return-void

    .line 6
    :cond_27
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "grade must be a multiple of 0.5f"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public setGradeCount(I)V
    .registers 4

    int-to-float v0, p1

    .line 1
    iget v1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    cmpl-float v1, v0, v1

    if-lez v1, :cond_9

    .line 2
    iput v0, p0, Lnet/nyx/widget/view/SimpleRatingBar;->k:F

    .line 3
    :cond_9
    iput p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->l:I

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setGradeSpace(I)V
    .registers 2

    .line 1
    iput p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->o:I

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->requestLayout()V

    return-void
.end method

.method public setGradeStep(Lnet/nyx/widget/view/SimpleRatingBar$a;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->p:Lnet/nyx/widget/view/SimpleRatingBar$a;

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setOnRatingBarChangeListener(Lnet/nyx/widget/view/SimpleRatingBar$b;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lnet/nyx/widget/view/SimpleRatingBar;->q:Lnet/nyx/widget/view/SimpleRatingBar$b;

    return-void
.end method
