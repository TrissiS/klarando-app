.class public final Lc/a/a/a/h0/k;
.super Lc/a/a/a/h0/h;
.source "LinearDrawingDelegate.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lc/a/a/a/h0/h<",
        "Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;",
        ">;"
    }
.end annotation


# instance fields
.field public c:F

.field public d:F

.field public e:F


# direct methods
.method public constructor <init>(Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lc/a/a/a/h0/h;-><init>(Lc/a/a/a/h0/c;)V

    const/high16 p1, 0x43960000    # 300.0f

    .line 2
    iput p1, p0, Lc/a/a/a/h0/k;->c:F

    return-void
.end method

.method public static a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFFZLandroid/graphics/RectF;)V
    .registers 17

    move-object v6, p0

    move v0, p2

    move v1, p3

    .line 37
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    const/4 v7, 0x0

    move v2, p4

    .line 38
    invoke-virtual {p0, p4, v7}, Landroid/graphics/Canvas;->translate(FF)V

    if-nez p5, :cond_12

    const/high16 v2, 0x43340000    # 180.0f

    .line 39
    invoke-virtual {p0, v2}, Landroid/graphics/Canvas;->rotate(F)V

    :cond_12
    neg-float v2, v1

    neg-float v3, v0

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float v8, v3, v1

    const/4 v3, 0x0

    div-float/2addr v0, v4

    sub-float v9, v0, v1

    move-object v0, p0

    move v1, v2

    move v2, v8

    move v4, v9

    move-object v5, p1

    .line 40
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 41
    invoke-virtual {p0}, Landroid/graphics/Canvas;->save()I

    .line 42
    invoke-virtual {p0, v7, v8}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v2, 0x43340000    # 180.0f

    const/high16 v3, 0x42b40000    # 90.0f

    const/4 v4, 0x1

    move-object/from16 v1, p6

    .line 43
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 44
    invoke-virtual {p0}, Landroid/graphics/Canvas;->restore()V

    .line 45
    invoke-virtual {p0, v7, v9}, Landroid/graphics/Canvas;->translate(FF)V

    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 46
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 47
    invoke-virtual {p0}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v0, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget v0, v0, Lc/a/a/a/h0/c;->a:I

    return v0
.end method

.method public a(Landroid/graphics/Canvas;F)V
    .registers 10

    .line 2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getClipBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    iput v1, p0, Lc/a/a/a/h0/k;->c:F

    .line 4
    iget-object v1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v1, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget v1, v1, Lc/a/a/a/h0/c;->a:I

    int-to-float v1, v1

    .line 5
    iget v2, v0, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    .line 6
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    iget v3, v0, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    .line 7
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, v4

    add-float/2addr v3, v5

    .line 8
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    iget-object v5, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v5, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget v5, v5, Lc/a/a/a/h0/c;->a:I

    sub-int/2addr v0, v5

    int-to-float v0, v0

    div-float/2addr v0, v4

    const/4 v5, 0x0

    invoke-static {v5, v0}, Ljava/lang/Math;->max(FF)F

    move-result v0

    add-float/2addr v3, v0

    .line 9
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 10
    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v0, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget-boolean v0, v0, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;->i:Z

    const/high16 v2, -0x40800000    # -1.0f

    const/high16 v3, 0x3f800000    # 1.0f

    if-eqz v0, :cond_4d

    .line 11
    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->scale(FF)V

    .line 12
    :cond_4d
    iget-object v0, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    invoke-virtual {v0}, Lc/a/a/a/h0/g;->f()Z

    move-result v0

    if-eqz v0, :cond_5e

    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v0, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget v0, v0, Lc/a/a/a/h0/c;->e:I

    const/4 v6, 0x1

    if-eq v0, v6, :cond_6f

    :cond_5e
    iget-object v0, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    .line 13
    invoke-virtual {v0}, Lc/a/a/a/h0/g;->e()Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v0, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget v0, v0, Lc/a/a/a/h0/c;->f:I

    const/4 v6, 0x2

    if-ne v0, v6, :cond_72

    .line 14
    :cond_6f
    invoke-virtual {p1, v3, v2}, Landroid/graphics/Canvas;->scale(FF)V

    .line 15
    :cond_72
    iget-object v0, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    invoke-virtual {v0}, Lc/a/a/a/h0/g;->f()Z

    move-result v0

    if-nez v0, :cond_82

    iget-object v0, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    invoke-virtual {v0}, Lc/a/a/a/h0/g;->e()Z

    move-result v0

    if-eqz v0, :cond_91

    .line 16
    :cond_82
    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v0, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget v0, v0, Lc/a/a/a/h0/c;->a:I

    int-to-float v0, v0

    sub-float v2, p2, v3

    mul-float v0, v0, v2

    div-float/2addr v0, v4

    invoke-virtual {p1, v5, v0}, Landroid/graphics/Canvas;->translate(FF)V

    .line 17
    :cond_91
    iget v0, p0, Lc/a/a/a/h0/k;->c:F

    neg-float v2, v0

    div-float/2addr v2, v4

    neg-float v3, v1

    div-float/2addr v3, v4

    div-float/2addr v0, v4

    div-float/2addr v1, v4

    invoke-virtual {p1, v2, v3, v0, v1}, Landroid/graphics/Canvas;->clipRect(FFFF)Z

    .line 18
    iget-object p1, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    move-object v0, p1

    check-cast v0, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget v0, v0, Lc/a/a/a/h0/c;->a:I

    int-to-float v0, v0

    mul-float v0, v0, p2

    iput v0, p0, Lc/a/a/a/h0/k;->d:F

    .line 19
    check-cast p1, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget p1, p1, Lc/a/a/a/h0/c;->b:I

    int-to-float p1, p1

    mul-float p1, p1, p2

    iput p1, p0, Lc/a/a/a/h0/k;->e:F

    return-void
