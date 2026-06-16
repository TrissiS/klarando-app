.class public final Lc/a/a/a/h0/d;
.super Lc/a/a/a/h0/h;
.source "CircularDrawingDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lc/a/a/a/h0/h<",
        "Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;",
        ">;"
    }
.end annotation


# instance fields
.field public c:I

.field public d:F

.field public e:F

.field public f:F


# direct methods
.method public constructor <init>(Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/h0/h;-><init>(Lc/a/a/a/h0/c;)V

    const/4 p1, 0x1

    .line 2
    iput p1, p0, Lc/a/a/a/h0/d;->c:I

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/d;->c()I

    move-result v0

    return v0
.end method

.method public a(Landroid/graphics/Canvas;F)V
    .registers 7

    .line 2
    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    move-object v1, v0

    check-cast v1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget v1, v1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->g:I

    int-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget v0, v0, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->h:I

    int-to-float v0, v0

    add-float/2addr v1, v0

    .line 3
    invoke-virtual {p1, v1, v1}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v0, -0x3d4c0000    # -90.0f

    .line 4
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->rotate(F)V

    neg-float v0, v1

    .line 5
    invoke-virtual {p1, v0, v0, v1, v1}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 6
    iget-object p1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast p1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget p1, p1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->i:I

    const/4 v0, 0x1

    if-nez p1, :cond_28

    const/4 p1, 0x1

    goto :goto_29

    :cond_28
    const/4 p1, -0x1

    :goto_29
    iput p1, p0, Lc/a/a/a/h0/d;->c:I

    .line 7
    iget-object p1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    move-object v1, p1

    check-cast v1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget v1, v1, Lc/a/a/a/h0/c;->a:I

    int-to-float v1, v1

    mul-float v1, v1, p2

    iput v1, p0, Lc/a/a/a/h0/d;->d:F

    .line 8
    move-object v1, p1

    check-cast v1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget v1, v1, Lc/a/a/a/h0/c;->b:I

    int-to-float v1, v1

    mul-float v1, v1, p2

    iput v1, p0, Lc/a/a/a/h0/d;->e:F

    .line 9
    move-object v1, p1

    check-cast v1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget v1, v1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->g:I

    check-cast p1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget p1, p1, Lc/a/a/a/h0/c;->a:I

    sub-int/2addr v1, p1

    int-to-float p1, v1

    div-float/2addr p1, v2

    iput p1, p0, Lc/a/a/a/h0/d;->f:F

    .line 10
    iget-object p1, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    invoke-virtual {p1}, Lc/a/a/a/h0/g;->f()Z

    move-result p1

    const/high16 v1, 0x3f800000    # 1.0f

    const/4 v3, 0x2

    if-eqz p1, :cond_62

    iget-object p1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast p1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget p1, p1, Lc/a/a/a/h0/c;->e:I

    if-eq p1, v3, :cond_72

    :cond_62
    iget-object p1, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    .line 11
    invoke-virtual {p1}, Lc/a/a/a/h0/g;->e()Z

    move-result p1

    if-eqz p1, :cond_83

    iget-object p1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast p1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget p1, p1, Lc/a/a/a/h0/c;->f:I

    if-ne p1, v0, :cond_83

    .line 12
    :cond_72
    iget p1, p0, Lc/a/a/a/h0/d;->f:F

    sub-float/2addr v1, p2

    iget-object p2, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast p2, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget p2, p2, Lc/a/a/a/h0/c;->a:I

    int-to-float p2, p2

    mul-float v1, v1, p2

    div-float/2addr v1, v2

    add-float/2addr p1, v1

    iput p1, p0, Lc/a/a/a/h0/d;->f:F

    goto :goto_b3

    .line 13
    :cond_83
    iget-object p1, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    invoke-virtual {p1}, Lc/a/a/a/h0/g;->f()Z

    move-result p1

    if-eqz p1, :cond_93

    iget-object p1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast p1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget p1, p1, Lc/a/a/a/h0/c;->e:I

    if-eq p1, v0, :cond_a3

    :cond_93
    iget-object p1, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    .line 14
    invoke-virtual {p1}, Lc/a/a/a/h0/g;->e()Z

    move-result p1

    if-eqz p1, :cond_b3

    iget-object p1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast p1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget p1, p1, Lc/a/a/a/h0/c;->f:I

    if-ne p1, v3, :cond_b3

    .line 15
    :cond_a3
    iget p1, p0, Lc/a/a/a/h0/d;->f:F

    sub-float/2addr v1, p2

    iget-object p2, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast p2, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget p2, p2, Lc/a/a/a/h0/c;->a:I

    int-to-float p2, p2

    mul-float v1, v1, p2

    div-float/2addr v1, v2

    sub-float/2addr p1, v1

    iput p1, p0, Lc/a/a/a/h0/d;->f:F

    :cond_b3
    :goto_b3
    return-void
.end method

.method public a(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 10

    .line 29
    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget v0, v0, Lc/a/a/a/h0/c;->d:I

    iget-object v1, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    invoke-virtual {v1}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v1

    invoke-static {v0, v1}, Lc/a/a/a/w/a;->a(II)I

    move-result v0

    .line 30
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 31
    sget-object v1, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    const/4 v1, 0x1

    .line 32
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 33
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 34
    iget v0, p0, Lc/a/a/a/h0/d;->d:F

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 35
    new-instance v2, Landroid/graphics/RectF;

    iget v0, p0, Lc/a/a/a/h0/d;->f:F

    neg-float v1, v0

    neg-float v3, v0

    invoke-direct {v2, v1, v3, v0, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v3, 0x0

    const/high16 v4, 0x43b40000    # 360.0f

    const/4 v5, 0x0

    move-object v1, p1

    move-object v6, p2

    .line 36
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    return-void
.end method

.method public final a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFFZLandroid/graphics/RectF;)V
    .registers 20

    move-object v0, p0

    move-object v7, p1

    if-eqz p6, :cond_9

    const/high16 v1, -0x40800000    # -1.0f

    const/high16 v8, -0x40800000    # -1.0f

    goto :goto_d

    :cond_9
    const/high16 v1, 0x3f800000    # 1.0f

    const/high16 v8, 0x3f800000    # 1.0f

    .line 37
    :goto_d
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move/from16 v1, p5

    .line 38
    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->rotate(F)V

    .line 39
    iget v1, v0, Lc/a/a/a/h0/d;->f:F

    const/high16 v9, 0x40000000    # 2.0f

    div-float v10, p3, v9

    sub-float/2addr v1, v10

    add-float v2, v1, p4

    mul-float v1, v8, p4

    iget v3, v0, Lc/a/a/a/h0/d;->c:I

    int-to-float v3, v3

    mul-float v3, v3, v1

    const/4 v11, 0x0

    .line 40
    invoke-static {v11, v3}, Ljava/lang/Math;->min(FF)F

    move-result v3

    iget v4, v0, Lc/a/a/a/h0/d;->f:F

    add-float/2addr v4, v10

    sub-float v4, v4, p4

    iget v5, v0, Lc/a/a/a/h0/d;->c:I

    int-to-float v5, v5

    mul-float v1, v1, v5

    .line 41
    invoke-static {v11, v1}, Ljava/lang/Math;->max(FF)F

    move-result v5

    move-object v1, p1

    move-object v6, p2

    .line 42
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 43
    iget v1, v0, Lc/a/a/a/h0/d;->f:F

    sub-float/2addr v1, v10

    add-float v1, v1, p4

    invoke-virtual {p1, v1, v11}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v3, 0x43340000    # 180.0f

    neg-float v1, v8

    const/high16 v10, 0x42b40000    # 90.0f

    mul-float v1, v1, v10

    .line 44
    iget v2, v0, Lc/a/a/a/h0/d;->c:I

    int-to-float v2, v2

    mul-float v4, v1, v2

    const/4 v5, 0x1

    move-object v1, p1

    move-object/from16 v2, p7

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    mul-float v1, p4, v9

    sub-float v1, p3, v1

    .line 45
    invoke-virtual {p1, v1, v11}, Landroid/graphics/Canvas;->translate(FF)V

    const/4 v3, 0x0

    mul-float v8, v8, v10

    .line 46
    iget v1, v0, Lc/a/a/a/h0/d;->c:I

    int-to-float v1, v1

    mul-float v4, v8, v1

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 47
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFI)V
    .registers 19

    move-object v8, p0

    move-object v9, p2

    cmpl-float v0, p3, p4

    if-nez v0, :cond_7

    return-void

    .line 16
    :cond_7
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 17
    sget-object v0, Landroid/graphics/Paint$Cap;->BUTT:Landroid/graphics/Paint$Cap;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    const/4 v0, 0x1

    .line 18
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    move/from16 v0, p5

    .line 19
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    iget v0, v8, Lc/a/a/a/h0/d;->d:F

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 v6, 0x43b40000    # 360.0f

    mul-float v0, p3, v6

    .line 21
    iget v1, v8, Lc/a/a/a/h0/d;->c:I

    int-to-float v2, v1

    mul-float v10, v0, v2

    cmpl-float v0, p4, p3

    if-ltz v0, :cond_2f

    sub-float v0, p4, p3

    goto :goto_35

    :cond_2f
    const/high16 v0, 0x3f800000    # 1.0f

    add-float v0, p4, v0

    sub-float v0, v0, p3

    :goto_35
    mul-float v0, v0, v6

    int-to-float v1, v1

    mul-float v0, v0, v1

    move v11, v0

    .line 22
    new-instance v1, Landroid/graphics/RectF;

    iget v0, v8, Lc/a/a/a/h0/d;->f:F

    neg-float v2, v0

    neg-float v3, v0

    invoke-direct {v1, v2, v3, v0, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v4, 0x0

    move-object v0, p1

    move v2, v10

    move v3, v11

    move-object v5, p2

    .line 23
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 24
    iget v0, v8, Lc/a/a/a/h0/d;->e:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_80

    invoke-static {v11}, Ljava/lang/Math;->abs(F)F

    move-result v0

    cmpg-float v0, v0, v6

    if-gez v0, :cond_80

    .line 25
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 26
    new-instance v12, Landroid/graphics/RectF;

    iget v0, v8, Lc/a/a/a/h0/d;->e:F

    neg-float v1, v0

    neg-float v2, v0

    invoke-direct {v12, v1, v2, v0, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 27
    iget v3, v8, Lc/a/a/a/h0/d;->d:F

    iget v4, v8, Lc/a/a/a/h0/d;->e:F

    const/4 v6, 0x1

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v5, v10

    move-object v7, v12

    invoke-virtual/range {v0 .. v7}, Lc/a/a/a/h0/d;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFFZLandroid/graphics/RectF;)V

    .line 28
    iget v3, v8, Lc/a/a/a/h0/d;->d:F

    iget v4, v8, Lc/a/a/a/h0/d;->e:F

    add-float v5, v10, v11

    const/4 v6, 0x0

    invoke-virtual/range {v0 .. v7}, Lc/a/a/a/h0/d;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFFZLandroid/graphics/RectF;)V

    :cond_80
    return-void
.end method

.method public b()I
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/h0/d;->c()I

    move-result v0

    return v0
.end method

.method public final c()I
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    move-object v1, v0

    check-cast v1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget v1, v1, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->g:I

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;

    iget v0, v0, Lcom/google/android/material/progressindicator/CircularProgressIndicatorSpec;->h:I

    mul-int/lit8 v0, v0, 0x2

    add-int/2addr v1, v0

    return v1
.end method
