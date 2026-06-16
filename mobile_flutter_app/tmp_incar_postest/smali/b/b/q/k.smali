.class public Lb/b/q/k;
.super Lb/b/q/i;
.source "AppCompatSeekBarHelper.java"


# instance fields
.field public final d:Landroid/widget/SeekBar;

.field public e:Landroid/graphics/drawable/Drawable;

.field public f:Landroid/content/res/ColorStateList;

.field public g:Landroid/graphics/PorterDuff$Mode;

.field public h:Z

.field public i:Z


# direct methods
.method public constructor <init>(Landroid/widget/SeekBar;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Lb/b/q/i;-><init>(Landroid/widget/ProgressBar;)V

    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lb/b/q/k;->f:Landroid/content/res/ColorStateList;

    .line 3
    iput-object v0, p0, Lb/b/q/k;->g:Landroid/graphics/PorterDuff$Mode;

    const/4 v0, 0x0

    .line 4
    iput-boolean v0, p0, Lb/b/q/k;->h:Z

    .line 5
    iput-boolean v0, p0, Lb/b/q/k;->i:Z

    .line 6
    iput-object p1, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;)V
    .registers 8

    .line 18
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_6a

    .line 19
    iget-object v0, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_6a

    .line 20
    iget-object v2, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v2

    .line 21
    iget-object v3, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v3}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    if-ltz v2, :cond_1e

    .line 22
    div-int/lit8 v2, v2, 0x2

    goto :goto_1f

    :cond_1e
    const/4 v2, 0x1

    :goto_1f
    if-ltz v3, :cond_23

    .line 23
    div-int/lit8 v1, v3, 0x2

    .line 24
    :cond_23
    iget-object v3, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    neg-int v4, v2

    neg-int v5, v1

    invoke-virtual {v3, v4, v5, v2, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 25
    iget-object v1, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getWidth()I

    move-result v1

    iget-object v2, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v2}, Landroid/widget/SeekBar;->getPaddingLeft()I

    move-result v2

    sub-int/2addr v1, v2

    iget-object v2, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    .line 26
    invoke-virtual {v2}, Landroid/widget/SeekBar;->getPaddingRight()I

    move-result v2

    sub-int/2addr v1, v2

    int-to-float v1, v1

    int-to-float v2, v0

    div-float/2addr v1, v2

    .line 27
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    .line 28
    iget-object v3, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v3}, Landroid/widget/SeekBar;->getPaddingLeft()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v4}, Landroid/widget/SeekBar;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    int-to-float v4, v4

    invoke-virtual {p1, v3, v4}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 v3, 0x0

    :goto_59
    if-gt v3, v0, :cond_67

    .line 29
    iget-object v4, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v4, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    const/4 v4, 0x0

    .line 30
    invoke-virtual {p1, v1, v4}, Landroid/graphics/Canvas;->translate(FF)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_59

    .line 31
    :cond_67
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_6a
    return-void
.end method

