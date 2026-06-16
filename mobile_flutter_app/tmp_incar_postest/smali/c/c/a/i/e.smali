.class public Lc/c/a/i/e;
.super Lc/c/a/i/a;
.source "TransparentBarStyle.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/c/a/i/a;-><init>()V

    return-void
.end method


# virtual methods
.method public E(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 1
    new-instance p1, Lc/c/a/g$a;

    invoke-direct {p1}, Lc/c/a/g$a;-><init>()V

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 2
    invoke-virtual {p1, v0}, Lc/c/a/g$a;->a(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v1, 0x22000000

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 3
    invoke-virtual {p1, v0}, Lc/c/a/g$a;->b(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 4
    invoke-virtual {p1, v0}, Lc/c/a/g$a;->c(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;

    .line 5
    invoke-virtual {p1}, Lc/c/a/g$a;->a()Lc/c/a/g;

    move-result-object p1

    return-object p1
.end method

.method public F(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 2

    const/4 p1, -0x1

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1
.end method

.method public G(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 2

    const/4 p1, -0x1

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1
.end method

.method public H(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 4

    .line 1
    new-instance p1, Lc/c/a/g$a;

    invoke-direct {p1}, Lc/c/a/g$a;-><init>()V

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 2
    invoke-virtual {p1, v0}, Lc/c/a/g$a;->a(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    const/high16 v1, 0x22000000

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 3
    invoke-virtual {p1, v0}, Lc/c/a/g$a;->b(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;

    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-direct {v0, v1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 4
    invoke-virtual {p1, v0}, Lc/c/a/g$a;->c(Landroid/graphics/drawable/Drawable;)Lc/c/a/g$a;

    .line 5
    invoke-virtual {p1}, Lc/c/a/g$a;->a()Lc/c/a/g;

    move-result-object p1

    return-object p1
.end method

.method public K(Landroid/content/Context;)Landroid/content/res/ColorStateList;
    .registers 2

    const/4 p1, -0x1

    .line 1
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1
.end method

.method public k(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    sget v0, Lc/c/a/c;->bar_arrows_left_white:I

    invoke-static {p1, v0}, Lc/c/a/h;->a(Landroid/content/Context;I)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    return-object p1
.end method

.method public n(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    return-object p1
.end method

.method public x(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 3

    .line 1
    new-instance p1, Landroid/graphics/drawable/ColorDrawable;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    return-object p1
.end method
