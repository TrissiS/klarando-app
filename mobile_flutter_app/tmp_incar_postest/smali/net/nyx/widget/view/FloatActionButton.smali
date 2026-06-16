.class public final Lnet/nyx/widget/view/FloatActionButton;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "FloatActionButton.java"


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance p1, Ld/a/d/i/b;

    invoke-direct {p1, p0}, Ld/a/d/i/b;-><init>(Lnet/nyx/widget/view/FloatActionButton;)V

    .line 3
    new-instance p1, Ld/a/d/i/c;

    invoke-direct {p1, p0}, Ld/a/d/i/c;-><init>(Lnet/nyx/widget/view/FloatActionButton;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 3

    .line 4
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    new-instance p1, Ld/a/d/i/b;

    invoke-direct {p1, p0}, Ld/a/d/i/b;-><init>(Lnet/nyx/widget/view/FloatActionButton;)V

    .line 6
    new-instance p1, Ld/a/d/i/c;

    invoke-direct {p1, p0}, Ld/a/d/i/c;-><init>(Lnet/nyx/widget/view/FloatActionButton;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 8
    new-instance p1, Ld/a/d/i/b;

    invoke-direct {p1, p0}, Ld/a/d/i/b;-><init>(Lnet/nyx/widget/view/FloatActionButton;)V

    .line 9
    new-instance p1, Ld/a/d/i/c;

    invoke-direct {p1, p0}, Ld/a/d/i/c;-><init>(Lnet/nyx/widget/view/FloatActionButton;)V

    return-void
.end method


# virtual methods
.method public synthetic a(Landroid/animation/ValueAnimator;)V
    .registers 2

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleY(F)V

    return-void
.end method

.method public synthetic b(Landroid/animation/ValueAnimator;)V
    .registers 3

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    .line 2
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setAlpha(F)V

    .line 3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleX(F)V

    .line 4
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setScaleY(F)V

    const/4 v0, 0x0

    cmpl-float p1, p1, v0

    if-nez p1, :cond_1c

    const/4 p1, 0x4

    .line 5
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_1c
    return-void
.end method

.method public synthetic c()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_b

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Landroid/widget/ImageView;->setVisibility(I)V

    :cond_b
    const/4 v0, 0x2

    new-array v0, v0, [F

    .line 3
    fill-array-data v0, :array_26

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    .line 4
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 5
    new-instance v1, Ld/a/d/i/a;

    invoke-direct {v1, p0}, Ld/a/d/i/a;-><init>(Lnet/nyx/widget/view/FloatActionButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 6
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    :array_26
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public synthetic d()V
    .registers 4

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getVisibility()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_8

    return-void

    :cond_8
    const/4 v0, 0x2

    new-array v0, v0, [F

    .line 2
    fill-array-data v0, :array_24

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    const-wide/16 v1, 0x12c

    .line 3
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 4
    new-instance v1, Ld/a/d/i/d;

    invoke-direct {v1, p0}, Ld/a/d/i/d;-><init>(Lnet/nyx/widget/view/FloatActionButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :array_24
    .array-data 4
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
