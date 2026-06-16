.class public Lc/a/a/a/l0/i;
.super Ljava/lang/Object;
.source "MaterialShapeUtils.java"


# direct methods
.method public static a()Lc/a/a/a/l0/d;
    .registers 1

    .line 4
    new-instance v0, Lc/a/a/a/l0/l;

    invoke-direct {v0}, Lc/a/a/a/l0/l;-><init>()V

    return-object v0
.end method

.method public static a(I)Lc/a/a/a/l0/d;
    .registers 2

    if-eqz p0, :cond_10

    const/4 v0, 0x1

    if-eq p0, v0, :cond_a

    .line 1
    invoke-static {}, Lc/a/a/a/l0/i;->a()Lc/a/a/a/l0/d;

    move-result-object p0

    return-object p0

    .line 2
    :cond_a
    new-instance p0, Lc/a/a/a/l0/e;

    invoke-direct {p0}, Lc/a/a/a/l0/e;-><init>()V

    return-object p0

    .line 3
    :cond_10
    new-instance p0, Lc/a/a/a/l0/l;

    invoke-direct {p0}, Lc/a/a/a/l0/l;-><init>()V

    return-object p0
.end method

.method public static a(Landroid/view/View;)V
    .registers 3

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    .line 9
    instance-of v1, v0, Lc/a/a/a/l0/h;

    if-eqz v1, :cond_d

    .line 10
    check-cast v0, Lc/a/a/a/l0/h;

    invoke-static {p0, v0}, Lc/a/a/a/l0/i;->a(Landroid/view/View;Lc/a/a/a/l0/h;)V

    :cond_d
    return-void
.end method

.method public static a(Landroid/view/View;F)V
    .registers 3

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p0

    .line 6
    instance-of v0, p0, Lc/a/a/a/l0/h;

    if-eqz v0, :cond_d

    .line 7
    check-cast p0, Lc/a/a/a/l0/h;

    invoke-virtual {p0, p1}, Lc/a/a/a/l0/h;->b(F)V

    :cond_d
    return-void
.end method

.method public static a(Landroid/view/View;Lc/a/a/a/l0/h;)V
    .registers 3

    .line 11
    invoke-virtual {p1}, Lc/a/a/a/l0/h;->A()Z

    move-result v0

    if-eqz v0, :cond_d

    .line 12
    invoke-static {p0}, Lc/a/a/a/d0/t;->d(Landroid/view/View;)F

    move-result p0

    invoke-virtual {p1, p0}, Lc/a/a/a/l0/h;->d(F)V

    :cond_d
    return-void
.end method

.method public static b()Lc/a/a/a/l0/f;
    .registers 1

    .line 1
    new-instance v0, Lc/a/a/a/l0/f;

    invoke-direct {v0}, Lc/a/a/a/l0/f;-><init>()V

    return-object v0
.end method
