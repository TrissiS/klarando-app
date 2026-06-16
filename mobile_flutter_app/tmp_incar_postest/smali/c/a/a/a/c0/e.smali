.class public Lc/a/a/a/c0/e;
.super Lc/a/a/a/c0/d;
.source "FloatingActionButtonImplLollipop.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/c0/e$a;
    }
.end annotation


# direct methods
.method public constructor <init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Lc/a/a/a/k0/b;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1, p2}, Lc/a/a/a/c0/d;-><init>(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;Lc/a/a/a/k0/b;)V

    return-void
.end method


# virtual methods
.method public final a(FF)Landroid/animation/Animator;
    .registers 10

    .line 47
    new-instance v0, Landroid/animation/AnimatorSet;

    invoke-direct {v0}, Landroid/animation/AnimatorSet;-><init>()V

    .line 48
    iget-object v1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    const/4 v2, 0x1

    new-array v3, v2, [F

    const/4 v4, 0x0

    aput p1, v3, v4

    const-string p1, "elevation"

    invoke-static {v1, p1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    const-wide/16 v5, 0x0

    invoke-virtual {p1, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->play(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    move-result-object p1

    iget-object v1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    sget-object v3, Landroid/view/View;->TRANSLATION_Z:Landroid/util/Property;

    new-array v2, v2, [F

    aput p2, v2, v4

    .line 49
    invoke-static {v1, v3, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p2

    const-wide/16 v1, 0x64

    .line 50
    invoke-virtual {p2, v1, v2}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p2

    .line 51
    invoke-virtual {p1, p2}, Landroid/animation/AnimatorSet$Builder;->with(Landroid/animation/Animator;)Landroid/animation/AnimatorSet$Builder;

    .line 52
    sget-object p1, Lc/a/a/a/c0/d;->F:Landroid/animation/TimeInterpolator;

    invoke-virtual {v0, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    return-object v0
.end method

.method public a(ILandroid/content/res/ColorStateList;)Lc/a/a/a/c0/c;
    .registers 9

    .line 63
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 64
    new-instance v1, Lc/a/a/a/c0/c;

    iget-object v2, p0, Lc/a/a/a/c0/d;->a:Lc/a/a/a/l0/m;

    invoke-static {v2}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v2, Lc/a/a/a/l0/m;

    invoke-direct {v1, v2}, Lc/a/a/a/c0/c;-><init>(Lc/a/a/a/l0/m;)V

    .line 65
    sget v2, Lc/a/a/a/c;->design_fab_stroke_top_outer_color:I

    .line 66
    invoke-static {v0, v2}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v2

    sget v3, Lc/a/a/a/c;->design_fab_stroke_top_inner_color:I

    .line 67
    invoke-static {v0, v3}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v3

    sget v4, Lc/a/a/a/c;->design_fab_stroke_end_inner_color:I

    .line 68
    invoke-static {v0, v4}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v4

    sget v5, Lc/a/a/a/c;->design_fab_stroke_end_outer_color:I

    .line 69
    invoke-static {v0, v5}, Lb/h/e/a;->a(Landroid/content/Context;I)I

    move-result v0

    .line 70
    invoke-virtual {v1, v2, v3, v4, v0}, Lc/a/a/a/c0/c;->a(IIII)V

    int-to-float p1, p1

    .line 71
    invoke-virtual {v1, p1}, Lc/a/a/a/c0/c;->a(F)V

    .line 72
    invoke-virtual {v1, p2}, Lc/a/a/a/c0/c;->a(Landroid/content/res/ColorStateList;)V

    return-object v1
.end method

.method public a()Lc/a/a/a/l0/h;
    .registers 3

    .line 73
    iget-object v0, p0, Lc/a/a/a/c0/d;->a:Lc/a/a/a/l0/m;

    invoke-static {v0}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v0, Lc/a/a/a/l0/m;

    .line 74
    new-instance v1, Lc/a/a/a/c0/e$a;

    invoke-direct {v1, v0}, Lc/a/a/a/c0/e$a;-><init>(Lc/a/a/a/l0/m;)V

    return-object v1
.end method

.method public a(FFF)V
    .registers 12

    .line 13
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ne v0, v1, :cond_d

    .line 14
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1}, Landroid/widget/ImageButton;->refreshDrawableState()V

    goto/16 :goto_b1

    .line 15
    :cond_d
    new-instance v0, Landroid/animation/StateListAnimator;

    invoke-direct {v0}, Landroid/animation/StateListAnimator;-><init>()V

    .line 16
    sget-object v1, Lc/a/a/a/c0/d;->G:[I

    .line 17
    invoke-virtual {p0, p1, p3}, Lc/a/a/a/c0/e;->a(FF)Landroid/animation/Animator;

    move-result-object p3

    .line 18
    invoke-virtual {v0, v1, p3}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 19
    sget-object p3, Lc/a/a/a/c0/d;->H:[I

    .line 20
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/c0/e;->a(FF)Landroid/animation/Animator;

    move-result-object v1

    .line 21
    invoke-virtual {v0, p3, v1}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 22
    sget-object p3, Lc/a/a/a/c0/d;->I:[I

    .line 23
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/c0/e;->a(FF)Landroid/animation/Animator;

    move-result-object v1

    .line 24
    invoke-virtual {v0, p3, v1}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 25
    sget-object p3, Lc/a/a/a/c0/d;->J:[I

    .line 26
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/c0/e;->a(FF)Landroid/animation/Animator;

    move-result-object p2

    .line 27
    invoke-virtual {v0, p3, p2}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 28
    new-instance p2, Landroid/animation/AnimatorSet;

    invoke-direct {p2}, Landroid/animation/AnimatorSet;-><init>()V

    .line 29
    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3}, Ljava/util/ArrayList;-><init>()V

    .line 30
    iget-object v1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    const/4 v2, 0x1

    new-array v3, v2, [F

    const/4 v4, 0x0

    aput p1, v3, v4

    const-string p1, "elevation"

    invoke-static {v1, p1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Ljava/lang/String;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    const-wide/16 v5, 0x0

    invoke-virtual {p1, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x16

    const-wide/16 v5, 0x64

    if-lt p1, v1, :cond_7a

    const/16 v1, 0x18

    if-gt p1, v1, :cond_7a

    .line 32
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    sget-object v1, Landroid/view/View;->TRANSLATION_Z:Landroid/util/Property;

    new-array v3, v2, [F

    .line 33
    invoke-virtual {p1}, Landroid/widget/ImageButton;->getTranslationZ()F

    move-result v7

    aput v7, v3, v4

    invoke-static {p1, v1, v3}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 34
    invoke-virtual {p1, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 35
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 36
    :cond_7a
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    sget-object v1, Landroid/view/View;->TRANSLATION_Z:Landroid/util/Property;

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput v3, v2, v4

    .line 37
    invoke-static {p1, v1, v2}, Landroid/animation/ObjectAnimator;->ofFloat(Ljava/lang/Object;Landroid/util/Property;[F)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 38
    invoke-virtual {p1, v5, v6}, Landroid/animation/ObjectAnimator;->setDuration(J)Landroid/animation/ObjectAnimator;

    move-result-object p1

    .line 39
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    new-array p1, v4, [Landroid/animation/Animator;

    .line 40
    invoke-interface {p3, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [Landroid/animation/Animator;

    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->playSequentially([Landroid/animation/Animator;)V

    .line 41
    sget-object p1, Lc/a/a/a/c0/d;->F:Landroid/animation/TimeInterpolator;

    invoke-virtual {p2, p1}, Landroid/animation/AnimatorSet;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 42
    sget-object p1, Lc/a/a/a/c0/d;->K:[I

    invoke-virtual {v0, p1, p2}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 43
    sget-object p1, Lc/a/a/a/c0/d;->L:[I

    invoke-virtual {p0, v3, v3}, Lc/a/a/a/c0/e;->a(FF)Landroid/animation/Animator;

    move-result-object p2

    invoke-virtual {v0, p1, p2}, Landroid/animation/StateListAnimator;->addState([ILandroid/animation/Animator;)V

    .line 44
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1, v0}, Landroid/widget/ImageButton;->setStateListAnimator(Landroid/animation/StateListAnimator;)V

    .line 45
    :goto_b1
    invoke-virtual {p0}, Lc/a/a/a/c0/e;->w()Z

    move-result p1

    if-eqz p1, :cond_ba

    .line 46
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->B()V

    :cond_ba
    return-void
.end method

.method public a(Landroid/content/res/ColorStateList;Landroid/graphics/PorterDuff$Mode;Landroid/content/res/ColorStateList;I)V
    .registers 7

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/c0/e;->a()Lc/a/a/a/l0/h;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    .line 2
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setTintList(Landroid/content/res/ColorStateList;)V

    if-eqz p2, :cond_10

    .line 3
    iget-object v0, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    invoke-virtual {v0, p2}, Lc/a/a/a/l0/h;->setTintMode(Landroid/graphics/PorterDuff$Mode;)V

    .line 4
    :cond_10
    iget-object p2, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {p2, v0}, Lc/a/a/a/l0/h;->a(Landroid/content/Context;)V

    const/4 p2, 0x0

    if-lez p4, :cond_41

    .line 5
    invoke-virtual {p0, p4, p1}, Lc/a/a/a/c0/e;->a(ILandroid/content/res/ColorStateList;)Lc/a/a/a/c0/c;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/c0/d;->d:Lc/a/a/a/c0/c;

    .line 6
    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    const/4 p4, 0x2

    new-array p4, p4, [Landroid/graphics/drawable/Drawable;

    const/4 v0, 0x0

    iget-object v1, p0, Lc/a/a/a/c0/d;->d:Lc/a/a/a/c0/c;

    .line 7
    invoke-static {v1}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    aput-object v1, p4, v0

    const/4 v0, 0x1

    iget-object v1, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    invoke-static {v1}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast v1, Landroid/graphics/drawable/Drawable;

    aput-object v1, p4, v0

    invoke-direct {p1, p4}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    goto :goto_45

    .line 8
    :cond_41
    iput-object p2, p0, Lc/a/a/a/c0/d;->d:Lc/a/a/a/c0/c;

    .line 9
    iget-object p1, p0, Lc/a/a/a/c0/d;->b:Lc/a/a/a/l0/h;

    .line 10
    :goto_45
    new-instance p4, Landroid/graphics/drawable/RippleDrawable;

    .line 11
    invoke-static {p3}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object p3

    invoke-direct {p4, p3, p1, p2}, Landroid/graphics/drawable/RippleDrawable;-><init>(Landroid/content/res/ColorStateList;Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)V

    iput-object p4, p0, Lc/a/a/a/c0/d;->c:Landroid/graphics/drawable/Drawable;

    .line 12
    iput-object p4, p0, Lc/a/a/a/c0/d;->e:Landroid/graphics/drawable/Drawable;

    return-void
.end method

.method public a(Landroid/graphics/Rect;)V
    .registers 4

    .line 75
    iget-object v0, p0, Lc/a/a/a/c0/d;->z:Lc/a/a/a/k0/b;

    invoke-interface {v0}, Lc/a/a/a/k0/b;->a()Z

    move-result v0

    if-eqz v0, :cond_c

    .line 76
    invoke-super {p0, p1}, Lc/a/a/a/c0/d;->a(Landroid/graphics/Rect;)V

    goto :goto_25

    .line 77
    :cond_c
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->y()Z

    move-result v0

    if-nez v0, :cond_21

    .line 78
    iget v0, p0, Lc/a/a/a/c0/d;->k:I

    iget-object v1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->getSizeDimension()I

    move-result v1

    sub-int/2addr v0, v1

    div-int/lit8 v0, v0, 0x2

    .line 79
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    goto :goto_25

    :cond_21
    const/4 v0, 0x0

    .line 80
    invoke-virtual {p1, v0, v0, v0, v0}, Landroid/graphics/Rect;->set(IIII)V

    :goto_25
    return-void
.end method

.method public a([I)V
    .registers 4

    .line 53
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-ne p1, v0, :cond_4f

    .line 54
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1}, Landroid/widget/ImageButton;->isEnabled()Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_45

    .line 55
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget v1, p0, Lc/a/a/a/c0/d;->h:F

    invoke-virtual {p1, v1}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setElevation(F)V

    .line 56
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1}, Landroid/widget/ImageButton;->isPressed()Z

    move-result p1

    if-eqz p1, :cond_26

    .line 57
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget v0, p0, Lc/a/a/a/c0/d;->j:F

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setTranslationZ(F)V

    goto :goto_4f

    .line 58
    :cond_26
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1}, Landroid/widget/ImageButton;->isFocused()Z

    move-result p1

    if-nez p1, :cond_3d

    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1}, Landroid/widget/ImageButton;->isHovered()Z

    move-result p1

    if-eqz p1, :cond_37

    goto :goto_3d

    .line 59
    :cond_37
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setTranslationZ(F)V

    goto :goto_4f

    .line 60
    :cond_3d
    :goto_3d
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget v0, p0, Lc/a/a/a/c0/d;->i:F

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setTranslationZ(F)V

    goto :goto_4f

    .line 61
    :cond_45
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setElevation(F)V

    .line 62
    iget-object p1, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {p1, v0}, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;->setTranslationZ(F)V

    :cond_4f
    :goto_4f
    return-void
.end method

.method public b(Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->c:Landroid/graphics/drawable/Drawable;

    instance-of v1, v0, Landroid/graphics/drawable/RippleDrawable;

    if-eqz v1, :cond_10

    .line 2
    check-cast v0, Landroid/graphics/drawable/RippleDrawable;

    .line 3
    invoke-static {p1}, Lc/a/a/a/j0/b;->b(Landroid/content/res/ColorStateList;)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/RippleDrawable;->setColor(Landroid/content/res/ColorStateList;)V

    goto :goto_13

    .line 4
    :cond_10
    invoke-super {p0, p1}, Lc/a/a/a/c0/d;->b(Landroid/content/res/ColorStateList;)V

    :goto_13
    return-void
.end method

.method public e()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->y:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    invoke-virtual {v0}, Landroid/widget/ImageButton;->getElevation()F

    move-result v0

    return v0
.end method

.method public o()V
    .registers 1

    return-void
.end method

.method public q()V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/c0/d;->B()V

    return-void
.end method

.method public v()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public w()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d;->z:Lc/a/a/a/k0/b;

    invoke-interface {v0}, Lc/a/a/a/k0/b;->a()Z

    move-result v0

    if-nez v0, :cond_11

    invoke-virtual {p0}, Lc/a/a/a/c0/d;->y()Z

    move-result v0

    if-nez v0, :cond_f

    goto :goto_11

    :cond_f
    const/4 v0, 0x0

    goto :goto_12

    :cond_11
    :goto_11
    const/4 v0, 0x1

    :goto_12
    return v0
.end method

.method public z()V
    .registers 1

    return-void
.end method
