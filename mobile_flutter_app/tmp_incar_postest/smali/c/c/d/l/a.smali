.class public Lc/c/d/l/a;
.super Ljava/lang/Object;
.source "BlackToastStyle.java"

# interfaces
.implements Lc/c/d/k/f;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lc/c/d/k/f<",
        "Landroid/widget/TextView;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Landroid/content/Context;)Landroid/view/View;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->a(Landroid/content/Context;)Landroid/widget/TextView;

    move-result-object p1

    return-object p1
.end method

.method public a(Landroid/content/Context;)Landroid/widget/TextView;
    .registers 7

    .line 2
    new-instance v0, Landroid/widget/TextView;

    invoke-direct {v0, p1}, Landroid/widget/TextView;-><init>(Landroid/content/Context;)V

    const v1, 0x102000b

    .line 3
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setId(I)V

    .line 4
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->f(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setGravity(I)V

    .line 5
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->e(Landroid/content/Context;)I

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setTextColor(I)V

    .line 6
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->g(Landroid/content/Context;)F

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Landroid/widget/TextView;->setTextSize(IF)V

    .line 7
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->c(Landroid/content/Context;)I

    move-result v1

    .line 8
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->i(Landroid/content/Context;)I

    move-result v2

    .line 9
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v4, 0x10

    if-lt v3, v4, :cond_33

    .line 10
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPaddingRelative(IIII)V

    goto :goto_36

    .line 11
    :cond_33
    invoke-virtual {v0, v1, v2, v1, v2}, Landroid/widget/TextView;->setPadding(IIII)V

    .line 12
    :goto_36
    new-instance v1, Landroid/view/ViewGroup$LayoutParams;

    const/4 v2, -0x2

    invoke-direct {v1, v2, v2}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    .line 14
    sget v2, Landroid/os/Build$VERSION;->SDK_INT:I

    if-lt v2, v4, :cond_4b

    .line 15
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackground(Landroid/graphics/drawable/Drawable;)V

    goto :goto_4e

    .line 16
    :cond_4b
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 17
    :goto_4e
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x15

    if-lt v1, v2, :cond_5b

    .line 18
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->h(Landroid/content/Context;)F

    move-result v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setZ(F)V

    .line 19
    :cond_5b
    invoke-virtual {p0, p1}, Lc/c/d/l/a;->d(Landroid/content/Context;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/widget/TextView;->setMaxLines(I)V

    return-object v0
.end method

.method public b(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 5

    .line 1
    new-instance v0, Landroid/graphics/drawable/GradientDrawable;

    invoke-direct {v0}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    const/high16 v1, -0x78000000

    .line 2
    invoke-virtual {v0, v1}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v1, 0x1

    const/high16 v2, 0x41200000    # 10.0f

    invoke-static {v1, v2, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    invoke-virtual {v0, p1}, Landroid/graphics/drawable/GradientDrawable;->setCornerRadius(F)V

    return-object v0
.end method

.method public c(Landroid/content/Context;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x41c00000    # 24.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method

.method public d(Landroid/content/Context;)I
    .registers 2

    const/4 p1, 0x5

    return p1
.end method

.method public e(Landroid/content/Context;)I
    .registers 2

    const p1, -0x11000001

    return p1
.end method

.method public f(Landroid/content/Context;)I
    .registers 2

    const/16 p1, 0x11

    return p1
.end method

.method public g(Landroid/content/Context;)F
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x2

    const/high16 v1, 0x41600000    # 14.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    return p1
.end method

.method public synthetic getGravity()I
    .registers 2

    invoke-static {p0}, Lc/c/d/k/e;->a(Lc/c/d/k/f;)I

    move-result v0

    return v0
.end method

.method public synthetic getHorizontalMargin()F
    .registers 2

    invoke-static {p0}, Lc/c/d/k/e;->b(Lc/c/d/k/f;)F

    move-result v0

    return v0
.end method

.method public synthetic getVerticalMargin()F
    .registers 2

    invoke-static {p0}, Lc/c/d/k/e;->c(Lc/c/d/k/f;)F

    move-result v0

    return v0
.end method

.method public synthetic getXOffset()I
    .registers 2

    invoke-static {p0}, Lc/c/d/k/e;->d(Lc/c/d/k/f;)I

    move-result v0

    return v0
.end method

.method public synthetic getYOffset()I
    .registers 2

    invoke-static {p0}, Lc/c/d/k/e;->e(Lc/c/d/k/f;)I

    move-result v0

    return v0
.end method

.method public h(Landroid/content/Context;)F
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x40400000    # 3.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    return p1
.end method

.method public i(Landroid/content/Context;)I
    .registers 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p1

    const/4 v0, 0x1

    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v0, v1, p1}, Landroid/util/TypedValue;->applyDimension(IFLandroid/util/DisplayMetrics;)F

    move-result p1

    float-to-int p1, p1

    return p1
.end method
