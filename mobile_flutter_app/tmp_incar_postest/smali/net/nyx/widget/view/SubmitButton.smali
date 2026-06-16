.class public final Lnet/nyx/widget/view/SubmitButton;
.super Landroidx/appcompat/widget/AppCompatButton;
.source "SubmitButton.java"


# instance fields
.field public A:Landroid/graphics/Path;

.field public B:Landroid/graphics/PathMeasure;

.field public C:Landroid/graphics/Path;

.field public D:Landroid/graphics/RectF;

.field public E:Landroid/graphics/RectF;

.field public F:Landroid/graphics/RectF;

.field public G:F

.field public H:Landroid/animation/ValueAnimator;

.field public I:Landroid/animation/ValueAnimator;

.field public J:Landroid/animation/ValueAnimator;

.field public K:Z

.field public L:Z

.field public j:I

.field public final k:I

.field public l:F

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public final s:I

.field public final t:I

.field public final u:I

.field public v:Landroid/graphics/Paint;

.field public w:Landroid/graphics/Paint;

.field public x:Landroid/graphics/Paint;

.field public y:Landroid/graphics/Path;

.field public z:Landroid/graphics/Path;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Lnet/nyx/widget/view/SubmitButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lnet/nyx/widget/view/SubmitButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 7

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 v0, 0x0

    .line 4
    iput v0, p0, Lnet/nyx/widget/view/SubmitButton;->j:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    .line 5
    invoke-virtual {p0, v1, v2}, Landroid/widget/Button;->setLayerType(ILandroid/graphics/Paint;)V

    .line 6
    sget-object v1, Ld/a/d/f;->SubmitButton:[I

    invoke-virtual {p1, p2, v1, p3, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 7
    sget p2, Ld/a/d/f;->SubmitButton_progressColor:I

    invoke-direct {p0}, Lnet/nyx/widget/view/SubmitButton;->getAccentColor()I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/SubmitButton;->s:I

    .line 8
    sget p2, Ld/a/d/f;->SubmitButton_succeedColor:I

    const-string p3, "#19CC95"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/SubmitButton;->t:I

    .line 9
    sget p2, Ld/a/d/f;->SubmitButton_errorColor:I

    const-string p3, "#FC8E34"

    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result p3

    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/SubmitButton;->u:I

    .line 10
    sget p2, Ld/a/d/f;->SubmitButton_progressStyle:I

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p2

    iput p2, p0, Lnet/nyx/widget/view/SubmitButton;->k:I

    .line 11
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 12
    invoke-virtual {p0}, Lnet/nyx/widget/view/SubmitButton;->a()V

    .line 13
    invoke-virtual {p0}, Lnet/nyx/widget/view/SubmitButton;->b()V

    return-void
.end method

.method public static synthetic a(Lnet/nyx/widget/view/SubmitButton;)Z
    .registers 1

    .line 1
    iget-boolean p0, p0, Lnet/nyx/widget/view/SubmitButton;->K:Z

    return p0
.end method

.method public static synthetic b(Lnet/nyx/widget/view/SubmitButton;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/view/SubmitButton;->d()V

    return-void
.end method

.method public static synthetic c(Lnet/nyx/widget/view/SubmitButton;)V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lnet/nyx/widget/view/SubmitButton;->c()V

    return-void
.end method

.method private getAccentColor()I
    .registers 5

    .line 1
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 2
    invoke-virtual {p0}, Landroid/widget/Button;->getContext()Landroid/content/Context;

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
.method public final a()V
    .registers 2

    .line 2
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    .line 3
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->w:Landroid/graphics/Paint;

    .line 4
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->x:Landroid/graphics/Paint;

    .line 5
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->y:Landroid/graphics/Path;

    .line 6
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->z:Landroid/graphics/Path;

    .line 7
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    .line 8
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->A:Landroid/graphics/Path;

    .line 9
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->E:Landroid/graphics/RectF;

    .line 10
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->D:Landroid/graphics/RectF;

    .line 11
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->F:Landroid/graphics/RectF;

    .line 12
    new-instance v0, Landroid/graphics/PathMeasure;

    invoke-direct {v0}, Landroid/graphics/PathMeasure;-><init>()V

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->B:Landroid/graphics/PathMeasure;

    return-void
.end method

.method public synthetic a(Landroid/animation/ValueAnimator;)V
    .registers 2

    .line 29
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iput p1, p0, Lnet/nyx/widget/view/SubmitButton;->G:F

    .line 30
    invoke-virtual {p0}, Landroid/widget/Button;->invalidate()V

    return-void
.end method

.method public final a(Landroid/graphics/Canvas;)V
    .registers 9

    .line 13
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->y:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 14
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->D:Landroid/graphics/RectF;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->m:I

    neg-int v2, v1

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    iget v4, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    neg-int v5, v4

    int-to-float v5, v5

    div-float/2addr v5, v3

    neg-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    int-to-float v6, v4

    add-float/2addr v1, v6

    int-to-float v4, v4

    div-float/2addr v4, v3

    invoke-virtual {v0, v2, v5, v1, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 15
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->y:Landroid/graphics/Path;

    iget-object v1, p0, Lnet/nyx/widget/view/SubmitButton;->D:Landroid/graphics/RectF;

    const/high16 v2, 0x43340000    # 180.0f

    const/high16 v4, 0x42b40000    # 90.0f

    invoke-virtual {v0, v1, v4, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 16
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->y:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->m:I

    int-to-float v1, v1

    div-float/2addr v1, v3

    iget v4, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    int-to-float v5, v4

    div-float/2addr v5, v3

    sub-float/2addr v1, v5

    neg-int v4, v4

    int-to-float v4, v4

    div-float/2addr v4, v3

    invoke-virtual {v0, v1, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 17
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->F:Landroid/graphics/RectF;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->m:I

    int-to-float v4, v1

    div-float/2addr v4, v3

    iget v5, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    int-to-float v6, v5

    sub-float/2addr v4, v6

    neg-int v6, v5

    int-to-float v6, v6

    div-float/2addr v6, v3

    int-to-float v1, v1

    div-float/2addr v1, v3

    int-to-float v5, v5

    div-float/2addr v5, v3

    invoke-virtual {v0, v4, v6, v1, v5}, Landroid/graphics/RectF;->set(FFFF)V

    .line 18
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->y:Landroid/graphics/Path;

    iget-object v1, p0, Lnet/nyx/widget/view/SubmitButton;->F:Landroid/graphics/RectF;

    const/high16 v4, 0x43870000    # 270.0f

    invoke-virtual {v0, v1, v4, v2}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    .line 19
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->y:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->m:I

    neg-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v3

    iget v2, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    int-to-float v4, v2

    div-float/2addr v4, v3

    add-float/2addr v1, v4

    int-to-float v2, v2

    div-float/2addr v2, v3

    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 20
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->y:Landroid/graphics/Path;

    iget-object v1, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public final a(Landroid/graphics/Canvas;Z)V
    .registers 12

    const/high16 v0, 0x40c00000    # 6.0f

    if-eqz p2, :cond_3a

    .line 21
    iget-object p2, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    neg-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    const/4 v2, 0x0

    invoke-virtual {p2, v1, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 22
    iget-object p2, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    neg-int v1, v1

    div-int/lit8 v1, v1, 0x6

    int-to-double v3, v1

    const-wide/high16 v5, 0x3ff0000000000000L    # 1.0

    const-wide/high16 v7, 0x4014000000000000L    # 5.0

    invoke-static {v7, v8}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v7

    add-double/2addr v7, v5

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    int-to-double v5, v1

    mul-double v7, v7, v5

    const-wide/high16 v5, 0x4028000000000000L    # 12.0

    div-double/2addr v7, v5

    add-double/2addr v3, v7

    double-to-float v1, v3

    invoke-virtual {p2, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 23
    iget-object p2, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    int-to-float v2, v1

    div-float/2addr v2, v0

    neg-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-virtual {p2, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    goto :goto_6a

    .line 24
    :cond_3a
    iget-object p2, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    neg-int v2, v1

    int-to-float v2, v2

    div-float/2addr v2, v0

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-virtual {p2, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 25
    iget-object p2, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    int-to-float v2, v1

    div-float/2addr v2, v0

    neg-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-virtual {p2, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 26
    iget-object p2, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    neg-int v2, v1

    int-to-float v2, v2

    div-float/2addr v2, v0

    neg-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-virtual {p2, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 27
    iget-object p2, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    int-to-float v2, v1

    div-float/2addr v2, v0

    int-to-float v1, v1

    div-float/2addr v1, v0

    invoke-virtual {p2, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 28
    :goto_6a
    iget-object p2, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->x:Landroid/graphics/Paint;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public final b()V
    .registers 5

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->s:I

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 3
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    const/high16 v1, 0x40a00000    # 5.0f

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 4
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 5
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->w:Landroid/graphics/Paint;

    iget v2, p0, Lnet/nyx/widget/view/SubmitButton;->s:I

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->w:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 7
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->w:Landroid/graphics/Paint;

    const/high16 v2, 0x41100000    # 9.0f

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 8
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->w:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 9
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->x:Landroid/graphics/Paint;

    const/4 v3, -0x1

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 10
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->x:Landroid/graphics/Paint;

    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 11
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->x:Landroid/graphics/Paint;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 12
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->x:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 13
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->x:Landroid/graphics/Paint;

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->y:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 15
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->z:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 16
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->C:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 17
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->A:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    return-void
.end method

.method public synthetic b(Landroid/animation/ValueAnimator;)V
    .registers 5

    .line 28
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lnet/nyx/widget/view/SubmitButton;->m:I

    .line 29
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->x:Landroid/graphics/Paint;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    sub-int/2addr p1, v1

    mul-int/lit16 p1, p1, 0xff

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->o:I

    iget v2, p0, Lnet/nyx/widget/view/SubmitButton;->p:I

    sub-int/2addr v1, v2

    div-int/2addr p1, v1

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 30
    iget p1, p0, Lnet/nyx/widget/view/SubmitButton;->m:I

    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    if-ne p1, v0, :cond_3c

    .line 31
    iget-boolean p1, p0, Lnet/nyx/widget/view/SubmitButton;->L:Z

    if-eqz p1, :cond_2e

    .line 32
    iget-object p1, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->t:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    goto :goto_35

    .line 33
    :cond_2e
    iget-object p1, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->u:I

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 34
    :goto_35
    iget-object p1, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    :cond_3c
    invoke-virtual {p0}, Landroid/widget/Button;->invalidate()V

    return-void
.end method

.method public final b(Landroid/graphics/Canvas;)V
    .registers 8

    .line 18
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->A:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->reset()V

    .line 19
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->E:Landroid/graphics/RectF;

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->p:I

    neg-int v2, v1

    int-to-float v2, v2

    const/high16 v3, 0x40000000    # 2.0f

    div-float/2addr v2, v3

    neg-int v4, v1

    int-to-float v4, v4

    div-float/2addr v4, v3

    int-to-float v5, v1

    div-float/2addr v5, v3

    int-to-float v1, v1

    div-float/2addr v1, v3

    invoke-virtual {v0, v2, v4, v5, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 20
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->z:Landroid/graphics/Path;

    iget-object v1, p0, Lnet/nyx/widget/view/SubmitButton;->E:Landroid/graphics/RectF;

    const/high16 v2, 0x43870000    # 270.0f

    const v4, 0x43b3ffdf    # 359.999f

    invoke-virtual {v0, v1, v2, v4}, Landroid/graphics/Path;->addArc(Landroid/graphics/RectF;FF)V

    .line 21
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->B:Landroid/graphics/PathMeasure;

    iget-object v1, p0, Lnet/nyx/widget/view/SubmitButton;->z:Landroid/graphics/Path;

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Landroid/graphics/PathMeasure;->setPath(Landroid/graphics/Path;Z)V

    .line 22
    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->k:I

    if-nez v0, :cond_47

    .line 23
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->B:Landroid/graphics/PathMeasure;

    invoke-virtual {v0}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v0

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->G:F

    mul-float v0, v0, v1

    .line 24
    iget-object v1, p0, Lnet/nyx/widget/view/SubmitButton;->B:Landroid/graphics/PathMeasure;

    invoke-virtual {v1}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v1

    div-float/2addr v1, v3

    iget v3, p0, Lnet/nyx/widget/view/SubmitButton;->G:F

    mul-float v1, v1, v3

    add-float/2addr v1, v0

    goto :goto_52

    .line 25
    :cond_47
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->B:Landroid/graphics/PathMeasure;

    invoke-virtual {v0}, Landroid/graphics/PathMeasure;->getLength()F

    move-result v0

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->l:F

    mul-float v1, v1, v0

    const/4 v0, 0x0

    .line 26
    :goto_52
    iget-object v3, p0, Lnet/nyx/widget/view/SubmitButton;->B:Landroid/graphics/PathMeasure;

    iget-object v4, p0, Lnet/nyx/widget/view/SubmitButton;->A:Landroid/graphics/Path;

    invoke-virtual {v3, v0, v1, v4, v2}, Landroid/graphics/PathMeasure;->getSegment(FFLandroid/graphics/Path;Z)Z

    .line 27
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->A:Landroid/graphics/Path;

    iget-object v1, p0, Lnet/nyx/widget/view/SubmitButton;->w:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public final c()V
    .registers 4

    const/4 v0, 0x2

    .line 7
    iput v0, p0, Lnet/nyx/widget/view/SubmitButton;->j:I

    .line 8
    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->k:I

    const/4 v2, 0x1

    if-ne v1, v2, :cond_9

    return-void

    :cond_9
    new-array v0, v0, [F

    .line 9
    fill-array-data v0, :array_30

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->I:Landroid/animation/ValueAnimator;

    .line 10
    new-instance v1, Ld/a/d/i/f;

    invoke-direct {v1, p0}, Ld/a/d/i/f;-><init>(Lnet/nyx/widget/view/SubmitButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 11
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->I:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x7d0

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 12
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->I:Landroid/animation/ValueAnimator;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 13
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->I:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void

    nop

    :array_30
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public synthetic c(Landroid/animation/ValueAnimator;)V
    .registers 3

    .line 2
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/Integer;

    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    move-result p1

    iput p1, p0, Lnet/nyx/widget/view/SubmitButton;->m:I

    .line 3
    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    if-ne p1, v0, :cond_22

    .line 4
    iget-object p1, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    const-string v0, "#DDDDDD"

    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    move-result v0

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 5
    iget-object p1, p0, Lnet/nyx/widget/view/SubmitButton;->v:Landroid/graphics/Paint;

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 6
    :cond_22
    invoke-virtual {p0}, Landroid/widget/Button;->invalidate()V

    return-void
.end method

.method public final d()V
    .registers 4

    const/4 v0, 0x3

    .line 1
    iput v0, p0, Lnet/nyx/widget/view/SubmitButton;->j:I

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->I:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_a
    const/4 v0, 0x2

    new-array v0, v0, [I

    const/4 v1, 0x0

    .line 4
    iget v2, p0, Lnet/nyx/widget/view/SubmitButton;->p:I

    aput v2, v0, v1

    const/4 v1, 0x1

    iget v2, p0, Lnet/nyx/widget/view/SubmitButton;->o:I

    aput v2, v0, v1

    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->J:Landroid/animation/ValueAnimator;

    .line 5
    new-instance v1, Ld/a/d/i/g;

    invoke-direct {v1, p0}, Ld/a/d/i/g;-><init>(Lnet/nyx/widget/view/SubmitButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 6
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->J:Landroid/animation/ValueAnimator;

    new-instance v1, Lnet/nyx/widget/view/SubmitButton$b;

    invoke-direct {v1, p0}, Lnet/nyx/widget/view/SubmitButton$b;-><init>(Lnet/nyx/widget/view/SubmitButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    .line 7
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->J:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 8
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->J:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 9
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->J:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    return-void
.end method

.method public final e()V
    .registers 5

    const/4 v0, 0x1

    .line 1
    iput v0, p0, Lnet/nyx/widget/view/SubmitButton;->j:I

    const/4 v1, 0x2

    new-array v1, v1, [I

    .line 2
    iget v2, p0, Lnet/nyx/widget/view/SubmitButton;->o:I

    const/4 v3, 0x0

    aput v2, v1, v3

    iget v2, p0, Lnet/nyx/widget/view/SubmitButton;->p:I

    aput v2, v1, v0

    invoke-static {v1}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object v0

    iput-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->H:Landroid/animation/ValueAnimator;

    .line 3
    new-instance v1, Ld/a/d/i/e;

    invoke-direct {v1, p0}, Ld/a/d/i/e;-><init>(Lnet/nyx/widget/view/SubmitButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 4
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->H:Landroid/animation/ValueAnimator;

    const-wide/16 v1, 0x12c

    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 5
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->H:Landroid/animation/ValueAnimator;

    new-instance v1, Landroid/view/animation/AccelerateInterpolator;

    invoke-direct {v1}, Landroid/view/animation/AccelerateInterpolator;-><init>()V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 6
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->H:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->start()V

    .line 7
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->H:Landroid/animation/ValueAnimator;

    new-instance v1, Lnet/nyx/widget/view/SubmitButton$a;

    invoke-direct {v1, p0}, Lnet/nyx/widget/view/SubmitButton$a;-><init>(Lnet/nyx/widget/view/SubmitButton;)V

    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addListener(Landroid/animation/Animator$AnimatorListener;)V

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 2

    .line 1
    invoke-super {p0}, Landroid/widget/Button;->onDetachedFromWindow()V

    .line 2
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->H:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_a

    .line 3
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 4
    :cond_a
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->I:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_11

    .line 5
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    :cond_11
    iget-object v0, p0, Lnet/nyx/widget/view/SubmitButton;->J:Landroid/animation/ValueAnimator;

    if-eqz v0, :cond_18

    .line 7
    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->cancel()V

    :cond_18
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 5

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->j:I

    if-eqz v0, :cond_3b

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, v1, :cond_26

    const/4 v1, 0x2

    if-eq v0, v1, :cond_26

    const/4 v1, 0x3

    if-eq v0, v1, :cond_f

    goto :goto_3e

    .line 2
    :cond_f
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 3
    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->q:I

    int-to-float v0, v0

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->r:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 4
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/SubmitButton;->a(Landroid/graphics/Canvas;)V

    .line 5
    iget-boolean v0, p0, Lnet/nyx/widget/view/SubmitButton;->L:Z

    invoke-virtual {p0, p1, v0}, Lnet/nyx/widget/view/SubmitButton;->a(Landroid/graphics/Canvas;Z)V

    goto :goto_3e

    .line 6
    :cond_26
    sget-object v0, Landroid/graphics/PorterDuff$Mode;->CLEAR:Landroid/graphics/PorterDuff$Mode;

    invoke-virtual {p1, v2, v0}, Landroid/graphics/Canvas;->drawColor(ILandroid/graphics/PorterDuff$Mode;)V

    .line 7
    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->q:I

    int-to-float v0, v0

    iget v1, p0, Lnet/nyx/widget/view/SubmitButton;->r:I

    int-to-float v1, v1

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 8
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/SubmitButton;->a(Landroid/graphics/Canvas;)V

    .line 9
    invoke-virtual {p0, p1}, Lnet/nyx/widget/view/SubmitButton;->b(Landroid/graphics/Canvas;)V

    goto :goto_3e

    .line 10
    :cond_3b
    invoke-super {p0, p1}, Landroid/widget/Button;->onDraw(Landroid/graphics/Canvas;)V

    :goto_3e
    return-void
.end method

.method public onSizeChanged(IIII)V
    .registers 9

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/Button;->onSizeChanged(IIII)V

    .line 2
    iget p3, p0, Lnet/nyx/widget/view/SubmitButton;->j:I

    const/4 p4, 0x2

    if-eq p3, p4, :cond_22

    add-int/lit8 p3, p1, -0xa

    .line 3
    iput p3, p0, Lnet/nyx/widget/view/SubmitButton;->m:I

    add-int/lit8 p4, p2, -0xa

    .line 4
    iput p4, p0, Lnet/nyx/widget/view/SubmitButton;->n:I

    int-to-double v0, p1

    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    mul-double v0, v0, v2

    double-to-int p1, v0

    .line 5
    iput p1, p0, Lnet/nyx/widget/view/SubmitButton;->q:I

    int-to-double p1, p2

    mul-double p1, p1, v2

    double-to-int p1, p1

    .line 6
    iput p1, p0, Lnet/nyx/widget/view/SubmitButton;->r:I

    .line 7
    iput p3, p0, Lnet/nyx/widget/view/SubmitButton;->o:I

    .line 8
    iput p4, p0, Lnet/nyx/widget/view/SubmitButton;->p:I

    :cond_22
    return-void
.end method

.method public performClick()Z
    .registers 2

    .line 1
    iget v0, p0, Lnet/nyx/widget/view/SubmitButton;->j:I

    if-nez v0, :cond_c

    .line 2
    invoke-virtual {p0}, Lnet/nyx/widget/view/SubmitButton;->e()V

    .line 3
    invoke-super {p0}, Landroid/widget/Button;->performClick()Z

    move-result v0

    return v0

    :cond_c
    const/4 v0, 0x1

    return v0
.end method

.method public setProgress(F)V
    .registers 3

    .line 1
    iput p1, p0, Lnet/nyx/widget/view/SubmitButton;->l:F

    .line 2
    iget p1, p0, Lnet/nyx/widget/view/SubmitButton;->k:I

    const/4 v0, 0x1

    if-ne p1, v0, :cond_f

    iget p1, p0, Lnet/nyx/widget/view/SubmitButton;->j:I

    const/4 v0, 0x2

    if-ne p1, v0, :cond_f

    .line 3
    invoke-virtual {p0}, Landroid/widget/Button;->invalidate()V

    :cond_f
    return-void
.end method
