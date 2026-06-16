.class public Landroidx/transition/ChangeTransform$f;
.super Ljava/lang/Object;
.source "ChangeTransform.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/transition/ChangeTransform;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "f"
.end annotation


# instance fields
.field public final a:F

.field public final b:F

.field public final c:F

.field public final d:F

.field public final e:F

.field public final f:F

.field public final g:F

.field public final h:F


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    move-result v0

    iput v0, p0, Landroidx/transition/ChangeTransform$f;->a:F

    .line 3
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    move-result v0

    iput v0, p0, Landroidx/transition/ChangeTransform$f;->b:F

    .line 4
    invoke-static {p1}, Lb/h/m/y;->C(Landroid/view/View;)F

    move-result v0

    iput v0, p0, Landroidx/transition/ChangeTransform$f;->c:F

    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    move-result v0

    iput v0, p0, Landroidx/transition/ChangeTransform$f;->d:F

    .line 6
    invoke-virtual {p1}, Landroid/view/View;->getScaleY()F

    move-result v0

    iput v0, p0, Landroidx/transition/ChangeTransform$f;->e:F

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getRotationX()F

    move-result v0

    iput v0, p0, Landroidx/transition/ChangeTransform$f;->f:F

    .line 8
    invoke-virtual {p1}, Landroid/view/View;->getRotationY()F

    move-result v0

    iput v0, p0, Landroidx/transition/ChangeTransform$f;->g:F

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getRotation()F

    move-result p1

    iput p1, p0, Landroidx/transition/ChangeTransform$f;->h:F

    return-void
.end method


# virtual methods
.method public a(Landroid/view/View;)V
    .registers 11

    .line 1
    iget v1, p0, Landroidx/transition/ChangeTransform$f;->a:F

    iget v2, p0, Landroidx/transition/ChangeTransform$f;->b:F

    iget v3, p0, Landroidx/transition/ChangeTransform$f;->c:F

    iget v4, p0, Landroidx/transition/ChangeTransform$f;->d:F

    iget v5, p0, Landroidx/transition/ChangeTransform$f;->e:F

    iget v6, p0, Landroidx/transition/ChangeTransform$f;->f:F

    iget v7, p0, Landroidx/transition/ChangeTransform$f;->g:F

    iget v8, p0, Landroidx/transition/ChangeTransform$f;->h:F

    move-object v0, p1

    invoke-static/range {v0 .. v8}, Landroidx/transition/ChangeTransform;->a(Landroid/view/View;FFFFFFFF)V

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5

    .line 1
    instance-of v0, p1, Landroidx/transition/ChangeTransform$f;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    .line 2
    :cond_6
    check-cast p1, Landroidx/transition/ChangeTransform$f;

    .line 3
    iget v0, p1, Landroidx/transition/ChangeTransform$f;->a:F

    iget v2, p0, Landroidx/transition/ChangeTransform$f;->a:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_49

    iget v0, p1, Landroidx/transition/ChangeTransform$f;->b:F

    iget v2, p0, Landroidx/transition/ChangeTransform$f;->b:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_49

    iget v0, p1, Landroidx/transition/ChangeTransform$f;->c:F

    iget v2, p0, Landroidx/transition/ChangeTransform$f;->c:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_49

    iget v0, p1, Landroidx/transition/ChangeTransform$f;->d:F

    iget v2, p0, Landroidx/transition/ChangeTransform$f;->d:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_49

    iget v0, p1, Landroidx/transition/ChangeTransform$f;->e:F

    iget v2, p0, Landroidx/transition/ChangeTransform$f;->e:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_49

    iget v0, p1, Landroidx/transition/ChangeTransform$f;->f:F

    iget v2, p0, Landroidx/transition/ChangeTransform$f;->f:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_49

    iget v0, p1, Landroidx/transition/ChangeTransform$f;->g:F

    iget v2, p0, Landroidx/transition/ChangeTransform$f;->g:F

    cmpl-float v0, v0, v2

    if-nez v0, :cond_49

    iget p1, p1, Landroidx/transition/ChangeTransform$f;->h:F

    iget v0, p0, Landroidx/transition/ChangeTransform$f;->h:F

    cmpl-float p1, p1, v0

    if-nez p1, :cond_49

    const/4 v1, 0x1

    :cond_49
    return v1
.end method

.method public hashCode()I
    .registers 6

    .line 1
    iget v0, p0, Landroidx/transition/ChangeTransform$f;->a:F

    const/4 v1, 0x0

    const/4 v2, 0x0

    cmpl-float v3, v0, v2

    if-eqz v3, :cond_d

    invoke-static {v0}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v0

    goto :goto_e

    :cond_d
    const/4 v0, 0x0

    :goto_e
    mul-int/lit8 v0, v0, 0x1f

    .line 2
    iget v3, p0, Landroidx/transition/ChangeTransform$f;->b:F

    cmpl-float v4, v3, v2

    if-eqz v4, :cond_1b

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto :goto_1c

    :cond_1b
    const/4 v3, 0x0

    :goto_1c
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    .line 3
    iget v3, p0, Landroidx/transition/ChangeTransform$f;->c:F

    cmpl-float v4, v3, v2

    if-eqz v4, :cond_2a

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto :goto_2b

    :cond_2a
    const/4 v3, 0x0

    :goto_2b
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    .line 4
    iget v3, p0, Landroidx/transition/ChangeTransform$f;->d:F

    cmpl-float v4, v3, v2

    if-eqz v4, :cond_39

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto :goto_3a

    :cond_39
    const/4 v3, 0x0

    :goto_3a
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    .line 5
    iget v3, p0, Landroidx/transition/ChangeTransform$f;->e:F

    cmpl-float v4, v3, v2

    if-eqz v4, :cond_48

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto :goto_49

    :cond_48
    const/4 v3, 0x0

    :goto_49
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    .line 6
    iget v3, p0, Landroidx/transition/ChangeTransform$f;->f:F

    cmpl-float v4, v3, v2

    if-eqz v4, :cond_57

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto :goto_58

    :cond_57
    const/4 v3, 0x0

    :goto_58
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    .line 7
    iget v3, p0, Landroidx/transition/ChangeTransform$f;->g:F

    cmpl-float v4, v3, v2

    if-eqz v4, :cond_66

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v3

    goto :goto_67

    :cond_66
    const/4 v3, 0x0

    :goto_67
    add-int/2addr v0, v3

    mul-int/lit8 v0, v0, 0x1f

    .line 8
    iget v3, p0, Landroidx/transition/ChangeTransform$f;->h:F

    cmpl-float v2, v3, v2

    if-eqz v2, :cond_74

    invoke-static {v3}, Ljava/lang/Float;->floatToIntBits(F)I

    move-result v1

    :cond_74
    add-int/2addr v0, v1

    return v0
.end method
