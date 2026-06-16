.class public final Lnet/nyx/widget/view/PlayButton;
.super Landroid/view/View;
.source "PlayButton.java"


# instance fields
.field public h:I

.field public final i:Landroid/graphics/Paint;

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:Landroid/graphics/RectF;

.field public p:Landroid/graphics/RectF;

.field public q:F

.field public final r:Landroid/graphics/Path;

.field public final s:Landroid/graphics/Path;

.field public final t:Landroid/graphics/PathMeasure;

.field public u:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/PlayButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/PlayButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 8

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x1

    .line 4
    iput p3, p0, Lnet/nyx/widget/view/PlayButton;->h:I

    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    iput v0, p0, Lnet/nyx/widget/view/PlayButton;->q:F

    .line 6
    sget-object v1, Ld/a/d/f;->PlayButton:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 7
    sget p2, Ld/a/d/f;->PlayButton_pb_lineColor:I

    const/4 v1, -0x1

    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    .line 8
    sget v1, Ld/a/d/f;->PlayButton_pb_lineSize:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget v3, Ld/a/d/c;->dp_4:I

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getDimension(I)F

    move-result v2

    float-to-int v2, v2

    invoke-virtual {p1, v1, v2}, Landroid/content/res/TypedArray;->getInteger(II)I

    move-result v1

    .line 9
    sget v2, Ld/a/d/f;->PlayButton_pb_animDuration:I

    const/16 v3, 0xc8

    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 10
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    const/4 p1, 0x0

    .line 11
    invoke-virtual {p0, p3, p1}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 12
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1, p3}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    .line 13
    sget-object p3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 14
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    sget-object p3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 15
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 16
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    int-to-float p2, v1

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 17
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    new-instance p2, Landroid/graphics/CornerPathEffect;

    invoke-direct {p2, v0}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 18
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lnet/nyx/widget/view/PlayButton;->r:Landroid/graphics/Path;

    .line 19
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    .line 20
    new-instance p1, Landroid/graphics/PathMeasure;

    invoke-direct {p1}, Landroid/graphics/PathMeasure;-><init>()V

    iput-object p1, p0, Lnet/nyx/widget/view/PlayButton;->t:Landroid/graphics/PathMeasure;

    return-void
.end method


