.class public Lcom/google/android/material/imageview/ShapeableImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "ShapeableImageView.java"

# interfaces
.implements Lc/a/a/a/l0/p;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/android/material/imageview/ShapeableImageView$a;
    }
.end annotation


# static fields
.field public static final B:I


# instance fields
.field public A:Z

.field public final j:Lc/a/a/a/l0/n;

.field public final k:Landroid/graphics/RectF;

.field public final l:Landroid/graphics/RectF;

.field public final m:Landroid/graphics/Paint;

.field public final n:Landroid/graphics/Paint;

.field public final o:Landroid/graphics/Path;

.field public p:Landroid/content/res/ColorStateList;

.field public q:Lc/a/a/a/l0/h;

.field public r:Lc/a/a/a/l0/m;

.field public s:F

.field public t:Landroid/graphics/Path;

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    sget v0, Lc/a/a/a/k;->Widget_MaterialComponents_ShapeableImageView:I

    sput v0, Lcom/google/android/material/imageview/ShapeableImageView;->B:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 4

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    invoke-direct {p0, p1, v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, p2, v0}, Lcom/google/android/material/imageview/ShapeableImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 9

    .line 3
    sget v0, Lcom/google/android/material/imageview/ShapeableImageView;->B:I

    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/q0/a/a;->b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;

    move-result-object p1

    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    invoke-static {}, Lc/a/a/a/l0/n;->a()Lc/a/a/a/l0/n;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->j:Lc/a/a/a/l0/n;

    .line 5
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->o:Landroid/graphics/Path;

    const/4 p1, 0x0

    .line 6
    iput-boolean p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->A:Z

    .line 7
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    .line 8
    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->n:Landroid/graphics/Paint;

    const/4 v2, 0x1

    .line 9
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    iget-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->n:Landroid/graphics/Paint;

    const/4 v3, -0x1

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    iget-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->n:Landroid/graphics/Paint;

    new-instance v3, Landroid/graphics/PorterDuffXfermode;

    sget-object v4, Landroid/graphics/PorterDuff$Mode;->DST_OUT:Landroid/graphics/PorterDuff$Mode;

    invoke-direct {v3, v4}, Landroid/graphics/PorterDuffXfermode;-><init>(Landroid/graphics/PorterDuff$Mode;)V

    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setXfermode(Landroid/graphics/Xfermode;)Landroid/graphics/Xfermode;

    .line 12
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->k:Landroid/graphics/RectF;

    .line 13
    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->l:Landroid/graphics/RectF;

    .line 14
    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->t:Landroid/graphics/Path;

    .line 15
    sget-object v1, Lc/a/a/a/l;->ShapeableImageView:[I

    sget v3, Lcom/google/android/material/imageview/ShapeableImageView;->B:I

    .line 16
    invoke-virtual {v0, p2, v1, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    .line 17
    sget v3, Lc/a/a/a/l;->ShapeableImageView_strokeColor:I

    .line 18
    invoke-static {v0, v1, v3}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, p0, Lcom/google/android/material/imageview/ShapeableImageView;->p:Landroid/content/res/ColorStateList;

    .line 19
    sget v3, Lc/a/a/a/l;->ShapeableImageView_strokeWidth:I

    invoke-virtual {v1, v3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    int-to-float v3, v3

    iput v3, p0, Lcom/google/android/material/imageview/ShapeableImageView;->s:F

    .line 20
    sget v3, Lc/a/a/a/l;->ShapeableImageView_contentPadding:I

    .line 21
    invoke-virtual {v1, v3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    .line 22
    iput p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->u:I

    .line 23
    iput p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->v:I

    .line 24
    iput p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->w:I

    .line 25
    iput p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->x:I

    .line 26
    sget v3, Lc/a/a/a/l;->ShapeableImageView_contentPaddingLeft:I

    invoke-virtual {v1, v3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/imageview/ShapeableImageView;->u:I

    .line 27
    sget v3, Lc/a/a/a/l;->ShapeableImageView_contentPaddingTop:I

    invoke-virtual {v1, v3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/imageview/ShapeableImageView;->v:I

    .line 28
    sget v3, Lc/a/a/a/l;->ShapeableImageView_contentPaddingRight:I

    invoke-virtual {v1, v3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, p0, Lcom/google/android/material/imageview/ShapeableImageView;->w:I

    .line 29
    sget v3, Lc/a/a/a/l;->ShapeableImageView_contentPaddingBottom:I

    invoke-virtual {v1, v3, p1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->x:I

    .line 30
    sget p1, Lc/a/a/a/l;->ShapeableImageView_contentPaddingStart:I

    const/high16 v3, -0x80000000

    invoke-virtual {v1, p1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->y:I

    .line 31
    sget p1, Lc/a/a/a/l;->ShapeableImageView_contentPaddingEnd:I

    invoke-virtual {v1, p1, v3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p1

    iput p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->z:I

    .line 32
    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    .line 33
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->m:Landroid/graphics/Paint;

    .line 34
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    iget-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->m:Landroid/graphics/Paint;

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 36
    sget p1, Lcom/google/android/material/imageview/ShapeableImageView;->B:I

    .line 37
    invoke-static {v0, p2, p3, p1}, Lc/a/a/a/l0/m;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/l0/m$b;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    iput-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->r:Lc/a/a/a/l0/m;

    .line 38
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x15

    if-lt p1, p2, :cond_d6

    .line 39
    new-instance p1, Lcom/google/android/material/imageview/ShapeableImageView$a;

    invoke-direct {p1, p0}, Lcom/google/android/material/imageview/ShapeableImageView$a;-><init>(Lcom/google/android/material/imageview/ShapeableImageView;)V

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    :cond_d6
    return-void
.end method

.method public static synthetic a(Lcom/google/android/material/imageview/ShapeableImageView;Lc/a/a/a/l0/h;)Lc/a/a/a/l0/h;
    .registers 2

    .line 2
    iput-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->q:Lc/a/a/a/l0/h;

    return-object p1
.end method

.method public static synthetic a(Lcom/google/android/material/imageview/ShapeableImageView;)Lc/a/a/a/l0/m;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->r:Lc/a/a/a/l0/m;

    return-object p0
.end method

.method public static synthetic b(Lcom/google/android/material/imageview/ShapeableImageView;)Lc/a/a/a/l0/h;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->q:Lc/a/a/a/l0/h;

    return-object p0
.end method

.method public static synthetic c(Lcom/google/android/material/imageview/ShapeableImageView;)Landroid/graphics/RectF;
    .registers 1

    .line 1
    iget-object p0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->k:Landroid/graphics/RectF;

    return-object p0
.end method


# virtual methods
.method public final a(II)V
    .registers 8

    .line 3
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->k:Landroid/graphics/RectF;

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getPaddingLeft()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getPaddingTop()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getPaddingRight()I

    move-result v3

    sub-int v3, p1, v3

    int-to-float v3, v3

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getPaddingBottom()I

    move-result v4

    sub-int v4, p2, v4

    int-to-float v4, v4

    .line 5
    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 6
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->j:Lc/a/a/a/l0/n;

    iget-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->r:Lc/a/a/a/l0/m;

    iget-object v2, p0, Lcom/google/android/material/imageview/ShapeableImageView;->k:Landroid/graphics/RectF;

    iget-object v3, p0, Lcom/google/android/material/imageview/ShapeableImageView;->o:Landroid/graphics/Path;

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-virtual {v0, v1, v4, v2, v3}, Lc/a/a/a/l0/n;->a(Lc/a/a/a/l0/m;FLandroid/graphics/RectF;Landroid/graphics/Path;)V

    .line 7
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->t:Landroid/graphics/Path;

    invoke-virtual {v0}, Landroid/graphics/Path;->rewind()V

    .line 8
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->t:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->o:Landroid/graphics/Path;

    invoke-virtual {v0, v1}, Landroid/graphics/Path;->addPath(Landroid/graphics/Path;)V

    .line 9
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->l:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float p2, p2

    const/4 v1, 0x0

    invoke-virtual {v0, v1, v1, p1, p2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 10
    iget-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->t:Landroid/graphics/Path;

    iget-object p2, p0, Lcom/google/android/material/imageview/ShapeableImageView;->l:Landroid/graphics/RectF;

    sget-object v0, Landroid/graphics/Path$Direction;->CCW:Landroid/graphics/Path$Direction;

    invoke-virtual {p1, p2, v0}, Landroid/graphics/Path;->addRect(Landroid/graphics/RectF;Landroid/graphics/Path$Direction;)V

    return-void
.end method

.method public final a(Landroid/graphics/Canvas;)V
    .registers 5

    .line 11
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->p:Landroid/content/res/ColorStateList;

    if-nez v0, :cond_5

    return-void

    .line 12
    :cond_5
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->m:Landroid/graphics/Paint;

    iget v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->s:F

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 13
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->p:Landroid/content/res/ColorStateList;

    .line 14
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawableState()[I

    move-result-object v1

    iget-object v2, p0, Lcom/google/android/material/imageview/ShapeableImageView;->p:Landroid/content/res/ColorStateList;

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    invoke-virtual {v0, v1, v2}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result v0

    .line 15
    iget v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->s:F

    const/4 v2, 0x0

    cmpl-float v1, v1, v2

    if-lez v1, :cond_31

    if-eqz v0, :cond_31

    .line 16
    iget-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->m:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 17
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->o:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->m:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    :cond_31
    return-void
.end method

.method public final c()Z
    .registers 3

    .line 2
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->y:I

    const/high16 v1, -0x80000000

    if-ne v0, v1, :cond_d

    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->z:I

    if-eq v0, v1, :cond_b

    goto :goto_d

    :cond_b
    const/4 v0, 0x0

    goto :goto_e

    :cond_d
    :goto_d
    const/4 v0, 0x1

    :goto_e
    return v0
.end method

.method public final d()Z
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/4 v1, 0x1

    const/16 v2, 0x11

    if-lt v0, v2, :cond_e

    invoke-virtual {p0}, Landroid/widget/ImageView;->getLayoutDirection()I

    move-result v0

    if-ne v0, v1, :cond_e

    goto :goto_f

    :cond_e
    const/4 v1, 0x0

    :goto_f
    return v1
.end method

.method public getContentPaddingBottom()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->x:I

    return v0
.end method

.method public final getContentPaddingEnd()I
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->z:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_7

    return v0

    .line 2
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->d()Z

    move-result v0

    if-eqz v0, :cond_10

    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->u:I

    goto :goto_12

    :cond_10
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->w:I

    :goto_12
    return v0
.end method

.method public getContentPaddingLeft()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->c()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->d()Z

    move-result v0

    const/high16 v1, -0x80000000

    if-eqz v0, :cond_13

    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->z:I

    if-eq v0, v1, :cond_13

    return v0

    .line 3
    :cond_13
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->d()Z

    move-result v0

    if-nez v0, :cond_1e

    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->y:I

    if-eq v0, v1, :cond_1e

    return v0

    .line 4
    :cond_1e
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->u:I

    return v0
.end method

.method public getContentPaddingRight()I
    .registers 3

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->c()Z

    move-result v0

    if-eqz v0, :cond_1e

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->d()Z

    move-result v0

    const/high16 v1, -0x80000000

    if-eqz v0, :cond_13

    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->y:I

    if-eq v0, v1, :cond_13

    return v0

    .line 3
    :cond_13
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->d()Z

    move-result v0

    if-nez v0, :cond_1e

    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->z:I

    if-eq v0, v1, :cond_1e

    return v0

    .line 4
    :cond_1e
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->w:I

    return v0
.end method

.method public final getContentPaddingStart()I
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->y:I

    const/high16 v1, -0x80000000

    if-eq v0, v1, :cond_7

    return v0

    .line 2
    :cond_7
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->d()Z

    move-result v0

    if-eqz v0, :cond_10

    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->w:I

    goto :goto_12

    :cond_10
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->u:I

    :goto_12
    return v0
.end method

.method public getContentPaddingTop()I
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->v:I

    return v0
.end method

.method public getPaddingBottom()I
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingBottom()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getPaddingEnd()I
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingEnd()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingEnd()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getPaddingLeft()I
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingLeft()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getPaddingRight()I
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingRight()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getPaddingStart()I
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingStart()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingStart()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getPaddingTop()I
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result v0

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingTop()I

    move-result v1

    sub-int/2addr v0, v1

    return v0
.end method

.method public getShapeAppearanceModel()Lc/a/a/a/l0/m;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->r:Lc/a/a/a/l0/m;

    return-object v0
.end method

.method public getStrokeColor()Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->p:Landroid/content/res/ColorStateList;

    return-object v0
.end method

.method public getStrokeWidth()F
    .registers 2

    .line 1
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->s:F

    return v0
.end method

.method public onAttachedToWindow()V
    .registers 3

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->onAttachedToWindow()V

    const/4 v0, 0x2

    const/4 v1, 0x0

    .line 2
    invoke-virtual {p0, v0, v1}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    return-void
.end method

.method public onDetachedFromWindow()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 1
    invoke-virtual {p0, v0, v1}, Landroid/widget/ImageView;->setLayerType(ILandroid/graphics/Paint;)V

    .line 2
    invoke-super {p0}, Landroid/widget/ImageView;->onDetachedFromWindow()V

    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .registers 4

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->t:Landroid/graphics/Path;

    iget-object v1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->n:Landroid/graphics/Paint;

    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 3
    invoke-virtual {p0, p1}, Lcom/google/android/material/imageview/ShapeableImageView;->a(Landroid/graphics/Canvas;)V

    return-void
.end method

.method public onMeasure(II)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 2
    iget-boolean p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->A:Z

    if-eqz p1, :cond_8

    return-void

    .line 3
    :cond_8
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x13

    if-le p1, p2, :cond_15

    invoke-virtual {p0}, Landroid/widget/ImageView;->isLayoutDirectionResolved()Z

    move-result p1

    if-nez p1, :cond_15

    return-void

    :cond_15
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->A:Z

    .line 5
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 p2, 0x15

    if-lt p1, p2, :cond_3e

    invoke-virtual {p0}, Landroid/widget/ImageView;->isPaddingRelative()Z

    move-result p1

    if-nez p1, :cond_2a

    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->c()Z

    move-result p1

    if-eqz p1, :cond_3e

    .line 6
    :cond_2a
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingStart()I

    move-result p1

    .line 7
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result p2

    .line 8
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingEnd()I

    move-result v0

    .line 9
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v1

    .line 10
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setPaddingRelative(IIII)V

    return-void

    .line 11
    :cond_3e
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingLeft()I

    move-result p1

    .line 12
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingTop()I

    move-result p2

    .line 13
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingRight()I

    move-result v0

    .line 14
    invoke-super {p0}, Landroid/widget/ImageView;->getPaddingBottom()I

    move-result v1

    .line 15
    invoke-virtual {p0, p1, p2, v0, v1}, Lcom/google/android/material/imageview/ShapeableImageView;->setPadding(IIII)V

    return-void
.end method

.method public onSizeChanged(IIII)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;->onSizeChanged(IIII)V

    .line 2
    invoke-virtual {p0, p1, p2}, Lcom/google/android/material/imageview/ShapeableImageView;->a(II)V

    return-void
.end method

.method public setPadding(IIII)V
    .registers 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingLeft()I

    move-result v0

    add-int/2addr p1, v0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingTop()I

    move-result v0

    add-int/2addr p2, v0

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingRight()I

    move-result v0

    add-int/2addr p3, v0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingBottom()I

    move-result v0

    add-int/2addr p4, v0

    .line 5
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;->setPadding(IIII)V

    return-void
.end method

.method public setPaddingRelative(IIII)V
    .registers 6

    .line 1
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingStart()I

    move-result v0

    add-int/2addr p1, v0

    .line 2
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingTop()I

    move-result v0

    add-int/2addr p2, v0

    .line 3
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingEnd()I

    move-result v0

    add-int/2addr p3, v0

    .line 4
    invoke-virtual {p0}, Lcom/google/android/material/imageview/ShapeableImageView;->getContentPaddingBottom()I

    move-result v0

    add-int/2addr p4, v0

    .line 5
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/ImageView;->setPaddingRelative(IIII)V

    return-void
.end method

.method public setShapeAppearanceModel(Lc/a/a/a/l0/m;)V
    .registers 3

    .line 1
    iput-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->r:Lc/a/a/a/l0/m;

    .line 2
    iget-object v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->q:Lc/a/a/a/l0/h;

    if-eqz v0, :cond_9

    .line 3
    invoke-virtual {v0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 4
    :cond_9
    invoke-virtual {p0}, Landroid/widget/ImageView;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/widget/ImageView;->getHeight()I

    move-result v0

    invoke-virtual {p0, p1, v0}, Lcom/google/android/material/imageview/ShapeableImageView;->a(II)V

    .line 5
    invoke-virtual {p0}, Landroid/widget/ImageView;->invalidate()V

    .line 6
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x15

    if-lt p1, v0, :cond_20

    .line 7
    invoke-virtual {p0}, Landroid/widget/ImageView;->invalidateOutline()V

    :cond_20
    return-void
.end method

.method public setStrokeColor(Landroid/content/res/ColorStateList;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->p:Landroid/content/res/ColorStateList;

    .line 2
    invoke-virtual {p0}, Landroid/widget/ImageView;->invalidate()V

    return-void
.end method

.method public setStrokeColorResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p1}, Lb/b/l/a/a;->b(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/imageview/ShapeableImageView;->setStrokeColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setStrokeWidth(F)V
    .registers 3

    .line 1
    iget v0, p0, Lcom/google/android/material/imageview/ShapeableImageView;->s:F

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_b

    .line 2
    iput p1, p0, Lcom/google/android/material/imageview/ShapeableImageView;->s:F

    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageView;->invalidate()V

    :cond_b
    return-void
.end method

.method public setStrokeWidthResource(I)V
    .registers 3

    .line 1
    invoke-virtual {p0}, Landroid/widget/ImageView;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0, p1}, Lcom/google/android/material/imageview/ShapeableImageView;->setStrokeWidth(F)V

    return-void
.end method
