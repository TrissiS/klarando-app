.class public Lc/a/a/a/s0/a;
.super Lc/a/a/a/l0/h;
.source "TooltipDrawable.java"

# interfaces
.implements Lc/a/a/a/d0/j$b;


# instance fields
.field public F:Ljava/lang/CharSequence;

.field public final G:Landroid/content/Context;

.field public final H:Landroid/graphics/Paint$FontMetrics;

.field public final I:Lc/a/a/a/d0/j;

.field public final J:Landroid/view/View$OnLayoutChangeListener;

.field public final K:Landroid/graphics/Rect;

.field public L:I

.field public M:I

.field public N:I

.field public O:I

.field public P:I

.field public Q:I

.field public R:F

.field public S:F

.field public T:F

.field public U:F


# direct methods
.method public static constructor <clinit>()V
    .registers 0

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 5

    .line 1
    invoke-direct {p0, p1, p2, p3, p4}, Lc/a/a/a/l0/h;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 2
    new-instance p2, Landroid/graphics/Paint$FontMetrics;

    invoke-direct {p2}, Landroid/graphics/Paint$FontMetrics;-><init>()V

    iput-object p2, p0, Lc/a/a/a/s0/a;->H:Landroid/graphics/Paint$FontMetrics;

    .line 3
    new-instance p2, Lc/a/a/a/d0/j;

    invoke-direct {p2, p0}, Lc/a/a/a/d0/j;-><init>(Lc/a/a/a/d0/j$b;)V

    iput-object p2, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    .line 4
    new-instance p2, Lc/a/a/a/s0/a$a;

    invoke-direct {p2, p0}, Lc/a/a/a/s0/a$a;-><init>(Lc/a/a/a/s0/a;)V

    iput-object p2, p0, Lc/a/a/a/s0/a;->J:Landroid/view/View$OnLayoutChangeListener;

    .line 5
    new-instance p2, Landroid/graphics/Rect;

    invoke-direct {p2}, Landroid/graphics/Rect;-><init>()V

    iput-object p2, p0, Lc/a/a/a/s0/a;->K:Landroid/graphics/Rect;

    const/high16 p2, 0x3f800000    # 1.0f

    .line 6
    iput p2, p0, Lc/a/a/a/s0/a;->R:F

    .line 7
    iput p2, p0, Lc/a/a/a/s0/a;->S:F

    const/high16 p3, 0x3f000000    # 0.5f

    .line 8
    iput p3, p0, Lc/a/a/a/s0/a;->T:F

    .line 9
    iput p2, p0, Lc/a/a/a/s0/a;->U:F

    .line 10
    iput-object p1, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    .line 11
    iget-object p2, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-virtual {p2}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object p2

    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    iput p1, p2, Landroid/text/TextPaint;->density:F

    .line 12
    iget-object p1, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-virtual {p1}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object p1

    sget-object p2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {p1, p2}, Landroid/text/TextPaint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/util/AttributeSet;II)Lc/a/a/a/s0/a;
    .registers 5

    .line 2
    new-instance v0, Lc/a/a/a/s0/a;

    invoke-direct {v0, p0, p1, p2, p3}, Lc/a/a/a/s0/a;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V

    .line 3
    invoke-virtual {v0, p1, p2, p3}, Lc/a/a/a/s0/a;->a(Landroid/util/AttributeSet;II)V

    return-object v0
.end method

