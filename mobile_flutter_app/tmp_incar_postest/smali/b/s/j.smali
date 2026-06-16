.class public Lb/s/j;
.super Ljava/lang/Object;
.source "GhostViewUtils.java"


# direct methods
.method public static a(Landroid/view/View;Landroid/view/ViewGroup;Landroid/graphics/Matrix;)Lb/s/f;
    .registers 5

    .line 1
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ne v0, v1, :cond_b

    .line 2
    invoke-static {p0, p1, p2}, Lb/s/h;->a(Landroid/view/View;Landroid/view/ViewGroup;Landroid/graphics/Matrix;)Lb/s/f;

    move-result-object p0

    return-object p0

    .line 3
    :cond_b
    invoke-static {p0, p1, p2}, Lb/s/i;->a(Landroid/view/View;Landroid/view/ViewGroup;Landroid/graphics/Matrix;)Lb/s/i;

    move-result-object p0

    return-object p0
.end method

.method public static a(Landroid/view/View;)V
    .registers 3

    .line 4
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1c

    if-ne v0, v1, :cond_a

    .line 5
    invoke-static {p0}, Lb/s/h;->a(Landroid/view/View;)V

    goto :goto_d

    .line 6
    :cond_a
    invoke-static {p0}, Lb/s/i;->b(Landroid/view/View;)V

    :goto_d
    return-void
.end method
