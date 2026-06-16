.class public Lc/c/c/d/a;
.super Landroid/graphics/drawable/Drawable;
.source "ShapeDrawable.java"


# instance fields
.field public a:Lc/c/c/d/c;

.field public final b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Rect;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/ColorFilter;

.field public f:I

.field public g:Z

.field public final h:Landroid/graphics/Path;

.field public final i:Landroid/graphics/RectF;

.field public j:Landroid/graphics/Paint;

.field public k:Z

.field public l:Z

.field public m:Landroid/graphics/Path;

.field public n:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    new-instance v0, Lc/c/c/d/c;

    invoke-direct {v0}, Lc/c/c/d/c;-><init>()V

    invoke-direct {p0, v0}, Lc/c/c/d/a;-><init>(Lc/c/c/d/c;)V

    return-void
.end method

.method public constructor <init>(Lc/c/c/d/c;)V
    .registers 4

    .line 2
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    .line 3
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    const/16 v0, 0xff

    .line 4
    iput v0, p0, Lc/c/c/d/a;->f:I

    .line 5
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lc/c/c/d/a;->h:Landroid/graphics/Path;

    .line 6
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    .line 7
    iput-boolean v1, p0, Lc/c/c/d/a;->n:Z

    .line 8
    iput-object p1, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    .line 9
    invoke-virtual {p0, p1}, Lc/c/c/d/a;->b(Lc/c/c/d/c;)V

    .line 10
    iput-boolean v1, p0, Lc/c/c/d/a;->k:Z

    const/4 p1, 0x0

    .line 11
    iput-boolean p1, p0, Lc/c/c/d/a;->l:Z

    return-void
.end method


# virtual methods
.method public final a(I)I
    .registers 4

    .line 31
    iget v0, p0, Lc/c/c/d/a;->f:I

    shr-int/lit8 v1, v0, 0x7

    add-int/2addr v0, v1

    mul-int p1, p1, v0

    shr-int/lit8 p1, p1, 0x8

    return p1
.end method

