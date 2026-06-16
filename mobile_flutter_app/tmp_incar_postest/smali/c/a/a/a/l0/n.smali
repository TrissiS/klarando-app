.class public Lc/a/a/a/l0/n;
.super Ljava/lang/Object;
.source "ShapeAppearancePathProvider.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/l0/n$c;,
        Lc/a/a/a/l0/n$b;,
        Lc/a/a/a/l0/n$a;
    }
.end annotation


# instance fields
.field public final a:[Lc/a/a/a/l0/o;

.field public final b:[Landroid/graphics/Matrix;

.field public final c:[Landroid/graphics/Matrix;

.field public final d:Landroid/graphics/PointF;

.field public final e:Landroid/graphics/Path;

.field public final f:Landroid/graphics/Path;

.field public final g:Lc/a/a/a/l0/o;

.field public final h:[F

.field public final i:[F

.field public final j:Landroid/graphics/Path;

.field public final k:Landroid/graphics/Path;

.field public l:Z


# direct methods
.method public constructor <init>()V
    .registers 5

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x4

    new-array v1, v0, [Lc/a/a/a/l0/o;

    .line 2
    iput-object v1, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    new-array v1, v0, [Landroid/graphics/Matrix;

    .line 3
    iput-object v1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    new-array v1, v0, [Landroid/graphics/Matrix;

    .line 4
    iput-object v1, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    .line 5
    new-instance v1, Landroid/graphics/PointF;

    invoke-direct {v1}, Landroid/graphics/PointF;-><init>()V

    iput-object v1, p0, Lc/a/a/a/l0/n;->d:Landroid/graphics/PointF;

    .line 6
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lc/a/a/a/l0/n;->e:Landroid/graphics/Path;

    .line 7
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lc/a/a/a/l0/n;->f:Landroid/graphics/Path;

    .line 8
    new-instance v1, Lc/a/a/a/l0/o;

    invoke-direct {v1}, Lc/a/a/a/l0/o;-><init>()V

    iput-object v1, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    const/4 v1, 0x2

    new-array v2, v1, [F

    .line 9
    iput-object v2, p0, Lc/a/a/a/l0/n;->h:[F

    new-array v1, v1, [F

    .line 10
    iput-object v1, p0, Lc/a/a/a/l0/n;->i:[F

    .line 11
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lc/a/a/a/l0/n;->j:Landroid/graphics/Path;

    .line 12
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lc/a/a/a/l0/n;->k:Landroid/graphics/Path;

    const/4 v1, 0x1

    .line 13
    iput-boolean v1, p0, Lc/a/a/a/l0/n;->l:Z

    const/4 v1, 0x0

    :goto_47
    if-ge v1, v0, :cond_67

    .line 14
    iget-object v2, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    new-instance v3, Lc/a/a/a/l0/o;

    invoke-direct {v3}, Lc/a/a/a/l0/o;-><init>()V

    aput-object v3, v2, v1

    .line 15
    iget-object v2, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    aput-object v3, v2, v1

    .line 16
    iget-object v2, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    aput-object v3, v2, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_47

    :cond_67
    return-void
.end method

.method public static a()Lc/a/a/a/l0/n;
    .registers 1

    .line 1
    sget-object v0, Lc/a/a/a/l0/n$a;->a:Lc/a/a/a/l0/n;

    return-object v0
.end method


# virtual methods
.method public final a(I)F
    .registers 2

    add-int/lit8 p1, p1, 0x1

    mul-int/lit8 p1, p1, 0x5a

    int-to-float p1, p1

    return p1
.end method

.method public final a(Landroid/graphics/RectF;I)F
    .registers 7

    .line 32
    iget-object v0, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v1, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v2, v1, p2

    iget v2, v2, Lc/a/a/a/l0/o;->c:F

    const/4 v3, 0x0

    aput v2, v0, v3

    .line 33
    aget-object v1, v1, p2

    iget v1, v1, Lc/a/a/a/l0/o;->d:F

    const/4 v2, 0x1

    aput v1, v0, v2

    .line 34
    iget-object v1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object v1, v1, p2

    invoke-virtual {v1, v0}, Landroid/graphics/Matrix;->mapPoints([F)V

    if-eq p2, v2, :cond_2c

    const/4 v0, 0x3

    if-eq p2, v0, :cond_2c

    .line 35
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerY()F

    move-result p1

    iget-object p2, p0, Lc/a/a/a/l0/n;->h:[F

    aget p2, p2, v2

    sub-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    return p1

    .line 36
    :cond_2c
    invoke-virtual {p1}, Landroid/graphics/RectF;->centerX()F

    move-result p1

    iget-object p2, p0, Lc/a/a/a/l0/n;->h:[F

    aget p2, p2, v3

    sub-float/2addr p1, p2

    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    move-result p1

    return p1
.end method

.method public final a(ILc/a/a/a/l0/m;)Lc/a/a/a/l0/c;
    .registers 4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_18

    const/4 v0, 0x2

    if-eq p1, v0, :cond_13

    const/4 v0, 0x3

    if-eq p1, v0, :cond_e

    .line 37
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->l()Lc/a/a/a/l0/c;

    move-result-object p1

    return-object p1

    .line 38
    :cond_e
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->j()Lc/a/a/a/l0/c;

    move-result-object p1

    return-object p1

    .line 39
    :cond_13
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->c()Lc/a/a/a/l0/c;

    move-result-object p1

    return-object p1

    .line 40
    :cond_18
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->e()Lc/a/a/a/l0/c;

    move-result-object p1

    return-object p1
.end method

.method public final a(ILandroid/graphics/RectF;Landroid/graphics/PointF;)V
    .registers 5

    const/4 v0, 0x1

    if-eq p1, v0, :cond_21

    const/4 v0, 0x2

    if-eq p1, v0, :cond_19

    const/4 v0, 0x3

    if-eq p1, v0, :cond_11

    .line 41
    iget p1, p2, Landroid/graphics/RectF;->right:F

    iget p2, p2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p3, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_28

    .line 42
    :cond_11
    iget p1, p2, Landroid/graphics/RectF;->left:F

    iget p2, p2, Landroid/graphics/RectF;->top:F

    invoke-virtual {p3, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_28

    .line 43
    :cond_19
    iget p1, p2, Landroid/graphics/RectF;->left:F

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p3, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    goto :goto_28

    .line 44
    :cond_21
    iget p1, p2, Landroid/graphics/RectF;->right:F

    iget p2, p2, Landroid/graphics/RectF;->bottom:F

    invoke-virtual {p3, p1, p2}, Landroid/graphics/PointF;->set(FF)V

    :goto_28
    return-void
.end method

.method public a(Lc/a/a/a/l0/m;FLandroid/graphics/RectF;Landroid/graphics/Path;)V
    .registers 11

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move-object v3, p3

    move-object v5, p4

    .line 2
    invoke-virtual/range {v0 .. v5}, Lc/a/a/a/l0/n;->a(Lc/a/a/a/l0/m;FLandroid/graphics/RectF;Lc/a/a/a/l0/n$b;Landroid/graphics/Path;)V

    return-void
.end method

.method public a(Lc/a/a/a/l0/m;FLandroid/graphics/RectF;Lc/a/a/a/l0/n$b;Landroid/graphics/Path;)V
    .registers 14

    .line 3
    invoke-virtual {p5}, Landroid/graphics/Path;->rewind()V

    .line 4
    iget-object v0, p0, Lc/a/a/a/l0/n;->e:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 5
    iget-object v0, p0, Lc/a/a/a/l0/n;->f:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 6
    iget-object v0, p0, Lc/a/a/a/l0/n;->f:Landroid/graphics/Path;

    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v0, p3, v1}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 7
    new-instance v0, Lc/a/a/a/l0/n$c;

    move-object v2, v0

    move-object v3, p1

    move v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v2 .. v7}, Lc/a/a/a/l0/n$c;-><init>(Lc/a/a/a/l0/m;FLandroid/graphics/RectF;Lc/a/a/a/l0/n$b;Landroid/graphics/Path;)V

    const/4 p1, 0x0

    const/4 p2, 0x0

    :goto_21
    const/4 p3, 0x4

    if-ge p2, p3, :cond_2d

    .line 8
    invoke-virtual {p0, v0, p2}, Lc/a/a/a/l0/n;->c(Lc/a/a/a/l0/n$c;I)V

    .line 9
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/n;->b(I)V

    add-int/lit8 p2, p2, 0x1

    goto :goto_21

    :cond_2d
    :goto_2d
    if-ge p1, p3, :cond_38

    .line 10
    invoke-virtual {p0, v0, p1}, Lc/a/a/a/l0/n;->a(Lc/a/a/a/l0/n$c;I)V

    .line 11
    invoke-virtual {p0, v0, p1}, Lc/a/a/a/l0/n;->b(Lc/a/a/a/l0/n$c;I)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_2d

    .line 12
    :cond_38
    invoke-virtual {p5}, Landroid/graphics/Path;->close()V

    .line 13
    iget-object p1, p0, Lc/a/a/a/l0/n;->e:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 14
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x13

    if-lt p1, p2, :cond_55

    iget-object p1, p0, Lc/a/a/a/l0/n;->e:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_55

    .line 15
    iget-object p1, p0, Lc/a/a/a/l0/n;->e:Landroid/graphics/Path;

    sget-object p2, Landroid/graphics/Path$Op;->UNION:Landroid/graphics/Path$Op;

    invoke-virtual {p5, p1, p2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    :cond_55
    return-void
.end method

.method public final a(Lc/a/a/a/l0/n$c;I)V
    .registers 7

    .line 16
    iget-object v0, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v1, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lc/a/a/a/l0/o;->f()F

    move-result v1

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 17
    iget-object v0, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v1, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v1, v1, p2

    invoke-virtual {v1}, Lc/a/a/a/l0/o;->g()F

    move-result v1

    const/4 v3, 0x1

    aput v1, v0, v3

    .line 18
    iget-object v0, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object v0, v0, p2

    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    if-nez p2, :cond_31

    .line 19
    iget-object v0, p1, Lc/a/a/a/l0/n$c;->b:Landroid/graphics/Path;

    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    aget v2, v1, v2

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    goto :goto_3c

    .line 20
    :cond_31
    iget-object v0, p1, Lc/a/a/a/l0/n$c;->b:Landroid/graphics/Path;

    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    aget v2, v1, v2

    aget v1, v1, v3

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 21
    :goto_3c
    iget-object v0, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v0, v0, p2

    iget-object v1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object v1, v1, p2

    iget-object v2, p1, Lc/a/a/a/l0/n$c;->b:Landroid/graphics/Path;

    invoke-virtual {v0, v1, v2}, Lc/a/a/a/l0/o;->a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 22
    iget-object p1, p1, Lc/a/a/a/l0/n$c;->d:Lc/a/a/a/l0/n$b;

    if-eqz p1, :cond_58

    .line 23
    iget-object v0, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v0, v0, p2

    iget-object v1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object v1, v1, p2

    invoke-interface {p1, v0, v1, p2}, Lc/a/a/a/l0/n$b;->b(Lc/a/a/a/l0/o;Landroid/graphics/Matrix;I)V

    :cond_58
    return-void
.end method

.method public final a(Landroid/graphics/Path;I)Z
    .registers 6

    .line 24
    iget-object v0, p0, Lc/a/a/a/l0/n;->k:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 25
    iget-object v0, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v0, v0, p2

    iget-object v1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object p2, v1, p2

    iget-object v1, p0, Lc/a/a/a/l0/n;->k:Landroid/graphics/Path;

    invoke-virtual {v0, p2, v1}, Lc/a/a/a/l0/o;->a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 26
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 28
    iget-object v1, p0, Lc/a/a/a/l0/n;->k:Landroid/graphics/Path;

    invoke-virtual {v1, p2, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 29
    iget-object v1, p0, Lc/a/a/a/l0/n;->k:Landroid/graphics/Path;

    sget-object v2, Landroid/graphics/Path$Op;->INTERSECT:Landroid/graphics/Path$Op;

    invoke-virtual {p1, v1, v2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 30
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Path;->computeBounds(Landroid/graphics/RectF;Z)V

    .line 31
    invoke-virtual {p2}, Landroid/graphics/RectF;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_44

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result p1

    const/high16 v1, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v1

    if-lez p1, :cond_43

    invoke-virtual {p2}, Landroid/graphics/RectF;->height()F

    move-result p1

    cmpl-float p1, p1, v1

    if-lez p1, :cond_43

    goto :goto_44

    :cond_43
    const/4 v0, 0x0

    :cond_44
    :goto_44
    return v0
.end method

.method public final b(ILc/a/a/a/l0/m;)Lc/a/a/a/l0/d;
    .registers 4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_18

    const/4 v0, 0x2

    if-eq p1, v0, :cond_13

    const/4 v0, 0x3

    if-eq p1, v0, :cond_e

    .line 36
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->k()Lc/a/a/a/l0/d;

    move-result-object p1

    return-object p1

    .line 37
    :cond_e
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->i()Lc/a/a/a/l0/d;

    move-result-object p1

    return-object p1

    .line 38
    :cond_13
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->b()Lc/a/a/a/l0/d;

    move-result-object p1

    return-object p1

    .line 39
    :cond_18
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->d()Lc/a/a/a/l0/d;

    move-result-object p1

    return-object p1
.end method

.method public final b(I)V
    .registers 7

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v1, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lc/a/a/a/l0/o;->d()F

    move-result v1

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v1, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Lc/a/a/a/l0/o;->e()F

    move-result v1

    const/4 v3, 0x1

    aput v1, v0, v3

    .line 3
    iget-object v0, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object v0, v0, p1

    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 4
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/n;->a(I)F

    move-result v0

    .line 5
    iget-object v1, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    aget-object v1, v1, p1

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 6
    iget-object v1, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    aget-object v1, v1, p1

    iget-object v4, p0, Lc/a/a/a/l0/n;->h:[F

    aget v2, v4, v2

    aget v3, v4, v3

    invoke-virtual {v1, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 7
    iget-object v1, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    aget-object p1, v1, p1

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    return-void
.end method

.method public final b(Lc/a/a/a/l0/n$c;I)V
    .registers 11

    add-int/lit8 v0, p2, 0x1

    .line 8
    rem-int/lit8 v0, v0, 0x4

    .line 9
    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v2, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v2, v2, p2

    invoke-virtual {v2}, Lc/a/a/a/l0/o;->d()F

    move-result v2

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 10
    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v2, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v2, v2, p2

    invoke-virtual {v2}, Lc/a/a/a/l0/o;->e()F

    move-result v2

    const/4 v4, 0x1

    aput v2, v1, v4

    .line 11
    iget-object v1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object v1, v1, p2

    iget-object v2, p0, Lc/a/a/a/l0/n;->h:[F

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 12
    iget-object v1, p0, Lc/a/a/a/l0/n;->i:[F

    iget-object v2, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lc/a/a/a/l0/o;->f()F

    move-result v2

    aput v2, v1, v3

    .line 13
    iget-object v1, p0, Lc/a/a/a/l0/n;->i:[F

    iget-object v2, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v2, v2, v0

    invoke-virtual {v2}, Lc/a/a/a/l0/o;->g()F

    move-result v2

    aput v2, v1, v4

    .line 14
    iget-object v1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object v1, v1, v0

    iget-object v2, p0, Lc/a/a/a/l0/n;->i:[F

    invoke-virtual {v1, v2}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 15
    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    aget v2, v1, v3

    iget-object v5, p0, Lc/a/a/a/l0/n;->i:[F

    aget v6, v5, v3

    sub-float/2addr v2, v6

    float-to-double v6, v2

    aget v1, v1, v4

    aget v2, v5, v4

    sub-float/2addr v1, v2

    float-to-double v1, v1

    invoke-static {v6, v7, v1, v2}, Ljava/lang/Math;->hypot(DD)D

    move-result-wide v1

    double-to-float v1, v1

    const v2, 0x3a83126f    # 0.001f

    sub-float/2addr v1, v2

    const/4 v2, 0x0

    .line 16
    invoke-static {v1, v2}, Ljava/lang/Math;->max(FF)F

    move-result v1

    .line 17
    iget-object v5, p1, Lc/a/a/a/l0/n$c;->c:Landroid/graphics/RectF;

    invoke-virtual {p0, v5, p2}, Lc/a/a/a/l0/n;->a(Landroid/graphics/RectF;I)F

    move-result v5

    .line 18
    iget-object v6, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    invoke-virtual {v6, v2, v2}, Lc/a/a/a/l0/o;->b(FF)V

    .line 19
    iget-object v2, p1, Lc/a/a/a/l0/n$c;->a:Lc/a/a/a/l0/m;

    invoke-virtual {p0, p2, v2}, Lc/a/a/a/l0/n;->c(ILc/a/a/a/l0/m;)Lc/a/a/a/l0/f;

    move-result-object v2

    .line 20
    iget v6, p1, Lc/a/a/a/l0/n$c;->e:F

    iget-object v7, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    invoke-virtual {v2, v1, v5, v6, v7}, Lc/a/a/a/l0/f;->a(FFFLc/a/a/a/l0/o;)V

    .line 21
    iget-object v1, p0, Lc/a/a/a/l0/n;->j:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 22
    iget-object v1, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    iget-object v5, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    aget-object v5, v5, p2

    iget-object v6, p0, Lc/a/a/a/l0/n;->j:Landroid/graphics/Path;

    invoke-virtual {v1, v5, v6}, Lc/a/a/a/l0/o;->a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 23
    iget-boolean v1, p0, Lc/a/a/a/l0/n;->l:Z

    if-eqz v1, :cond_eb

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x13

    if-lt v1, v5, :cond_eb

    .line 24
    invoke-virtual {v2}, Lc/a/a/a/l0/f;->a()Z

    move-result v1

    if-nez v1, :cond_ae

    iget-object v1, p0, Lc/a/a/a/l0/n;->j:Landroid/graphics/Path;

    .line 25
    invoke-virtual {p0, v1, p2}, Lc/a/a/a/l0/n;->a(Landroid/graphics/Path;I)Z

    move-result v1

    if-nez v1, :cond_ae

    iget-object v1, p0, Lc/a/a/a/l0/n;->j:Landroid/graphics/Path;

    .line 26
    invoke-virtual {p0, v1, v0}, Lc/a/a/a/l0/n;->a(Landroid/graphics/Path;I)Z

    move-result v0

    if-eqz v0, :cond_eb

    .line 27
    :cond_ae
    iget-object v0, p0, Lc/a/a/a/l0/n;->j:Landroid/graphics/Path;

    iget-object v1, p0, Lc/a/a/a/l0/n;->f:Landroid/graphics/Path;

    sget-object v2, Landroid/graphics/Path$Op;->DIFFERENCE:Landroid/graphics/Path$Op;

    invoke-virtual {v0, v0, v1, v2}, Landroid/graphics/Path;->op(Landroid/graphics/Path;Landroid/graphics/Path;Landroid/graphics/Path$Op;)Z

    .line 28
    iget-object v0, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v1, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    invoke-virtual {v1}, Lc/a/a/a/l0/o;->f()F

    move-result v1

    aput v1, v0, v3

    .line 29
    iget-object v0, p0, Lc/a/a/a/l0/n;->h:[F

    iget-object v1, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    invoke-virtual {v1}, Lc/a/a/a/l0/o;->g()F

    move-result v1

    aput v1, v0, v4

    .line 30
    iget-object v0, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    aget-object v0, v0, p2

    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapPoints([F)V

    .line 31
    iget-object v0, p0, Lc/a/a/a/l0/n;->e:Landroid/graphics/Path;

    iget-object v1, p0, Lc/a/a/a/l0/n;->h:[F

    aget v2, v1, v3

    aget v1, v1, v4

    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 32
    iget-object v0, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    iget-object v1, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    aget-object v1, v1, p2

    iget-object v2, p0, Lc/a/a/a/l0/n;->e:Landroid/graphics/Path;

    invoke-virtual {v0, v1, v2}, Lc/a/a/a/l0/o;->a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    goto :goto_f6

    .line 33
    :cond_eb
    iget-object v0, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    iget-object v1, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    aget-object v1, v1, p2

    iget-object v2, p1, Lc/a/a/a/l0/n$c;->b:Landroid/graphics/Path;

    invoke-virtual {v0, v1, v2}, Lc/a/a/a/l0/o;->a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    .line 34
    :goto_f6
    iget-object p1, p1, Lc/a/a/a/l0/n$c;->d:Lc/a/a/a/l0/n$b;

    if-eqz p1, :cond_103

    .line 35
    iget-object v0, p0, Lc/a/a/a/l0/n;->g:Lc/a/a/a/l0/o;

    iget-object v1, p0, Lc/a/a/a/l0/n;->c:[Landroid/graphics/Matrix;

    aget-object v1, v1, p2

    invoke-interface {p1, v0, v1, p2}, Lc/a/a/a/l0/n$b;->a(Lc/a/a/a/l0/o;Landroid/graphics/Matrix;I)V

    :cond_103
    return-void
.end method

.method public final c(ILc/a/a/a/l0/m;)Lc/a/a/a/l0/f;
    .registers 4

    const/4 v0, 0x1

    if-eq p1, v0, :cond_18

    const/4 v0, 0x2

    if-eq p1, v0, :cond_13

    const/4 v0, 0x3

    if-eq p1, v0, :cond_e

    .line 9
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->g()Lc/a/a/a/l0/f;

    move-result-object p1

    return-object p1

    .line 10
    :cond_e
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->h()Lc/a/a/a/l0/f;

    move-result-object p1

    return-object p1

    .line 11
    :cond_13
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->f()Lc/a/a/a/l0/f;

    move-result-object p1

    return-object p1

    .line 12
    :cond_18
    invoke-virtual {p2}, Lc/a/a/a/l0/m;->a()Lc/a/a/a/l0/f;

    move-result-object p1

    return-object p1
.end method

.method public final c(Lc/a/a/a/l0/n$c;I)V
    .registers 10

    .line 1
    iget-object v0, p1, Lc/a/a/a/l0/n$c;->a:Lc/a/a/a/l0/m;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/l0/n;->a(ILc/a/a/a/l0/m;)Lc/a/a/a/l0/c;

    move-result-object v6

    .line 2
    iget-object v0, p1, Lc/a/a/a/l0/n$c;->a:Lc/a/a/a/l0/m;

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/l0/n;->b(ILc/a/a/a/l0/m;)Lc/a/a/a/l0/d;

    move-result-object v1

    iget-object v0, p0, Lc/a/a/a/l0/n;->a:[Lc/a/a/a/l0/o;

    aget-object v2, v0, p2

    iget v4, p1, Lc/a/a/a/l0/n$c;->e:F

    iget-object v5, p1, Lc/a/a/a/l0/n$c;->c:Landroid/graphics/RectF;

    const/high16 v3, 0x42b40000    # 90.0f

    .line 3
    invoke-virtual/range {v1 .. v6}, Lc/a/a/a/l0/d;->a(Lc/a/a/a/l0/o;FFLandroid/graphics/RectF;Lc/a/a/a/l0/c;)V

    .line 4
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/n;->a(I)F

    move-result v0

    .line 5
    iget-object v1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object v1, v1, p2

    invoke-virtual {v1}, Landroid/graphics/Matrix;->reset()V

    .line 6
    iget-object p1, p1, Lc/a/a/a/l0/n$c;->c:Landroid/graphics/RectF;

    iget-object v1, p0, Lc/a/a/a/l0/n;->d:Landroid/graphics/PointF;

    invoke-virtual {p0, p2, p1, v1}, Lc/a/a/a/l0/n;->a(ILandroid/graphics/RectF;Landroid/graphics/PointF;)V

    .line 7
    iget-object p1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object p1, p1, p2

    iget-object v1, p0, Lc/a/a/a/l0/n;->d:Landroid/graphics/PointF;

    iget v2, v1, Landroid/graphics/PointF;->x:F

    iget v1, v1, Landroid/graphics/PointF;->y:F

    invoke-virtual {p1, v2, v1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 8
    iget-object p1, p0, Lc/a/a/a/l0/n;->b:[Landroid/graphics/Matrix;

    aget-object p1, p1, p2

    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->preRotate(F)Z

    return-void
.end method