.end method

.method public a(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    .registers 15

    .line 28
    iget-object v0, p0, Lc/a/a/a/h0/h;->a:Lc/a/a/a/h0/c;

    check-cast v0, Lcom/google/android/material/progressindicator/LinearProgressIndicatorSpec;

    iget v0, v0, Lc/a/a/a/h0/c;->d:I

    iget-object v1, p0, Lc/a/a/a/h0/h;->b:Lc/a/a/a/h0/g;

    invoke-virtual {v1}, Lc/a/a/a/h0/g;->getAlpha()I

    move-result v1

    invoke-static {v0, v1}, Lc/a/a/a/w/a;->a(II)I

    move-result v0

    .line 29
    iget v1, p0, Lc/a/a/a/h0/k;->c:F

    neg-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    iget v3, p0, Lc/a/a/a/h0/k;->e:F

    add-float/2addr v1, v3

    neg-float v11, v1

    .line 30
    sget-object v3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v3, 0x1

    .line 31
    invoke-virtual {p2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 32
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 33
    iget v0, p0, Lc/a/a/a/h0/k;->d:F

    neg-float v3, v0

    div-float v6, v3, v2

    div-float v8, v0, v2

    move-object v4, p1

    move v5, v1

    move v7, v11

    move-object v9, p2

    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 34
    new-instance v0, Landroid/graphics/RectF;

    iget v2, p0, Lc/a/a/a/h0/k;->e:F

    neg-float v3, v2

    neg-float v4, v2

    invoke-direct {v0, v3, v4, v2, v2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 35
    iget v6, p0, Lc/a/a/a/h0/k;->d:F

    iget v7, p0, Lc/a/a/a/h0/k;->e:F

    const/4 v9, 0x1

    move-object v4, p1

    move-object v5, p2

    move v8, v1

    move-object v10, v0

    invoke-static/range {v4 .. v10}, Lc/a/a/a/h0/k;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFFZLandroid/graphics/RectF;)V

    .line 36
    iget v5, p0, Lc/a/a/a/h0/k;->d:F

    iget v6, p0, Lc/a/a/a/h0/k;->e:F

    const/4 v8, 0x0

    move-object v3, p1

    move-object v4, p2

    move v7, v11

    move-object v9, v0

    invoke-static/range {v3 .. v9}, Lc/a/a/a/h0/k;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFFZLandroid/graphics/RectF;)V

    return-void
.end method

.method public a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFI)V
    .registers 17

    move-object v0, p0

    move-object v8, p2

    cmpl-float v1, p3, p4

    if-nez v1, :cond_7

    return-void

    .line 20
    :cond_7
    iget v1, v0, Lc/a/a/a/h0/k;->c:F

    neg-float v2, v1

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    iget v4, v0, Lc/a/a/a/h0/k;->e:F

    add-float/2addr v2, v4

    mul-float v5, v4, v3

    sub-float v5, v1, v5

    mul-float v5, v5, p3

    add-float v7, v2, v5

    neg-float v2, v1

    div-float/2addr v2, v3

    add-float/2addr v2, v4

    mul-float v4, v4, v3

    sub-float/2addr v1, v4

    mul-float v1, v1, p4

    add-float v9, v2, v1

    .line 21
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v1, 0x1

    .line 22
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    move/from16 v1, p5

    .line 23
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 24
    iget v1, v0, Lc/a/a/a/h0/k;->d:F

    neg-float v2, v1

    div-float v4, v2, v3

    div-float v5, v1, v3

    move-object v1, p1

    move v2, v7

    move v3, v4

    move v4, v9

    move-object v6, p2

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 25
    new-instance v10, Landroid/graphics/RectF;

    iget v1, v0, Lc/a/a/a/h0/k;->e:F

    neg-float v2, v1

    neg-float v3, v1

    invoke-direct {v10, v2, v3, v1, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 26
    iget v3, v0, Lc/a/a/a/h0/k;->d:F

    iget v4, v0, Lc/a/a/a/h0/k;->e:F

    const/4 v6, 0x1

    move-object v1, p1

    move-object v2, p2

    move v5, v7

    move-object v7, v10

    invoke-static/range {v1 .. v7}, Lc/a/a/a/h0/k;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFFZLandroid/graphics/RectF;)V

    .line 27
    iget v3, v0, Lc/a/a/a/h0/k;->d:F

    iget v4, v0, Lc/a/a/a/h0/k;->e:F

    const/4 v6, 0x0

    move v5, v9

    invoke-static/range {v1 .. v7}, Lc/a/a/a/h0/k;->a(Landroid/graphics/Canvas;Landroid/graphics/Paint;FFFZLandroid/graphics/RectF;)V

    return-void
.end method

.method public b()I
    .registers 2

    const/4 v0, -0x1

    return v0
.end method
