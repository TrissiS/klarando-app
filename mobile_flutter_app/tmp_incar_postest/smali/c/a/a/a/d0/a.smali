.class public final Lc/a/a/a/d0/a;
.super Ljava/lang/Object;
.source "CollapsingTextHelper.java"


# static fields
.field public static final j0:Z

.field public static final k0:Landroid/graphics/Paint;


# instance fields
.field public A:Lc/a/a/a/i0/a;

.field public B:Ljava/lang/CharSequence;

.field public C:Ljava/lang/CharSequence;

.field public D:Z

.field public E:Z

.field public F:Z

.field public G:Landroid/graphics/Bitmap;

.field public H:Landroid/graphics/Paint;

.field public I:F

.field public J:F

.field public K:[I

.field public L:Z

.field public final M:Landroid/text/TextPaint;

.field public final N:Landroid/text/TextPaint;

.field public O:Landroid/animation/TimeInterpolator;

.field public P:Landroid/animation/TimeInterpolator;

.field public Q:F

.field public R:F

.field public S:F

.field public T:Landroid/content/res/ColorStateList;

.field public U:F

.field public V:F

.field public W:F

.field public X:Landroid/content/res/ColorStateList;

.field public Y:F

.field public Z:F

.field public final a:Landroid/view/View;

.field public a0:Landroid/text/StaticLayout;

.field public b:Z

.field public b0:F

.field public c:F

.field public c0:F

.field public d:Z

.field public d0:F

.field public e:F

.field public e0:Ljava/lang/CharSequence;

.field public f:F

.field public f0:I

.field public g:I

.field public g0:F

.field public final h:Landroid/graphics/Rect;

.field public h0:F

.field public final i:Landroid/graphics/Rect;

.field public i0:I

.field public final j:Landroid/graphics/RectF;

.field public k:I

.field public l:I

.field public m:F

.field public n:F

.field public o:Landroid/content/res/ColorStateList;

.field public p:Landroid/content/res/ColorStateList;

.field public q:F

.field public r:F

.field public s:F

.field public t:F

.field public u:F

.field public v:F

.field public w:Landroid/graphics/Typeface;

.field public x:Landroid/graphics/Typeface;

.field public y:Landroid/graphics/Typeface;

.field public z:Lc/a/a/a/i0/a;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x12

    if-ge v0, v2, :cond_9

    const/4 v0, 0x1

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    sput-boolean v0, Lc/a/a/a/d0/a;->j0:Z

    const/4 v0, 0x0

    .line 2
    sput-object v0, Lc/a/a/a/d0/a;->k0:Landroid/graphics/Paint;

    if-eqz v0, :cond_1c

    .line 3
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 4
    sget-object v0, Lc/a/a/a/d0/a;->k0:Landroid/graphics/Paint;

    const v1, -0xff01

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    :cond_1c
    return-void
.end method

.method public constructor <init>(Landroid/view/View;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/16 v0, 0x10

    .line 2
    iput v0, p0, Lc/a/a/a/d0/a;->k:I

    .line 3
    iput v0, p0, Lc/a/a/a/d0/a;->l:I

    const/high16 v0, 0x41700000    # 15.0f

    .line 4
    iput v0, p0, Lc/a/a/a/d0/a;->m:F

    .line 5
    iput v0, p0, Lc/a/a/a/d0/a;->n:F

    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lc/a/a/a/d0/a;->E:Z

    .line 7
    iput v0, p0, Lc/a/a/a/d0/a;->f0:I

    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lc/a/a/a/d0/a;->g0:F

    const/high16 v0, 0x3f800000    # 1.0f

    .line 9
    iput v0, p0, Lc/a/a/a/d0/a;->h0:F

    .line 10
    sget v0, Lc/a/a/a/d0/i;->n:I

    iput v0, p0, Lc/a/a/a/d0/a;->i0:I

    .line 11
    iput-object p1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    .line 12
    new-instance p1, Landroid/text/TextPaint;

    const/16 v0, 0x81

    invoke-direct {p1, v0}, Landroid/text/TextPaint;-><init>(I)V

    iput-object p1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    .line 13
    new-instance p1, Landroid/text/TextPaint;

    iget-object v0, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-direct {p1, v0}, Landroid/text/TextPaint;-><init>(Landroid/graphics/Paint;)V

    iput-object p1, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    .line 14
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    .line 15
    new-instance p1, Landroid/graphics/Rect;

    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    iput-object p1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    .line 16
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lc/a/a/a/d0/a;->j:Landroid/graphics/RectF;

    .line 17
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->c()F

    move-result p1

    iput p1, p0, Lc/a/a/a/d0/a;->f:F

    return-void
.end method

.method public static a(FFFLandroid/animation/TimeInterpolator;)F
    .registers 4

    if-eqz p3, :cond_6

    .line 168
    invoke-interface {p3, p2}, Landroid/animation/TimeInterpolator;->getInterpolation(F)F

    move-result p2

    .line 169
    :cond_6
    invoke-static {p0, p1, p2}, Lc/a/a/a/m/a;->a(FFF)F

    move-result p0

    return p0
.end method

.method public static a(IIF)I
    .registers 8

    const/high16 v0, 0x3f800000    # 1.0f

    sub-float/2addr v0, p2

    .line 163
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    int-to-float v1, v1

    mul-float v1, v1, v0

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, p2

    add-float/2addr v1, v2

    .line 164
    invoke-static {p0}, Landroid/graphics/Color;->red(I)I

    move-result v2

    int-to-float v2, v2

    mul-float v2, v2, v0

    invoke-static {p1}, Landroid/graphics/Color;->red(I)I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, p2

    add-float/2addr v2, v3

    .line 165
    invoke-static {p0}, Landroid/graphics/Color;->green(I)I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v0

    invoke-static {p1}, Landroid/graphics/Color;->green(I)I

    move-result v4

    int-to-float v4, v4

    mul-float v4, v4, p2

    add-float/2addr v3, v4

    .line 166
    invoke-static {p0}, Landroid/graphics/Color;->blue(I)I

    move-result p0

    int-to-float p0, p0

    mul-float p0, p0, v0

    invoke-static {p1}, Landroid/graphics/Color;->blue(I)I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, p2

    add-float/2addr p0, p1

    float-to-int p1, v1

    float-to-int p2, v2

    float-to-int v0, v3

    float-to-int p0, p0

    .line 167
    invoke-static {p1, p2, v0, p0}, Landroid/graphics/Color;->argb(IIII)I

    move-result p0

    return p0
.end method

.method public static a(FF)Z
    .registers 2

    sub-float/2addr p0, p1

    .line 162
    invoke-static {p0}, Ljava/lang/Math;->abs(F)F

    move-result p0

    const p1, 0x3a83126f    # 0.001f

    cmpg-float p0, p0, p1

    if-gez p0, :cond_e

    const/4 p0, 0x1

    goto :goto_f

    :cond_e
    const/4 p0, 0x0

    :goto_f
    return p0
.end method

.method public static a(Landroid/graphics/Rect;IIII)Z
    .registers 6

    .line 170
    iget v0, p0, Landroid/graphics/Rect;->left:I

    if-ne v0, p1, :cond_12

    iget p1, p0, Landroid/graphics/Rect;->top:I

    if-ne p1, p2, :cond_12

    iget p1, p0, Landroid/graphics/Rect;->right:I

    if-ne p1, p3, :cond_12

    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    if-ne p0, p4, :cond_12

    const/4 p0, 0x1

    goto :goto_13

    :cond_12
    const/4 p0, 0x0

    :goto_13
    return p0
.end method


# virtual methods
.method public A()V
    .registers 2

    const/4 v0, 0x0

    .line 1
    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->b(Z)V

    return-void
.end method

.method public final B()Z
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/d0/a;->f0:I

    const/4 v1, 0x1

    if-le v0, v1, :cond_12

    iget-boolean v0, p0, Lc/a/a/a/d0/a;->D:Z

    if-eqz v0, :cond_d

    iget-boolean v0, p0, Lc/a/a/a/d0/a;->d:Z

    if-eqz v0, :cond_12

    :cond_d
    iget-boolean v0, p0, Lc/a/a/a/d0/a;->F:Z

    if-nez v0, :cond_12

    goto :goto_13

    :cond_12
    const/4 v1, 0x0

    :goto_13
    return v1
.end method

.method public a()F
    .registers 5

    .line 16
    iget-object v0, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 17
    :cond_6
    iget-object v0, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->a(Landroid/text/TextPaint;)V

    .line 18
    iget-object v0, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    iget-object v1, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    invoke-virtual {v0, v1, v2, v3}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v0

    return v0
.end method

.method public final a(F)F
    .registers 6

    .line 45
    iget v0, p0, Lc/a/a/a/d0/a;->f:F

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    cmpg-float v3, p1, v0

    if-gtz v3, :cond_10

    .line 46
    iget v3, p0, Lc/a/a/a/d0/a;->e:F

    invoke-static {v2, v1, v3, v0, p1}, Lc/a/a/a/m/a;->a(FFFFF)F

    move-result p1

    return p1

    .line 47
    :cond_10
    invoke-static {v1, v2, v0, v2, p1}, Lc/a/a/a/m/a;->a(FFFFF)F

    move-result p1

    return p1
.end method

.method public final a(II)F
    .registers 5

    const/16 v0, 0x11

    if-eq p2, v0, :cond_40

    and-int/lit8 v0, p2, 0x7

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a

    goto :goto_40

    :cond_a
    const p1, 0x800005

    and-int v0, p2, p1

    if-eq v0, p1, :cond_2b

    const/4 p1, 0x5

    and-int/2addr p2, p1

    if-ne p2, p1, :cond_16

    goto :goto_2b

    .line 13
    :cond_16
    iget-boolean p1, p0, Lc/a/a/a/d0/a;->D:Z

    if-eqz p1, :cond_25

    iget-object p1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    int-to-float p1, p1

    invoke-virtual {p0}, Lc/a/a/a/d0/a;->a()F

    move-result p2

    sub-float/2addr p1, p2

    goto :goto_2a

    :cond_25
    iget-object p1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    :goto_2a
    return p1

    .line 14
    :cond_2b
    :goto_2b
    iget-boolean p1, p0, Lc/a/a/a/d0/a;->D:Z

    if-eqz p1, :cond_35

    iget-object p1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    goto :goto_3f

    :cond_35
    iget-object p1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    int-to-float p1, p1

    invoke-virtual {p0}, Lc/a/a/a/d0/a;->a()F

    move-result p2

    sub-float/2addr p1, p2

    :goto_3f
    return p1

    :cond_40
    :goto_40
    int-to-float p1, p1

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    .line 15
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->a()F

    move-result v0

    div-float/2addr v0, p2

    sub-float/2addr p1, v0

    return p1
.end method

.method public final a(Landroid/content/res/ColorStateList;)I
    .registers 4

    const/4 v0, 0x0

    if-nez p1, :cond_4

    return v0

    .line 48
    :cond_4
    iget-object v1, p0, Lc/a/a/a/d0/a;->K:[I

    if-eqz v1, :cond_d

    .line 49
    invoke-virtual {p1, v1, v0}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p1

    return p1

    .line 50
    :cond_d
    invoke-virtual {p1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    return p1
.end method

.method public final a(IFZ)Landroid/text/StaticLayout;
    .registers 6

    .line 150
    :try_start_0
    iget-object v0, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    iget-object v1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    float-to-int p2, p2

    .line 151
    invoke-static {v0, v1, p2}, Lc/a/a/a/d0/i;->a(Ljava/lang/CharSequence;Landroid/text/TextPaint;I)Lc/a/a/a/d0/i;

    move-result-object p2

    sget-object v0, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 152
    invoke-virtual {p2, v0}, Lc/a/a/a/d0/i;->a(Landroid/text/TextUtils$TruncateAt;)Lc/a/a/a/d0/i;

    .line 153
    invoke-virtual {p2, p3}, Lc/a/a/a/d0/i;->b(Z)Lc/a/a/a/d0/i;

    sget-object p3, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 154
    invoke-virtual {p2, p3}, Lc/a/a/a/d0/i;->a(Landroid/text/Layout$Alignment;)Lc/a/a/a/d0/i;

    const/4 p3, 0x0

    .line 155
    invoke-virtual {p2, p3}, Lc/a/a/a/d0/i;->a(Z)Lc/a/a/a/d0/i;

    .line 156
    invoke-virtual {p2, p1}, Lc/a/a/a/d0/i;->b(I)Lc/a/a/a/d0/i;

    iget p1, p0, Lc/a/a/a/d0/a;->g0:F

    iget p3, p0, Lc/a/a/a/d0/a;->h0:F

    .line 157
    invoke-virtual {p2, p1, p3}, Lc/a/a/a/d0/i;->a(FF)Lc/a/a/a/d0/i;

    iget p1, p0, Lc/a/a/a/d0/a;->i0:I

    .line 158
    invoke-virtual {p2, p1}, Lc/a/a/a/d0/i;->a(I)Lc/a/a/a/d0/i;

    .line 159
    invoke-virtual {p2}, Lc/a/a/a/d0/i;->a()Landroid/text/StaticLayout;

    move-result-object p1
    :try_end_2d
    .catch Lc/a/a/a/d0/i$a; {:try_start_0 .. :try_end_2d} :catch_2e

    goto :goto_3d

    :catch_2e
    move-exception p1

    .line 160
    invoke-virtual {p1}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p2

    const-string p3, "CollapsingTextHelper"

    invoke-static {p3, p2, p1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    const/4 p1, 0x0

    .line 161
    :goto_3d
    invoke-static {p1}, Lb/h/l/h;->a(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p1, Landroid/text/StaticLayout;

    return-object p1
.end method

.method public final a(FZ)V
    .registers 11

    .line 124
    iget-object v0, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    if-nez v0, :cond_5

    return-void

    .line 125
    :cond_5
    iget-object v0, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    int-to-float v0, v0

    .line 126
    iget-object v1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-float v1, v1

    .line 127
    iget v2, p0, Lc/a/a/a/d0/a;->n:F

    invoke-static {p1, v2}, Lc/a/a/a/d0/a;->a(FF)Z

    move-result v2

    const/high16 v3, 0x3f800000    # 1.0f

    const/4 v4, 0x0

    const/4 v5, 0x1

    if-eqz v2, :cond_2f

    .line 128
    iget p1, p0, Lc/a/a/a/d0/a;->n:F

    .line 129
    iput v3, p0, Lc/a/a/a/d0/a;->I:F

    .line 130
    iget-object p2, p0, Lc/a/a/a/d0/a;->y:Landroid/graphics/Typeface;

    iget-object v1, p0, Lc/a/a/a/d0/a;->w:Landroid/graphics/Typeface;

    if-eq p2, v1, :cond_2d

    .line 131
    iput-object v1, p0, Lc/a/a/a/d0/a;->y:Landroid/graphics/Typeface;

    const/4 p2, 0x1

    goto :goto_64

    :cond_2d
    const/4 p2, 0x0

    goto :goto_64

    .line 132
    :cond_2f
    iget v2, p0, Lc/a/a/a/d0/a;->m:F

    .line 133
    iget-object v6, p0, Lc/a/a/a/d0/a;->y:Landroid/graphics/Typeface;

    iget-object v7, p0, Lc/a/a/a/d0/a;->x:Landroid/graphics/Typeface;

    if-eq v6, v7, :cond_3b

    .line 134
    iput-object v7, p0, Lc/a/a/a/d0/a;->y:Landroid/graphics/Typeface;

    const/4 v6, 0x1

    goto :goto_3c

    :cond_3b
    const/4 v6, 0x0

    .line 135
    :goto_3c
    iget v7, p0, Lc/a/a/a/d0/a;->m:F

    invoke-static {p1, v7}, Lc/a/a/a/d0/a;->a(FF)Z

    move-result v7

    if-eqz v7, :cond_47

    .line 136
    iput v3, p0, Lc/a/a/a/d0/a;->I:F

    goto :goto_4c

    .line 137
    :cond_47
    iget v7, p0, Lc/a/a/a/d0/a;->m:F

    div-float/2addr p1, v7

    iput p1, p0, Lc/a/a/a/d0/a;->I:F

    .line 138
    :goto_4c
    iget p1, p0, Lc/a/a/a/d0/a;->n:F

    iget v7, p0, Lc/a/a/a/d0/a;->m:F

    div-float/2addr p1, v7

    mul-float v7, v1, p1

    if-eqz p2, :cond_59

    :cond_55
    move v0, v1

    :goto_56
    move p1, v2

    move p2, v6

    goto :goto_64

    :cond_59
    cmpl-float p2, v7, v0

    if-lez p2, :cond_55

    div-float/2addr v0, p1

    .line 139
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result p1

    move v0, p1

    goto :goto_56

    :goto_64
    const/4 v1, 0x0

    cmpl-float v1, v0, v1

    if-lez v1, :cond_7d

    .line 140
    iget v1, p0, Lc/a/a/a/d0/a;->J:F

    cmpl-float v1, v1, p1

    if-nez v1, :cond_78

    iget-boolean v1, p0, Lc/a/a/a/d0/a;->L:Z

    if-nez v1, :cond_78

    if-eqz p2, :cond_76

    goto :goto_78

    :cond_76
    const/4 p2, 0x0

    goto :goto_79

    :cond_78
    :goto_78
    const/4 p2, 0x1

    .line 141
    :goto_79
    iput p1, p0, Lc/a/a/a/d0/a;->J:F

    .line 142
    iput-boolean v4, p0, Lc/a/a/a/d0/a;->L:Z

    .line 143
    :cond_7d
    iget-object p1, p0, Lc/a/a/a/d0/a;->C:Ljava/lang/CharSequence;

    if-eqz p1, :cond_83

    if-eqz p2, :cond_bb

    .line 144
    :cond_83
    iget-object p1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    iget p2, p0, Lc/a/a/a/d0/a;->J:F

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 145
    iget-object p1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    iget-object p2, p0, Lc/a/a/a/d0/a;->y:Landroid/graphics/Typeface;

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 146
    iget-object p1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    iget p2, p0, Lc/a/a/a/d0/a;->I:F

    cmpl-float p2, p2, v3

    if-eqz p2, :cond_9a

    const/4 v4, 0x1

    :cond_9a
    invoke-virtual {p1, v4}, Landroid/text/TextPaint;->setLinearText(Z)V

    .line 147
    iget-object p1, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->a(Ljava/lang/CharSequence;)Z

    move-result p1

    iput-boolean p1, p0, Lc/a/a/a/d0/a;->D:Z

    .line 148
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->B()Z

    move-result p1

    if-eqz p1, :cond_ad

    iget v5, p0, Lc/a/a/a/d0/a;->f0:I

    :cond_ad
    iget-boolean p1, p0, Lc/a/a/a/d0/a;->D:Z

    invoke-virtual {p0, v5, v0, p1}, Lc/a/a/a/d0/a;->a(IFZ)Landroid/text/StaticLayout;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    .line 149
    invoke-virtual {p1}, Landroid/text/StaticLayout;->getText()Ljava/lang/CharSequence;

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/d0/a;->C:Ljava/lang/CharSequence;

    :cond_bb
    return-void
.end method

.method public a(I)V
    .registers 5

    .line 23
    new-instance v0, Lc/a/a/a/i0/d;

    iget-object v1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lc/a/a/a/i0/d;-><init>(Landroid/content/Context;I)V

    .line 24
    iget-object p1, v0, Lc/a/a/a/i0/d;->a:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_11

    .line 25
    iput-object p1, p0, Lc/a/a/a/d0/a;->p:Landroid/content/res/ColorStateList;

    .line 26
    :cond_11
    iget p1, v0, Lc/a/a/a/i0/d;->k:F

    const/4 v1, 0x0

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_1a

    .line 27
    iput p1, p0, Lc/a/a/a/d0/a;->n:F

    .line 28
    :cond_1a
    iget-object p1, v0, Lc/a/a/a/i0/d;->b:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_20

    .line 29
    iput-object p1, p0, Lc/a/a/a/d0/a;->T:Landroid/content/res/ColorStateList;

    .line 30
    :cond_20
    iget p1, v0, Lc/a/a/a/i0/d;->f:F

    iput p1, p0, Lc/a/a/a/d0/a;->R:F

    .line 31
    iget p1, v0, Lc/a/a/a/i0/d;->g:F

    iput p1, p0, Lc/a/a/a/d0/a;->S:F

    .line 32
    iget p1, v0, Lc/a/a/a/i0/d;->h:F

    iput p1, p0, Lc/a/a/a/d0/a;->Q:F

    .line 33
    iget p1, v0, Lc/a/a/a/i0/d;->j:F

    iput p1, p0, Lc/a/a/a/d0/a;->Y:F

    .line 34
    iget-object p1, p0, Lc/a/a/a/d0/a;->A:Lc/a/a/a/i0/a;

    if-eqz p1, :cond_37

    .line 35
    invoke-virtual {p1}, Lc/a/a/a/i0/a;->a()V

    .line 36
    :cond_37
    new-instance p1, Lc/a/a/a/i0/a;

    new-instance v1, Lc/a/a/a/d0/a$a;

    invoke-direct {v1, p0}, Lc/a/a/a/d0/a$a;-><init>(Lc/a/a/a/d0/a;)V

    .line 37
    invoke-virtual {v0}, Lc/a/a/a/i0/d;->b()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-direct {p1, v1, v2}, Lc/a/a/a/i0/a;-><init>(Lc/a/a/a/i0/a$a;Landroid/graphics/Typeface;)V

    iput-object p1, p0, Lc/a/a/a/d0/a;->A:Lc/a/a/a/i0/a;

    .line 38
    iget-object p1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lc/a/a/a/d0/a;->A:Lc/a/a/a/i0/a;

    invoke-virtual {v0, p1, v1}, Lc/a/a/a/i0/d;->a(Landroid/content/Context;Lc/a/a/a/i0/f;)V

    .line 39
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    return-void
.end method

.method public a(IIII)V
    .registers 6

    .line 3
    iget-object v0, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    invoke-static {v0, p1, p2, p3, p4}, Lc/a/a/a/d0/a;->a(Landroid/graphics/Rect;IIII)Z

    move-result v0

    if-nez v0, :cond_13

    .line 4
    iget-object v0, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    const/4 p1, 0x1

    .line 5
    iput-boolean p1, p0, Lc/a/a/a/d0/a;->L:Z

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->z()V

    :cond_13
    return-void
.end method

.method public a(Landroid/animation/TimeInterpolator;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/d0/a;->O:Landroid/animation/TimeInterpolator;

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    return-void
.end method

.method public a(Landroid/graphics/Canvas;)V
    .registers 9

    .line 85
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    .line 86
    iget-object v1, p0, Lc/a/a/a/d0/a;->C:Ljava/lang/CharSequence;

    if-eqz v1, :cond_7c

    iget-boolean v1, p0, Lc/a/a/a/d0/a;->b:Z

    if-eqz v1, :cond_7c

    .line 87
    iget v1, p0, Lc/a/a/a/d0/a;->f0:I

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-le v1, v2, :cond_1a

    iget-object v1, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {v1, v3}, Landroid/text/StaticLayout;->getLineStart(I)I

    move-result v1

    int-to-float v1, v1

    goto :goto_20

    :cond_1a
    iget-object v1, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {v1, v3}, Landroid/text/StaticLayout;->getLineLeft(I)F

    move-result v1

    .line 88
    :goto_20
    iget v4, p0, Lc/a/a/a/d0/a;->u:F

    add-float/2addr v4, v1

    iget v1, p0, Lc/a/a/a/d0/a;->d0:F

    const/high16 v5, 0x40000000    # 2.0f

    mul-float v1, v1, v5

    sub-float/2addr v4, v1

    .line 89
    iget-object v1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    iget v5, p0, Lc/a/a/a/d0/a;->J:F

    invoke-virtual {v1, v5}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 90
    iget v1, p0, Lc/a/a/a/d0/a;->u:F

    .line 91
    iget v5, p0, Lc/a/a/a/d0/a;->v:F

    .line 92
    iget-boolean v6, p0, Lc/a/a/a/d0/a;->F:Z

    if-eqz v6, :cond_3e

    iget-object v6, p0, Lc/a/a/a/d0/a;->G:Landroid/graphics/Bitmap;

    if-eqz v6, :cond_3e

    goto :goto_3f

    :cond_3e
    const/4 v2, 0x0

    .line 93
    :goto_3f
    iget v3, p0, Lc/a/a/a/d0/a;->I:F

    const/high16 v6, 0x3f800000    # 1.0f

    cmpl-float v6, v3, v6

    if-eqz v6, :cond_4e

    iget-boolean v6, p0, Lc/a/a/a/d0/a;->d:Z

    if-nez v6, :cond_4e

    .line 94
    invoke-virtual {p1, v3, v3, v1, v5}, Landroid/graphics/Canvas;->scale(FFFF)V

    :cond_4e
    if-eqz v2, :cond_5b

    .line 95
    iget-object v2, p0, Lc/a/a/a/d0/a;->G:Landroid/graphics/Bitmap;

    iget-object v3, p0, Lc/a/a/a/d0/a;->H:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v1, v5, v3}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    .line 96
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void

    .line 97
    :cond_5b
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->B()Z

    move-result v2

    if-eqz v2, :cond_71

    iget-boolean v2, p0, Lc/a/a/a/d0/a;->d:Z

    if-eqz v2, :cond_6d

    iget v2, p0, Lc/a/a/a/d0/a;->c:F

    iget v3, p0, Lc/a/a/a/d0/a;->f:F

    cmpl-float v2, v2, v3

    if-lez v2, :cond_71

    .line 98
    :cond_6d
    invoke-virtual {p0, p1, v4, v5}, Lc/a/a/a/d0/a;->a(Landroid/graphics/Canvas;FF)V

    goto :goto_79

    .line 99
    :cond_71
    invoke-virtual {p1, v1, v5}, Landroid/graphics/Canvas;->translate(FF)V

    .line 100
    iget-object v1, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {v1, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 101
    :goto_79
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    :cond_7c
    return-void
.end method

.method public final a(Landroid/graphics/Canvas;FF)V
    .registers 16

    .line 102
    iget-object v0, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->getAlpha()I

    move-result v0

    .line 103
    invoke-virtual {p1, p2, p3}, Landroid/graphics/Canvas;->translate(FF)V

    .line 104
    iget-object p2, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    iget p3, p0, Lc/a/a/a/d0/a;->c0:F

    int-to-float v1, v0

    mul-float p3, p3, v1

    float-to-int p3, p3

    invoke-virtual {p2, p3}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 105
    iget-object p2, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {p2, p1}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 106
    iget-object p2, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    iget p3, p0, Lc/a/a/a/d0/a;->b0:F

    mul-float p3, p3, v1

    float-to-int p3, p3

    invoke-virtual {p2, p3}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 107
    iget-object p2, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    const/4 p3, 0x0

    invoke-virtual {p2, p3}, Landroid/text/StaticLayout;->getLineBaseline(I)I

    move-result p2

    .line 108
    iget-object v2, p0, Lc/a/a/a/d0/a;->e0:Ljava/lang/CharSequence;

    .line 109
    invoke-interface {v2}, Ljava/lang/CharSequence;->length()I

    move-result v4

    int-to-float v10, p2

    iget-object v7, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    const/4 v3, 0x0

    const/4 v5, 0x0

    move-object v1, p1

    move v6, v10

    .line 110
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 111
    iget-boolean p2, p0, Lc/a/a/a/d0/a;->d:Z

    if-nez p2, :cond_76

    .line 112
    iget-object p2, p0, Lc/a/a/a/d0/a;->e0:Ljava/lang/CharSequence;

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    const-string v1, "\u2026"

    .line 113
    invoke-virtual {p2, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5a

    .line 114
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p2, p3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p2

    :cond_5a
    move-object v6, p2

    .line 115
    iget-object p2, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {p2, v0}, Landroid/text/TextPaint;->setAlpha(I)V

    const/4 v7, 0x0

    .line 116
    iget-object p2, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    .line 117
    invoke-virtual {p2, p3}, Landroid/text/StaticLayout;->getLineEnd(I)I

    move-result p2

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result p3

    invoke-static {p2, p3}, Ljava/lang/Math;->min(II)I

    move-result v8

    const/4 v9, 0x0

    iget-object v11, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    move-object v5, p1

    .line 118
    invoke-virtual/range {v5 .. v11}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    :cond_76
    return-void
.end method

.method public a(Landroid/graphics/Rect;)V
    .registers 5

    .line 7
    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v0, v1, v2, p1}, Lc/a/a/a/d0/a;->a(IIII)V

    return-void
.end method

.method public a(Landroid/graphics/RectF;II)V
    .registers 5

    .line 8
    iget-object v0, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->a(Ljava/lang/CharSequence;)Z

    move-result v0

    iput-boolean v0, p0, Lc/a/a/a/d0/a;->D:Z

    .line 9
    invoke-virtual {p0, p2, p3}, Lc/a/a/a/d0/a;->a(II)F

    move-result v0

    iput v0, p1, Landroid/graphics/RectF;->left:F

    .line 10
    iget-object v0, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    int-to-float v0, v0

    iput v0, p1, Landroid/graphics/RectF;->top:F

    .line 11
    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/d0/a;->b(Landroid/graphics/RectF;II)F

    move-result p2

    iput p2, p1, Landroid/graphics/RectF;->right:F

    .line 12
    iget-object p2, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget p2, p2, Landroid/graphics/Rect;->top:I

    int-to-float p2, p2

    invoke-virtual {p0}, Lc/a/a/a/d0/a;->h()F

    move-result p3

    add-float/2addr p2, p3

    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    return-void
.end method

.method public a(Landroid/graphics/Typeface;)V
    .registers 2

    .line 40
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->b(Landroid/graphics/Typeface;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 41
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_9
    return-void
.end method

.method public final a(Landroid/text/TextPaint;)V
    .registers 4

    .line 19
    iget v0, p0, Lc/a/a/a/d0/a;->n:F

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 20
    iget-object v0, p0, Lc/a/a/a/d0/a;->w:Landroid/graphics/Typeface;

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 21
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_15

    .line 22
    iget v0, p0, Lc/a/a/a/d0/a;->Y:F

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    :cond_15
    return-void
.end method

.method public final a(Z)V
    .registers 14

    .line 51
    iget v0, p0, Lc/a/a/a/d0/a;->J:F

    .line 52
    iget v1, p0, Lc/a/a/a/d0/a;->n:F

    invoke-virtual {p0, v1, p1}, Lc/a/a/a/d0/a;->a(FZ)V

    .line 53
    iget-object v1, p0, Lc/a/a/a/d0/a;->C:Ljava/lang/CharSequence;

    if-eqz v1, :cond_1e

    iget-object v2, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    if-eqz v2, :cond_1e

    .line 54
    iget-object v3, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    .line 55
    invoke-virtual {v2}, Landroid/text/StaticLayout;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sget-object v4, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    invoke-static {v1, v3, v2, v4}, Landroid/text/TextUtils;->ellipsize(Ljava/lang/CharSequence;Landroid/text/TextPaint;FLandroid/text/TextUtils$TruncateAt;)Ljava/lang/CharSequence;

    move-result-object v1

    iput-object v1, p0, Lc/a/a/a/d0/a;->e0:Ljava/lang/CharSequence;

    .line 56
    :cond_1e
    iget-object v1, p0, Lc/a/a/a/d0/a;->e0:Ljava/lang/CharSequence;

    const/4 v2, 0x0

    const/4 v3, 0x0

    if-eqz v1, :cond_2f

    iget-object v4, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    .line 57
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-virtual {v4, v1, v2, v5}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v1

    goto :goto_30

    :cond_2f
    const/4 v1, 0x0

    .line 58
    :goto_30
    iget v4, p0, Lc/a/a/a/d0/a;->l:I

    iget-boolean v5, p0, Lc/a/a/a/d0/a;->D:Z

    .line 59
    invoke-static {v4, v5}, Lb/h/m/e;->a(II)I

    move-result v4

    and-int/lit8 v5, v4, 0x70

    const/16 v6, 0x50

    const/16 v7, 0x30

    const/high16 v8, 0x40000000    # 2.0f

    if-eq v5, v7, :cond_6c

    if-eq v5, v6, :cond_5d

    .line 60
    iget-object v5, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {v5}, Landroid/text/TextPaint;->descent()F

    move-result v5

    iget-object v9, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {v9}, Landroid/text/TextPaint;->ascent()F

    move-result v9

    sub-float/2addr v5, v9

    div-float/2addr v5, v8

    .line 61
    iget-object v9, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    invoke-virtual {v9}, Landroid/graphics/Rect;->centerY()I

    move-result v9

    int-to-float v9, v9

    sub-float/2addr v9, v5

    iput v9, p0, Lc/a/a/a/d0/a;->r:F

    goto :goto_73

    .line 62
    :cond_5d
    iget-object v5, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    iget-object v9, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {v9}, Landroid/text/TextPaint;->ascent()F

    move-result v9

    add-float/2addr v5, v9

    iput v5, p0, Lc/a/a/a/d0/a;->r:F

    goto :goto_73

    .line 63
    :cond_6c
    iget-object v5, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget v5, v5, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    iput v5, p0, Lc/a/a/a/d0/a;->r:F

    :goto_73
    const v5, 0x800007

    and-int/2addr v4, v5

    const/4 v9, 0x5

    const/4 v10, 0x1

    if-eq v4, v10, :cond_8e

    if-eq v4, v9, :cond_85

    .line 64
    iget-object v1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iput v1, p0, Lc/a/a/a/d0/a;->t:F

    goto :goto_99

    .line 65
    :cond_85
    iget-object v4, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    sub-float/2addr v4, v1

    iput v4, p0, Lc/a/a/a/d0/a;->t:F

    goto :goto_99

    .line 66
    :cond_8e
    iget-object v4, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->centerX()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v1, v8

    sub-float/2addr v4, v1

    iput v4, p0, Lc/a/a/a/d0/a;->t:F

    .line 67
    :goto_99
    iget v1, p0, Lc/a/a/a/d0/a;->m:F

    invoke-virtual {p0, v1, p1}, Lc/a/a/a/d0/a;->a(FZ)V

    .line 68
    iget-object p1, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    if-eqz p1, :cond_a8

    invoke-virtual {p1}, Landroid/text/StaticLayout;->getHeight()I

    move-result p1

    int-to-float p1, p1

    goto :goto_a9

    :cond_a8
    const/4 p1, 0x0

    .line 69
    :goto_a9
    iget-object v1, p0, Lc/a/a/a/d0/a;->C:Ljava/lang/CharSequence;

    if-eqz v1, :cond_b8

    iget-object v4, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    .line 70
    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v11

    invoke-virtual {v4, v1, v2, v11}, Landroid/text/TextPaint;->measureText(Ljava/lang/CharSequence;II)F

    move-result v1

    goto :goto_b9

    :cond_b8
    const/4 v1, 0x0

    .line 71
    :goto_b9
    iget-object v4, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    if-eqz v4, :cond_c6

    iget v11, p0, Lc/a/a/a/d0/a;->f0:I

    if-le v11, v10, :cond_c6

    .line 72
    invoke-virtual {v4}, Landroid/text/StaticLayout;->getWidth()I

    move-result v1

    int-to-float v1, v1

    .line 73
    :cond_c6
    iget-object v4, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    if-eqz v4, :cond_d8

    iget v3, p0, Lc/a/a/a/d0/a;->f0:I

    if-le v3, v10, :cond_d4

    .line 74
    invoke-virtual {v4, v2}, Landroid/text/StaticLayout;->getLineStart(I)I

    move-result v2

    int-to-float v3, v2

    goto :goto_d8

    :cond_d4
    invoke-virtual {v4, v2}, Landroid/text/StaticLayout;->getLineLeft(I)F

    move-result v3

    :cond_d8
    :goto_d8
    iput v3, p0, Lc/a/a/a/d0/a;->d0:F

    .line 75
    iget v2, p0, Lc/a/a/a/d0/a;->k:I

    iget-boolean v3, p0, Lc/a/a/a/d0/a;->D:Z

    .line 76
    invoke-static {v2, v3}, Lb/h/m/e;->a(II)I

    move-result v2

    and-int/lit8 v3, v2, 0x70

    if-eq v3, v7, :cond_104

    if-eq v3, v6, :cond_f4

    div-float/2addr p1, v8

    .line 77
    iget-object v3, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    invoke-virtual {v3}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v3, p1

    iput v3, p0, Lc/a/a/a/d0/a;->q:F

    goto :goto_10b

    .line 78
    :cond_f4
    iget-object v3, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    iget v3, v3, Landroid/graphics/Rect;->bottom:I

    int-to-float v3, v3

    sub-float/2addr v3, p1

    iget-object p1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {p1}, Landroid/text/TextPaint;->descent()F

    move-result p1

    add-float/2addr v3, p1

    iput v3, p0, Lc/a/a/a/d0/a;->q:F

    goto :goto_10b

    .line 79
    :cond_104
    iget-object p1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    iput p1, p0, Lc/a/a/a/d0/a;->q:F

    :goto_10b
    and-int p1, v2, v5

    if-eq p1, v10, :cond_122

    if-eq p1, v9, :cond_119

    .line 80
    iget-object p1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    iput p1, p0, Lc/a/a/a/d0/a;->s:F

    goto :goto_12d

    .line 81
    :cond_119
    iget-object p1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    int-to-float p1, p1

    sub-float/2addr p1, v1

    iput p1, p0, Lc/a/a/a/d0/a;->s:F

    goto :goto_12d

    .line 82
    :cond_122
    iget-object p1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    invoke-virtual {p1}, Landroid/graphics/Rect;->centerX()I

    move-result p1

    int-to-float p1, p1

    div-float/2addr v1, v8

    sub-float/2addr p1, v1

    iput p1, p0, Lc/a/a/a/d0/a;->s:F

    .line 83
    :goto_12d
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->d()V

    .line 84
    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->j(F)V

    return-void
.end method

.method public final a(Ljava/lang/CharSequence;)Z
    .registers 4

    .line 119
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->x()Z

    move-result v0

    .line 120
    iget-boolean v1, p0, Lc/a/a/a/d0/a;->E:Z

    if-eqz v1, :cond_c

    .line 121
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/d0/a;->a(Ljava/lang/CharSequence;Z)Z

    move-result v0

    :cond_c
    return v0
.end method

.method public final a(Ljava/lang/CharSequence;Z)Z
    .registers 5

    if-eqz p2, :cond_5

    .line 122
    sget-object p2, Lb/h/k/e;->d:Lb/h/k/d;

    goto :goto_7

    :cond_5
    sget-object p2, Lb/h/k/e;->c:Lb/h/k/d;

    :goto_7
    const/4 v0, 0x0

    .line 123
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    invoke-interface {p2, p1, v0, v1}, Lb/h/k/d;->a(Ljava/lang/CharSequence;II)Z

    move-result p1

    return p1
.end method

.method public final a([I)Z
    .registers 2

    .line 42
    iput-object p1, p0, Lc/a/a/a/d0/a;->K:[I

    .line 43
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->y()Z

    move-result p1

    if-eqz p1, :cond_d

    .line 44
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    const/4 p1, 0x1

    return p1

    :cond_d
    const/4 p1, 0x0

    return p1
.end method

.method public final b(Landroid/graphics/RectF;II)F
    .registers 6

    const/16 v0, 0x11

    if-eq p3, v0, :cond_3a

    and-int/lit8 v0, p3, 0x7

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a

    goto :goto_3a

    :cond_a
    const p2, 0x800005

    and-int v0, p3, p2

    if-eq v0, p2, :cond_28

    const/4 p2, 0x5

    and-int/2addr p3, p2

    if-ne p3, p2, :cond_16

    goto :goto_28

    .line 11
    :cond_16
    iget-boolean p2, p0, Lc/a/a/a/d0/a;->D:Z

    if-eqz p2, :cond_20

    iget-object p1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    int-to-float p1, p1

    goto :goto_27

    :cond_20
    iget p1, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0}, Lc/a/a/a/d0/a;->a()F

    move-result p2

    add-float/2addr p1, p2

    :goto_27
    return p1

    .line 12
    :cond_28
    :goto_28
    iget-boolean p2, p0, Lc/a/a/a/d0/a;->D:Z

    if-eqz p2, :cond_34

    iget p1, p1, Landroid/graphics/RectF;->left:F

    invoke-virtual {p0}, Lc/a/a/a/d0/a;->a()F

    move-result p2

    add-float/2addr p1, p2

    goto :goto_39

    :cond_34
    iget-object p1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget p1, p1, Landroid/graphics/Rect;->right:I

    int-to-float p1, p1

    :goto_39
    return p1

    :cond_3a
    :goto_3a
    int-to-float p1, p2

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p1, p2

    .line 13
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->a()F

    move-result p3

    div-float/2addr p3, p2

    add-float/2addr p1, p3

    return p1
.end method

.method public final b()V
    .registers 2

    .line 25
    iget v0, p0, Lc/a/a/a/d0/a;->c:F

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->b(F)V

    return-void
.end method

.method public final b(F)V
    .registers 8

    .line 26
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->d(F)V

    .line 27
    iget-boolean v0, p0, Lc/a/a/a/d0/a;->d:Z

    const/4 v1, 0x0

    const/high16 v2, 0x3f800000    # 1.0f

    if-eqz v0, :cond_38

    .line 28
    iget v0, p0, Lc/a/a/a/d0/a;->f:F

    cmpg-float v0, p1, v0

    if-gez v0, :cond_1f

    .line 29
    iget v0, p0, Lc/a/a/a/d0/a;->s:F

    iput v0, p0, Lc/a/a/a/d0/a;->u:F

    .line 30
    iget v0, p0, Lc/a/a/a/d0/a;->q:F

    iput v0, p0, Lc/a/a/a/d0/a;->v:F

    .line 31
    iget v0, p0, Lc/a/a/a/d0/a;->m:F

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->j(F)V

    const/4 v0, 0x0

    goto :goto_5e

    .line 32
    :cond_1f
    iget v0, p0, Lc/a/a/a/d0/a;->t:F

    iput v0, p0, Lc/a/a/a/d0/a;->u:F

    .line 33
    iget v0, p0, Lc/a/a/a/d0/a;->r:F

    const/4 v3, 0x0

    iget v4, p0, Lc/a/a/a/d0/a;->g:I

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    sub-float/2addr v0, v3

    iput v0, p0, Lc/a/a/a/d0/a;->v:F

    .line 34
    iget v0, p0, Lc/a/a/a/d0/a;->n:F

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->j(F)V

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_5e

    .line 35
    :cond_38
    iget v0, p0, Lc/a/a/a/d0/a;->s:F

    iget v3, p0, Lc/a/a/a/d0/a;->t:F

    iget-object v4, p0, Lc/a/a/a/d0/a;->O:Landroid/animation/TimeInterpolator;

    invoke-static {v0, v3, p1, v4}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v0

    iput v0, p0, Lc/a/a/a/d0/a;->u:F

    .line 36
    iget v0, p0, Lc/a/a/a/d0/a;->q:F

    iget v3, p0, Lc/a/a/a/d0/a;->r:F

    iget-object v4, p0, Lc/a/a/a/d0/a;->O:Landroid/animation/TimeInterpolator;

    invoke-static {v0, v3, p1, v4}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v0

    iput v0, p0, Lc/a/a/a/d0/a;->v:F

    .line 37
    iget v0, p0, Lc/a/a/a/d0/a;->m:F

    iget v3, p0, Lc/a/a/a/d0/a;->n:F

    iget-object v4, p0, Lc/a/a/a/d0/a;->P:Landroid/animation/TimeInterpolator;

    .line 38
    invoke-static {v0, v3, p1, v4}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v0

    .line 39
    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->j(F)V

    move v0, p1

    :goto_5e
    sub-float v3, v2, p1

    .line 40
    sget-object v4, Lc/a/a/a/m/a;->b:Landroid/animation/TimeInterpolator;

    .line 41
    invoke-static {v1, v2, v3, v4}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    sub-float v3, v2, v3

    .line 42
    invoke-virtual {p0, v3}, Lc/a/a/a/d0/a;->e(F)V

    .line 43
    sget-object v3, Lc/a/a/a/m/a;->b:Landroid/animation/TimeInterpolator;

    invoke-static {v2, v1, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    invoke-virtual {p0, v1}, Lc/a/a/a/d0/a;->f(F)V

    .line 44
    iget-object v1, p0, Lc/a/a/a/d0/a;->p:Landroid/content/res/ColorStateList;

    iget-object v2, p0, Lc/a/a/a/d0/a;->o:Landroid/content/res/ColorStateList;

    if-eq v1, v2, :cond_8c

    .line 45
    iget-object v1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    .line 46
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->k()I

    move-result v2

    invoke-virtual {p0}, Lc/a/a/a/d0/a;->j()I

    move-result v3

    .line 47
    invoke-static {v2, v3, v0}, Lc/a/a/a/d0/a;->a(IIF)I

    move-result v0

    .line 48
    invoke-virtual {v1, v0}, Landroid/text/TextPaint;->setColor(I)V

    goto :goto_95

    .line 49
    :cond_8c
    iget-object v0, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {p0}, Lc/a/a/a/d0/a;->j()I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->setColor(I)V

    .line 50
    :goto_95
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_b4

    .line 51
    iget v0, p0, Lc/a/a/a/d0/a;->Y:F

    iget v1, p0, Lc/a/a/a/d0/a;->Z:F

    cmpl-float v2, v0, v1

    if-eqz v2, :cond_af

    .line 52
    iget-object v2, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    sget-object v3, Lc/a/a/a/m/a;->b:Landroid/animation/TimeInterpolator;

    .line 53
    invoke-static {v1, v0, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v0

    .line 54
    invoke-virtual {v2, v0}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    goto :goto_b4

    .line 55
    :cond_af
    iget-object v1, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {v1, v0}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    .line 56
    :cond_b4
    :goto_b4
    iget-object v0, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    iget v1, p0, Lc/a/a/a/d0/a;->U:F

    iget v2, p0, Lc/a/a/a/d0/a;->Q:F

    const/4 v3, 0x0

    .line 57
    invoke-static {v1, v2, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    iget v2, p0, Lc/a/a/a/d0/a;->V:F

    iget v4, p0, Lc/a/a/a/d0/a;->R:F

    .line 58
    invoke-static {v2, v4, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v2

    iget v4, p0, Lc/a/a/a/d0/a;->W:F

    iget v5, p0, Lc/a/a/a/d0/a;->S:F

    .line 59
    invoke-static {v4, v5, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v3

    iget-object v4, p0, Lc/a/a/a/d0/a;->X:Landroid/content/res/ColorStateList;

    .line 60
    invoke-virtual {p0, v4}, Lc/a/a/a/d0/a;->a(Landroid/content/res/ColorStateList;)I

    move-result v4

    iget-object v5, p0, Lc/a/a/a/d0/a;->T:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v5}, Lc/a/a/a/d0/a;->a(Landroid/content/res/ColorStateList;)I

    move-result v5

    .line 61
    invoke-static {v4, v5, p1}, Lc/a/a/a/d0/a;->a(IIF)I

    move-result v4

    .line 62
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/text/TextPaint;->setShadowLayer(FFFI)V

    .line 63
    iget-boolean v0, p0, Lc/a/a/a/d0/a;->d:Z

    if-eqz v0, :cond_f4

    .line 64
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->a(F)F

    move-result p1

    const/high16 v0, 0x437f0000    # 255.0f

    mul-float p1, p1, v0

    float-to-int p1, p1

    .line 65
    iget-object v0, p0, Lc/a/a/a/d0/a;->M:Landroid/text/TextPaint;

    invoke-virtual {v0, p1}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 66
    :cond_f4
    iget-object p1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-static {p1}, Lb/h/m/y;->O(Landroid/view/View;)V

    return-void
.end method

.method public b(I)V
    .registers 3

    .line 18
    iget v0, p0, Lc/a/a/a/d0/a;->l:I

    if-eq v0, p1, :cond_9

    .line 19
    iput p1, p0, Lc/a/a/a/d0/a;->l:I

    .line 20
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_9
    return-void
.end method

.method public b(IIII)V
    .registers 6

    .line 6
    iget-object v0, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    invoke-static {v0, p1, p2, p3, p4}, Lc/a/a/a/d0/a;->a(Landroid/graphics/Rect;IIII)Z

    move-result v0

    if-nez v0, :cond_13

    .line 7
    iget-object v0, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lc/a/a/a/d0/a;->L:Z

    .line 9
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->z()V

    :cond_13
    return-void
.end method

.method public b(Landroid/animation/TimeInterpolator;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/d0/a;->P:Landroid/animation/TimeInterpolator;

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    return-void
.end method

.method public b(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 3
    iget-object v0, p0, Lc/a/a/a/d0/a;->p:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 4
    iput-object p1, p0, Lc/a/a/a/d0/a;->p:Landroid/content/res/ColorStateList;

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_9
    return-void
.end method

.method public b(Landroid/graphics/Rect;)V
    .registers 5

    .line 10
    iget v0, p1, Landroid/graphics/Rect;->left:I

    iget v1, p1, Landroid/graphics/Rect;->top:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    iget p1, p1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p0, v0, v1, v2, p1}, Lc/a/a/a/d0/a;->b(IIII)V

    return-void
.end method

.method public final b(Landroid/text/TextPaint;)V
    .registers 4

    .line 14
    iget v0, p0, Lc/a/a/a/d0/a;->m:F

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTextSize(F)V

    .line 15
    iget-object v0, p0, Lc/a/a/a/d0/a;->x:Landroid/graphics/Typeface;

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 16
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_15

    .line 17
    iget v0, p0, Lc/a/a/a/d0/a;->Z:F

    invoke-virtual {p1, v0}, Landroid/text/TextPaint;->setLetterSpacing(F)V

    :cond_15
    return-void
.end method

.method public b(Ljava/lang/CharSequence;)V
    .registers 3

    if-eqz p1, :cond_a

    .line 70
    iget-object v0, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_15

    .line 71
    :cond_a
    iput-object p1, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    const/4 p1, 0x0

    .line 72
    iput-object p1, p0, Lc/a/a/a/d0/a;->C:Ljava/lang/CharSequence;

    .line 73
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->d()V

    .line 74
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_15
    return-void
.end method

.method public b(Z)V
    .registers 3

    .line 67
    iget-object v0, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v0

    if-lez v0, :cond_10

    iget-object v0, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getWidth()I

    move-result v0

    if-gtz v0, :cond_12

    :cond_10
    if-eqz p1, :cond_18

    .line 68
    :cond_12
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->a(Z)V

    .line 69
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->b()V

    :cond_18
    return-void
.end method

.method public final b(Landroid/graphics/Typeface;)Z
    .registers 3

    .line 21
    iget-object v0, p0, Lc/a/a/a/d0/a;->A:Lc/a/a/a/i0/a;

    if-eqz v0, :cond_7

    .line 22
    invoke-virtual {v0}, Lc/a/a/a/i0/a;->a()V

    .line 23
    :cond_7
    iget-object v0, p0, Lc/a/a/a/d0/a;->w:Landroid/graphics/Typeface;

    if-eq v0, p1, :cond_f

    .line 24
    iput-object p1, p0, Lc/a/a/a/d0/a;->w:Landroid/graphics/Typeface;

    const/4 p1, 0x1

    return p1

    :cond_f
    const/4 p1, 0x0

    return p1
.end method

.method public final c()F
    .registers 4

    .line 5
    iget v0, p0, Lc/a/a/a/d0/a;->e:F

    const/high16 v1, 0x3f800000    # 1.0f

    sub-float/2addr v1, v0

    const/high16 v2, 0x3f000000    # 0.5f

    mul-float v1, v1, v2

    add-float/2addr v0, v1

    return v0
.end method

.method public final c(F)V
    .registers 3

    const/4 v0, 0x0

    .line 9
    invoke-virtual {p0, p1, v0}, Lc/a/a/a/d0/a;->a(FZ)V

    return-void
.end method

.method public c(I)V
    .registers 2

    .line 4
    iput p1, p0, Lc/a/a/a/d0/a;->g:I

    return-void
.end method

.method public c(Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->o:Landroid/content/res/ColorStateList;

    if-eq v0, p1, :cond_9

    .line 2
    iput-object p1, p0, Lc/a/a/a/d0/a;->o:Landroid/content/res/ColorStateList;

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_9
    return-void
.end method

.method public c(Landroid/graphics/Typeface;)V
    .registers 2

    .line 7
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->d(Landroid/graphics/Typeface;)Z

    move-result p1

    if-eqz p1, :cond_9

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_9
    return-void
.end method

.method public c(Z)V
    .registers 2

    .line 6
    iput-boolean p1, p0, Lc/a/a/a/d0/a;->d:Z

    return-void
.end method

.method public final d()V
    .registers 2

    .line 32
    iget-object v0, p0, Lc/a/a/a/d0/a;->G:Landroid/graphics/Bitmap;

    if-eqz v0, :cond_a

    .line 33
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    const/4 v0, 0x0

    .line 34
    iput-object v0, p0, Lc/a/a/a/d0/a;->G:Landroid/graphics/Bitmap;

    :cond_a
    return-void
.end method

.method public final d(F)V
    .registers 6

    .line 23
    iget-boolean v0, p0, Lc/a/a/a/d0/a;->d:Z

    if-eqz v0, :cond_15

    .line 24
    iget-object v0, p0, Lc/a/a/a/d0/a;->j:Landroid/graphics/RectF;

    iget v1, p0, Lc/a/a/a/d0/a;->f:F

    cmpg-float p1, p1, v1

    if-gez p1, :cond_f

    iget-object p1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    goto :goto_11

    :cond_f
    iget-object p1, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    :goto_11
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/Rect;)V

    goto :goto_5f

    .line 25
    :cond_15
    iget-object v0, p0, Lc/a/a/a/d0/a;->j:Landroid/graphics/RectF;

    iget-object v1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    iget-object v2, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    iget-object v3, p0, Lc/a/a/a/d0/a;->O:Landroid/animation/TimeInterpolator;

    .line 26
    invoke-static {v1, v2, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 27
    iget-object v0, p0, Lc/a/a/a/d0/a;->j:Landroid/graphics/RectF;

    iget v1, p0, Lc/a/a/a/d0/a;->q:F

    iget v2, p0, Lc/a/a/a/d0/a;->r:F

    iget-object v3, p0, Lc/a/a/a/d0/a;->O:Landroid/animation/TimeInterpolator;

    invoke-static {v1, v2, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 28
    iget-object v0, p0, Lc/a/a/a/d0/a;->j:Landroid/graphics/RectF;

    iget-object v1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->right:I

    int-to-float v1, v1

    iget-object v2, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->right:I

    int-to-float v2, v2

    iget-object v3, p0, Lc/a/a/a/d0/a;->O:Landroid/animation/TimeInterpolator;

    .line 29
    invoke-static {v1, v2, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result v1

    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 30
    iget-object v0, p0, Lc/a/a/a/d0/a;->j:Landroid/graphics/RectF;

    iget-object v1, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    iget-object v2, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    iget-object v3, p0, Lc/a/a/a/d0/a;->O:Landroid/animation/TimeInterpolator;

    .line 31
    invoke-static {v1, v2, p1, v3}, Lc/a/a/a/d0/a;->a(FFFLandroid/animation/TimeInterpolator;)F

    move-result p1

    iput p1, v0, Landroid/graphics/RectF;->bottom:F

    :goto_5f
    return-void
.end method

.method public d(I)V
    .registers 5

    .line 1
    new-instance v0, Lc/a/a/a/i0/d;

    iget-object v1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1, p1}, Lc/a/a/a/i0/d;-><init>(Landroid/content/Context;I)V

    .line 2
    iget-object p1, v0, Lc/a/a/a/i0/d;->a:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_11

    .line 3
    iput-object p1, p0, Lc/a/a/a/d0/a;->o:Landroid/content/res/ColorStateList;

    .line 4
    :cond_11
    iget p1, v0, Lc/a/a/a/i0/d;->k:F

    const/4 v1, 0x0

    cmpl-float v1, p1, v1

    if-eqz v1, :cond_1a

    .line 5
    iput p1, p0, Lc/a/a/a/d0/a;->m:F

    .line 6
    :cond_1a
    iget-object p1, v0, Lc/a/a/a/i0/d;->b:Landroid/content/res/ColorStateList;

    if-eqz p1, :cond_20

    .line 7
    iput-object p1, p0, Lc/a/a/a/d0/a;->X:Landroid/content/res/ColorStateList;

    .line 8
    :cond_20
    iget p1, v0, Lc/a/a/a/i0/d;->f:F

    iput p1, p0, Lc/a/a/a/d0/a;->V:F

    .line 9
    iget p1, v0, Lc/a/a/a/i0/d;->g:F

    iput p1, p0, Lc/a/a/a/d0/a;->W:F

    .line 10
    iget p1, v0, Lc/a/a/a/i0/d;->h:F

    iput p1, p0, Lc/a/a/a/d0/a;->U:F

    .line 11
    iget p1, v0, Lc/a/a/a/i0/d;->j:F

    iput p1, p0, Lc/a/a/a/d0/a;->Z:F

    .line 12
    iget-object p1, p0, Lc/a/a/a/d0/a;->z:Lc/a/a/a/i0/a;

    if-eqz p1, :cond_37

    .line 13
    invoke-virtual {p1}, Lc/a/a/a/i0/a;->a()V

    .line 14
    :cond_37
    new-instance p1, Lc/a/a/a/i0/a;

    new-instance v1, Lc/a/a/a/d0/a$b;

    invoke-direct {v1, p0}, Lc/a/a/a/d0/a$b;-><init>(Lc/a/a/a/d0/a;)V

    .line 15
    invoke-virtual {v0}, Lc/a/a/a/i0/d;->b()Landroid/graphics/Typeface;

    move-result-object v2

    invoke-direct {p1, v1, v2}, Lc/a/a/a/i0/a;-><init>(Lc/a/a/a/i0/a$a;Landroid/graphics/Typeface;)V

    iput-object p1, p0, Lc/a/a/a/d0/a;->z:Lc/a/a/a/i0/a;

    .line 16
    iget-object p1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget-object v1, p0, Lc/a/a/a/d0/a;->z:Lc/a/a/a/i0/a;

    invoke-virtual {v0, p1, v1}, Lc/a/a/a/i0/d;->a(Landroid/content/Context;Lc/a/a/a/i0/f;)V

    .line 17
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    return-void
.end method

.method public d(Z)V
    .registers 2

    .line 22
    iput-boolean p1, p0, Lc/a/a/a/d0/a;->E:Z

    return-void
.end method

.method public final d(Landroid/graphics/Typeface;)Z
    .registers 3

    .line 18
    iget-object v0, p0, Lc/a/a/a/d0/a;->z:Lc/a/a/a/i0/a;

    if-eqz v0, :cond_7

    .line 19
    invoke-virtual {v0}, Lc/a/a/a/i0/a;->a()V

    .line 20
    :cond_7
    iget-object v0, p0, Lc/a/a/a/d0/a;->x:Landroid/graphics/Typeface;

    if-eq v0, p1, :cond_f

    .line 21
    iput-object p1, p0, Lc/a/a/a/d0/a;->x:Landroid/graphics/Typeface;

    const/4 p1, 0x1

    return p1

    :cond_f
    const/4 p1, 0x0

    return p1
.end method

.method public final e()V
    .registers 4

    .line 9
    iget-object v0, p0, Lc/a/a/a/d0/a;->G:Landroid/graphics/Bitmap;

    if-nez v0, :cond_4a

    iget-object v0, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    invoke-virtual {v0}, Landroid/graphics/Rect;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_4a

    iget-object v0, p0, Lc/a/a/a/d0/a;->C:Ljava/lang/CharSequence;

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_15

    goto :goto_4a

    :cond_15
    const/4 v0, 0x0

    .line 10
    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->b(F)V

    .line 11
    iget-object v0, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {v0}, Landroid/text/StaticLayout;->getWidth()I

    move-result v0

    .line 12
    iget-object v1, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {v1}, Landroid/text/StaticLayout;->getHeight()I

    move-result v1

    if-lez v0, :cond_4a

    if-gtz v1, :cond_2a

    goto :goto_4a

    .line 13
    :cond_2a
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v0, v1, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v0

    iput-object v0, p0, Lc/a/a/a/d0/a;->G:Landroid/graphics/Bitmap;

    .line 14
    new-instance v0, Landroid/graphics/Canvas;

    iget-object v1, p0, Lc/a/a/a/d0/a;->G:Landroid/graphics/Bitmap;

    invoke-direct {v0, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 15
    iget-object v1, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {v1, v0}, Landroid/text/StaticLayout;->draw(Landroid/graphics/Canvas;)V

    .line 16
    iget-object v0, p0, Lc/a/a/a/d0/a;->H:Landroid/graphics/Paint;

    if-nez v0, :cond_4a

    .line 17
    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x3

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Lc/a/a/a/d0/a;->H:Landroid/graphics/Paint;

    :cond_4a
    :goto_4a
    return-void
.end method

.method public final e(F)V
    .registers 2

    .line 7
    iput p1, p0, Lc/a/a/a/d0/a;->b0:F

    .line 8
    iget-object p1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-static {p1}, Lb/h/m/y;->O(Landroid/view/View;)V

    return-void
.end method

.method public e(I)V
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/d0/a;->k:I

    if-eq v0, p1, :cond_9

    .line 2
    iput p1, p0, Lc/a/a/a/d0/a;->k:I

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_9
    return-void
.end method

.method public e(Landroid/graphics/Typeface;)V
    .registers 3

    .line 4
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->b(Landroid/graphics/Typeface;)Z

    move-result v0

    .line 5
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->d(Landroid/graphics/Typeface;)Z

    move-result p1

    if-nez v0, :cond_c

    if-eqz p1, :cond_f

    .line 6
    :cond_c
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_f
    return-void
.end method

.method public f()Landroid/content/res/ColorStateList;
    .registers 2

    .line 4
    iget-object v0, p0, Lc/a/a/a/d0/a;->p:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public final f(F)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/d0/a;->c0:F

    .line 2
    iget-object p1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-static {p1}, Lb/h/m/y;->O(Landroid/view/View;)V

    return-void
.end method

.method public f(I)V
    .registers 2

    .line 3
    iput p1, p0, Lc/a/a/a/d0/a;->i0:I

    return-void
.end method

.method public g()I
    .registers 2

    .line 4
    iget v0, p0, Lc/a/a/a/d0/a;->l:I

    return v0
.end method

.method public g(F)V
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/d0/a;->m:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lc/a/a/a/d0/a;->m:F

    .line 3
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_b
    return-void
.end method

.method public g(I)V
    .registers 3

    .line 5
    iget v0, p0, Lc/a/a/a/d0/a;->f0:I

    if-eq p1, v0, :cond_c

    .line 6
    iput p1, p0, Lc/a/a/a/d0/a;->f0:I

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->d()V

    .line 8
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->A()V

    :cond_c
    return-void
.end method

.method public h()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->a(Landroid/text/TextPaint;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->ascent()F

    move-result v0

    neg-float v0, v0

    return v0
.end method

.method public h(F)V
    .registers 4

    const/4 v0, 0x0

    const/high16 v1, 0x3f800000    # 1.0f

    .line 3
    invoke-static {p1, v0, v1}, Lb/h/h/a;->a(FFF)F

    move-result p1

    .line 4
    iget v0, p0, Lc/a/a/a/d0/a;->c:F

    cmpl-float v0, p1, v0

    if-eqz v0, :cond_12

    .line 5
    iput p1, p0, Lc/a/a/a/d0/a;->c:F

    .line 6
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->b()V

    :cond_12
    return-void
.end method

.method public i()Landroid/graphics/Typeface;
    .registers 2

    .line 3
    iget-object v0, p0, Lc/a/a/a/d0/a;->w:Landroid/graphics/Typeface;

    if-eqz v0, :cond_5

    goto :goto_7

    :cond_5
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    :goto_7
    return-object v0
.end method

.method public i(F)V
    .registers 2

    .line 1
    iput p1, p0, Lc/a/a/a/d0/a;->e:F

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->c()F

    move-result p1

    iput p1, p0, Lc/a/a/a/d0/a;->f:F

    return-void
.end method

.method public j()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->p:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->a(Landroid/content/res/ColorStateList;)I

    move-result v0

    return v0
.end method

.method public final j(F)V
    .registers 3

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/d0/a;->c(F)V

    .line 3
    sget-boolean p1, Lc/a/a/a/d0/a;->j0:Z

    if-eqz p1, :cond_11

    iget p1, p0, Lc/a/a/a/d0/a;->I:F

    const/high16 v0, 0x3f800000    # 1.0f

    cmpl-float p1, p1, v0

    if-eqz p1, :cond_11

    const/4 p1, 0x1

    goto :goto_12

    :cond_11
    const/4 p1, 0x0

    :goto_12
    iput-boolean p1, p0, Lc/a/a/a/d0/a;->F:Z

    if-eqz p1, :cond_19

    .line 4
    invoke-virtual {p0}, Lc/a/a/a/d0/a;->e()V

    .line 5
    :cond_19
    iget-object p1, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-static {p1}, Lb/h/m/y;->O(Landroid/view/View;)V

    return-void
.end method

.method public final k()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->o:Landroid/content/res/ColorStateList;

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->a(Landroid/content/res/ColorStateList;)I

    move-result v0

    return v0
.end method

.method public k(F)V
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/d0/a;->g0:F

    return-void
.end method

.method public l()F
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->b(Landroid/text/TextPaint;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->ascent()F

    move-result v0

    neg-float v0, v0

    iget-object v1, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    invoke-virtual {v1}, Landroid/text/TextPaint;->descent()F

    move-result v1

    add-float/2addr v0, v1

    return v0
.end method

.method public l(F)V
    .registers 2

    .line 3
    iput p1, p0, Lc/a/a/a/d0/a;->h0:F

    return-void
.end method

.method public m()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/a;->k:I

    return v0
.end method

.method public n()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    invoke-virtual {p0, v0}, Lc/a/a/a/d0/a;->b(Landroid/text/TextPaint;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/d0/a;->N:Landroid/text/TextPaint;

    invoke-virtual {v0}, Landroid/text/TextPaint;->ascent()F

    move-result v0

    neg-float v0, v0

    return v0
.end method

.method public o()Landroid/graphics/Typeface;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->x:Landroid/graphics/Typeface;

    if-eqz v0, :cond_5

    goto :goto_7

    :cond_5
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    :goto_7
    return-object v0
.end method

.method public p()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/a;->c:F

    return v0
.end method

.method public q()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/a;->f:F

    return v0
.end method

.method public r()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/a;->i0:I

    return v0
.end method

.method public s()I
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    if-eqz v0, :cond_9

    invoke-virtual {v0}, Landroid/text/StaticLayout;->getLineCount()I

    move-result v0

    goto :goto_a

    :cond_9
    const/4 v0, 0x0

    :goto_a
    return v0
.end method

.method public t()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {v0}, Landroid/text/StaticLayout;->getSpacingAdd()F

    move-result v0

    return v0
.end method

.method public u()F
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->a0:Landroid/text/StaticLayout;

    invoke-virtual {v0}, Landroid/text/StaticLayout;->getSpacingMultiplier()F

    move-result v0

    return v0
.end method

.method public v()I
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/d0/a;->f0:I

    return v0
.end method

.method public w()Ljava/lang/CharSequence;
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->B:Ljava/lang/CharSequence;

    return-object v0
.end method

.method public final x()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->a:Landroid/view/View;

    invoke-static {v0}, Lb/h/m/y;->r(Landroid/view/View;)I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_a

    goto :goto_b

    :cond_a
    const/4 v1, 0x0

    :goto_b
    return v1
.end method

.method public final y()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->p:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-nez v0, :cond_14

    :cond_a
    iget-object v0, p0, Lc/a/a/a/d0/a;->o:Landroid/content/res/ColorStateList;

    if-eqz v0, :cond_16

    .line 2
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v0

    if-eqz v0, :cond_16

    :cond_14
    const/4 v0, 0x1

    goto :goto_17

    :cond_16
    const/4 v0, 0x0

    :goto_17
    return v0
.end method

.method public z()V
    .registers 2

    .line 1
    iget-object v0, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    .line 2
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-lez v0, :cond_22

    iget-object v0, p0, Lc/a/a/a/d0/a;->i:Landroid/graphics/Rect;

    .line 3
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-lez v0, :cond_22

    iget-object v0, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    .line 4
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v0

    if-lez v0, :cond_22

    iget-object v0, p0, Lc/a/a/a/d0/a;->h:Landroid/graphics/Rect;

    .line 5
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v0

    if-lez v0, :cond_22

    const/4 v0, 0x1

    goto :goto_23

    :cond_22
    const/4 v0, 0x0

    :goto_23
    iput-boolean v0, p0, Lc/a/a/a/d0/a;->b:Z

    return-void
.end method
