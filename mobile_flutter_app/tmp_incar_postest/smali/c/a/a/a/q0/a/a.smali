.class public Lc/a/a/a/q0/a/a;
.super Ljava/lang/Object;
.source "MaterialThemeOverlay.java"


# static fields
.field public static final a:[I

.field public static final b:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    const/4 v0, 0x2

    new-array v0, v0, [I

    const/high16 v1, 0x1010000

    const/4 v2, 0x0

    aput v1, v0, v2

    .line 1
    sget v1, Lc/a/a/a/b;->theme:I

    const/4 v3, 0x1

    aput v1, v0, v3

    sput-object v0, Lc/a/a/a/q0/a/a;->a:[I

    new-array v0, v3, [I

    .line 2
    sget v1, Lc/a/a/a/b;->materialThemeOverlay:I

    aput v1, v0, v2

    sput-object v0, Lc/a/a/a/q0/a/a;->b:[I

    return-void
.end method

.method public static a(Landroid/content/Context;Landroid/util/AttributeSet;)I
    .registers 4

    .line 1
    sget-object v0, Lc/a/a/a/q0/a/a;->a:[I

    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result v0

    const/4 v1, 0x1

    .line 3
    invoke-virtual {p0, v1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    .line 4
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz v0, :cond_16

    goto :goto_17

    :cond_16
    move v0, p1

    :goto_17
    return v0
.end method

.method public static a(Landroid/content/Context;Landroid/util/AttributeSet;II)I
    .registers 5

    .line 5
    sget-object v0, Lc/a/a/a/q0/a/a;->b:[I

    .line 6
    invoke-virtual {p0, p1, v0, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object p0

    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1, p1}, Landroid/content/res/TypedArray;->getResourceId(II)I

    move-result p1

    .line 8
    invoke-virtual {p0}, Landroid/content/res/TypedArray;->recycle()V

    return p1
.end method

.method public static b(Landroid/content/Context;Landroid/util/AttributeSet;II)Landroid/content/Context;
    .registers 5

    .line 1
    invoke-static {p0, p1, p2, p3}, Lc/a/a/a/q0/a/a;->a(Landroid/content/Context;Landroid/util/AttributeSet;II)I

    move-result p2

    .line 2
    instance-of p3, p0, Lb/b/p/d;

    const/4 v0, 0x1

    if-eqz p3, :cond_14

    move-object p3, p0

    check-cast p3, Lb/b/p/d;

    .line 3
    invoke-virtual {p3}, Lb/b/p/d;->b()I

    move-result p3

    if-ne p3, p2, :cond_14

    const/4 p3, 0x1

    goto :goto_15

    :cond_14
    const/4 p3, 0x0

    :goto_15
    if-eqz p2, :cond_2d

    if-eqz p3, :cond_1a

    goto :goto_2d

    .line 4
    :cond_1a
    new-instance p3, Lb/b/p/d;

    invoke-direct {p3, p0, p2}, Lb/b/p/d;-><init>(Landroid/content/Context;I)V

    .line 5
    invoke-static {p0, p1}, Lc/a/a/a/q0/a/a;->a(Landroid/content/Context;Landroid/util/AttributeSet;)I

    move-result p0

    if-eqz p0, :cond_2c

    .line 6
    invoke-virtual {p3}, Lb/b/p/d;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object p1

    invoke-virtual {p1, p0, v0}, Landroid/content/res/Resources$Theme;->applyStyle(IZ)V

    :cond_2c
    return-object p3

    :cond_2d
    :goto_2d
    return-object p0
.end method
