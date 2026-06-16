.class public Landroidx/cardview/widget/CardView;
.super Landroid/widget/FrameLayout;
.source "CardView.java"


# static fields
.field public static final o:[I

.field public static final p:Lb/d/f/e;


# instance fields
.field public h:Z

.field public i:Z

.field public j:I

.field public k:I

.field public final l:Landroid/graphics/Rect;

.field public final m:Landroid/graphics/Rect;

.field public final n:Lb/d/f/d;


# direct methods
.method public static constructor <clinit>()V
    .registers 3

    const/4 v0, 0x1

    new-array v0, v0, [I

    const/4 v1, 0x0

    const v2, 0x1010031

    aput v2, v0, v1

    .line 1
    sput-object v0, Landroidx/cardview/widget/CardView;->o:[I

    .line 2
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-lt v0, v1, :cond_19

    .line 3
    new-instance v0, Lb/d/f/b;

    invoke-direct {v0}, Lb/d/f/b;-><init>()V

    sput-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    goto :goto_2c

    :cond_19
    const/16 v1, 0x11

    if-lt v0, v1, :cond_25

    .line 4
    new-instance v0, Lb/d/f/a;

    invoke-direct {v0}, Lb/d/f/a;-><init>()V

    sput-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    goto :goto_2c

    .line 5
    :cond_25
    new-instance v0, Lb/d/f/c;

    invoke-direct {v0}, Lb/d/f/c;-><init>()V

    sput-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    .line 6
    :goto_2c
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    invoke-interface {v0}, Lb/d/f/e;->a()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p1, v0}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 2
    sget v0, Lb/d/a;->cardViewStyle:I

    invoke-direct {p0, p1, p2, v0}, Landroidx/cardview/widget/CardView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 12

    .line 3
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 4
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    .line 5
    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    iput-object v0, p0, Landroidx/cardview/widget/CardView;->m:Landroid/graphics/Rect;

    .line 6
    new-instance v0, Landroidx/cardview/widget/CardView$a;

    invoke-direct {v0, p0}, Landroidx/cardview/widget/CardView$a;-><init>(Landroidx/cardview/widget/CardView;)V

    iput-object v0, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    .line 7
    sget-object v0, Lb/d/e;->CardView:[I

    sget v1, Lb/d/d;->CardView:I

    invoke-virtual {p1, p2, v0, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 8
    sget p3, Lb/d/e;->CardView_cardBackgroundColor:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result p3

    const/4 v0, 0x0

    if-eqz p3, :cond_31

    .line 9
    sget p3, Lb/d/e;->CardView_cardBackgroundColor:I

    invoke-virtual {p2, p3}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    :goto_2f
    move-object v4, p3

    goto :goto_6b

    .line 10
    :cond_31
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getContext()Landroid/content/Context;

    move-result-object p3

    sget-object v1, Landroidx/cardview/widget/CardView;->o:[I

    invoke-virtual {p3, v1}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p3

    .line 11
    invoke-virtual {p3, v0, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v1

    .line 12
    invoke-virtual {p3}, Landroid/content/res/TypedArray;->recycle()V

    const/4 p3, 0x3

    new-array p3, p3, [F

    .line 13
    invoke-static {v1, p3}, Landroid/graphics/Color;->colorToHSV(I[F)V

    const/4 v1, 0x2

    .line 14
    aget p3, p3, v1

    const/high16 v1, 0x3f000000    # 0.5f

    cmpl-float p3, p3, v1

    if-lez p3, :cond_5c

    .line 15
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v1, Lb/d/b;->cardview_light_background:I

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    goto :goto_66

    .line 16
    :cond_5c
    invoke-virtual {p0}, Landroid/widget/FrameLayout;->getResources()Landroid/content/res/Resources;

    move-result-object p3

    sget v1, Lb/d/b;->cardview_dark_background:I

    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getColor(I)I

    move-result p3

    .line 17
    :goto_66
    invoke-static {p3}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p3

    goto :goto_2f

    .line 18
    :goto_6b
    sget p3, Lb/d/e;->CardView_cardCornerRadius:I

    const/4 v1, 0x0

    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v5

    .line 19
    sget p3, Lb/d/e;->CardView_cardElevation:I

    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v6

    .line 20
    sget p3, Lb/d/e;->CardView_cardMaxElevation:I

    invoke-virtual {p2, p3, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result p3

    .line 21
    sget v1, Lb/d/e;->CardView_cardUseCompatPadding:I

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroidx/cardview/widget/CardView;->h:Z

    .line 22
    sget v1, Lb/d/e;->CardView_cardPreventCornerOverlap:I

    const/4 v2, 0x1

    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v1

    iput-boolean v1, p0, Landroidx/cardview/widget/CardView;->i:Z

    .line 23
    sget v1, Lb/d/e;->CardView_contentPadding:I

    invoke-virtual {p2, v1, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    .line 24
    iget-object v2, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    sget v3, Lb/d/e;->CardView_contentPaddingLeft:I

    invoke-virtual {p2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->left:I

    .line 25
    iget-object v2, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    sget v3, Lb/d/e;->CardView_contentPaddingTop:I

    invoke-virtual {p2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->top:I

    .line 26
    iget-object v2, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    sget v3, Lb/d/e;->CardView_contentPaddingRight:I

    invoke-virtual {p2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v3

    iput v3, v2, Landroid/graphics/Rect;->right:I

    .line 27
    iget-object v2, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    sget v3, Lb/d/e;->CardView_contentPaddingBottom:I

    invoke-virtual {p2, v3, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v1

    iput v1, v2, Landroid/graphics/Rect;->bottom:I

    cmpl-float v1, v6, p3

    if-lez v1, :cond_c3

    move v7, v6

    goto :goto_c4

    :cond_c3
    move v7, p3

    .line 28
    :goto_c4
    sget p3, Lb/d/e;->CardView_android_minWidth:I

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Landroidx/cardview/widget/CardView;->j:I

    .line 29
    sget p3, Lb/d/e;->CardView_android_minHeight:I

    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result p3

    iput p3, p0, Landroidx/cardview/widget/CardView;->k:I

    .line 30
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 31
    sget-object v1, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v2, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    move-object v3, p1

    invoke-interface/range {v1 .. v7}, Lb/d/f/e;->a(Lb/d/f/d;Landroid/content/Context;Landroid/content/res/ColorStateList;FFF)V

    return-void
.end method

.method public static synthetic a(Landroidx/cardview/widget/CardView;I)V
    .registers 2

    .line 2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setMinimumWidth(I)V

    return-void
.end method

.method public static synthetic a(Landroidx/cardview/widget/CardView;IIII)V
    .registers 5

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/FrameLayout;->setPadding(IIII)V

    return-void
.end method

.method public static synthetic b(Landroidx/cardview/widget/CardView;I)V
    .registers 2

    .line 1
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setMinimumHeight(I)V

    return-void
.end method


# virtual methods
.method public a(IIII)V
    .registers 6

    .line 3
    iget-object v0, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    invoke-virtual {v0, p1, p2, p3, p4}, Landroid/graphics/Rect;->set(IIII)V

    .line 4
    sget-object p1, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object p2, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {p1, p2}, Lb/d/f/e;->i(Lb/d/f/d;)V

    return-void
.end method

.method public getCardBackgroundColor()Landroid/content/res/ColorStateList;
    .registers 3

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v0, v1}, Lb/d/f/e;->f(Lb/d/f/d;)Landroid/content/res/ColorStateList;

    move-result-object v0

    return-object v0
.end method

.method public getCardElevation()F
    .registers 3

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v0, v1}, Lb/d/f/e;->h(Lb/d/f/d;)F

    move-result v0

    return v0
.end method

.method public getContentPaddingBottom()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    return v0
.end method

.method public getContentPaddingLeft()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->left:I

    return v0
.end method

.method public getContentPaddingRight()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->right:I

    return v0
.end method

.method public getContentPaddingTop()I
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/cardview/widget/CardView;->l:Landroid/graphics/Rect;

    iget v0, v0, Landroid/graphics/Rect;->top:I

    return v0
.end method

.method public getMaxCardElevation()F
    .registers 3

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v0, v1}, Lb/d/f/e;->a(Lb/d/f/d;)F

    move-result v0

    return v0
.end method

.method public getPreventCornerOverlap()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/cardview/widget/CardView;->i:Z

    return v0
.end method

.method public getRadius()F
    .registers 3

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v0, v1}, Lb/d/f/e;->b(Lb/d/f/d;)F

    move-result v0

    return v0
.end method

.method public getUseCompatPadding()Z
    .registers 2

    .line 1
    iget-boolean v0, p0, Landroidx/cardview/widget/CardView;->h:Z

    return v0
.end method

.method public onMeasure(II)V
    .registers 8

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    instance-of v0, v0, Lb/d/f/b;

    if-nez v0, :cond_54

    .line 2
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    const/high16 v1, 0x40000000    # 2.0f

    const/high16 v2, -0x80000000

    if-eq v0, v2, :cond_13

    if-eq v0, v1, :cond_13

    goto :goto_2d

    .line 3
    :cond_13
    sget-object v3, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v4, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v3, v4}, Lb/d/f/e;->d(Lb/d/f/d;)F

    move-result v3

    float-to-double v3, v3

    invoke-static {v3, v4}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v3

    double-to-int v3, v3

    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    .line 5
    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    invoke-static {p1, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p1

    .line 6
    :goto_2d
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    move-result v0

    if-eq v0, v2, :cond_36

    if-eq v0, v1, :cond_36

    goto :goto_50

    .line 7
    :cond_36
    sget-object v1, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v2, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v1, v2}, Lb/d/f/e;->c(Lb/d/f/d;)F

    move-result v1

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-int v1, v1

    .line 8
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p2

    .line 9
    invoke-static {v1, p2}, Ljava/lang/Math;->max(II)I

    move-result p2

    invoke-static {p2, v0}, Landroid/view/View$MeasureSpec;->makeMeasureSpec(II)I

    move-result p2

    .line 10
    :goto_50
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    goto :goto_57

    .line 11
    :cond_54
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    :goto_57
    return-void
.end method

.method public setCardBackgroundColor(I)V
    .registers 4

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-interface {v0, v1, p1}, Lb/d/f/e;->a(Lb/d/f/d;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setCardBackgroundColor(Landroid/content/res/ColorStateList;)V
    .registers 4

    .line 2
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v0, v1, p1}, Lb/d/f/e;->a(Lb/d/f/d;Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setCardElevation(F)V
    .registers 4

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v0, v1, p1}, Lb/d/f/e;->a(Lb/d/f/d;F)V

    return-void
.end method

.method public setMaxCardElevation(F)V
    .registers 4

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v0, v1, p1}, Lb/d/f/e;->c(Lb/d/f/d;F)V

    return-void
.end method

.method public setMinimumHeight(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/cardview/widget/CardView;->k:I

    .line 2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setMinimumHeight(I)V

    return-void
.end method

.method public setMinimumWidth(I)V
    .registers 2

    .line 1
    iput p1, p0, Landroidx/cardview/widget/CardView;->j:I

    .line 2
    invoke-super {p0, p1}, Landroid/widget/FrameLayout;->setMinimumWidth(I)V

    return-void
.end method

.method public setPadding(IIII)V
    .registers 5

    return-void
.end method

.method public setPaddingRelative(IIII)V
    .registers 5

    return-void
.end method

.method public setPreventCornerOverlap(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/cardview/widget/CardView;->i:Z

    if-eq p1, v0, :cond_d

    .line 2
    iput-boolean p1, p0, Landroidx/cardview/widget/CardView;->i:Z

    .line 3
    sget-object p1, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v0, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {p1, v0}, Lb/d/f/e;->g(Lb/d/f/d;)V

    :cond_d
    return-void
.end method

.method public setRadius(F)V
    .registers 4

    .line 1
    sget-object v0, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v1, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {v0, v1, p1}, Lb/d/f/e;->b(Lb/d/f/d;F)V

    return-void
.end method

.method public setUseCompatPadding(Z)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Landroidx/cardview/widget/CardView;->h:Z

    if-eq v0, p1, :cond_d

    .line 2
    iput-boolean p1, p0, Landroidx/cardview/widget/CardView;->h:Z

    .line 3
    sget-object p1, Landroidx/cardview/widget/CardView;->p:Lb/d/f/e;

    iget-object v0, p0, Landroidx/cardview/widget/CardView;->n:Lb/d/f/d;

    invoke-interface {p1, v0}, Lb/d/f/e;->e(Lb/d/f/d;)V

    :cond_d
    return-void
.end method
