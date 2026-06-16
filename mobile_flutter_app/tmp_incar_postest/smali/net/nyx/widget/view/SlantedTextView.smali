.class public final Lnet/nyx/widget/view/SlantedTextView;
.super Landroid/view/View;
.source "SlantedTextView.java"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "RtlHardcoded"
    }
.end annotation


# instance fields
.field public final h:Landroid/graphics/Paint;

.field public final i:Landroid/text/TextPaint;

.field public j:Ljava/lang/String;

.field public k:I

.field public l:Z

.field public m:I

.field public final n:Landroid/graphics/Rect;

.field public o:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/SlantedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/SlantedTextView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 6

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const-string p3, ""

    .line 4
    iput-object p3, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    .line 5
    new-instance p3, Landroid/graphics/Rect;

    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    iput-object p3, p0, Lnet/nyx/widget/view/SlantedTextView;->n:Landroid/graphics/Rect;

    .line 6
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lnet/nyx/widget/view/SlantedTextView;->h:Landroid/graphics/Paint;

    .line 7
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 8
    iget-object p3, p0, Lnet/nyx/widget/view/SlantedTextView;->h:Landroid/graphics/Paint;

    new-instance v0, Landroid/graphics/PorterDuffXfermode;

    sget-object v1, Landroid/graphics/PorterDuff$Mode;->SRC_OVER:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v0, v1}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 9
    iget-object p3, p0, Lnet/nyx/widget/view/SlantedTextView;->h:Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    new-instance p3, Landroid/text/TextPaint;

    invoke-direct {p3, v0}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p3, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    .line 11
    invoke-virtual {p3, v0}, Landroid/text/TextPaint;->setAntiAlias(Z)V

    .line 12
    sget-object p3, Ld/a/d/f;->SlantedTextView:[I

    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 13
    sget p2, Ld/a/d/f;->SlantedTextView_android_text:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/SlantedTextView;->setText(Ljava/lang/String;)V

    .line 14
    sget p2, Ld/a/d/f;->SlantedTextView_android_textSize:I

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v0, Ld/a/d/c;->sp_12:I

    invoke-virtual {p3, v0}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p3

    float-to-int p3, p3

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    int-to-float p2, p2

    const/4 p3, 0x0

    invoke-virtual {p0, p3, p2}, Lnet/nyx/widget/view/SlantedTextView;->a(IF)V

    .line 15
    sget p2, Ld/a/d/f;->SlantedTextView_android_textColor:I

    const/4 v0, -0x1

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/SlantedTextView;->setTextColor(I)V

    .line 16
    sget p2, Ld/a/d/f;->SlantedTextView_android_textStyle:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    invoke-static {p2}, Landroid/graphics/Typeface;->defaultFromStyle(I)Landroid/graphics/Typeface;

    move-result-object p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/SlantedTextView;->setTextStyle(Landroid/graphics/Typeface;)V

    .line 17
    sget p2, Ld/a/d/f;->SlantedTextView_android_gravity:I

    const v0, 0x800005

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/SlantedTextView;->setGravity(I)V

    .line 18
    sget p2, Ld/a/d/f;->SlantedTextView_android_colorBackground:I

    invoke-direct {p0}, Lnet/nyx/widget/view/SlantedTextView;->getAccentColor()I

    move-result v0

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/SlantedTextView;->setColorBackground(I)V

    .line 19
    sget p2, Ld/a/d/f;->SlantedTextView_triangle:I

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    invoke-virtual {p0, p2}, Lnet/nyx/widget/view/SlantedTextView;->setTriangle(Z)V

    .line 20
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method private getAccentColor()I
    .registers 5

    .line 1
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    sget v2, Ld/a/d/a;->colorAccent:I

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 3
    iget v0, v0, Landroid/util/TypedValue;->data:I

    return v0
.end method


# virtual methods
.method public a(IF)V
    .registers 4

    .line 36
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    invoke-static {p1, p2, v0}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    .line 37
    invoke-virtual {p0}, Lnet/nyx/widget/view/SlantedTextView;->getTextSize()F

    move-result p2

    cmpl-float p2, p2, p1

    if-eqz p2, :cond_1c

    .line 38
    iget-object p2, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {p2, p1}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 39
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_1c
    return-void
.end method

.method public final a(Landroid/graphics/Canvas;)V
    .registers 9

    .line 1
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    .line 3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    .line 4
    iget v3, p0, Lnet/nyx/widget/view/SlantedTextView;->k:I

    const/high16 v4, 0x3f800000    # 1.0f

    const/4 v5, 0x0

    if-eqz v3, :cond_a2

    const/4 v6, 0x3

    if-eq v3, v6, :cond_7e

    const/4 v6, 0x5

    if-eq v3, v6, :cond_a2

    const/16 v6, 0x33

    if-eq v3, v6, :cond_7e

    const/16 v6, 0x35

    if-eq v3, v6, :cond_a2

    const/16 v6, 0x50

    if-eq v3, v6, :cond_5e

    const/16 v6, 0x53

    if-eq v3, v6, :cond_5e

    const/16 v6, 0x55

    if-ne v3, v6, :cond_56

    .line 5
    iget-boolean v3, p0, Lnet/nyx/widget/view/SlantedTextView;->l:Z

    if-eqz v3, :cond_3f

    int-to-float v2, v2

    .line 6
    invoke-virtual {v0, v5, v2}, Landroid/graphics/Path;->moveTo(FF)V

    int-to-float v1, v1

    .line 7
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 8
    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->lineTo(FF)V

    goto/16 :goto_c3

    :cond_3f
    int-to-float v2, v2

    .line 9
    invoke-virtual {v0, v5, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 10
    iget v3, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    int-to-float v3, v3

    mul-float v3, v3, v4

    invoke-virtual {v0, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    int-to-float v1, v1

    .line 11
    iget v2, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 12
    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_c3

    .line 13
    :cond_56
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "are you ok?"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 14
    :cond_5e
    iget-boolean v3, p0, Lnet/nyx/widget/view/SlantedTextView;->l:Z

    if-eqz v3, :cond_6b

    int-to-float v1, v1

    int-to-float v2, v2

    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 16
    invoke-virtual {v0, v5, v2}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_c3

    :cond_6b
    int-to-float v3, v1

    int-to-float v2, v2

    .line 17
    invoke-virtual {v0, v3, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 18
    iget v3, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    sub-int/2addr v1, v3

    int-to-float v1, v1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 19
    iget v1, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    int-to-float v1, v1

    invoke-virtual {v0, v5, v1}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_c3

    .line 20
    :cond_7e
    iget-boolean v3, p0, Lnet/nyx/widget/view/SlantedTextView;->l:Z

    if-eqz v3, :cond_8b

    int-to-float v2, v2

    .line 21
    invoke-virtual {v0, v5, v2}, Landroid/graphics/Path;->lineTo(FF)V

    int-to-float v1, v1

    .line 22
    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_c3

    :cond_8b
    int-to-float v3, v1

    .line 23
    invoke-virtual {v0, v3, v5}, Landroid/graphics/Path;->moveTo(FF)V

    int-to-float v3, v2

    .line 24
    invoke-virtual {v0, v5, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 25
    iget v3, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v5, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 26
    iget v2, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    sub-int/2addr v1, v2

    int-to-float v1, v1

    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_c3

    .line 27
    :cond_a2
    iget-boolean v3, p0, Lnet/nyx/widget/view/SlantedTextView;->l:Z

    if-eqz v3, :cond_af

    int-to-float v1, v1

    .line 28
    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->lineTo(FF)V

    int-to-float v2, v2

    .line 29
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_c3

    :cond_af
    int-to-float v1, v1

    int-to-float v3, v2

    .line 30
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 31
    iget v3, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    sub-int/2addr v2, v3

    int-to-float v2, v2

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 32
    iget v1, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    int-to-float v1, v1

    mul-float v1, v1, v4

    invoke-virtual {v0, v1, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 33
    :goto_c3
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 34
    iget-object v1, p0, Lnet/nyx/widget/view/SlantedTextView;->h:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 35
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    return-void
.end method

.method public a()Z
    .registers 2

    .line 40
    iget-boolean v0, p0, Lnet/nyx/widget/view/SlantedTextView;->l:Z

    return v0
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .registers 13

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v0

    iget v1, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    div-int/lit8 v1, v1, 0x2

    sub-int/2addr v0, v1

    .line 2
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    iget v2, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    div-int/lit8 v3, v2, 0x2

    sub-int/2addr v1, v3

    .line 3
    div-int/lit8 v2, v2, 0x2

    .line 4
    iget v3, p0, Lnet/nyx/widget/view/SlantedTextView;->k:I

    const/high16 v4, -0x3dcc0000    # -45.0f

    const/high16 v5, 0x42340000    # 45.0f

    const/4 v6, 0x0

    const/high16 v7, 0x40000000    # 2.0f

    if-eqz v3, :cond_142

    const/4 v8, 0x3

    if-eq v3, v8, :cond_f0

    const/4 v8, 0x5

    if-eq v3, v8, :cond_142

    const/16 v8, 0x33

    if-eq v3, v8, :cond_f0

    const/16 v8, 0x35

    if-eq v3, v8, :cond_142

    const/16 v8, 0x50

    if-eq v3, v8, :cond_9a

    const/16 v8, 0x53

    if-eq v3, v8, :cond_9a

    const/16 v5, 0x55

    if-ne v3, v5, :cond_92

    .line 5
    new-instance v3, Landroid/graphics/Rect;

    add-int v5, v0, v2

    add-int v8, v1, v2

    invoke-direct {v3, v2, v2, v5, v8}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 6
    new-instance v5, Landroid/graphics/RectF;

    invoke-direct {v5, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 7
    iget-object v8, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    iget-object v9, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v8, v9, v6, v10}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;II)F

    move-result v6

    iput v6, v5, Landroid/graphics/RectF;->right:F

    .line 8
    iget-object v6, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v6}, Landroid/text/TextPaint;->descent()F

    move-result v6

    iget-object v8, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v8}, Landroid/text/TextPaint;->ascent()F

    move-result v8

    sub-float/2addr v6, v8

    iput v6, v5, Landroid/graphics/RectF;->bottom:F

    .line 9
    iget v6, v5, Landroid/graphics/RectF;->left:F

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    iget v9, v5, Landroid/graphics/RectF;->right:F

    sub-float/2addr v8, v9

    div-float/2addr v8, v7

    add-float/2addr v6, v8

    iput v6, v5, Landroid/graphics/RectF;->left:F

    .line 10
    iget v6, v5, Landroid/graphics/RectF;->top:F

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    iget v8, v5, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v8

    div-float/2addr v3, v7

    add-float/2addr v6, v3

    iput v6, v5, Landroid/graphics/RectF;->top:F

    .line 11
    iget v3, v5, Landroid/graphics/RectF;->left:F

    .line 12
    iget-object v5, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v5}, Landroid/text/TextPaint;->ascent()F

    move-result v5

    sub-float/2addr v6, v5

    int-to-float v0, v0

    div-float/2addr v0, v7

    int-to-float v2, v2

    add-float/2addr v0, v2

    int-to-float v1, v1

    div-float/2addr v1, v7

    add-float/2addr v1, v2

    goto/16 :goto_198

    .line 13
    :cond_92
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "are you ok?"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 14
    :cond_9a
    new-instance v3, Landroid/graphics/Rect;

    add-int v4, v1, v2

    invoke-direct {v3, v6, v2, v0, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 15
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 16
    iget-object v8, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    iget-object v9, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v8, v9, v6, v10}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;II)F

    move-result v6

    iput v6, v4, Landroid/graphics/RectF;->right:F

    .line 17
    iget-object v6, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v6}, Landroid/text/TextPaint;->descent()F

    move-result v6

    iget-object v8, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v8}, Landroid/text/TextPaint;->ascent()F

    move-result v8

    sub-float/2addr v6, v8

    iput v6, v4, Landroid/graphics/RectF;->bottom:F

    .line 18
    iget v6, v4, Landroid/graphics/RectF;->left:F

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    iget v9, v4, Landroid/graphics/RectF;->right:F

    sub-float/2addr v8, v9

    div-float/2addr v8, v7

    add-float/2addr v6, v8

    iput v6, v4, Landroid/graphics/RectF;->left:F

    .line 19
    iget v6, v4, Landroid/graphics/RectF;->top:F

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    iget v8, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v8

    div-float/2addr v3, v7

    add-float/2addr v6, v3

    iput v6, v4, Landroid/graphics/RectF;->top:F

    .line 20
    iget v3, v4, Landroid/graphics/RectF;->left:F

    .line 21
    iget-object v4, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v4}, Landroid/text/TextPaint;->ascent()F

    move-result v4

    sub-float/2addr v6, v4

    int-to-float v0, v0

    div-float/2addr v0, v7

    int-to-float v1, v1

    div-float/2addr v1, v7

    int-to-float v2, v2

    add-float/2addr v1, v2

    goto/16 :goto_196

    .line 22
    :cond_f0
    new-instance v2, Landroid/graphics/Rect;

    invoke-direct {v2, v6, v6, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 23
    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 24
    iget-object v5, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    iget-object v8, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    invoke-virtual {v8}, Ljava/lang/String;->length()I

    move-result v9

    invoke-virtual {v5, v8, v6, v9}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;II)F

    move-result v5

    iput v5, v3, Landroid/graphics/RectF;->right:F

    .line 25
    iget-object v5, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v5}, Landroid/text/TextPaint;->descent()F

    move-result v5

    iget-object v6, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v6}, Landroid/text/TextPaint;->ascent()F

    move-result v6

    sub-float/2addr v5, v6

    iput v5, v3, Landroid/graphics/RectF;->bottom:F

    .line 26
    iget v5, v3, Landroid/graphics/RectF;->left:F

    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    move-result v6

    int-to-float v6, v6

    iget v8, v3, Landroid/graphics/RectF;->right:F

    sub-float/2addr v6, v8

    div-float/2addr v6, v7

    add-float/2addr v5, v6

    iput v5, v3, Landroid/graphics/RectF;->left:F

    .line 27
    iget v5, v3, Landroid/graphics/RectF;->top:F

    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    iget v6, v3, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v2, v6

    div-float/2addr v2, v7

    add-float/2addr v5, v2

    iput v5, v3, Landroid/graphics/RectF;->top:F

    .line 28
    iget v3, v3, Landroid/graphics/RectF;->left:F

    .line 29
    iget-object v2, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v2}, Landroid/text/TextPaint;->ascent()F

    move-result v2

    sub-float v6, v5, v2

    int-to-float v0, v0

    div-float/2addr v0, v7

    int-to-float v1, v1

    div-float/2addr v1, v7

    goto :goto_198

    .line 30
    :cond_142
    new-instance v3, Landroid/graphics/Rect;

    add-int v4, v0, v2

    invoke-direct {v3, v2, v6, v4, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 31
    new-instance v4, Landroid/graphics/RectF;

    invoke-direct {v4, v3}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 32
    iget-object v8, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    iget-object v9, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    invoke-virtual {v9}, Ljava/lang/String;->length()I

    move-result v10

    invoke-virtual {v8, v9, v6, v10}, Landroid/text/TextPaint;->measureText(Ljava/lang/String;II)F

    move-result v6

    iput v6, v4, Landroid/graphics/RectF;->right:F

    .line 33
    iget-object v6, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v6}, Landroid/text/TextPaint;->descent()F

    move-result v6

    iget-object v8, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v8}, Landroid/text/TextPaint;->ascent()F

    move-result v8

    sub-float/2addr v6, v8

    iput v6, v4, Landroid/graphics/RectF;->bottom:F

    .line 34
    iget v6, v4, Landroid/graphics/RectF;->left:F

    invoke-virtual {v3}, Landroid/graphics/Rect;->width()I

    move-result v8

    int-to-float v8, v8

    iget v9, v4, Landroid/graphics/RectF;->right:F

    sub-float/2addr v8, v9

    div-float/2addr v8, v7

    add-float/2addr v6, v8

    iput v6, v4, Landroid/graphics/RectF;->left:F

    .line 35
    iget v6, v4, Landroid/graphics/RectF;->top:F

    invoke-virtual {v3}, Landroid/graphics/Rect;->height()I

    move-result v3

    int-to-float v3, v3

    iget v8, v4, Landroid/graphics/RectF;->bottom:F

    sub-float/2addr v3, v8

    div-float/2addr v3, v7

    add-float/2addr v6, v3

    iput v6, v4, Landroid/graphics/RectF;->top:F

    .line 36
    iget v3, v4, Landroid/graphics/RectF;->left:F

    .line 37
    iget-object v4, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v4}, Landroid/text/TextPaint;->ascent()F

    move-result v4

    sub-float/2addr v6, v4

    int-to-float v0, v0

    div-float/2addr v0, v7

    int-to-float v2, v2

    add-float/2addr v0, v2

    int-to-float v1, v1

    div-float/2addr v1, v7

    :goto_196
    const/high16 v4, 0x42340000    # 45.0f

    .line 38
    :goto_198
    invoke-virtual {p1, v4, v0, v1}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 39
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    iget-object v1, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {p1, v0, v3, v6, v1}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public getColorBackground()I
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SlantedTextView;->m:I

    return v0