.method public a(Landroid/util/AttributeSet;I)V
    .registers 11

    .line 1
    invoke-super {p0, p1, p2}, Lb/b/q/i;->a(Landroid/util/AttributeSet;I)V

    .line 2
    iget-object v0, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lb/b/j;->AppCompatSeekBar:[I

    const/4 v2, 0x0

    invoke-static {v0, p1, v1, p2, v2}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[III)Lb/b/q/g0;

    move-result-object v0

    .line 3
    iget-object v1, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lb/b/j;->AppCompatSeekBar:[I

    .line 4
    invoke-virtual {v0}, Lb/b/q/g0;->a()Landroid/content/res/TypedArray;

    move-result-object v5

    const/4 v7, 0x0

    move-object v4, p1

    move v6, p2

    .line 5
    invoke-static/range {v1 .. v7}, Lb/h/m/y;->a(Landroid/view/View;Landroid/content/Context;[ILandroid/util/AttributeSet;Landroid/content/res/TypedArray;II)V

    .line 6
    sget p1, Lb/b/j;->AppCompatSeekBar_android_thumb:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->c(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    if-eqz p1, :cond_2f

    .line 7
    iget-object p2, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {p2, p1}, Landroid/widget/SeekBar;->setThumb(Landroid/graphics/drawable/Drawable;)V

    .line 8
    :cond_2f
    sget p1, Lb/b/j;->AppCompatSeekBar_tickMark:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->b(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    .line 9
    invoke-virtual {p0, p1}, Lb/b/q/k;->b(Landroid/graphics/drawable/Drawable;)V

    .line 10
    sget p1, Lb/b/j;->AppCompatSeekBar_tickMarkTintMode:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    const/4 p2, 0x1

    if-eqz p1, :cond_52

    .line 11
    sget p1, Lb/b/j;->AppCompatSeekBar_tickMarkTintMode:I

    const/4 v1, -0x1

    invoke-virtual {v0, p1, v1}, Lb/b/q/g0;->d(II)I

    move-result p1

    iget-object v1, p0, Lb/b/q/k;->g:Landroid/graphics/PorterDuff$Mode;

    invoke-static {p1, v1}, Lb/b/q/q;->a(ILandroid/graphics/PorterDuff$Mode;)Landroid/graphics/PorterDuff$Mode;

    move-result-object p1

    iput-object p1, p0, Lb/b/q/k;->g:Landroid/graphics/PorterDuff$Mode;

    .line 12
    iput-boolean p2, p0, Lb/b/q/k;->i:Z

    .line 13
    :cond_52
    sget p1, Lb/b/j;->AppCompatSeekBar_tickMarkTint:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->g(I)Z

    move-result p1

    if-eqz p1, :cond_64

    .line 14
    sget p1, Lb/b/j;->AppCompatSeekBar_tickMarkTint:I

    invoke-virtual {v0, p1}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lb/b/q/k;->f:Landroid/content/res/ColorStateList;

    .line 15
    iput-boolean p2, p0, Lb/b/q/k;->h:Z

    .line 16
    :cond_64
    invoke-virtual {v0}, Lb/b/q/g0;->b()V

    .line 17
    invoke-virtual {p0}, Lb/b/q/k;->c()V

    return-void
.end method

.method public b(Landroid/graphics/drawable/Drawable;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_8

    const/4 v1, 0x0

    .line 2
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 3
    :cond_8
    iput-object p1, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_2c

    .line 4
    iget-object v0, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setCallback(Landroid/graphics/drawable/Drawable$Callback;)V

    .line 5
    iget-object v0, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-static {v0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    invoke-static {p1, v0}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;I)Z

    .line 6
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_29

    .line 7
    iget-object v0, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v0}, Landroid/widget/SeekBar;->getDrawableState()[I

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    .line 8
    :cond_29
    invoke-virtual {p0}, Lb/b/q/k;->c()V

    .line 9
    :cond_2c
    iget-object p1, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {p1}, Landroid/widget/SeekBar;->invalidate()V

    return-void
.end method

.method public final c()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_3f

    iget-boolean v0, p0, Lb/b/q/k;->h:Z

    if-nez v0, :cond_c

    iget-boolean v0, p0, Lb/b/q/k;->i:Z

    if-eqz v0, :cond_3f

    .line 2
    :cond_c
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-static {v0}, Lb/h/f/l/a;->i(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iput-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    .line 3
    iget-boolean v1, p0, Lb/b/q/k;->h:Z

    if-eqz v1, :cond_21

    .line 4
    iget-object v1, p0, Lb/b/q/k;->f:Landroid/content/res/ColorStateList;

    invoke-static {v0, v1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    .line 5
    :cond_21
    iget-boolean v0, p0, Lb/b/q/k;->i:Z

    if-eqz v0, :cond_2c

    .line 6
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lb/b/q/k;->g:Landroid/graphics/PorterDuff$Mode;

    invoke-static {v0, v1}, Lb/h/f/l/a;->a(Landroid/graphics/drawable/Drawable;Landroid/graphics/PorterDuff$Mode;)V

    .line 7
    :cond_2c
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_3f

    .line 8
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    iget-object v1, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v1}, Landroid/widget/SeekBar;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_3f
    return-void
.end method

.method public d()V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_1b

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_1b

    iget-object v1, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    .line 3
    invoke-virtual {v1}, Landroid/widget/SeekBar;->getDrawableState()[I

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    move-result v1

    if-eqz v1, :cond_1b

    .line 4
    iget-object v1, p0, Lb/b/q/k;->d:Landroid/widget/SeekBar;

    invoke-virtual {v1, v0}, Landroid/widget/SeekBar;->invalidateDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_1b
    return-void
.end method

.method public e()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/q/k;->e:Landroid/graphics/drawable/Drawable;

    if-eqz v0, :cond_7

    .line 2
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->jumpToCurrentState()V

    :cond_7
    return-void
.end method
