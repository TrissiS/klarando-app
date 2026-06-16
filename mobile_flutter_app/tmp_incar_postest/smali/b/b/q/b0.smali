.class public Lb/b/q/b0;
.super Ljava/lang/Object;
.source "ThemeUtils.java"


# static fields
.field public static final a:Ljava/lang/ThreadLocal;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ThreadLocal<",
            "Landroid/util/TypedValue;",
            ">;"
        }
    .end annotation
.end field

.field public static final b:[I

.field public static final c:[I

.field public static final d:[I

.field public static final e:[I

.field public static final f:[I

.field public static final g:[I


# direct methods
.method public static constructor <clinit>()V
    .registers 4

    .line 1
    new-instance v0, Ljava/lang/ThreadLocal;

    invoke-direct {v0}, Ljava/lang/ThreadLocal;-><init>()V

    sput-object v0, Lb/b/q/b0;->a:Ljava/lang/ThreadLocal;

    const/4 v0, 0x1

    new-array v1, v0, [I

    const v2, -0x101009e

    const/4 v3, 0x0

    aput v2, v1, v3

    .line 2
    sput-object v1, Lb/b/q/b0;->b:[I

    new-array v1, v0, [I

    const v2, 0x101009c

    aput v2, v1, v3

    .line 3
    sput-object v1, Lb/b/q/b0;->c:[I

    new-array v1, v0, [I

    const v2, 0x10100a7

    aput v2, v1, v3

    .line 4
    sput-object v1, Lb/b/q/b0;->d:[I

    new-array v1, v0, [I

    const v2, 0x10100a0

    aput v2, v1, v3

    .line 5
    sput-object v1, Lb/b/q/b0;->e:[I

    new-array v1, v3, [I

    .line 6
    sput-object v1, Lb/b/q/b0;->f:[I

    new-array v0, v0, [I

    .line 7
    sput-object v0, Lb/b/q/b0;->g:[I

    return-void
.end method

.method public static a(Landroid/content/Context;I)I
    .registers 6

    .line 1
    invoke-static {p0, p1}, Lb/b/q/b0;->c(Landroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    if-eqz v0, :cond_17

    .line 2
    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->isStateful()Z

    move-result v1

    if-eqz v1, :cond_17

    .line 3
    sget-object p0, Lb/b/q/b0;->b:[I

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result p1

    invoke-virtual {v0, p0, p1}, Landroid/content/res/ColorStateList;->getColorForState([II)I

    move-result p0

    return p0

    .line 4
    :cond_17
    invoke-static {}, Lb/b/q/b0;->a()Landroid/util/TypedValue;

    move-result-object v0

    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    move-result-object v1

    const v2, 0x1010033

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources$Theme;->resolveAttribute(ILandroid/util/TypedValue;Z)Z

    .line 6
    invoke-virtual {v0}, Landroid/util/TypedValue;->getFloat()F

    move-result v0

    .line 7
    invoke-static {p0, p1, v0}, Lb/b/q/b0;->a(Landroid/content/Context;IF)I

    move-result p0

    return p0
.end method

.method public static a(Landroid/content/Context;IF)I
    .registers 3

    .line 11
    invoke-static {p0, p1}, Lb/b/q/b0;->b(Landroid/content/Context;I)I

    move-result p0

    .line 12
    invoke-static {p0}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    int-to-float p1, p1

    mul-float p1, p1, p2

    .line 13
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p0, p1}, Lb/h/f/a;->c(II)I

    move-result p0

    return p0
.end method

.method public static a()Landroid/util/TypedValue;
    .registers 2

    .line 8
    sget-object v0, Lb/b/q/b0;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v0}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/util/TypedValue;

    if-nez v0, :cond_14

    .line 9
    new-instance v0, Landroid/util/TypedValue;

    invoke-direct {v0}, Landroid/util/TypedValue;-><init>()V

    .line 10
    sget-object v1, Lb/b/q/b0;->a:Ljava/lang/ThreadLocal;

    invoke-virtual {v1, v0}, Ljava/lang/ThreadLocal;->set(Ljava/lang/Object;)V

    :cond_14
    return-object v0
.end method

.method public static a(Landroid/view/View;Landroid/content/Context;)V
    .registers 5

    .line 14
    sget-object v0, Lb/b/j;->AppCompatTheme:[I

    invoke-virtual {p1, v0}, Landroid/content/Context;->obtainStyledAttributes([I)Landroid/content/res/TypedArray;

    move-result-object p1

    .line 15
    :try_start_6
    sget v0, Lb/b/j;->AppCompatTheme_windowActionBar:I

    invoke-virtual {p1, v0}, Landroid/content/res/TypedArray;->hasValue(I)Z

    move-result v0

    if-nez v0, :cond_2d

    const-string v0, "ThemeUtils"

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "View "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string p0, " is an AppCompat widget that can only be used with a Theme.AppCompat theme (or descendant)."

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2d
    .catchall {:try_start_6 .. :try_end_2d} :catchall_31

    .line 17
    :cond_2d
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    return-void

    :catchall_31
    move-exception p0

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 18
    throw p0
.end method

.method public static b(Landroid/content/Context;I)I
    .registers 4

    .line 1
    sget-object v0, Lb/b/q/b0;->g:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[I)Lb/b/q/g0;

    move-result-object p0

    .line 3
    :try_start_a
    invoke-virtual {p0, v1, v1}, Lb/b/q/g0;->a(II)I

    move-result p1
    :try_end_e
    .catchall {:try_start_a .. :try_end_e} :catchall_12

    .line 4
    invoke-virtual {p0}, Lb/b/q/g0;->b()V

    return p1

    :catchall_12
    move-exception p1

    invoke-virtual {p0}, Lb/b/q/g0;->b()V

    .line 5
    throw p1
.end method

.method public static c(Landroid/content/Context;I)Landroid/content/res/ColorStateList;
    .registers 4

    .line 1
    sget-object v0, Lb/b/q/b0;->g:[I

    const/4 v1, 0x0

    aput p1, v0, v1

    const/4 p1, 0x0

    .line 2
    invoke-static {p0, p1, v0}, Lb/b/q/g0;->a(Landroid/content/Context;Landroid/util/AttributeSet;[I)Lb/b/q/g0;

    move-result-object p0

    .line 3
    :try_start_a
    invoke-virtual {p0, v1}, Lb/b/q/g0;->a(I)Landroid/content/res/ColorStateList;

    move-result-object p1
    :try_end_e
    .catchall {:try_start_a .. :try_end_e} :catchall_12

    .line 4
    invoke-virtual {p0}, Lb/b/q/g0;->b()V

    return-object p1

    :catchall_12
    move-exception p1

    invoke-virtual {p0}, Lb/b/q/g0;->b()V

    .line 5
    throw p1
.end method
