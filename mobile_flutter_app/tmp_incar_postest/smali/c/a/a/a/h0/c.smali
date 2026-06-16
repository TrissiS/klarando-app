.class public abstract Lc/a/a/a/h0/c;
.super Ljava/lang/Object;
.source "BaseProgressIndicatorSpec.java"


# instance fields
.field public a:I

.field public b:I

.field public c:[I

.field public d:I

.field public e:I

.field public f:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;II)V
    .registers 13

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    new-array v1, v0, [I

    .line 2
    iput-object v1, p0, Lc/a/a/a/h0/c;->c:[I

    .line 3
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    sget v2, Lc/a/a/a/d;->mtrl_progress_track_thickness:I

    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v1

    .line 4
    sget-object v4, Lc/a/a/a/l;->BaseProgressIndicator:[I

    new-array v7, v0, [I

    move-object v2, p1

    move-object v3, p2

    move v5, p3

    move v6, p4

    .line 5
    invoke-static/range {v2 .. v7}, Lc/a/a/a/d0/m;->c(Landroid/content/Context;Landroid/util/AttributeSet;[III[I)Landroid/content/res/TypedArray;

    move-result-object p2

    .line 6
    sget p3, Lc/a/a/a/l;->BaseProgressIndicator_trackThickness:I

    .line 7
    invoke-static {p1, p2, p3, v1}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;II)I

    move-result p3

    iput p3, p0, Lc/a/a/a/h0/c;->a:I

    .line 8
    sget p3, Lc/a/a/a/l;->BaseProgressIndicator_trackCornerRadius:I

    .line 9
    invoke-static {p1, p2, p3, v0}, Lc/a/a/a/i0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;II)I

    move-result p3

    iget p4, p0, Lc/a/a/a/h0/c;->a:I

    div-int/lit8 p4, p4, 0x2

    .line 10
    invoke-static {p3, p4}, Ljava/lang/Math;->min(II)I

    move-result p3

    iput p3, p0, Lc/a/a/a/h0/c;->b:I

    .line 11
    sget p3, Lc/a/a/a/l;->BaseProgressIndicator_showAnimationBehavior:I

    .line 12
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lc/a/a/a/h0/c;->e:I

    .line 13
    sget p3, Lc/a/a/a/l;->BaseProgressIndicator_hideAnimationBehavior:I

    .line 14
    invoke-virtual {p2, p3, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    move-result p3

    iput p3, p0, Lc/a/a/a/h0/c;->f:I

    .line 15
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/h0/c;->a(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 16
    invoke-virtual {p0, p1, p2}, Lc/a/a/a/h0/c;->b(Landroid/content/Context;Landroid/content/res/TypedArray;)V

    .line 17
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .registers 7

    .line 1
    sget v0, Lc/a/a/a/l;->BaseProgressIndicator_indicatorColor:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    const/4 v1, 0x0

    const/4 v2, -0x1

    const/4 v3, 0x1

    if-nez v0, :cond_18

    new-array p2, v3, [I

    .line 2
    sget v0, Lc/a/a/a/b;->colorPrimary:I

    invoke-static {p1, v0, v2}, Lc/a/a/a/w/a;->a(Landroid/content/Context;II)I

    move-result p1

    aput p1, p2, v1

    iput-object p2, p0, Lc/a/a/a/h0/c;->c:[I

    return-void

    .line 3
    :cond_18
    sget v0, Lc/a/a/a/l;->BaseProgressIndicator_indicatorColor:I

    .line 4
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->peekValue(I)Landroid/util/TypedValue;

    move-result-object v0

    .line 5
    iget v0, v0, Landroid/util/TypedValue;->type:I

    if-eq v0, v3, :cond_2f

    new-array p1, v3, [I

    .line 6
    sget v0, Lc/a/a/a/l;->BaseProgressIndicator_indicatorColor:I

    .line 7
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p2

    aput p2, p1, v1

    iput-object p1, p0, Lc/a/a/a/h0/c;->c:[I

    return-void

    .line 8
    :cond_2f
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    sget v0, Lc/a/a/a/l;->BaseProgressIndicator_indicatorColor:I

    .line 9
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p2

    .line 10
    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getIntArray(I)[I

    move-result-object p1

    iput-object p1, p0, Lc/a/a/a/h0/c;->c:[I

    .line 11
    array-length p1, p1

    if-eqz p1, :cond_43

    return-void

    .line 12
    :cond_43
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "indicatorColors cannot be empty when indicatorColor is not used."

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a()Z
    .registers 2

    .line 13
    iget v0, p0, Lc/a/a/a/h0/c;->f:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public final b(Landroid/content/Context;Landroid/content/res/TypedArray;)V
    .registers 5

    .line 1
    sget v0, Lc/a/a/a/l;->BaseProgressIndicator_trackColor:I

    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-eqz v0, :cond_12

    .line 2
    sget p1, Lc/a/a/a/l;->BaseProgressIndicator_trackColor:I

    const/4 v0, -0x1

    invoke-virtual {p2, p1, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result p1

    iput p1, p0, Lc/a/a/a/h0/c;->d:I

    return-void

    .line 3
    :cond_12
    iget-object p2, p0, Lc/a/a/a/h0/c;->c:[I

    const/4 v0, 0x0

    aget p2, p2, v0

    iput p2, p0, Lc/a/a/a/h0/c;->d:I

    .line 4
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    const/4 p2, 0x1

    new-array p2, p2, [I

    const v1, 0x1010033

    aput v1, p2, v0

    invoke-virtual {p1, p2}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    const p2, 0x3e4ccccd    # 0.2f

    .line 5
    invoke-virtual {p1, v0, p2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    move-result p2

    .line 6
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    const/high16 p1, 0x437f0000    # 255.0f

    mul-float p2, p2, p1

    float-to-int p1, p2

    .line 7
    iget p2, p0, Lc/a/a/a/h0/c;->d:I

    invoke-static {p2, p1}, Lc/a/a/a/w/a;->a(II)I

    move-result p1

    iput p1, p0, Lc/a/a/a/h0/c;->d:I

    return-void
.end method

.method public b()Z
    .registers 2

    .line 8
    iget v0, p0, Lc/a/a/a/h0/c;->e:I

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public abstract c()V
.end method
