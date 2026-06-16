.class public Lc/a/a/a/w/a;
.super Ljava/lang/Object;
.source "MaterialColors.java"


# direct methods
.method public static a(II)I
    .registers 3

    .line 12
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    mul-int v0, v0, p1

    div-int/lit16 v0, v0, 0xff

    .line 13
    invoke-static {p0, v0}, Lb/h/f/a;->c(II)I

    move-result p0

    return p0
.end method

.method public static a(IIF)I
    .registers 4

    .line 9
    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result v0

    int-to-float v0, v0

    mul-float v0, v0, p2

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result p2

    .line 10
    invoke-static {p1, p2}, Lb/h/f/a;->c(II)I

    move-result p1

    .line 11
    invoke-static {p0, p1}, Lc/a/a/a/w/a;->b(II)I

    move-result p0

    return p0
.end method

.method public static a(Landroid/content/Context;II)I
    .registers 3

    .line 4
    invoke-static {p0, p1}, Lc/a/a/a/i0/b;->a(Landroid/content/Context;I)Landroid/util/TypedValue;

    move-result-object p0

    if-eqz p0, :cond_9

    .line 5
    iget p0, p0, Landroid/util/TypedValue;->data:I

    return p0

    :cond_9
    return p2
.end method

.method public static a(Landroid/content/Context;ILjava/lang/String;)I
    .registers 3

    .line 2
    invoke-static {p0, p1, p2}, Lc/a/a/a/i0/b;->a(Landroid/content/Context;ILjava/lang/String;)I

    move-result p0

    return p0
.end method

.method public static a(Landroid/view/View;I)I
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lc/a/a/a/i0/b;->a(Landroid/view/View;I)I

    move-result p0

    return p0
.end method

.method public static a(Landroid/view/View;II)I
    .registers 3

    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0, p1, p2}, Lc/a/a/a/w/a;->a(Landroid/content/Context;II)I

    move-result p0

    return p0
.end method

.method public static a(Landroid/view/View;IIF)I
    .registers 4

    .line 6
    invoke-static {p0, p1}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result p1

    .line 7
    invoke-static {p0, p2}, Lc/a/a/a/w/a;->a(Landroid/view/View;I)I

    move-result p0

    .line 8
    invoke-static {p1, p0, p3}, Lc/a/a/a/w/a;->a(IIF)I

    move-result p0

    return p0
.end method

.method public static b(II)I
    .registers 2

    .line 1
    invoke-static {p1, p0}, Lb/h/f/a;->b(II)I

    move-result p0

    return p0
.end method
