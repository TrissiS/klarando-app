.class public Lc/a/a/a/i0/d;
.super Ljava/lang/Object;
.source "TextAppearance.java"


# instance fields
.field public final a:Landroid/content/res/ColorStateList;

.field public final b:Landroid/content/res/ColorStateList;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:I

.field public final f:F

.field public final g:F

.field public final h:F

.field public final i:Z

.field public final j:F

.field public k:F

.field public final l:I

.field public m:Z

.field public n:Landroid/graphics/Typeface;


# direct methods
.method public constructor <init>(Landroid/content/Context;I)V
    .registers 8

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lc/a/a/a/i0/d;->m:Z

    .line 3
    sget-object v1, Lc/a/a/a/l;->TextAppearance:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 4
    sget v2, Lc/a/a/a/l;->TextAppearance_android_textSize:I

    const/4 v3, 0x0

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v2

    iput v2, p0, Lc/a/a/a/i0/d;->k:F

    .line 5
    sget v2, Lc/a/a/a/l;->TextAppearance_android_textColor:I

    .line 6
    invoke-static {p1, v1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lc/a/a/a/i0/d;->a:Landroid/content/res/ColorStateList;

    .line 7
    sget v2, Lc/a/a/a/l;->TextAppearance_android_textColorHint:I

    .line 8
    invoke-static {p1, v1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 9
    sget v2, Lc/a/a/a/l;->TextAppearance_android_textColorLink:I

    .line 10
    invoke-static {p1, v1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    .line 11
    sget v2, Lc/a/a/a/l;->TextAppearance_android_textStyle:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lc/a/a/a/i0/d;->d:I

    .line 12
    sget v2, Lc/a/a/a/l;->TextAppearance_android_typeface:I

    const/4 v4, 0x1

    invoke-virtual {v1, v2, v4}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result v2

    iput v2, p0, Lc/a/a/a/i0/d;->e:I

    .line 13
    sget v2, Lc/a/a/a/l;->TextAppearance_fontFamily:I

    sget v4, Lc/a/a/a/l;->TextAppearance_android_fontFamily:I

    .line 14
    invoke-static {v1, v2, v4}, Lc/a/a/a/i0/c;->a(Landroid/content/res/TypedArray;II)I

    move-result v2

    .line 15
    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v4

    iput v4, p0, Lc/a/a/a/i0/d;->l:I

    .line 16
    invoke-virtual {v1, v2}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, p0, Lc/a/a/a/i0/d;->c:Ljava/lang/String;

    .line 17
    sget v2, Lc/a/a/a/l;->TextAppearance_textAllCaps:I

    invoke-virtual {v1, v2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 18
    sget v2, Lc/a/a/a/l;->TextAppearance_android_shadowColor:I

    .line 19
    invoke-static {p1, v1, v2}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    iput-object v2, p0, Lc/a/a/a/i0/d;->b:Landroid/content/res/ColorStateList;

    .line 20
    sget v2, Lc/a/a/a/l;->TextAppearance_android_shadowDx:I

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p0, Lc/a/a/a/i0/d;->f:F

    .line 21
    sget v2, Lc/a/a/a/l;->TextAppearance_android_shadowDy:I

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p0, Lc/a/a/a/i0/d;->g:F

    .line 22
    sget v2, Lc/a/a/a/l;->TextAppearance_android_shadowRadius:I

    invoke-virtual {v1, v2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v2

    iput v2, p0, Lc/a/a/a/i0/d;->h:F

    .line 23
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 24
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_94

    .line 25
    sget-object v0, Lc/a/a/a/l;->MaterialTextAppearance:[I

    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(I[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 26
    sget p2, Lc/a/a/a/l;->MaterialTextAppearance_android_letterSpacing:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p2

    iput-boolean p2, p0, Lc/a/a/a/i0/d;->i:Z

    .line 27
    sget p2, Lc/a/a/a/l;->MaterialTextAppearance_android_letterSpacing:I

    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    iput p2, p0, Lc/a/a/a/i0/d;->j:F

    .line 28
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_98

    .line 29
    :cond_94
    iput-boolean v0, p0, Lc/a/a/a/i0/d;->i:Z

    .line 30
    iput v3, p0, Lc/a/a/a/i0/d;->j:F

    :goto_98
    return-void
.end method

.method public static synthetic a(Lc/a/a/a/i0/d;)Landroid/graphics/Typeface;
    .registers 1

    .line 1
    iget-object p0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    return-object p0
.end method

.method public static synthetic a(Lc/a/a/a/i0/d;Landroid/graphics/Typeface;)Landroid/graphics/Typeface;
    .registers 2

    .line 2
    iput-object p1, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    return-object p1
.end method

.method public static synthetic a(Lc/a/a/a/i0/d;Z)Z
    .registers 2

    .line 3
    iput-boolean p1, p0, Lc/a/a/a/i0/d;->m:Z

    return p1
.end method


# virtual methods
.method public a(Landroid/content/Context;)Landroid/graphics/Typeface;
    .registers 4

    .line 4
    iget-boolean v0, p0, Lc/a/a/a/i0/d;->m:Z

    if-eqz v0, :cond_7

    .line 5
    iget-object p1, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    return-object p1

    .line 6
    :cond_7
    invoke-virtual {p1}, Landroid/content/Context;->isRestricted()Z

    move-result v0

    if-nez v0, :cond_39

    .line 7
    :try_start_d
    iget v0, p0, Lc/a/a/a/i0/d;->l:I

    invoke-static {p1, v0}, Lb/h/e/c/f;->b(Landroid/content/Context;I)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    if-eqz p1, :cond_39

    .line 8
    iget v0, p0, Lc/a/a/a/i0/d;->d:I

    invoke-static {p1, v0}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;
    :try_end_1f
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_d .. :try_end_1f} :catch_39
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_d .. :try_end_1f} :catch_39
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_1f} :catch_20

    goto :goto_39

    :catch_20
    move-exception p1

    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "Error loading font "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lc/a/a/a/i0/d;->c:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TextAppearance"

    invoke-static {v1, v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 10
    :catch_39
    :cond_39
    :goto_39
    invoke-virtual {p0}, Lc/a/a/a/i0/d;->a()V

    const/4 p1, 0x1

    .line 11
    iput-boolean p1, p0, Lc/a/a/a/i0/d;->m:Z

    .line 12
    iget-object p1, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    return-object p1
.end method

.method public final a()V
    .registers 3

    .line 28
    iget-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    if-nez v0, :cond_10

    iget-object v0, p0, Lc/a/a/a/i0/d;->c:Ljava/lang/String;

    if-eqz v0, :cond_10

    .line 29
    iget v1, p0, Lc/a/a/a/i0/d;->d:I

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    .line 30
    :cond_10
    iget-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    if-nez v0, :cond_3c

    .line 31
    iget v0, p0, Lc/a/a/a/i0/d;->e:I

    const/4 v1, 0x1

    if-eq v0, v1, :cond_2e

    const/4 v1, 0x2

    if-eq v0, v1, :cond_29

    const/4 v1, 0x3

    if-eq v0, v1, :cond_24

    .line 32
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    iput-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    goto :goto_32

    .line 33
    :cond_24
    sget-object v0, Landroid/graphics/Typeface;->MONOSPACE:Landroid/graphics/Typeface;

    iput-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    goto :goto_32

    .line 34
    :cond_29
    sget-object v0, Landroid/graphics/Typeface;->SERIF:Landroid/graphics/Typeface;

    iput-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    goto :goto_32

    .line 35
    :cond_2e
    sget-object v0, Landroid/graphics/Typeface;->SANS_SERIF:Landroid/graphics/Typeface;

    iput-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    .line 36
    :goto_32
    iget-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    iget v1, p0, Lc/a/a/a/i0/d;->d:I

    invoke-static {v0, v1}, Landroid/graphics/Typeface;->create(Landroid/graphics/Typeface;I)Landroid/graphics/Typeface;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    :cond_3c
    return-void
.end method

.method public a(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V
    .registers 5

    .line 26
    invoke-virtual {p0}, Lc/a/a/a/i0/d;->b()Landroid/graphics/Typeface;

    move-result-object v0

    invoke-virtual {p0, p2, v0}, Lc/a/a/a/i0/d;->a(Landroid/text/TextPaint;Landroid/graphics/Typeface;)V

    .line 27
    new-instance v0, Lc/a/a/a/i0/d$b;

    invoke-direct {v0, p0, p2, p3}, Lc/a/a/a/i0/d$b;-><init>(Lc/a/a/a/i0/d;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V

    invoke-virtual {p0, p1, v0}, Lc/a/a/a/i0/d;->a(Landroid/content/Context;Lc/a/a/a/i0/f;)V

    return-void
.end method

.method public a(Landroid/content/Context;Lc/a/a/a/i0/f;)V
    .registers 7

    .line 13
    invoke-virtual {p0, p1}, Lc/a/a/a/i0/d;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_a

    .line 14
    invoke-virtual {p0, p1}, Lc/a/a/a/i0/d;->a(Landroid/content/Context;)Landroid/graphics/Typeface;

    goto :goto_d

    .line 15
    :cond_a
    invoke-virtual {p0}, Lc/a/a/a/i0/d;->a()V

    .line 16
    :goto_d
    iget v0, p0, Lc/a/a/a/i0/d;->l:I

    const/4 v1, 0x1

    if-nez v0, :cond_14

    .line 17
    iput-boolean v1, p0, Lc/a/a/a/i0/d;->m:Z

    .line 18
    :cond_14
    iget-boolean v0, p0, Lc/a/a/a/i0/d;->m:Z

    if-eqz v0, :cond_1e

    .line 19
    iget-object p1, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    invoke-virtual {p2, p1, v1}, Lc/a/a/a/i0/f;->a(Landroid/graphics/Typeface;Z)V

    return-void

    .line 20
    :cond_1e
    :try_start_1e
    iget v0, p0, Lc/a/a/a/i0/d;->l:I

    new-instance v2, Lc/a/a/a/i0/d$a;

    invoke-direct {v2, p0, p2}, Lc/a/a/a/i0/d$a;-><init>(Lc/a/a/a/i0/d;Lc/a/a/a/i0/f;)V

    const/4 v3, 0x0

    invoke-static {p1, v0, v2, v3}, Lb/h/e/c/f;->a(Landroid/content/Context;ILb/h/e/c/f$a;Landroid/os/Handler;)V
    :try_end_29
    .catch Landroid/content/res/Resources$NotFoundException; {:try_start_1e .. :try_end_29} :catch_4a
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_29} :catch_2a

    goto :goto_4f

    :catch_2a
    move-exception p1

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Error loading font "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Lc/a/a/a/i0/d;->c:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "TextAppearance"

    invoke-static {v2, v0, p1}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 22
    iput-boolean v1, p0, Lc/a/a/a/i0/d;->m:Z

    const/4 p1, -0x3

    .line 23
    invoke-virtual {p2, p1}, Lc/a/a/a/i0/f;->a(I)V

    goto :goto_4f

    .line 24
    :catch_4a
    iput-boolean v1, p0, Lc/a/a/a/i0/d;->m:Z

    .line 25
    invoke-virtual {p2, v1}, Lc/a/a/a/i0/f;->a(I)V

    :goto_4f
    return-void
.end method

.method public a(Landroid/text/TextPaint;Landroid/graphics/Typeface;)V
    .registers 4

    .line 37
    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 38
    iget v0, p0, Lc/a/a/a/i0/d;->d:I

    invoke-virtual {p2}, Landroid/graphics/Typeface;->getStyle()I

    move-result p2

    not-int p2, p2

    and-int/2addr p2, v0

    and-int/lit8 v0, p2, 0x1

    if-eqz v0, :cond_11

    const/4 v0, 0x1

    goto :goto_12

    :cond_11
    const/4 v0, 0x0

    .line 39
    :goto_12
    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setFakeBoldText(Z)V

    and-int/lit8 p2, p2, 0x2

    if-eqz p2, :cond_1c

    const/high16 p2, -0x41800000    # -0.25f

    goto :goto_1d

    :cond_1c
    const/4 p2, 0x0

    .line 40
    :goto_1d
    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTextSkewX(F)V

    .line 41
    iget p2, p0, Lc/a/a/a/i0/d;->k:F

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 42
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p2, v0, :cond_34

    .line 43
    iget-boolean p2, p0, Lc/a/a/a/i0/d;->i:Z

    if-eqz p2, :cond_34

    .line 44
    iget p2, p0, Lc/a/a/a/i0/d;->j:F

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    :cond_34
    return-void
.end method

.method public b()Landroid/graphics/Typeface;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/i0/d;->a()V

    .line 2
    iget-object v0, p0, Lc/a/a/a/i0/d;->n:Landroid/graphics/Typeface;

    return-object v0
.end method

.method public b(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V
    .registers 8

    .line 3
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/i0/d;->c(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V

    .line 4
    iget-object p1, p0, Lc/a/a/a/i0/d;->a:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_12

    iget-object p3, p2, Landroid/text/TextPaint;->drawableState:[I

    .line 5
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {p1, p3, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    goto :goto_14

    :cond_12
    const/high16 p1, -0x1000000

    .line 6
    :goto_14
    invoke-virtual {p2, p1}, Landroid/text/TextPaint;->setColor(I)V

    .line 7
    iget p1, p0, Lc/a/a/a/i0/d;->h:F

    iget p3, p0, Lc/a/a/a/i0/d;->f:F

    iget v0, p0, Lc/a/a/a/i0/d;->g:F

    iget-object v1, p0, Lc/a/a/a/i0/d;->b:Landroid/content/res/ColorStateList;

    if-eqz v1, :cond_2c

    iget-object v2, p2, Landroid/text/TextPaint;->drawableState:[I

    .line 8
    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v3

    invoke-virtual {v1, v2, v3}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v1

    goto :goto_2d

    :cond_2c
    const/4 v1, 0x0

    .line 9
    :goto_2d
    invoke-virtual {p2, p1, p3, v0, v1}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    return-void
.end method

.method public final b(Landroid/content/Context;)Z
    .registers 4

    .line 10
    invoke-static {}, Lc/a/a/a/i0/e;->a()Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    .line 11
    :cond_8
    iget v0, p0, Lc/a/a/a/i0/d;->l:I

    if-eqz v0, :cond_11

    .line 12
    invoke-static {p1, v0}, Lb/h/e/c/f;->a(Landroid/content/Context;I)Landroid/graphics/Typeface;

    move-result-object p1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    if-eqz p1, :cond_15

    goto :goto_16

    :cond_15
    const/4 v1, 0x0

    :goto_16
    return v1
.end method

.method public c(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V
    .registers 5

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/i0/d;->b(Landroid/content/Context;)Z

    move-result v0

    if-eqz v0, :cond_e

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/i0/d;->a(Landroid/content/Context;)Landroid/graphics/Typeface;

    move-result-object p1

    invoke-virtual {p0, p2, p1}, Lc/a/a/a/i0/d;->a(Landroid/text/TextPaint;Landroid/graphics/Typeface;)V

    goto :goto_11

    .line 3
    :cond_e
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/i0/d;->a(Landroid/content/Context;Landroid/text/TextPaint;Lc/a/a/a/i0/f;)V

    :goto_11
    return-void
.end method
