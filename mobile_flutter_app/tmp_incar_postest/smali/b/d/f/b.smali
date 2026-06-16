.class public Lb/d/f/b;
.super Ljava/lang/Object;
.source "CardViewApi21Impl.java"

# interfaces
.implements Lb/d/f/e;


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lb/d/f/d;)F
    .registers 2

    .line 7
    invoke-virtual {p0, p1}, Lb/d/f/b;->j(Lb/d/f/d;)Lb/d/f/f;

    move-result-object p1

    invoke-virtual {p1}, Lb/d/f/f;->b()F

    move-result p1

    return p1
.end method

.method public a()V
    .registers 1

    return-void
.end method

.method public a(Lb/d/f/d;F)V
    .registers 3

    .line 8
    invoke-interface {p1}, Lb/d/f/d;->a()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1, p2}, Landroid/view/View;->setElevation(F)V

    return-void
.end method

.method public a(Lb/d/f/d;Landroid/content/Context;Landroid/content/res/ColorStateList;FFF)V
    .registers 7

    .line 1
    new-instance p2, Lb/d/f/f;

    invoke-direct {p2, p3, p4}, Lb/d/f/f;-><init>(Landroid/content/res/ColorStateList;F)V

    .line 2
    invoke-interface {p1, p2}, Lb/d/f/d;->a(Landroid/graphics/drawable/Drawable;)V

    .line 3
    invoke-interface {p1}, Lb/d/f/d;->a()Landroid/view/View;

    move-result-object p2

    const/4 p3, 0x1

    .line 4
    invoke-virtual {p2, p3}, Landroid/view/View;->setClipToOutline(Z)V

    .line 5
    invoke-virtual {p2, p5}, Landroid/view/View;->setElevation(F)V

    .line 6
    invoke-virtual {p0, p1, p6}, Lb/d/f/b;->c(Lb/d/f/d;F)V

    return-void
.end method

.method public a(Lb/d/f/d;Landroid/content/res/ColorStateList;)V
    .registers 3

    .line 9
    invoke-virtual {p0, p1}, Lb/d/f/b;->j(Lb/d/f/d;)Lb/d/f/f;

    move-result-object p1

    invoke-virtual {p1, p2}, Lb/d/f/f;->b(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public b(Lb/d/f/d;)F
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lb/d/f/b;->j(Lb/d/f/d;)Lb/d/f/f;

    move-result-object p1

    invoke-virtual {p1}, Lb/d/f/f;->c()F

    move-result p1

    return p1
.end method

.method public b(Lb/d/f/d;F)V
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lb/d/f/b;->j(Lb/d/f/d;)Lb/d/f/f;

    move-result-object p1

    invoke-virtual {p1, p2}, Lb/d/f/f;->a(F)V

    return-void
.end method

.method public c(Lb/d/f/d;)F
    .registers 3

    .line 5
    invoke-virtual {p0, p1}, Lb/d/f/b;->b(Lb/d/f/d;)F

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    return p1
.end method

.method public c(Lb/d/f/d;F)V
    .registers 6

    .line 1
    invoke-virtual {p0, p1}, Lb/d/f/b;->j(Lb/d/f/d;)Lb/d/f/f;

    move-result-object v0

    .line 2
    invoke-interface {p1}, Lb/d/f/d;->b()Z

    move-result v1

    invoke-interface {p1}, Lb/d/f/d;->d()Z

    move-result v2

    .line 3
    invoke-virtual {v0, p2, v1, v2}, Lb/d/f/f;->a(FZZ)V

    .line 4
    invoke-virtual {p0, p1}, Lb/d/f/b;->i(Lb/d/f/d;)V

    return-void
.end method

.method public d(Lb/d/f/d;)F
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lb/d/f/b;->b(Lb/d/f/d;)F

    move-result p1

    const/high16 v0, 0x40000000    # 2.0f

    mul-float p1, p1, v0

    return p1
.end method

.method public e(Lb/d/f/d;)V
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lb/d/f/b;->a(Lb/d/f/d;)F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lb/d/f/b;->c(Lb/d/f/d;F)V

    return-void
.end method

.method public f(Lb/d/f/d;)Landroid/content/res/ColorStateList;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/d/f/b;->j(Lb/d/f/d;)Lb/d/f/f;

    move-result-object p1

    invoke-virtual {p1}, Lb/d/f/f;->a()Landroid/content/res/ColorStateList;

    move-result-object p1

    return-object p1
.end method

.method public g(Lb/d/f/d;)V
    .registers 3

    .line 1
    invoke-virtual {p0, p1}, Lb/d/f/b;->a(Lb/d/f/d;)F

    move-result v0

    invoke-virtual {p0, p1, v0}, Lb/d/f/b;->c(Lb/d/f/d;F)V

    return-void
.end method

.method public h(Lb/d/f/d;)F
    .registers 2

    .line 1
    invoke-interface {p1}, Lb/d/f/d;->a()Landroid/view/View;

    move-result-object p1

    invoke-virtual {p1}, Landroid/view/View;->getElevation()F

    move-result p1

    return p1
.end method

.method public i(Lb/d/f/d;)V
    .registers 6

    .line 1
    invoke-interface {p1}, Lb/d/f/d;->b()Z

    move-result v0

    if-nez v0, :cond_b

    const/4 v0, 0x0

    .line 2
    invoke-interface {p1, v0, v0, v0, v0}, Lb/d/f/d;->a(IIII)V

    return-void

    .line 3
    :cond_b
    invoke-virtual {p0, p1}, Lb/d/f/b;->a(Lb/d/f/d;)F

    move-result v0

    .line 4
    invoke-virtual {p0, p1}, Lb/d/f/b;->b(Lb/d/f/d;)F

    move-result v1

    .line 5
    invoke-interface {p1}, Lb/d/f/d;->d()Z

    move-result v2

    invoke-static {v0, v1, v2}, Lb/d/f/g;->a(FFZ)F

    move-result v2

    float-to-double v2, v2

    .line 6
    invoke-static {v2, v3}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v2

    double-to-int v2, v2

    .line 7
    invoke-interface {p1}, Lb/d/f/d;->d()Z

    move-result v3

    invoke-static {v0, v1, v3}, Lb/d/f/g;->b(FFZ)F

    move-result v0

    float-to-double v0, v0

    .line 8
    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    .line 9
    invoke-interface {p1, v2, v0, v2, v0}, Lb/d/f/d;->a(IIII)V

    return-void
.end method

.method public final j(Lb/d/f/d;)Lb/d/f/f;
    .registers 2

    .line 1
    invoke-interface {p1}, Lb/d/f/d;->c()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    check-cast p1, Lb/d/f/f;

    return-object p1
.end method