.end method

.method public getGravity()I
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SlantedTextView;->k:I

    return v0
.end method

.method public getText()Ljava/lang/String;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    return-object v0
.end method

.method public getTextColor()I
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getColor()I

    move-result v0

    return v0
.end method

.method public getTextSize()F
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextSize()F

    move-result v0

    return v0
.end method

.method public getTextStyle()Landroid/graphics/Typeface;
    .registers 2

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTypeface()Landroid/graphics/Typeface;

    move-result-object v0

    return-object v0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/SlantedTextView;->a(Landroid/graphics/Canvas;)V

    .line 2
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/SlantedTextView;->b(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public onMeasure(II)V
    .registers 8

    .line 1
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    iget-object v1, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    iget-object v3, p0, Lnet/nyx/widget/view/SlantedTextView;->n:Landroid/graphics/Rect;

    const/4 v4, 0x0

    invoke-virtual {v0, v1, v4, v2, v3}, Landroid/text/TextPaint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->n:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v1

    add-int/2addr v0, v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    add-int/2addr v0, v1

    iput v0, p0, Lnet/nyx/widget/view/SlantedTextView;->o:I

    .line 3
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, -0x80000000

    if-eq v0, v2, :cond_35

    if-eqz v0, :cond_35

    if-eq v0, v1, :cond_30

    const/4 p1, 0x0

    goto :goto_45

    .line 4
    :cond_30
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    goto :goto_45

    .line 5
    :cond_35
    iget-object p1, p0, Lnet/nyx/widget/view/SlantedTextView;->n:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v0

    add-int/2addr p1, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    add-int/2addr p1, v0

    .line 6
    :goto_45
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eq v0, v2, :cond_55

    if-eqz v0, :cond_55

    if-eq v0, v1, :cond_50

    goto :goto_66

    .line 7
    :cond_50
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v4

    goto :goto_66

    .line 8
    :cond_55
    iget-object p2, p0, Lnet/nyx/widget/view/SlantedTextView;->n:Landroid/graphics/Rect;

    invoke-virtual {p2}, Landroid/graphics/Rect;->height()I

    move-result p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v0

    add-int/2addr p2, v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v0

    add-int v4, p2, v0

    .line 9
    :goto_66
    invoke-static {p1, v4}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-static {p1, v4}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public setColorBackground(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/view/SlantedTextView;->getColorBackground()I

    move-result v0

    if-eq v0, p1, :cond_10

    .line 2
    iput p1, p0, Lnet/nyx/widget/view/SlantedTextView;->m:I

    .line 3
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->h:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_10
    return-void
.end method

.method public setGravity(I)V
    .registers 3

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SlantedTextView;->k:I

    if-eq v0, p1, :cond_19

    .line 2
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Configuration;->getLayoutDirection()I

    move-result v0

    invoke-static {p1, v0}, Landroid/view/Gravity;->getAbsoluteGravity(II)I

    move-result p1

    iput p1, p0, Lnet/nyx/widget/view/SlantedTextView;->k:I

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_19
    return-void
.end method

.method public setText(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/SlantedTextView;->setText(Ljava/lang/String;)V

    return-void
.end method

.method public setText(Ljava/lang/String;)V
    .registers 3

    .line 2
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_15

    invoke-virtual {p0}, Lnet/nyx/widget/view/SlantedTextView;->getText()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 3
    iput-object p1, p0, Lnet/nyx/widget/view/SlantedTextView;->j:Ljava/lang/String;

    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_15
    return-void
.end method

.method public setTextColor(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/view/SlantedTextView;->getTextColor()I

    move-result v0

    if-eq v0, p1, :cond_e

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_e
    return-void
.end method

.method public setTextSize(F)V
    .registers 3

    const/4 v0, 0x2

    .line 1
    invoke-virtual {p0, v0, p1}, Lnet/nyx/widget/view/SlantedTextView;->a(IF)V

    return-void
.end method

.method public setTextStyle(Landroid/graphics/Typeface;)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/view/SlantedTextView;->getTextStyle()Landroid/graphics/Typeface;

    move-result-object v0

    if-eq v0, p1, :cond_e

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/view/SlantedTextView;->i:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_e
    return-void
.end method

.method public setTriangle(Z)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/view/SlantedTextView;->a()Z

    move-result v0

    if-eq v0, p1, :cond_b

    .line 2
    iput-boolean p1, p0, Lnet/nyx/widget/view/SlantedTextView;->l:Z

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_b
    return-void
.end method