.method public final a(Lc/c/c/d/c;)Landroid/graphics/Path;
    .registers 11

    .line 32
    iget-object v0, p0, Lc/c/c/d/a;->m:Landroid/graphics/Path;

    if-eqz v0, :cond_f

    iget-boolean v0, p1, Lc/c/c/d/c;->B:Z

    if-eqz v0, :cond_c

    iget-boolean v0, p0, Lc/c/c/d/a;->n:Z

    if-nez v0, :cond_f

    .line 33
    :cond_c
    iget-object p1, p0, Lc/c/c/d/a;->m:Landroid/graphics/Path;

    return-object p1

    :cond_f
    const/4 v0, 0x0

    .line 34
    iput-boolean v0, p0, Lc/c/c/d/a;->n:Z

    .line 35
    iget-boolean v1, p1, Lc/c/c/d/c;->B:Z

    const/high16 v2, 0x43b40000    # 360.0f

    if-eqz v1, :cond_24

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, v2

    const v3, 0x461c4000    # 10000.0f

    div-float/2addr v1, v3

    goto :goto_26

    :cond_24
    const/high16 v1, 0x43b40000    # 360.0f

    .line 36
    :goto_26
    new-instance v3, Landroid/graphics/RectF;

    iget-object v4, p0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    invoke-direct {v3, v4}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    .line 37
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    .line 38
    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v6

    div-float/2addr v6, v5

    .line 39
    iget v5, p1, Lc/c/c/d/c;->w:I

    const/4 v7, -0x1

    if-eq v5, v7, :cond_40

    int-to-float v5, v5

    goto :goto_47

    .line 40
    :cond_40
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v5

    iget v8, p1, Lc/c/c/d/c;->u:F

    div-float/2addr v5, v8

    .line 41
    :goto_47
    iget v8, p1, Lc/c/c/d/c;->v:I

    if-eq v8, v7, :cond_4d

    int-to-float p1, v8

    goto :goto_55

    .line 42
    :cond_4d
    invoke-virtual {v3}, Landroid/graphics/RectF;->width()F

    move-result v7

    iget p1, p1, Lc/c/c/d/c;->t:F

    div-float p1, v7, p1

    .line 43
    :goto_55
    new-instance v7, Landroid/graphics/RectF;

    invoke-direct {v7, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    sub-float v3, v4, p1

    sub-float v8, v6, p1

    .line 44
    invoke-virtual {v7, v3, v8}, Landroid/graphics/RectF;->inset(FF)V

    .line 45
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v7}, Landroid/graphics/RectF;-><init>(Landroid/graphics/RectF;)V

    neg-float v8, v5

    .line 46
    invoke-virtual {v3, v8, v8}, Landroid/graphics/RectF;->inset(FF)V

    .line 47
    iget-object v8, p0, Lc/c/c/d/a;->m:Landroid/graphics/Path;

    if-nez v8, :cond_76

    .line 48
    new-instance v8, Landroid/graphics/Path;

    invoke-direct {v8}, Landroid/graphics/Path;-><init>()V

    iput-object v8, p0, Lc/c/c/d/a;->m:Landroid/graphics/Path;

    goto :goto_79

    .line 49
    :cond_76
    invoke-virtual {v8}, Landroid/graphics/Path;->reset()V

    .line 50
    :goto_79
    iget-object v8, p0, Lc/c/c/d/a;->m:Landroid/graphics/Path;

    cmpg-float v2, v1, v2

    if-gez v2, :cond_9e

    const/high16 v2, -0x3c4c0000    # -360.0f

    cmpl-float v2, v1, v2

    if-lez v2, :cond_9e

    .line 51
    sget-object v2, Landroid/graphics/Path$FillType;->EVEN_ODD:Landroid/graphics/Path$FillType;

    invoke-virtual {v8, v2}, Landroid/graphics/Path;->setFillType(Landroid/graphics/Path$FillType;)V

    add-float/2addr v4, p1

    .line 52
    invoke-virtual {v8, v4, v6}, Landroid/graphics/Path;->moveTo(FF)V

    add-float/2addr v4, v5

    .line 53
    invoke-virtual {v8, v4, v6}, Landroid/graphics/Path;->lineTo(FF)V

    const/4 p1, 0x0

    .line 54
    invoke-virtual {v8, v3, p1, v1, v0}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    neg-float p1, v1

    .line 55
    invoke-virtual {v8, v7, v1, p1, v0}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 56
    invoke-virtual {v8}, Landroid/graphics/Path;->close()V

    goto :goto_a8

    .line 57
    :cond_9e
    sget-object p1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v8, v3, p1}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    .line 58
    sget-object p1, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {v8, v7, p1}, Landroid/graphics/Path;->addOval(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    :goto_a8
    return-object v8
.end method

.method public a(F)Lc/c/c/d/a;
    .registers 3

    .line 22
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->b(F)V

    const/4 p1, 0x1

    .line 23
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 24
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public a(FF)Lc/c/c/d/a;
    .registers 4

    .line 19
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1, p2}, Lc/c/c/d/c;->a(FF)V

    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 21
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public a(FFFF)Lc/c/c/d/a;
    .registers 8

    cmpl-float v0, p1, p2

    if-nez v0, :cond_10

    cmpl-float v0, p1, p3

    if-nez v0, :cond_10

    cmpl-float v0, p1, p4

    if-nez v0, :cond_10

    .line 4
    invoke-virtual {p0, p1}, Lc/c/c/d/a;->c(F)Lc/c/c/d/a;

    return-object p0

    .line 5
    :cond_10
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    const/16 v1, 0x8

    new-array v1, v1, [F

    const/4 v2, 0x0

    aput p1, v1, v2

    const/4 v2, 0x1

    aput p1, v1, v2

    const/4 p1, 0x2

    aput p2, v1, p1

    const/4 p1, 0x3

    aput p2, v1, p1

    const/4 p1, 0x4

    aput p4, v1, p1

    const/4 p1, 0x5

    aput p4, v1, p1

    const/4 p1, 0x6

    aput p3, v1, p1

    const/4 p1, 0x7

    aput p3, v1, p1

    invoke-virtual {v0, v1}, Lc/c/c/d/c;->a([F)V

    .line 6
    iput-boolean v2, p0, Lc/c/c/d/a;->n:Z

    .line 7
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public a(II)Lc/c/c/d/a;
    .registers 4

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1, p2}, Lc/c/c/d/c;->a(II)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->n:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public a(IIFF)Lc/c/c/d/a;
    .registers 9

    .line 8
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1, p2, p3, p4}, Lc/c/c/d/c;->a(IIFF)V

    .line 9
    iget-object v0, p0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    const/4 v1, 0x1

    if-nez v0, :cond_16

    .line 10
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    .line 11
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 12
    :cond_16
    iget-object v0, p0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 13
    iget-object p1, p0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    iget-object p1, p0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    const/4 p2, 0x0

    cmpl-float v0, p3, p2

    if-lez v0, :cond_36

    new-instance v0, Landroid/graphics/DashPathEffect;

    const/4 v2, 0x2

    new-array v2, v2, [F

    const/4 v3, 0x0

    aput p3, v2, v3

    aput p4, v2, v1

    invoke-direct {v0, v2, p2}, Landroid/graphics/DashPathEffect;-><init>([FF)V

    goto :goto_37

    :cond_36
    const/4 v0, 0x0

    :goto_37
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 15
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public a(Lc/c/c/d/b;)Lc/c/c/d/a;
    .registers 3

    .line 28
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iput-object p1, v0, Lc/c/c/d/c;->d:Lc/c/c/d/b;

    const/4 p1, 0x1

    .line 29
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 30
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public a(Z)Lc/c/c/d/a;
    .registers 3

    .line 25
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iput-boolean p1, v0, Lc/c/c/d/c;->A:Z

    const/4 p1, 0x1

    .line 26
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 27
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public a([I)Lc/c/c/d/a;
    .registers 3

    .line 16
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->a([I)V

    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 18
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public final a()Z
    .registers 21

    move-object/from16 v0, p0

    .line 59
    iget-boolean v1, v0, Lc/c/c/d/a;->k:Z

    const/4 v2, 0x1

    if-eqz v1, :cond_17d

    const/4 v1, 0x0

    .line 60
    iput-boolean v1, v0, Lc/c/c/d/a;->k:Z

    .line 61
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    const/4 v4, 0x0

    .line 62
    iget-object v5, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    if-eqz v5, :cond_1b

    .line 63
    invoke-virtual {v5}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v4

    const/high16 v5, 0x3f000000    # 0.5f

    mul-float v4, v4, v5

    .line 64
    :cond_1b
    iget-object v5, v0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    .line 65
    iget-object v6, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget v7, v3, Landroid/graphics/Rect;->left:I

    int-to-float v7, v7

    add-float/2addr v7, v4

    iget v8, v5, Lc/c/c/d/c;->D:I

    int-to-float v9, v8

    add-float/2addr v7, v9

    iget v9, v3, Landroid/graphics/Rect;->top:I

    int-to-float v9, v9

    add-float/2addr v9, v4

    int-to-float v10, v8

    add-float/2addr v9, v10

    iget v10, v3, Landroid/graphics/Rect;->right:I

    int-to-float v10, v10

    sub-float/2addr v10, v4

    int-to-float v11, v8

    sub-float/2addr v10, v11

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v3, v4

    int-to-float v4, v8

    sub-float/2addr v3, v4

    invoke-virtual {v6, v7, v9, v10, v3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 66
    iget-object v3, v5, Lc/c/c/d/c;->e:[I

    if-eqz v3, :cond_17d

    .line 67
    iget-object v4, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    .line 68
    iget v6, v5, Lc/c/c/d/c;->c:I

    const v7, 0x461c4000    # 10000.0f

    const/high16 v8, 0x3f800000    # 1.0f

    if-nez v6, :cond_d0

    .line 69
    iget-boolean v1, v5, Lc/c/c/d/c;->A:Z

    if-eqz v1, :cond_56

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v1

    int-to-float v1, v1

    div-float v8, v1, v7

    .line 70
    :cond_56
    sget-object v1, Lc/c/c/d/a$a;->a:[I

    iget-object v6, v5, Lc/c/c/d/c;->d:Lc/c/c/d/b;

    invoke-virtual {v6}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    aget v1, v1, v6

    packed-switch v1, :pswitch_data_186

    .line 71
    iget v1, v4, Landroid/graphics/RectF;->left:F

    iget v6, v4, Landroid/graphics/RectF;->top:F

    .line 72
    iget v7, v4, Landroid/graphics/RectF;->right:F

    mul-float v7, v7, v8

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    goto :goto_a9

    .line 73
    :pswitch_6e
    iget v1, v4, Landroid/graphics/RectF;->left:F

    iget v6, v4, Landroid/graphics/RectF;->top:F

    .line 74
    iget v4, v4, Landroid/graphics/RectF;->right:F

    goto :goto_98

    .line 75
    :pswitch_75
    iget v1, v4, Landroid/graphics/RectF;->left:F

    iget v6, v4, Landroid/graphics/RectF;->bottom:F

    .line 76
    iget v7, v4, Landroid/graphics/RectF;->right:F

    mul-float v7, v7, v8

    iget v4, v4, Landroid/graphics/RectF;->top:F

    goto :goto_a9

    .line 77
    :pswitch_80
    iget v1, v4, Landroid/graphics/RectF;->left:F

    iget v6, v4, Landroid/graphics/RectF;->bottom:F

    .line 78
    iget v4, v4, Landroid/graphics/RectF;->top:F

    goto :goto_b5

    .line 79
    :pswitch_87
    iget v1, v4, Landroid/graphics/RectF;->right:F

    iget v6, v4, Landroid/graphics/RectF;->bottom:F

    .line 80
    iget v7, v4, Landroid/graphics/RectF;->left:F

    mul-float v7, v7, v8

    iget v4, v4, Landroid/graphics/RectF;->top:F

    goto :goto_a9

    .line 81
    :pswitch_92
    iget v1, v4, Landroid/graphics/RectF;->right:F

    iget v6, v4, Landroid/graphics/RectF;->top:F

    .line 82
    iget v4, v4, Landroid/graphics/RectF;->left:F

    :goto_98
    mul-float v8, v8, v4

    move v12, v1

    move v13, v6

    move v15, v13

    move v14, v8

    goto :goto_bb

    .line 83
    :pswitch_9f
    iget v1, v4, Landroid/graphics/RectF;->right:F

    iget v6, v4, Landroid/graphics/RectF;->top:F

    .line 84
    iget v7, v4, Landroid/graphics/RectF;->left:F

    mul-float v7, v7, v8

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    :goto_a9
    mul-float v8, v8, v4

    move v12, v1

    move v13, v6

    move v14, v7

    goto :goto_ba

    .line 85
    :pswitch_af
    iget v1, v4, Landroid/graphics/RectF;->left:F

    iget v6, v4, Landroid/graphics/RectF;->top:F

    .line 86
    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    :goto_b5
    mul-float v8, v8, v4

    move v12, v1

    move v14, v12

    move v13, v6

    :goto_ba
    move v15, v8

    .line 87
    :goto_bb
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/LinearGradient;

    iget-object v6, v5, Lc/c/c/d/c;->h:[F

    sget-object v18, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v11, v4

    move-object/from16 v16, v3

    move-object/from16 v17, v6

    invoke-direct/range {v11 .. v18}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    goto/16 :goto_172

    :cond_d0
    if-ne v6, v2, :cond_108

    .line 88
    iget v1, v4, Landroid/graphics/RectF;->left:F

    iget v6, v4, Landroid/graphics/RectF;->right:F

    sub-float/2addr v6, v1

    iget v9, v5, Lc/c/c/d/c;->x:F

    mul-float v6, v6, v9

    add-float v12, v1, v6

    .line 89
    iget v1, v4, Landroid/graphics/RectF;->top:F

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v1

    iget v6, v5, Lc/c/c/d/c;->y:F

    mul-float v4, v4, v6

    add-float v13, v1, v4

    .line 90
    iget-boolean v1, v5, Lc/c/c/d/c;->A:Z

    if-eqz v1, :cond_f3

    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v1

    int-to-float v1, v1

    div-float v8, v1, v7

    .line 91
    :cond_f3
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    new-instance v4, Landroid/graphics/RadialGradient;

    iget v6, v5, Lc/c/c/d/c;->z:F

    mul-float v14, v8, v6

    const/16 v16, 0x0

    sget-object v17, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    move-object v11, v4

    move-object v15, v3

    invoke-direct/range {v11 .. v17}, Landroid/graphics/RadialGradient;-><init>(FFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    goto :goto_172

    :cond_108
    const/4 v9, 0x2

    if-ne v6, v9, :cond_172

    .line 92
    iget v6, v4, Landroid/graphics/RectF;->left:F

    iget v9, v4, Landroid/graphics/RectF;->right:F

    sub-float/2addr v9, v6

    iget v10, v5, Lc/c/c/d/c;->x:F

    mul-float v9, v9, v10

    add-float/2addr v6, v9

    .line 93
    iget v9, v4, Landroid/graphics/RectF;->top:F

    iget v4, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v4, v9

    iget v10, v5, Lc/c/c/d/c;->y:F

    mul-float v4, v4, v10

    add-float/2addr v9, v4

    const/4 v4, 0x0

    .line 94
    iget-boolean v10, v5, Lc/c/c/d/c;->A:Z

    if-eqz v10, :cond_168

    .line 95
    iget-object v4, v5, Lc/c/c/d/c;->f:[I

    .line 96
    array-length v10, v3

    if-eqz v4, :cond_12e

    .line 97
    array-length v11, v4

    add-int/lit8 v12, v10, 0x1

    if-eq v11, v12, :cond_134

    :cond_12e
    add-int/lit8 v4, v10, 0x1

    .line 98
    new-array v4, v4, [I

    iput-object v4, v5, Lc/c/c/d/c;->f:[I

    .line 99
    :cond_134
    invoke-static {v3, v1, v4, v1, v10}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    add-int/lit8 v11, v10, -0x1

    .line 100
    aget v3, v3, v11

    aput v3, v4, v10

    .line 101
    iget-object v3, v5, Lc/c/c/d/c;->g:[F

    int-to-float v11, v11

    div-float v11, v8, v11

    if-eqz v3, :cond_149

    .line 102
    array-length v12, v3

    add-int/lit8 v13, v10, 0x1

    if-eq v12, v13, :cond_14f

    :cond_149
    add-int/lit8 v3, v10, 0x1

    .line 103
    new-array v3, v3, [F

    iput-object v3, v5, Lc/c/c/d/c;->g:[F

    .line 104
    :cond_14f
    invoke-virtual/range {p0 .. p0}, Landroid/graphics/drawable/Drawable;->getLevel()I

    move-result v12

    int-to-float v12, v12

    div-float/2addr v12, v7

    :goto_155
    if-ge v1, v10, :cond_161

    int-to-float v7, v1

    mul-float v7, v7, v11

    mul-float v7, v7, v12

    .line 105
    aput v7, v3, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_155

    .line 106
    :cond_161
    aput v8, v3, v10

    move-object/from16 v19, v4

    move-object v4, v3

    move-object/from16 v3, v19

    .line 107
    :cond_168
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    new-instance v7, Landroid/graphics/SweepGradient;

    invoke-direct {v7, v6, v9, v3, v4}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    invoke-virtual {v1, v7}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 108
    :cond_172
    :goto_172
    iget-boolean v1, v5, Lc/c/c/d/c;->i:Z

    if-nez v1, :cond_17d

    .line 109
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    const/high16 v3, -0x1000000

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 110
    :cond_17d
    iget-object v1, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    invoke-virtual {v1}, Landroid/graphics/RectF;->isEmpty()Z

    move-result v1

    xor-int/2addr v1, v2

    return v1

    nop

    :pswitch_data_186
    .packed-switch 0x1
        :pswitch_af
        :pswitch_9f
        :pswitch_92
        :pswitch_87
        :pswitch_80
        :pswitch_75
        :pswitch_6e
    .end packed-switch
.end method

.method public b(F)Lc/c/c/d/a;
    .registers 3

    .line 11
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iput p1, v0, Lc/c/c/d/c;->t:F

    const/4 p1, 0x1

    .line 12
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 13
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public b(I)Lc/c/c/d/a;
    .registers 3

    .line 1
    rem-int/lit16 p1, p1, 0x168

    .line 2
    rem-int/lit8 v0, p1, 0x2d

    if-nez v0, :cond_54

    if-eqz p1, :cond_4f

    const/16 v0, 0x2d

    if-eq p1, v0, :cond_49

    const/16 v0, 0x5a

    if-eq p1, v0, :cond_43

    const/16 v0, 0x87

    if-eq p1, v0, :cond_3d

    const/16 v0, 0xb4

    if-eq p1, v0, :cond_37

    const/16 v0, 0xe1

    if-eq p1, v0, :cond_31

    const/16 v0, 0x10e

    if-eq p1, v0, :cond_2b

    const/16 v0, 0x13b

    if-eq p1, v0, :cond_25

    goto :goto_54

    .line 3
    :cond_25
    sget-object p1, Lc/c/c/d/b;->TL_BR:Lc/c/c/d/b;

    invoke-virtual {p0, p1}, Lc/c/c/d/a;->a(Lc/c/c/d/b;)Lc/c/c/d/a;

    goto :goto_54

    .line 4
    :cond_2b
    sget-object p1, Lc/c/c/d/b;->TOP_BOTTOM:Lc/c/c/d/b;

    invoke-virtual {p0, p1}, Lc/c/c/d/a;->a(Lc/c/c/d/b;)Lc/c/c/d/a;

    goto :goto_54

    .line 5
    :cond_31
    sget-object p1, Lc/c/c/d/b;->TR_BL:Lc/c/c/d/b;

    invoke-virtual {p0, p1}, Lc/c/c/d/a;->a(Lc/c/c/d/b;)Lc/c/c/d/a;

    goto :goto_54

    .line 6
    :cond_37
    sget-object p1, Lc/c/c/d/b;->RIGHT_LEFT:Lc/c/c/d/b;

    invoke-virtual {p0, p1}, Lc/c/c/d/a;->a(Lc/c/c/d/b;)Lc/c/c/d/a;

    goto :goto_54

    .line 7
    :cond_3d
    sget-object p1, Lc/c/c/d/b;->BR_TL:Lc/c/c/d/b;

    invoke-virtual {p0, p1}, Lc/c/c/d/a;->a(Lc/c/c/d/b;)Lc/c/c/d/a;

    goto :goto_54

    .line 8
    :cond_43
    sget-object p1, Lc/c/c/d/b;->BOTTOM_TOP:Lc/c/c/d/b;

    invoke-virtual {p0, p1}, Lc/c/c/d/a;->a(Lc/c/c/d/b;)Lc/c/c/d/a;

    goto :goto_54

    .line 9
    :cond_49
    sget-object p1, Lc/c/c/d/b;->BL_TR:Lc/c/c/d/b;

    invoke-virtual {p0, p1}, Lc/c/c/d/a;->a(Lc/c/c/d/b;)Lc/c/c/d/a;

    goto :goto_54

    .line 10
    :cond_4f
    sget-object p1, Lc/c/c/d/b;->LEFT_RIGHT:Lc/c/c/d/b;

    invoke-virtual {p0, p1}, Lc/c/c/d/a;->a(Lc/c/c/d/b;)Lc/c/c/d/a;

    :cond_54
    :goto_54
    return-object p0
.end method

.method public final b(Lc/c/c/d/c;)V
    .registers 5

    .line 14
    iget-boolean v0, p1, Lc/c/c/d/c;->i:Z

    if-eqz v0, :cond_c

    .line 15
    iget-object v0, p0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    iget v1, p1, Lc/c/c/d/c;->j:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1e

    .line 16
    :cond_c
    iget-object v0, p1, Lc/c/c/d/c;->e:[I

    if-nez v0, :cond_17

    .line 17
    iget-object v0, p0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_1e

    .line 18
    :cond_17
    iget-object v0, p0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    const/high16 v1, -0x1000000

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    :goto_1e
    iget-object v0, p1, Lc/c/c/d/c;->q:Landroid/graphics/Rect;

    iput-object v0, p0, Lc/c/c/d/a;->c:Landroid/graphics/Rect;

    .line 20
    iget v0, p1, Lc/c/c/d/c;->k:I

    if-ltz v0, :cond_2f

    .line 21
    iget v1, p1, Lc/c/c/d/c;->l:I

    iget v2, p1, Lc/c/c/d/c;->m:F

    iget p1, p1, Lc/c/c/d/c;->n:F

    invoke-virtual {p0, v0, v1, v2, p1}, Lc/c/c/d/a;->a(IIFF)Lc/c/c/d/a;

    :cond_2f
    return-void
.end method

.method public c(F)Lc/c/c/d/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->a(F)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->n:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public c(I)Lc/c/c/d/a;
    .registers 3

    .line 4
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->a(I)V

    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public d(F)Lc/c/c/d/a;
    .registers 3

    .line 4
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iput p1, v0, Lc/c/c/d/c;->u:F

    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public d(I)Lc/c/c/d/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iput p1, v0, Lc/c/c/d/c;->v:I

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 20
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "WrongConstant"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v8, p1

    .line 1
    invoke-virtual/range {p0 .. p0}, Lc/c/c/d/a;->a()Z

    move-result v1

    if-nez v1, :cond_b

    return-void

    .line 2
    :cond_b
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getAlpha()I

    move-result v9

    .line 3
    iget-object v1, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    const/4 v10, 0x0

    if-eqz v1, :cond_1c

    invoke-virtual {v1}, Landroid/graphics/Paint;->getAlpha()I

    move-result v1

    move v11, v1

    goto :goto_1d

    :cond_1c
    const/4 v11, 0x0

    .line 4
    :goto_1d
    invoke-virtual {v0, v9}, Lc/c/c/d/a;->a(I)I

    move-result v1

    .line 5
    invoke-virtual {v0, v11}, Lc/c/c/d/a;->a(I)I

    move-result v2

    const/4 v12, 0x0

    const/4 v13, 0x1

    if-lez v2, :cond_37

    .line 6
    iget-object v3, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    if-eqz v3, :cond_37

    .line 7
    invoke-virtual {v3}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v3

    cmpl-float v3, v3, v12

    if-lez v3, :cond_37

    const/4 v14, 0x1

    goto :goto_38

    :cond_37
    const/4 v14, 0x0

    :goto_38
    if-lez v1, :cond_3c

    const/4 v3, 0x1

    goto :goto_3d

    :cond_3c
    const/4 v3, 0x0

    .line 8
    :goto_3d
    iget-object v15, v0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    const/4 v7, 0x2

    if-eqz v14, :cond_57

    if-eqz v3, :cond_57

    .line 9
    iget v3, v15, Lc/c/c/d/c;->b:I

    if-eq v3, v7, :cond_57

    const/16 v3, 0xff

    if-ge v2, v3, :cond_57

    iget v4, v0, Lc/c/c/d/a;->f:I

    if-lt v4, v3, :cond_54

    iget-object v3, v0, Lc/c/c/d/a;->e:Landroid/graphics/ColorFilter;

    if-eqz v3, :cond_57

    :cond_54
    const/16 v16, 0x1

    goto :goto_59

    :cond_57
    const/16 v16, 0x0

    .line 10
    :goto_59
    iget-object v3, v0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iget v4, v3, Lc/c/c/d/c;->D:I

    if-lez v4, :cond_7f

    if-eqz v14, :cond_70

    .line 11
    iget-object v5, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    int-to-float v4, v4

    iget v6, v3, Lc/c/c/d/c;->F:I

    int-to-float v6, v6

    iget v7, v3, Lc/c/c/d/c;->G:I

    int-to-float v7, v7

    iget v3, v3, Lc/c/c/d/c;->E:I

    invoke-virtual {v5, v4, v6, v7, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_8c

    .line 12
    :cond_70
    iget-object v5, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    int-to-float v4, v4

    iget v6, v3, Lc/c/c/d/c;->F:I

    int-to-float v6, v6

    iget v7, v3, Lc/c/c/d/c;->G:I

    int-to-float v7, v7

    iget v3, v3, Lc/c/c/d/c;->E:I

    invoke-virtual {v5, v4, v6, v7, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_8c

    :cond_7f
    if-eqz v14, :cond_87

    .line 13
    iget-object v3, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->clearShadowLayer()V

    goto :goto_8c

    .line 14
    :cond_87
    iget-object v3, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v3}, Landroid/graphics/Paint;->clearShadowLayer()V

    :goto_8c
    if-eqz v16, :cond_103

    .line 15
    iget-object v1, v0, Lc/c/c/d/a;->j:Landroid/graphics/Paint;

    if-nez v1, :cond_99

    .line 16
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, v0, Lc/c/c/d/a;->j:Landroid/graphics/Paint;

    .line 17
    :cond_99
    iget-object v1, v0, Lc/c/c/d/a;->j:Landroid/graphics/Paint;

    iget-boolean v2, v0, Lc/c/c/d/a;->g:Z

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 18
    iget-object v1, v0, Lc/c/c/d/a;->j:Landroid/graphics/Paint;

    iget v2, v0, Lc/c/c/d/a;->f:I

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 19
    iget-object v1, v0, Lc/c/c/d/a;->j:Landroid/graphics/Paint;

    iget-object v2, v0, Lc/c/c/d/a;->e:Landroid/graphics/ColorFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 20
    iget-object v1, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    move-result v1

    .line 21
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v3, 0x15

    if-lt v2, v3, :cond_d7

    .line 22
    iget-object v2, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, v1

    iget v4, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v1

    iget v5, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, v1

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    add-float v6, v2, v1

    iget-object v7, v0, Lc/c/c/d/a;->j:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move-object v6, v7

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;)I

    const/4 v12, 0x2

    goto :goto_f7

    .line 23
    :cond_d7
    iget-object v2, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget v3, v2, Landroid/graphics/RectF;->left:F

    sub-float/2addr v3, v1

    iget v4, v2, Landroid/graphics/RectF;->top:F

    sub-float/2addr v4, v1

    iget v5, v2, Landroid/graphics/RectF;->right:F

    add-float/2addr v5, v1

    iget v2, v2, Landroid/graphics/RectF;->bottom:F

    add-float v6, v2, v1

    iget-object v7, v0, Lc/c/c/d/a;->j:Landroid/graphics/Paint;

    const/16 v17, 0x4

    move-object/from16 v1, p1

    move v2, v3

    move v3, v4

    move v4, v5

    move v5, v6

    move-object v6, v7

    const/4 v12, 0x2

    move/from16 v7, v17

    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->saveLayer(FFFFLandroid/graphics/Paint;I)I

    .line 24
    :goto_f7
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 25
    iget-object v1, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    goto :goto_13f

    :cond_103
    const/4 v12, 0x2

    .line 26
    iget-object v3, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 27
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    iget-boolean v3, v0, Lc/c/c/d/a;->g:Z

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setDither(Z)V

    .line 28
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    iget-object v3, v0, Lc/c/c/d/a;->e:Landroid/graphics/ColorFilter;

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 29
    iget-object v1, v0, Lc/c/c/d/a;->e:Landroid/graphics/ColorFilter;

    if-eqz v1, :cond_12a

    iget-object v1, v0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iget-boolean v1, v1, Lc/c/c/d/c;->i:Z

    if-nez v1, :cond_12a

    .line 30
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    iget v3, v0, Lc/c/c/d/a;->f:I

    shl-int/lit8 v3, v3, 0x18

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    :cond_12a
    if-eqz v14, :cond_13f

    .line 31
    iget-object v1, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 32
    iget-object v1, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    iget-boolean v2, v0, Lc/c/c/d/a;->g:Z

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 33
    iget-object v1, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    iget-object v2, v0, Lc/c/c/d/a;->e:Landroid/graphics/ColorFilter;

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    .line 34
    :cond_13f
    :goto_13f
    iget v1, v15, Lc/c/c/d/c;->b:I

    if-eqz v1, :cond_184

    if-eq v1, v13, :cond_172

    if-eq v1, v12, :cond_15e

    const/4 v2, 0x3

    if-eq v1, v2, :cond_14c

    goto/16 :goto_20a

    .line 35
    :cond_14c
    invoke-virtual {v0, v15}, Lc/c/c/d/a;->a(Lc/c/c/d/c;)Landroid/graphics/Path;

    move-result-object v1

    .line 36
    iget-object v2, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    if-eqz v14, :cond_20a

    .line 37
    iget-object v2, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto/16 :goto_20a

    .line 38
    :cond_15e
    iget-object v1, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    .line 39
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    move-result v5

    .line 40
    iget v2, v1, Landroid/graphics/RectF;->left:F

    iget v4, v1, Landroid/graphics/RectF;->right:F

    iget-object v6, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v3, v5

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    goto/16 :goto_20a

    .line 41
    :cond_172
    iget-object v1, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget-object v2, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    if-eqz v14, :cond_20a

    .line 42
    iget-object v1, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget-object v2, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    goto/16 :goto_20a

    .line 43
    :cond_184
    iget-object v1, v15, Lc/c/c/d/c;->p:[F

    if-eqz v1, :cond_1b5

    .line 44
    iget-boolean v1, v0, Lc/c/c/d/a;->n:Z

    if-nez v1, :cond_190

    iget-boolean v1, v0, Lc/c/c/d/a;->k:Z

    if-eqz v1, :cond_1a4

    .line 45
    :cond_190
    iget-object v1, v0, Lc/c/c/d/a;->h:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 46
    iget-object v1, v0, Lc/c/c/d/a;->h:Landroid/graphics/Path;

    iget-object v2, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget-object v3, v15, Lc/c/c/d/c;->p:[F

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {v1, v2, v3, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 47
    iput-boolean v10, v0, Lc/c/c/d/a;->k:Z

    iput-boolean v10, v0, Lc/c/c/d/a;->n:Z

    .line 48
    :cond_1a4
    iget-object v1, v0, Lc/c/c/d/a;->h:Landroid/graphics/Path;

    iget-object v2, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    if-eqz v14, :cond_20a

    .line 49
    iget-object v1, v0, Lc/c/c/d/a;->h:Landroid/graphics/Path;

    iget-object v2, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_20a

    .line 50
    :cond_1b5
    iget v1, v15, Lc/c/c/d/c;->o:F

    const/4 v2, 0x0

    cmpl-float v2, v1, v2

    if-lez v2, :cond_1e6

    .line 51
    iget-object v2, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    invoke-virtual {v2}, Landroid/graphics/RectF;->width()F

    move-result v2

    iget-object v3, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    invoke-virtual {v3}, Landroid/graphics/RectF;->height()F

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->min(FF)F

    move-result v2

    const/high16 v3, 0x3f000000    # 0.5f

    mul-float v2, v2, v3

    cmpl-float v3, v1, v2

    if-lez v3, :cond_1d5

    move v1, v2

    .line 52
    :cond_1d5
    iget-object v2, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget-object v3, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v8, v2, v1, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    if-eqz v14, :cond_20a

    .line 53
    iget-object v2, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget-object v3, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v8, v2, v1, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_20a

    .line 54
    :cond_1e6
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->getColor()I

    move-result v1

    if-nez v1, :cond_1fa

    iget-object v1, v0, Lc/c/c/d/a;->e:Landroid/graphics/ColorFilter;

    if-nez v1, :cond_1fa

    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    .line 55
    invoke-virtual {v1}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v1

    if-eqz v1, :cond_201

    .line 56
    :cond_1fa
    iget-object v1, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget-object v2, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_201
    if-eqz v14, :cond_20a

    .line 57
    iget-object v1, v0, Lc/c/c/d/a;->i:Landroid/graphics/RectF;

    iget-object v2, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v8, v1, v2}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_20a
    :goto_20a
    if-eqz v16, :cond_210

    .line 58
    invoke-virtual/range {p1 .. p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_21c

    .line 59
    :cond_210
    iget-object v1, v0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v1, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    if-eqz v14, :cond_21c

    .line 60
    iget-object v1, v0, Lc/c/c/d/a;->d:Landroid/graphics/Paint;

    invoke-virtual {v1, v11}, Landroid/graphics/Paint;->setAlpha(I)V

    :cond_21c
    :goto_21c
    return-void
.end method

.method public e(I)Lc/c/c/d/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->b(I)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->n:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public f(I)Lc/c/c/d/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->c(I)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->n:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public g(I)Lc/c/c/d/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->d(I)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->n:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public getAlpha()I
    .registers 2

    .line 1
    iget v0, p0, Lc/c/c/d/a;->f:I

    return v0
.end method

.method public getChangingConfigurations()I
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getChangingConfigurations()I

    move-result v0

    iget-object v1, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iget v1, v1, Lc/c/c/d/c;->a:I

    or-int/2addr v0, v1

    return v0
.end method

.method public getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {p0}, Lc/c/c/d/a;->getChangingConfigurations()I

    move-result v1

    iput v1, v0, Lc/c/c/d/c;->a:I

    .line 2
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    return-object v0
.end method

.method public getIntrinsicHeight()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iget v0, v0, Lc/c/c/d/c;->s:I

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iget v0, v0, Lc/c/c/d/c;->r:I

    return v0
.end method

.method public getOpacity()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iget-boolean v0, v0, Lc/c/c/d/c;->C:Z

    if-eqz v0, :cond_8

    const/4 v0, -0x1

    goto :goto_9

    :cond_8
    const/4 v0, -0x3

    :goto_9
    return v0
.end method

.method public getPadding(Landroid/graphics/Rect;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->c:Landroid/graphics/Rect;

    if-eqz v0, :cond_9

    .line 2
    invoke-virtual {p1, v0}, Landroid/graphics/Rect;->set(Landroid/graphics/Rect;)V

    const/4 p1, 0x1

    return p1

    .line 3
    :cond_9
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->getPadding(Landroid/graphics/Rect;)Z

    move-result p1

    return p1
.end method

.method public h(I)Lc/c/c/d/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->e(I)V

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->n:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public i(I)Lc/c/c/d/a;
    .registers 3

    const/4 v0, 0x0

    .line 1
    iput-object v0, p0, Lc/c/c/d/a;->m:Landroid/graphics/Path;

    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lc/c/c/d/a;->n:Z

    .line 3
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->f(I)V

    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public j(I)Lc/c/c/d/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-virtual {v0, p1}, Lc/c/c/d/c;->g(I)V

    .line 2
    iget-object v0, p0, Lc/c/c/d/a;->b:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public k(I)Lc/c/c/d/a;
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    iput p1, v0, Lc/c/c/d/c;->w:I

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-object p0
.end method

.method public mutate()Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    iget-boolean v0, p0, Lc/c/c/d/a;->l:Z

    if-nez v0, :cond_19

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-ne v0, p0, :cond_19

    .line 2
    new-instance v0, Lc/c/c/d/c;

    iget-object v1, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    invoke-direct {v0, v1}, Lc/c/c/d/c;-><init>(Lc/c/c/d/c;)V

    iput-object v0, p0, Lc/c/c/d/a;->a:Lc/c/c/d/c;

    .line 3
    invoke-virtual {p0, v0}, Lc/c/c/d/a;->b(Lc/c/c/d/c;)V

    const/4 v0, 0x1

    .line 4
    iput-boolean v0, p0, Lc/c/c/d/a;->l:Z

    :cond_19
    return-object p0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lc/c/c/d/a;->m:Landroid/graphics/Path;

    const/4 p1, 0x1

    .line 3
    iput-boolean p1, p0, Lc/c/c/d/a;->n:Z

    .line 4
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    return-void
.end method

.method public onLevelChange(I)Z
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onLevelChange(I)Z

    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->k:Z

    .line 3
    iput-boolean p1, p0, Lc/c/c/d/a;->n:Z

    .line 4
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return p1
.end method

.method public setAlpha(I)V
    .registers 3

    .line 1
    iget v0, p0, Lc/c/c/d/a;->f:I

    if-eq p1, v0, :cond_9

    .line 2
    iput p1, p0, Lc/c/c/d/a;->f:I

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_9
    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/c/c/d/a;->e:Landroid/graphics/ColorFilter;

    if-eq p1, v0, :cond_9

    .line 2
    iput-object p1, p0, Lc/c/c/d/a;->e:Landroid/graphics/ColorFilter;

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_9
    return-void
.end method

.method public setDither(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lc/c/c/d/a;->g:Z

    if-eq p1, v0, :cond_9

    .line 2
    iput-boolean p1, p0, Lc/c/c/d/a;->g:Z

    .line 3
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_9
    return-void
.end method