.method public static synthetic a(Lc/a/a/a/s0/a;Landroid/view/View;)V
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/s0/a;->c(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final F()F
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/s0/a;->K:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->Q:I

    sub-int/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->O:I

    sub-int/2addr v0, v1

    if-gez v0, :cond_26

    .line 2
    iget-object v0, p0, Lc/a/a/a/s0/a;->K:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->right:I

    sub-int/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->Q:I

    sub-int/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->O:I

    sub-int/2addr v0, v1

    :goto_24
    int-to-float v0, v0

    goto :goto_4c

    .line 3
    :cond_26
    iget-object v0, p0, Lc/a/a/a/s0/a;->K:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->Q:I

    sub-int/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->O:I

    add-int/2addr v0, v1

    if-lez v0, :cond_4b

    .line 4
    iget-object v0, p0, Lc/a/a/a/s0/a;->K:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    iget v1, v1, Landroid/graphics/Rect;->left:I

    sub-int/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->Q:I

    sub-int/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->O:I

    add-int/2addr v0, v1

    goto :goto_24

    :cond_4b
    const/4 v0, 0x0

    :goto_4c
    return v0
.end method

.method public final G()F
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-virtual {v0}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object v0

    iget-object v1, p0, Lc/a/a/a/s0/a;->H:Landroid/graphics/Paint$FontMetrics;

    invoke-virtual {v0, v1}, Landroid/text/TextPaint;->getFontMetrics(Landroid/graphics/Paint$FontMetrics;)F

    .line 2
    iget-object v0, p0, Lc/a/a/a/s0/a;->H:Landroid/graphics/Paint$FontMetrics;

    iget v1, v0, Landroid/graphics/Paint$FontMetrics;->descent:F

    iget v0, v0, Landroid/graphics/Paint$FontMetrics;->ascent:F

    add-float/2addr v1, v0

    const/high16 v0, 0x40000000    # 2.0f

    div-float/2addr v1, v0

    return v1
.end method

.method public final H()Lc/a/a/a/l0/f;
    .registers 8

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/s0/a;->F()F

    move-result v0

    neg-float v0, v0

    .line 2
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v1

    int-to-double v1, v1

    iget v3, p0, Lc/a/a/a/s0/a;->P:I

    int-to-double v3, v3

    const-wide/high16 v5, 0x4000000000000000L    # 2.0

    invoke-static {v5, v6}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v5

    mul-double v3, v3, v5

    sub-double/2addr v1, v3

    double-to-float v1, v1

    const/high16 v2, 0x40000000    # 2.0f

    div-float/2addr v1, v2

    neg-float v2, v1

    .line 3
    invoke-static {v0, v2}, Ljava/lang/Math;->max(FF)F

    move-result v0

    .line 4
    invoke-static {v0, v1}, Ljava/lang/Math;->min(FF)F

    move-result v0

    .line 5
    new-instance v1, Lc/a/a/a/l0/j;

    new-instance v2, Lc/a/a/a/l0/g;

    iget v3, p0, Lc/a/a/a/s0/a;->P:I

    int-to-float v3, v3

    invoke-direct {v2, v3}, Lc/a/a/a/l0/g;-><init>(F)V

    invoke-direct {v1, v2, v0}, Lc/a/a/a/l0/j;-><init>(Lc/a/a/a/l0/f;F)V

    return-object v1
.end method

.method public final I()F
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/s0/a;->F:Ljava/lang/CharSequence;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    iget-object v1, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-interface {v0}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lc/a/a/a/d0/j;->a(Ljava/lang/String;)F

    move-result v0

    return v0
.end method

.method public final a(Landroid/graphics/Rect;)F
    .registers 3

    .line 43
    invoke-virtual {p1}, Landroid/graphics/Rect;->centerY()I

    move-result p1

    int-to-float p1, p1

    invoke-virtual {p0}, Lc/a/a/a/s0/a;->G()F

    move-result v0

    sub-float/2addr p1, v0

    return p1
.end method

.method public a()V
    .registers 1

    .line 42
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    return-void
.end method

.method public final a(Landroid/util/AttributeSet;II)V
    .registers 11

    .line 4
    iget-object v0, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    sget-object v2, Lc/a/a/a/l;->Tooltip:[I

    const/4 v6, 0x0

    new-array v5, v6, [I

    move-object v1, p1

    move v3, p2

    move v4, p3

    .line 5
    invoke-static/range {v0 .. v5}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 6
    iget-object p2, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    sget p3, Lc/a/a/a/d;->mtrl_tooltip_arrowSize:I

    invoke-virtual {p2, p3}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p2

    iput p2, p0, Lc/a/a/a/s0/a;->P:I

    .line 7
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object p2

    invoke-virtual {p2}, Lc/a/a/a/l0/m;->m()Lc/a/a/a/l0/m$b;

    move-result-object p2

    invoke-virtual {p0}, Lc/a/a/a/s0/a;->H()Lc/a/a/a/l0/f;

    move-result-object p3

    invoke-virtual {p2, p3}, Lc/a/a/a/l0/m$b;->a(Lc/a/a/a/l0/f;)Lc/a/a/a/l0/m$b;

    invoke-virtual {p2}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p2

    .line 8
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    .line 9
    sget p2, Lc/a/a/a/l;->Tooltip_android_text:I

    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getText(I)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-virtual {p0, p2}, Lc/a/a/a/s0/a;->a(Ljava/lang/CharSequence;)V

    .line 10
    iget-object p2, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    sget p3, Lc/a/a/a/l;->Tooltip_android_textAppearance:I

    .line 11
    invoke-static {p2, p1, p3}, Lc/a/a/a/i0/c;->c(Landroid/content/Context;Landroid/content/res/TypedArray;I)Lc/a/a/a/i0/d;

    move-result-object p2

    .line 12
    invoke-virtual {p0, p2}, Lc/a/a/a/s0/a;->a(Lc/a/a/a/i0/d;)V

    .line 13
    iget-object p2, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    sget p3, Lc/a/a/a/b;->colorOnBackground:I

    const-class v0, Lc/a/a/a/s0/a;

    .line 14
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    .line 15
    invoke-static {p2, p3, v0}, Lc/a/a/a/w/a;->a(Landroid/content/Context;ILjava/lang/String;)I

    move-result p2

    .line 16
    iget-object p3, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    const-class v0, Lc/a/a/a/s0/a;

    .line 17
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    const v1, 0x1010031

    .line 18
    invoke-static {p3, v1, v0}, Lc/a/a/a/w/a;->a(Landroid/content/Context;ILjava/lang/String;)I

    move-result p3

    const/16 v0, 0xe5

    .line 19
    invoke-static {p3, v0}, Lb/h/f/a;->c(II)I

    move-result p3

    const/16 v0, 0x99

    .line 20
    invoke-static {p2, v0}, Lb/h/f/a;->c(II)I

    move-result p2

    .line 21
    invoke-static {p3, p2}, Lc/a/a/a/w/a;->b(II)I

    move-result p2

    .line 22
    sget p3, Lc/a/a/a/l;->Tooltip_backgroundTint:I

    .line 23
    invoke-virtual {p1, p3, p2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    .line 24
    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    .line 25
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/h;->a(Landroid/content/res/ColorStateList;)V

    .line 26
    iget-object p2, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    sget p3, Lc/a/a/a/b;->colorSurface:I

    const-class v0, Lc/a/a/a/s0/a;

    .line 27
    invoke-virtual {v0}, Ljava/lang/Class;->getCanonicalName()Ljava/lang/String;

    move-result-object v0

    .line 28
    invoke-static {p2, p3, v0}, Lc/a/a/a/w/a;->a(Landroid/content/Context;ILjava/lang/String;)I

    move-result p2

    .line 29
    invoke-static {p2}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p2

    .line 30
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/h;->b(Landroid/content/res/ColorStateList;)V

    .line 31
    sget p2, Lc/a/a/a/l;->Tooltip_android_padding:I

    invoke-virtual {p1, p2, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lc/a/a/a/s0/a;->L:I

    .line 32
    sget p2, Lc/a/a/a/l;->Tooltip_android_minWidth:I

    invoke-virtual {p1, p2, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lc/a/a/a/s0/a;->M:I

    .line 33
    sget p2, Lc/a/a/a/l;->Tooltip_android_minHeight:I

    invoke-virtual {p1, p2, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lc/a/a/a/s0/a;->N:I

    .line 34
    sget p2, Lc/a/a/a/l;->Tooltip_android_layout_margin:I

    invoke-virtual {p1, p2, v6}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p2

    iput p2, p0, Lc/a/a/a/s0/a;->O:I

    .line 35
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method

.method public a(Landroid/view/View;)V
    .registers 3

    if-nez p1, :cond_3

    return-void

    .line 41
    :cond_3
    iget-object v0, p0, Lc/a/a/a/s0/a;->J:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->removeOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public a(Lc/a/a/a/i0/d;)V
    .registers 4

    .line 40
    iget-object v0, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    iget-object v1, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    invoke-virtual {v0, p1, v1}, Lc/a/a/a/d0/j;->a(Lc/a/a/a/i0/d;Landroid/content/Context;)V

    return-void
.end method

.method public a(Ljava/lang/CharSequence;)V
    .registers 3

    .line 36
    iget-object v0, p0, Lc/a/a/a/s0/a;->F:Ljava/lang/CharSequence;

    invoke-static {v0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_13

    .line 37
    iput-object p1, p0, Lc/a/a/a/s0/a;->F:Ljava/lang/CharSequence;

    .line 38
    iget-object p1, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    const/4 v0, 0x1

    invoke-virtual {p1, v0}, Lc/a/a/a/d0/j;->a(Z)V

    .line 39
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    :cond_13
    return-void
.end method

.method public b(Landroid/view/View;)V
    .registers 3

    if-nez p1, :cond_3

    return-void

    .line 1
    :cond_3
    invoke-virtual {p0, p1}, Lc/a/a/a/s0/a;->c(Landroid/view/View;)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/s0/a;->J:Landroid/view/View$OnLayoutChangeListener;

    invoke-virtual {p1, v0}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public final c(Landroid/view/View;)V
    .registers 4

    const/4 v0, 0x2

    new-array v0, v0, [I

    .line 1
    invoke-virtual {p1, v0}, Landroid/view/View;->getLocationOnScreen([I)V

    const/4 v1, 0x0

    .line 2
    aget v0, v0, v1

    iput v0, p0, Lc/a/a/a/s0/a;->Q:I

    .line 3
    iget-object v0, p0, Lc/a/a/a/s0/a;->K:Landroid/graphics/Rect;

    invoke-virtual {p1, v0}, Landroid/view/View;->getWindowVisibleDisplayFrame(Landroid/graphics/Rect;)V

    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 10

    .line 1
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/s0/a;->F()F

    move-result v0

    .line 3
    iget v1, p0, Lc/a/a/a/s0/a;->P:I

    int-to-double v1, v1

    const-wide/high16 v3, 0x4000000000000000L    # 2.0

    invoke-static {v3, v4}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v3

    mul-double v1, v1, v3

    iget v3, p0, Lc/a/a/a/s0/a;->P:I

    int-to-double v3, v3

    sub-double/2addr v1, v3

    neg-double v1, v1

    double-to-float v1, v1

    .line 4
    iget v2, p0, Lc/a/a/a/s0/a;->R:F

    iget v3, p0, Lc/a/a/a/s0/a;->S:F

    .line 5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    invoke-virtual {v5}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    const/high16 v6, 0x3f000000    # 0.5f

    mul-float v5, v5, v6

    add-float/2addr v4, v5

    .line 6
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    iget v7, p0, Lc/a/a/a/s0/a;->T:F

    mul-float v6, v6, v7

    add-float/2addr v5, v6

    .line 7
    invoke-virtual {p1, v2, v3, v4, v5}, Landroid/graphics/Canvas;->scale(FFFF)V

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 9
    invoke-super {p0, p1}, Lc/a/a/a/l0/h;->draw(Landroid/graphics/Canvas;)V

    .line 10
    invoke-virtual {p0, p1}, Lc/a/a/a/s0/a;->f(Landroid/graphics/Canvas;)V

    .line 11
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public f(F)V
    .registers 5

    const v0, 0x3f99999a    # 1.2f

    .line 1
    iput v0, p0, Lc/a/a/a/s0/a;->T:F

    .line 2
    iput p1, p0, Lc/a/a/a/s0/a;->R:F

    .line 3
    iput p1, p0, Lc/a/a/a/s0/a;->S:F

    const/high16 v0, 0x3f800000    # 1.0f

    const/4 v1, 0x0

    const v2, 0x3e428f5c    # 0.19f

    .line 4
    invoke-static {v1, v0, v2, v0, p1}, Lc/a/a/a/m/a;->a(FFFFF)F

    move-result p1

    iput p1, p0, Lc/a/a/a/s0/a;->U:F

    .line 5
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->invalidateSelf()V

    return-void
.end method

.method public final f(Landroid/graphics/Canvas;)V
    .registers 13

    .line 6
    iget-object v0, p0, Lc/a/a/a/s0/a;->F:Ljava/lang/CharSequence;

    if-nez v0, :cond_5

    return-void

    .line 7
    :cond_5
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    .line 8
    invoke-virtual {p0, v0}, Lc/a/a/a/s0/a;->a(Landroid/graphics/Rect;)F

    move-result v1

    float-to-int v1, v1

    .line 9
    iget-object v2, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-virtual {v2}, Lc/a/a/a/d0/j;->a()Lc/a/a/a/i0/d;

    move-result-object v2

    if-eqz v2, :cond_39

    .line 10
    iget-object v2, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-virtual {v2}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object v2

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getState()[I

    move-result-object v3

    iput-object v3, v2, Landroid/text/TextPaint;->drawableState:[I

    .line 11
    iget-object v2, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    iget-object v3, p0, Lc/a/a/a/s0/a;->G:Landroid/content/Context;

    invoke-virtual {v2, v3}, Lc/a/a/a/d0/j;->a(Landroid/content/Context;)V

    .line 12
    iget-object v2, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-virtual {v2}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object v2

    iget v3, p0, Lc/a/a/a/s0/a;->U:F

    const/high16 v4, 0x437f0000    # 255.0f

    mul-float v3, v3, v4

    float-to-int v3, v3

    invoke-virtual {v2, v3}, Landroid/text/TextPaint;->setAlpha(I)V

    .line 13
    :cond_39
    iget-object v5, p0, Lc/a/a/a/s0/a;->F:Ljava/lang/CharSequence;

    const/4 v6, 0x0

    invoke-interface {v5}, Ljava/lang/CharSequence;->length()I

    move-result v7

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    int-to-float v8, v0

    int-to-float v9, v1

    iget-object v0, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-virtual {v0}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object v10

    move-object v4, p1

    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public getIntrinsicHeight()I
    .registers 3

    .line 1
    iget-object v0, p0, Lc/a/a/a/s0/a;->I:Lc/a/a/a/d0/j;

    invoke-virtual {v0}, Lc/a/a/a/d0/j;->b()Landroid/text/TextPaint;

    move-result-object v0

    invoke-virtual {v0}, Landroid/text/TextPaint;->getTextSize()F

    move-result v0

    iget v1, p0, Lc/a/a/a/s0/a;->N:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public getIntrinsicWidth()I
    .registers 3

    .line 1
    iget v0, p0, Lc/a/a/a/s0/a;->L:I

    mul-int/lit8 v0, v0, 0x2

    int-to-float v0, v0

    invoke-virtual {p0}, Lc/a/a/a/s0/a;->I()F

    move-result v1

    add-float/2addr v0, v1

    iget v1, p0, Lc/a/a/a/s0/a;->M:I

    int-to-float v1, v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(FF)F

    move-result v0

    float-to-int v0, v0

    return v0
.end method

.method public onBoundsChange(Landroid/graphics/Rect;)V
    .registers 3

    .line 1
    invoke-super {p0, p1}, Lc/a/a/a/l0/h;->onBoundsChange(Landroid/graphics/Rect;)V

    .line 2
    invoke-virtual {p0}, Lc/a/a/a/l0/h;->n()Lc/a/a/a/l0/m;

    move-result-object p1

    invoke-virtual {p1}, Lc/a/a/a/l0/m;->m()Lc/a/a/a/l0/m$b;

    move-result-object p1

    invoke-virtual {p0}, Lc/a/a/a/s0/a;->H()Lc/a/a/a/l0/f;

    move-result-object v0

    invoke-virtual {p1, v0}, Lc/a/a/a/l0/m$b;->a(Lc/a/a/a/l0/f;)Lc/a/a/a/l0/m$b;

    invoke-virtual {p1}, Lc/a/a/a/l0/m$b;->a()Lc/a/a/a/l0/m;

    move-result-object p1

    .line 3
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->setShapeAppearanceModel(Lc/a/a/a/l0/m;)V

    return-void
.end method

.method public onStateChange([I)Z
    .registers 2

    .line 1
    invoke-super {p0, p1}, Lc/a/a/a/l0/h;->onStateChange([I)Z

    move-result p1

    return p1
.end method
