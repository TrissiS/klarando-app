.class public Landroidx/constraintlayout/utils/widget/ImageFilterButton;
.super Landroidx/appcompat/widget/AppCompatImageButton;
.source "ImageFilterButton.java"


# instance fields
.field public j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

.field public k:F

.field public l:F

.field public m:F

.field public n:Landroid/graphics/Path;

.field public o:Landroid/view/ViewOutlineProvider;

.field public p:Landroid/graphics/RectF;

.field public q:[Landroid/graphics/drawable/Drawable;

.field public r:Landroid/graphics/drawable/LayerDrawable;

.field public s:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 3

    .line 1
    invoke-direct {p0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;-><init>(Landroid/content/Context;)V

    .line 2
    new-instance v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    invoke-direct {v0}, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    const/4 v0, 0x0

    .line 3
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    .line 4
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 5
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->s:Z

    const/4 v0, 0x0

    .line 7
    invoke-virtual {p0, p1, v0}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 4

    .line 8
    invoke-direct {p0, p1, p2}, Landroidx/appcompat/widget/AppCompatImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 9
    new-instance v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    invoke-direct {v0}, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;-><init>()V

    iput-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    const/4 v0, 0x0

    .line 10
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    .line 11
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    const/high16 v0, 0x7fc00000    # Float.NaN

    .line 12
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    const/4 v0, 0x1

    .line 13
    iput-boolean v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->s:Z

    .line 14
    invoke-virtual {p0, p1, p2}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .registers 4

    .line 15
    invoke-direct {p0, p1, p2, p3}, Landroidx/appcompat/widget/AppCompatImageButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 16
    new-instance p3, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    invoke-direct {p3}, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;-><init>()V

    iput-object p3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    const/4 p3, 0x0

    .line 17
    iput p3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    .line 18
    iput p3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    const/high16 p3, 0x7fc00000    # Float.NaN

    .line 19
    iput p3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    const/4 p3, 0x1

    .line 20
    iput-boolean p3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->s:Z

    .line 21
    invoke-virtual {p0, p1, p2}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public static synthetic a(Landroidx/constraintlayout/utils/widget/ImageFilterButton;)F
    .registers 1

    .line 1
    iget p0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    return p0
.end method

.method public static synthetic b(Landroidx/constraintlayout/utils/widget/ImageFilterButton;)F
    .registers 1

    .line 1
    iget p0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    return p0
.end method

.method private setOverlay(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->s:Z

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 9

    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p1, p1, p1}, Landroid/widget/ImageButton;->setPadding(IIII)V

    if-eqz p2, :cond_aa

    .line 3
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lb/f/c/f;->ImageFilterView:[I

    .line 4
    invoke-virtual {v0, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 5
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->getIndexCount()I

    move-result v0

    .line 6
    sget v1, Lb/f/c/f;->ImageFilterView_altSrc:I

    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    const/4 v2, 0x0

    :goto_1b
    if-ge v2, v0, :cond_79

    .line 7
    invoke-virtual {p2, v2}, Landroid/content/res/TypedArray;->getIndex(I)I

    move-result v3

    .line 8
    sget v4, Lb/f/c/f;->ImageFilterView_crossfade:I

    const/4 v5, 0x0

    if-ne v3, v4, :cond_2d

    .line 9
    invoke-virtual {p2, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    iput v3, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    goto :goto_76

    .line 10
    :cond_2d
    sget v4, Lb/f/c/f;->ImageFilterView_warmth:I

    if-ne v3, v4, :cond_39

    .line 11
    invoke-virtual {p2, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->setWarmth(F)V

    goto :goto_76

    .line 12
    :cond_39
    sget v4, Lb/f/c/f;->ImageFilterView_saturation:I

    if-ne v3, v4, :cond_45

    .line 13
    invoke-virtual {p2, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->setSaturation(F)V

    goto :goto_76

    .line 14
    :cond_45
    sget v4, Lb/f/c/f;->ImageFilterView_contrast:I

    if-ne v3, v4, :cond_51

    .line 15
    invoke-virtual {p2, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->setContrast(F)V

    goto :goto_76

    .line 16
    :cond_51
    sget v4, Lb/f/c/f;->ImageFilterView_round:I

    if-ne v3, v4, :cond_5d

    .line 17
    invoke-virtual {p2, v3, v5}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->setRound(F)V

    goto :goto_76

    .line 18
    :cond_5d
    sget v4, Lb/f/c/f;->ImageFilterView_roundPercent:I

    if-ne v3, v4, :cond_69

    .line 19
    invoke-virtual {p2, v3, v5}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result v3

    invoke-virtual {p0, v3}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->setRoundPercent(F)V

    goto :goto_76

    .line 20
    :cond_69
    sget v4, Lb/f/c/f;->ImageFilterView_overlay:I

    if-ne v3, v4, :cond_76

    .line 21
    iget-boolean v4, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->s:Z

    invoke-virtual {p2, v3, v4}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result v3

    invoke-direct {p0, v3}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->setOverlay(Z)V

    :cond_76
    :goto_76
    add-int/lit8 v2, v2, 0x1

    goto :goto_1b

    .line 22
    :cond_79
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz v1, :cond_aa

    const/4 p2, 0x2

    new-array p2, p2, [Landroid/graphics/drawable/Drawable;

    .line 23
    iput-object p2, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->q:[Landroid/graphics/drawable/Drawable;

    .line 24
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    aput-object v0, p2, p1

    .line 25
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->q:[Landroid/graphics/drawable/Drawable;

    const/4 p2, 0x1

    aput-object v1, p1, p2

    .line 26
    new-instance p1, Landroid/graphics/drawable/LayerDrawable;

    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->q:[Landroid/graphics/drawable/Drawable;

    invoke-direct {p1, v0}, Landroid/graphics/drawable/LayerDrawable;-><init>([Landroid/graphics/drawable/Drawable;)V

    iput-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->r:Landroid/graphics/drawable/LayerDrawable;

    .line 27
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/high16 p2, 0x437f0000    # 255.0f

    iget v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    mul-float v0, v0, p2

    float-to-int p2, v0

    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 28
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->r:Landroid/graphics/drawable/LayerDrawable;

    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_aa
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .registers 4

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x15

    if-ge v0, v1, :cond_1b

    .line 2
    iget v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_1b

    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    if-eqz v0, :cond_1b

    const/4 v0, 0x1

    .line 3
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    .line 4
    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    goto :goto_1c

    :cond_1b
    const/4 v0, 0x0

    .line 5
    :goto_1c
    invoke-super {p0, p1}, Landroid/widget/ImageButton;->draw(Landroid/graphics/Canvas;)V

    if-eqz v0, :cond_24

    .line 6
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    :cond_24
    return-void
.end method

.method public getContrast()F
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    iget v0, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->f:F

    return v0
.end method

.method public getCrossfade()F
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    return v0
.end method

.method public getRound()F
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    return v0
.end method

.method public getRoundPercent()F
    .registers 2

    .line 1
    iget v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    return v0
.end method

.method public getSaturation()F
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    iget v0, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->e:F

    return v0
.end method

.method public getWarmth()F
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    iget v0, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->g:F

    return v0
.end method

.method public setBrightness(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    iput p1, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->d:F

    .line 2
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->a(Landroid/widget/ImageView;)V

    return-void
.end method

.method public setContrast(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    iput p1, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->f:F

    .line 2
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->a(Landroid/widget/ImageView;)V

    return-void
.end method

.method public setCrossfade(F)V
    .registers 5

    .line 1
    iput p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    .line 2
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->q:[Landroid/graphics/drawable/Drawable;

    if-eqz p1, :cond_32

    .line 3
    iget-boolean p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->s:Z

    const/high16 v0, 0x437f0000    # 255.0f

    if-nez p1, :cond_1e

    .line 4
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->r:Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x0

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/high16 v1, 0x3f800000    # 1.0f

    iget v2, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    sub-float/2addr v1, v2

    mul-float v1, v1, v0

    float-to-int v1, v1

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 5
    :cond_1e
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->r:Landroid/graphics/drawable/LayerDrawable;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    iget v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->k:F

    mul-float v1, v1, v0

    float-to-int v0, v1

    invoke-virtual {p1, v0}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    .line 6
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->r:Landroid/graphics/drawable/LayerDrawable;

    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageButton;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    :cond_32
    return-void
.end method

.method public setRound(F)V
    .registers 7

    .line 1
    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 2
    iput p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    .line 3
    iget p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    const/high16 v0, -0x40800000    # -1.0f

    .line 4
    iput v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    .line 5
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->setRoundPercent(F)V

    return-void

    .line 6
    :cond_12
    iget v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    const/4 v1, 0x1

    const/4 v2, 0x0

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_1c

    const/4 v0, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v0, 0x0

    .line 7
    :goto_1d
    iput p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    const/16 v3, 0x15

    const/4 v4, 0x0

    cmpl-float p1, p1, v4

    if-eqz p1, :cond_71

    .line 8
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    if-nez p1, :cond_31

    .line 9
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    .line 10
    :cond_31
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->p:Landroid/graphics/RectF;

    if-nez p1, :cond_3c

    .line 11
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->p:Landroid/graphics/RectF;

    .line 12
    :cond_3c
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_51

    .line 13
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->o:Landroid/view/ViewOutlineProvider;

    if-nez p1, :cond_4e

    .line 14
    new-instance p1, Landroidx/constraintlayout/utils/widget/ImageFilterButton$b;

    invoke-direct {p1, p0}, Landroidx/constraintlayout/utils/widget/ImageFilterButton$b;-><init>(Landroidx/constraintlayout/utils/widget/ImageFilterButton;)V

    iput-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->o:Landroid/view/ViewOutlineProvider;

    .line 15
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 16
    :cond_4e
    invoke-virtual {p0, v1}, Landroid/widget/ImageButton;->setClipToOutline(Z)V

    .line 17
    :cond_51
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getWidth()I

    move-result p1

    .line 18
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getHeight()I

    move-result v1

    .line 19
    iget-object v2, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->p:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float v1, v1

    invoke-virtual {v2, v4, v4, p1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 20
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 21
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->p:Landroid/graphics/RectF;

    iget v2, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->m:F

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {p1, v1, v2, v2, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    goto :goto_78

    .line 22
    :cond_71
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_78

    .line 23
    invoke-virtual {p0, v2}, Landroid/widget/ImageButton;->setClipToOutline(Z)V

    :cond_78
    :goto_78
    if-eqz v0, :cond_81

    .line 24
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_81

    .line 25
    invoke-virtual {p0}, Landroid/widget/ImageButton;->invalidateOutline()V

    :cond_81
    return-void
.end method

.method public setRoundPercent(F)V
    .registers 8

    .line 1
    iget v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    const/4 v1, 0x1

    const/4 v2, 0x0

    cmpl-float v0, v0, p1

    if-eqz v0, :cond_a

    const/4 v0, 0x1

    goto :goto_b

    :cond_a
    const/4 v0, 0x0

    .line 2
    :goto_b
    iput p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    const/16 v3, 0x15

    const/4 v4, 0x0

    cmpl-float p1, p1, v4

    if-eqz p1, :cond_69

    .line 3
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    if-nez p1, :cond_1f

    .line 4
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    .line 5
    :cond_1f
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->p:Landroid/graphics/RectF;

    if-nez p1, :cond_2a

    .line 6
    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->p:Landroid/graphics/RectF;

    .line 7
    :cond_2a
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_3f

    .line 8
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->o:Landroid/view/ViewOutlineProvider;

    if-nez p1, :cond_3c

    .line 9
    new-instance p1, Landroidx/constraintlayout/utils/widget/ImageFilterButton$a;

    invoke-direct {p1, p0}, Landroidx/constraintlayout/utils/widget/ImageFilterButton$a;-><init>(Landroidx/constraintlayout/utils/widget/ImageFilterButton;)V

    iput-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->o:Landroid/view/ViewOutlineProvider;

    .line 10
    invoke-virtual {p0, p1}, Landroid/widget/ImageButton;->setOutlineProvider(Landroid/view/ViewOutlineProvider;)V

    .line 11
    :cond_3c
    invoke-virtual {p0, v1}, Landroid/widget/ImageButton;->setClipToOutline(Z)V

    .line 12
    :cond_3f
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getWidth()I

    move-result p1

    .line 13
    invoke-virtual {p0}, Landroid/widget/ImageButton;->getHeight()I

    move-result v1

    .line 14
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    int-to-float v2, v2

    iget v5, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->l:F

    mul-float v2, v2, v5

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v2, v5

    .line 15
    iget-object v5, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->p:Landroid/graphics/RectF;

    int-to-float p1, p1

    int-to-float v1, v1

    invoke-virtual {v5, v4, v4, p1, v1}, Landroid/graphics/RectF;->set(FFFF)V

    .line 16
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 17
    iget-object p1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->n:Landroid/graphics/Path;

    iget-object v1, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->p:Landroid/graphics/RectF;

    sget-object v4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    invoke-virtual {p1, v1, v2, v2, v4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    goto :goto_70

    .line 18
    :cond_69
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_70

    .line 19
    invoke-virtual {p0, v2}, Landroid/widget/ImageButton;->setClipToOutline(Z)V

    :cond_70
    :goto_70
    if-eqz v0, :cond_79

    .line 20
    sget p1, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt p1, v3, :cond_79

    .line 21
    invoke-virtual {p0}, Landroid/widget/ImageButton;->invalidateOutline()V

    :cond_79
    return-void
.end method

.method public setSaturation(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    iput p1, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->e:F

    .line 2
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->a(Landroid/widget/ImageView;)V

    return-void
.end method

.method public setWarmth(F)V
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/utils/widget/ImageFilterButton;->j:Landroidx/constraintlayout/utils/widget/ImageFilterView$c;

    iput p1, v0, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->g:F

    .line 2
    invoke-virtual {v0, p0}, Landroidx/constraintlayout/utils/widget/ImageFilterView$c;->a(Landroid/widget/ImageView;)V

    return-void
.end method