# virtual methods
.method public getCurrentState()I
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/PlayButton;->h:I

    return v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 19

    move-object/from16 v0, p0

    move-object/from16 v7, p1

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    iget v1, v0, Lnet/nyx/widget/view/PlayButton;->l:I

    int-to-float v1, v1

    iget v2, v0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float v2, v2

    iget v3, v0, Lnet/nyx/widget/view/PlayButton;->j:I

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    iget-object v4, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 3
    iget v1, v0, Lnet/nyx/widget/view/PlayButton;->q:F

    const/4 v8, 0x0

    const v9, 0x3fcccccd    # 1.6f

    cmpg-float v2, v1, v8

    if-gez v2, :cond_7f

    .line 4
    iget v2, v0, Lnet/nyx/widget/view/PlayButton;->l:I

    iget v3, v0, Lnet/nyx/widget/view/PlayButton;->n:I

    add-int v4, v2, v3

    int-to-float v4, v4

    iget v5, v0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float v6, v5

    int-to-float v8, v3

    mul-float v8, v8, v9

    sub-float/2addr v6, v8

    mul-int/lit8 v8, v3, 0xa

    int-to-float v8, v8

    mul-float v8, v8, v1

    add-float/2addr v6, v8

    add-int/2addr v2, v3

    int-to-float v8, v2

    int-to-float v2, v5

    int-to-float v5, v3

    mul-float v5, v5, v9

    add-float/2addr v2, v5

    mul-int/lit8 v3, v3, 0xa

    int-to-float v3, v3

    mul-float v3, v3, v1

    add-float v5, v2, v3

    iget-object v10, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v2, v4

    move v3, v6

    move v4, v8

    move-object v6, v10

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 5
    iget v1, v0, Lnet/nyx/widget/view/PlayButton;->l:I

    iget v2, v0, Lnet/nyx/widget/view/PlayButton;->n:I

    sub-int v3, v1, v2

    int-to-float v3, v3

    iget v4, v0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float v5, v4

    int-to-float v6, v2

    mul-float v6, v6, v9

    sub-float/2addr v5, v6

    sub-int/2addr v1, v2

    int-to-float v6, v1

    int-to-float v1, v4

    int-to-float v2, v2

    mul-float v2, v2, v9

    add-float v8, v1, v2

    iget-object v9, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v2, v3

    move v3, v5

    move v4, v6

    move v5, v8

    move-object v6, v9

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 6
    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->p:Landroid/graphics/RectF;

    const/high16 v3, -0x3d2e0000    # -105.0f

    const/high16 v4, 0x43b40000    # 360.0f

    const/4 v5, 0x0

    iget-object v6, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto/16 :goto_1d3

    :cond_7f
    float-to-double v2, v1

    const-wide v4, 0x3fd3333333333333L    # 0.3

    const/high16 v10, -0x3d2e0000    # -105.0f

    const/high16 v11, 0x44160000    # 600.0f

    const/high16 v12, 0x3f800000    # 1.0f

    const v13, 0x3e99999a    # 0.3f

    const/high16 v14, 0x43b40000    # 360.0f

    cmpg-double v6, v2, v4

    if-gtz v6, :cond_108

    .line 7
    iget v2, v0, Lnet/nyx/widget/view/PlayButton;->l:I

    iget v3, v0, Lnet/nyx/widget/view/PlayButton;->n:I

    add-int v4, v2, v3

    int-to-float v4, v4

    iget v5, v0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float v6, v5

    int-to-float v15, v3

    mul-float v15, v15, v9

    sub-float/2addr v6, v15

    int-to-float v15, v3

    const v16, 0x404ccccd    # 3.2f

    mul-float v15, v15, v16

    div-float/2addr v15, v13

    mul-float v15, v15, v1

    add-float/2addr v6, v15

    add-int/2addr v2, v3

    int-to-float v13, v2

    int-to-float v1, v5

    int-to-float v2, v3

    mul-float v2, v2, v9

    add-float v5, v1, v2

    iget-object v15, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v2, v4

    move v3, v6

    move v4, v13

    move-object v6, v15

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 8
    iget v1, v0, Lnet/nyx/widget/view/PlayButton;->l:I

    iget v2, v0, Lnet/nyx/widget/view/PlayButton;->n:I

    sub-int v3, v1, v2

    int-to-float v3, v3

    iget v4, v0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float v5, v4

    int-to-float v6, v2

    mul-float v6, v6, v9

    sub-float/2addr v5, v6

    sub-int/2addr v1, v2

    int-to-float v6, v1

    int-to-float v1, v4

    int-to-float v2, v2

    mul-float v2, v2, v9

    add-float v9, v1, v2

    iget-object v13, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    move v2, v3

    move v3, v5

    move v4, v6

    move v5, v9

    move-object v6, v13

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 9
    iget v1, v0, Lnet/nyx/widget/view/PlayButton;->q:F

    cmpl-float v2, v1, v8

    if-eqz v2, :cond_f4

    .line 10
    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->o:Landroid/graphics/RectF;

    const/4 v3, 0x0

    mul-float v4, v1, v11

    const/4 v5, 0x0

    iget-object v6, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 11
    :cond_f4
    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->p:Landroid/graphics/RectF;

    iget v1, v0, Lnet/nyx/widget/view/PlayButton;->q:F

    mul-float v3, v1, v14

    add-float/2addr v3, v10

    sub-float/2addr v12, v1

    mul-float v4, v12, v14

    const/4 v5, 0x0

    iget-object v6, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto/16 :goto_1d3

    :cond_108
    float-to-double v2, v1

    const-wide v4, 0x3fe3333333333333L    # 0.6

    const v8, 0x3ca3d70a    # 0.02f

    const/4 v9, 0x1

    cmpg-double v6, v2, v4

    if-gtz v6, :cond_164

    .line 12
    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->o:Landroid/graphics/RectF;

    sub-float v3, v1, v13

    mul-float v3, v3, v11

    const/high16 v4, 0x43340000    # 180.0f

    sub-float/2addr v1, v13

    mul-float v1, v1, v11

    sub-float/2addr v4, v1

    const/4 v5, 0x0

    iget-object v6, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 13
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 14
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->t:Landroid/graphics/PathMeasure;

    iget v2, v0, Lnet/nyx/widget/view/PlayButton;->u:F

    mul-float v8, v8, v2

    const v3, 0x3ec28f5c    # 0.38f

    mul-float v3, v3, v2

    const v4, 0x3ed70a3d    # 0.42f

    mul-float v2, v2, v4

    div-float/2addr v2, v13

    iget v4, v0, Lnet/nyx/widget/view/PlayButton;->q:F

    sub-float/2addr v4, v13

    mul-float v2, v2, v4

    add-float/2addr v3, v2

    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    invoke-virtual {v1, v8, v3, v2, v9}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 15
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 16
    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->p:Landroid/graphics/RectF;

    iget v1, v0, Lnet/nyx/widget/view/PlayButton;->q:F

    mul-float v3, v1, v14

    add-float/2addr v3, v10

    sub-float/2addr v12, v1

    mul-float v4, v12, v14

    iget-object v6, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_1d3

    :cond_164
    float-to-double v1, v1

    const-wide v3, 0x3fe999999999999aL    # 0.8

    cmpg-double v5, v1, v3

    if-gtz v5, :cond_1b4

    .line 17
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 18
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->t:Landroid/graphics/PathMeasure;

    iget v2, v0, Lnet/nyx/widget/view/PlayButton;->u:F

    mul-float v8, v8, v2

    const v3, 0x3e4ccccd    # 0.2f

    mul-float v4, v2, v3

    div-float/2addr v4, v3

    iget v5, v0, Lnet/nyx/widget/view/PlayButton;->q:F

    const v6, 0x3f19999a    # 0.6f

    sub-float v11, v5, v6

    mul-float v4, v4, v11

    add-float/2addr v8, v4

    const v4, 0x3f4ccccd    # 0.8f

    mul-float v4, v4, v2

    mul-float v2, v2, v3

    div-float/2addr v2, v3

    sub-float/2addr v5, v6

    mul-float v2, v2, v5

    add-float/2addr v4, v2

    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    invoke-virtual {v1, v8, v4, v2, v9}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 19
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 20
    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->p:Landroid/graphics/RectF;

    iget v1, v0, Lnet/nyx/widget/view/PlayButton;->q:F

    mul-float v3, v1, v14

    add-float/2addr v3, v10

    sub-float/2addr v12, v1

    mul-float v4, v12, v14

    const/4 v5, 0x0

    iget-object v6, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    move-object/from16 v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    goto :goto_1d3

    .line 21
    :cond_1b4
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->reset()V

    .line 22
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->t:Landroid/graphics/PathMeasure;

    iget v2, v0, Lnet/nyx/widget/view/PlayButton;->n:I

    mul-int/lit8 v2, v2, 0xa

    int-to-float v2, v2

    iget v3, v0, Lnet/nyx/widget/view/PlayButton;->q:F

    sub-float/2addr v3, v12

    mul-float v2, v2, v3

    iget v3, v0, Lnet/nyx/widget/view/PlayButton;->u:F

    iget-object v4, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    invoke-virtual {v1, v2, v3, v4, v9}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 23
    iget-object v1, v0, Lnet/nyx/widget/view/PlayButton;->s:Landroid/graphics/Path;

    iget-object v2, v0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    invoke-virtual {v7, v1, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :goto_1d3
    return-void
.end method

.method public onMeasure(II)V
    .registers 6

    .line 1
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, -0x80000000

    if-eq v0, v2, :cond_d

    if-eqz v0, :cond_d

    goto :goto_1c

    .line 2
    :cond_d
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Ld/a/d/c;->dp_60:I

    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    float-to-int p1, p1

    invoke-static {p1, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 3
    :goto_1c
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eq v0, v2, :cond_25

    if-eqz v0, :cond_25

    goto :goto_34

    .line 4
    :cond_25
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget v0, Ld/a/d/c;->dp_60:I

    invoke-virtual {p2, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p2

    float-to-int p2, p2

    invoke-static {p2, v1}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 5
    :goto_34
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public onSizeChanged(IIII)V
    .registers 10

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    mul-int/lit8 p3, p1, 0x9

    .line 2
    div-int/lit8 p3, p3, 0xa

    iput p3, p0, Lnet/nyx/widget/view/PlayButton;->j:I

    mul-int/lit8 p4, p2, 0x9

    .line 3
    div-int/lit8 p4, p4, 0xa

    iput p4, p0, Lnet/nyx/widget/view/PlayButton;->k:I

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    sget v0, Ld/a/d/c;->dp_4:I

    invoke-virtual {p4, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p4

    float-to-int p4, p4

    div-int/2addr p3, p4

    iput p3, p0, Lnet/nyx/widget/view/PlayButton;->n:I

    .line 5
    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lnet/nyx/widget/view/PlayButton;->l:I

    .line 6
    div-int/lit8 p2, p2, 0x2

    iput p2, p0, Lnet/nyx/widget/view/PlayButton;->m:I

    .line 7
    new-instance p1, Landroid/graphics/RectF;

    iget p2, p0, Lnet/nyx/widget/view/PlayButton;->l:I

    iget p3, p0, Lnet/nyx/widget/view/PlayButton;->n:I

    sub-int p4, p2, p3

    int-to-float p4, p4

    iget v0, p0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float v1, v0

    int-to-float v2, p3

    const v3, 0x3f19999a    # 0.6f

    mul-float v2, v2, v3

    add-float/2addr v1, v2

    add-int/2addr p2, p3

    int-to-float p2, p2

    int-to-float v0, v0

    int-to-float p3, p3

    const v2, 0x40266666    # 2.6f

    mul-float p3, p3, v2

    add-float/2addr v0, p3

    invoke-direct {p1, p4, v1, p2, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lnet/nyx/widget/view/PlayButton;->o:Landroid/graphics/RectF;

    .line 8
    new-instance p1, Landroid/graphics/RectF;

    iget p2, p0, Lnet/nyx/widget/view/PlayButton;->l:I

    int-to-float p3, p2

    iget p4, p0, Lnet/nyx/widget/view/PlayButton;->j:I

    int-to-float v0, p4

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    sub-float/2addr p3, v0

    iget v0, p0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float v2, v0

    iget v3, p0, Lnet/nyx/widget/view/PlayButton;->k:I

    int-to-float v4, v3

    div-float/2addr v4, v1

    sub-float/2addr v2, v4

    int-to-float p2, p2

    int-to-float p4, p4

    div-float/2addr p4, v1

    add-float/2addr p2, p4

    int-to-float p4, v0

    int-to-float v0, v3

    div-float/2addr v0, v1

    add-float/2addr p4, v0

    invoke-direct {p1, p3, v2, p2, p4}, Landroid/graphics/RectF;-><init>(FFFF)V

    iput-object p1, p0, Lnet/nyx/widget/view/PlayButton;->p:Landroid/graphics/RectF;

    .line 9
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->r:Landroid/graphics/Path;

    iget p2, p0, Lnet/nyx/widget/view/PlayButton;->l:I

    iget p3, p0, Lnet/nyx/widget/view/PlayButton;->n:I

    sub-int/2addr p2, p3

    int-to-float p2, p2

    iget p4, p0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float p4, p4

    int-to-float p3, p3

    const v0, 0x3fe66666    # 1.8f

    mul-float p3, p3, v0

    add-float/2addr p4, p3

    invoke-virtual {p1, p2, p4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 10
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->r:Landroid/graphics/Path;

    iget p2, p0, Lnet/nyx/widget/view/PlayButton;->l:I

    iget p3, p0, Lnet/nyx/widget/view/PlayButton;->n:I

    sub-int/2addr p2, p3

    int-to-float p2, p2

    iget p4, p0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float p4, p4

    int-to-float p3, p3

    mul-float p3, p3, v0

    sub-float/2addr p4, p3

    invoke-virtual {p1, p2, p4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 11
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->r:Landroid/graphics/Path;

    iget p2, p0, Lnet/nyx/widget/view/PlayButton;->l:I

    iget p3, p0, Lnet/nyx/widget/view/PlayButton;->n:I

    add-int/2addr p2, p3

    int-to-float p2, p2

    iget p3, p0, Lnet/nyx/widget/view/PlayButton;->m:I

    int-to-float p3, p3

    invoke-virtual {p1, p2, p3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 12
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->r:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 13
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->t:Landroid/graphics/PathMeasure;

    iget-object p2, p0, Lnet/nyx/widget/view/PlayButton;->r:Landroid/graphics/Path;

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p3}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 14
    iget-object p1, p0, Lnet/nyx/widget/view/PlayButton;->t:Landroid/graphics/PathMeasure;

    invoke-virtual {p1}, Landroid/graphics/PathMeasure;->getLength()F

    move-result p1

    iput p1, p0, Lnet/nyx/widget/view/PlayButton;->u:F

    return-void
.end method

.method public setAnimDuration(I)V
    .registers 2

    return-void
.end method

.method public setLineColor(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setLineSize(I)V
    .registers 3

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/PlayButton;->i:Landroid/graphics/Paint;

    int-to-float p1, p1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
