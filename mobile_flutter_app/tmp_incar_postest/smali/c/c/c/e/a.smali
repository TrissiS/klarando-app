.class public Lc/c/c/e/a;
.super Landroid/text/style/ReplacementSpan;
.source "LinearGradientFontSpan.java"


# instance fields
.field public h:F

.field public i:I

.field public j:[I

.field public k:[F


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    return-void
.end method

.method public static a(Ljava/lang/CharSequence;[I[FI)Landroid/text/SpannableStringBuilder;
    .registers 5

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    invoke-direct {v0, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 2
    new-instance p0, Lc/c/c/e/a;

    invoke-direct {p0}, Lc/c/c/e/a;-><init>()V

    .line 3
    invoke-virtual {p0, p1}, Lc/c/c/e/a;->a([I)Lc/c/c/e/a;

    .line 4
    invoke-virtual {p0, p3}, Lc/c/c/e/a;->a(I)Lc/c/c/e/a;

    .line 5
    invoke-virtual {p0, p2}, Lc/c/c/e/a;->a([F)Lc/c/c/e/a;

    .line 6
    invoke-virtual {v0}, Landroid/text/SpannableStringBuilder;->length()I

    move-result p1

    const/4 p2, 0x0

    const/16 p3, 0x21

    invoke-virtual {v0, p0, p2, p1, p3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    return-object v0
.end method


# virtual methods
.method public a(I)Lc/c/c/e/a;
    .registers 2

    .line 7
    iput p1, p0, Lc/c/c/e/a;->i:I

    return-object p0
.end method

.method public a([F)Lc/c/c/e/a;
    .registers 2

    .line 9
    iput-object p1, p0, Lc/c/c/e/a;->k:[F

    return-object p0
.end method

.method public a([I)Lc/c/c/e/a;
    .registers 2

    .line 8
    iput-object p1, p0, Lc/c/c/e/a;->j:[I

    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .registers 35

    move-object/from16 v0, p0

    move-object/from16 v8, p9

    .line 1
    iget v1, v0, Lc/c/c/e/a;->i:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_23

    .line 2
    new-instance v1, Landroid/graphics/LinearGradient;

    const/4 v10, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-virtual/range {p9 .. p9}, Landroid/graphics/Paint;->descent()F

    move-result v2

    invoke-virtual/range {p9 .. p9}, Landroid/graphics/Paint;->ascent()F

    move-result v3

    sub-float v13, v2, v3

    iget-object v14, v0, Lc/c/c/e/a;->j:[I

    iget-object v15, v0, Lc/c/c/e/a;->k:[F

    sget-object v16, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    move-object v9, v1

    invoke-direct/range {v9 .. v16}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    goto :goto_3e

    .line 3
    :cond_23
    new-instance v1, Landroid/graphics/LinearGradient;

    const/16 v19, 0x0

    iget v2, v0, Lc/c/c/e/a;->h:F

    add-float v20, p5, v2

    const/16 v21, 0x0

    iget-object v2, v0, Lc/c/c/e/a;->j:[I

    iget-object v3, v0, Lc/c/c/e/a;->k:[F

    sget-object v24, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    move-object/from16 v17, v1

    move/from16 v18, p5

    move-object/from16 v22, v2

    move-object/from16 v23, v3

    invoke-direct/range {v17 .. v24}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 4
    :goto_3e
    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 5
    invoke-virtual/range {p9 .. p9}, Landroid/graphics/Paint;->getAlpha()I

    move-result v9

    const/16 v1, 0xff

    if-eq v9, v1, :cond_4c

    .line 6
    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setAlpha(I)V

    :cond_4c
    move/from16 v1, p7

    int-to-float v6, v1

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move-object/from16 v7, p9

    .line 7
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 8
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .registers 6

    .line 1
    invoke-virtual {p1, p2, p3, p4}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    move-result p2

    iput p2, p0, Lc/c/c/e/a;->h:F

    .line 2
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetricsInt()Landroid/graphics/Paint$FontMetricsInt;

    move-result-object p1

    if-eqz p5, :cond_1c

    .line 3
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->top:I

    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->top:I

    .line 4
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->ascent:I

    .line 5
    iget p2, p1, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    iput p2, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 6
    iget p1, p1, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    iput p1, p5, Landroid/graphics/Paint$FontMetricsInt;->bottom:I

    .line 7
    :cond_1c
    iget p1, p0, Lc/c/c/e/a;->h:F

    float-to-int p1, p1

    return p1
.end method
