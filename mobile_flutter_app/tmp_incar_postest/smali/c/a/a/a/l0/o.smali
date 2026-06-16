.class public Lc/a/a/a/l0/o;
.super Ljava/lang/Object;
.source "ShapePath.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lc/a/a/a/l0/o$d;,
        Lc/a/a/a/l0/o$e;,
        Lc/a/a/a/l0/o$f;,
        Lc/a/a/a/l0/o$b;,
        Lc/a/a/a/l0/o$c;,
        Lc/a/a/a/l0/o$g;
    }
.end annotation


# instance fields
.field public a:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public b:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public c:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public d:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public e:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public f:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field

.field public final g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/a/a/a/l0/o$f;",
            ">;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lc/a/a/a/l0/o$g;",
            ">;"
        }
    .end annotation
.end field

.field public i:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/o;->g:Ljava/util/List;

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lc/a/a/a/l0/o;->h:Ljava/util/List;

    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, v0, v0}, Lc/a/a/a/l0/o;->b(FF)V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Matrix;)Lc/a/a/a/l0/o$g;
    .registers 4

    .line 33
    invoke-virtual {p0}, Lc/a/a/a/l0/o;->c()F

    move-result v0

    invoke-virtual {p0, v0}, Lc/a/a/a/l0/o;->a(F)V

    .line 34
    new-instance v0, Landroid/graphics/Matrix;

    invoke-direct {v0, p1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    iget-object v1, p0, Lc/a/a/a/l0/o;->h:Ljava/util/List;

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 36
    new-instance v1, Lc/a/a/a/l0/o$a;

    invoke-direct {v1, p0, p1, v0}, Lc/a/a/a/l0/o$a;-><init>(Lc/a/a/a/l0/o;Ljava/util/List;Landroid/graphics/Matrix;)V

    return-object v1
.end method

.method public final a(F)V
    .registers 8

    .line 41
    invoke-virtual {p0}, Lc/a/a/a/l0/o;->b()F

    move-result v0

    cmpl-float v0, v0, p1

    if-nez v0, :cond_9

    return-void

    .line 42
    :cond_9
    invoke-virtual {p0}, Lc/a/a/a/l0/o;->b()F

    move-result v0

    sub-float v0, p1, v0

    const/high16 v1, 0x43b40000    # 360.0f

    add-float/2addr v0, v1

    rem-float/2addr v0, v1

    const/high16 v1, 0x43340000    # 180.0f

    cmpl-float v1, v0, v1

    if-lez v1, :cond_1a

    return-void

    .line 43
    :cond_1a
    new-instance v1, Lc/a/a/a/l0/o$d;

    .line 44
    invoke-virtual {p0}, Lc/a/a/a/l0/o;->d()F

    move-result v2

    invoke-virtual {p0}, Lc/a/a/a/l0/o;->e()F

    move-result v3

    invoke-virtual {p0}, Lc/a/a/a/l0/o;->d()F

    move-result v4

    invoke-virtual {p0}, Lc/a/a/a/l0/o;->e()F

    move-result v5

    invoke-direct {v1, v2, v3, v4, v5}, Lc/a/a/a/l0/o$d;-><init>(FFFF)V

    .line 45
    invoke-virtual {p0}, Lc/a/a/a/l0/o;->b()F

    move-result v2

    invoke-static {v1, v2}, Lc/a/a/a/l0/o$d;->a(Lc/a/a/a/l0/o$d;F)V

    .line 46
    invoke-static {v1, v0}, Lc/a/a/a/l0/o$d;->b(Lc/a/a/a/l0/o$d;F)V

    .line 47
    iget-object v0, p0, Lc/a/a/a/l0/o;->h:Ljava/util/List;

    new-instance v2, Lc/a/a/a/l0/o$b;

    invoke-direct {v2, v1}, Lc/a/a/a/l0/o$b;-><init>(Lc/a/a/a/l0/o$d;)V

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/o;->b(F)V

    return-void
.end method

.method public a(FF)V
    .registers 7

    .line 10
    new-instance v0, Lc/a/a/a/l0/o$e;

    invoke-direct {v0}, Lc/a/a/a/l0/o$e;-><init>()V

    .line 11
    invoke-static {v0, p1}, Lc/a/a/a/l0/o$e;->a(Lc/a/a/a/l0/o$e;F)F

    .line 12
    invoke-static {v0, p2}, Lc/a/a/a/l0/o$e;->b(Lc/a/a/a/l0/o$e;F)F

    .line 13
    iget-object v1, p0, Lc/a/a/a/l0/o;->g:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 14
    new-instance v1, Lc/a/a/a/l0/o$c;

    invoke-virtual {p0}, Lc/a/a/a/l0/o;->d()F

    move-result v2

    invoke-virtual {p0}, Lc/a/a/a/l0/o;->e()F

    move-result v3

    invoke-direct {v1, v0, v2, v3}, Lc/a/a/a/l0/o$c;-><init>(Lc/a/a/a/l0/o$e;FF)V

    .line 15
    invoke-virtual {v1}, Lc/a/a/a/l0/o$c;->a()F

    move-result v0

    const/high16 v2, 0x43870000    # 270.0f

    add-float/2addr v0, v2

    .line 16
    invoke-virtual {v1}, Lc/a/a/a/l0/o$c;->a()F

    move-result v3

    add-float/2addr v3, v2

    .line 17
    invoke-virtual {p0, v1, v0, v3}, Lc/a/a/a/l0/o;->a(Lc/a/a/a/l0/o$g;FF)V

    .line 18
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/o;->d(F)V

    .line 19
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/o;->e(F)V

    return-void
.end method

.method public a(FFFF)V
    .registers 5

    .line 1
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/o;->f(F)V

    .line 2
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/o;->g(F)V

    .line 3
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/o;->d(F)V

    .line 4
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/o;->e(F)V

    .line 5
    invoke-virtual {p0, p3}, Lc/a/a/a/l0/o;->b(F)V

    add-float/2addr p3, p4

    const/high16 p1, 0x43b40000    # 360.0f

    rem-float/2addr p3, p1

    .line 6
    invoke-virtual {p0, p3}, Lc/a/a/a/l0/o;->c(F)V

    .line 7
    iget-object p1, p0, Lc/a/a/a/l0/o;->g:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 8
    iget-object p1, p0, Lc/a/a/a/l0/o;->h:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lc/a/a/a/l0/o;->i:Z

    return-void
.end method

.method public a(FFFFFF)V
    .registers 11

    .line 20
    new-instance v0, Lc/a/a/a/l0/o$d;

    invoke-direct {v0, p1, p2, p3, p4}, Lc/a/a/a/l0/o$d;-><init>(FFFF)V

    .line 21
    invoke-static {v0, p5}, Lc/a/a/a/l0/o$d;->a(Lc/a/a/a/l0/o$d;F)V

    .line 22
    invoke-static {v0, p6}, Lc/a/a/a/l0/o$d;->b(Lc/a/a/a/l0/o$d;F)V

    .line 23
    iget-object v1, p0, Lc/a/a/a/l0/o;->g:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 24
    new-instance v1, Lc/a/a/a/l0/o$b;

    invoke-direct {v1, v0}, Lc/a/a/a/l0/o$b;-><init>(Lc/a/a/a/l0/o$d;)V

    add-float v0, p5, p6

    const/4 v2, 0x0

    cmpg-float p6, p6, v2

    if-gez p6, :cond_1e

    const/4 p6, 0x1

    goto :goto_1f

    :cond_1e
    const/4 p6, 0x0

    :goto_1f
    const/high16 v2, 0x43b40000    # 360.0f

    const/high16 v3, 0x43340000    # 180.0f

    if-eqz p6, :cond_27

    add-float/2addr p5, v3

    rem-float/2addr p5, v2

    :cond_27
    if-eqz p6, :cond_2c

    add-float/2addr v3, v0

    rem-float/2addr v3, v2

    goto :goto_2d

    :cond_2c
    move v3, v0

    .line 25
    :goto_2d
    invoke-virtual {p0, v1, p5, v3}, Lc/a/a/a/l0/o;->a(Lc/a/a/a/l0/o$g;FF)V

    add-float p5, p1, p3

    const/high16 p6, 0x3f000000    # 0.5f

    mul-float p5, p5, p6

    sub-float/2addr p3, p1

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr p3, p1

    float-to-double v0, v0

    .line 26
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Math;->cos(D)D

    move-result-wide v2

    double-to-float v2, v2

    mul-float p3, p3, v2

    add-float/2addr p5, p3

    .line 27
    invoke-virtual {p0, p5}, Lc/a/a/a/l0/o;->d(F)V

    add-float p3, p2, p4

    mul-float p3, p3, p6

    sub-float/2addr p4, p2

    div-float/2addr p4, p1

    .line 28
    invoke-static {v0, v1}, Ljava/lang/Math;->toRadians(D)D

    move-result-wide p1

    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    move-result-wide p1

    double-to-float p1, p1

    mul-float p4, p4, p1

    add-float/2addr p3, p4

    .line 29
    invoke-virtual {p0, p3}, Lc/a/a/a/l0/o;->e(F)V

    return-void
.end method

.method public a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V
    .registers 6

    .line 30
    iget-object v0, p0, Lc/a/a/a/l0/o;->g:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_17

    .line 31
    iget-object v2, p0, Lc/a/a/a/l0/o;->g:Ljava/util/List;

    invoke-interface {v2, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lc/a/a/a/l0/o$f;

    .line 32
    invoke-virtual {v2, p1, p2}, Lc/a/a/a/l0/o$f;->a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_17
    return-void
.end method

.method public final a(Lc/a/a/a/l0/o$g;FF)V
    .registers 4

    .line 37
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/o;->a(F)V

    .line 38
    iget-object p2, p0, Lc/a/a/a/l0/o;->h:Ljava/util/List;

    invoke-interface {p2, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 39
    invoke-virtual {p0, p3}, Lc/a/a/a/l0/o;->b(F)V

    return-void
.end method

.method public a()Z
    .registers 2

    .line 40
    iget-boolean v0, p0, Lc/a/a/a/l0/o;->i:Z

    return v0
.end method

.method public final b()F
    .registers 2

    .line 2
    iget v0, p0, Lc/a/a/a/l0/o;->e:F

    return v0
.end method

.method public final b(F)V
    .registers 2

    .line 3
    iput p1, p0, Lc/a/a/a/l0/o;->e:F

    return-void
.end method

.method public b(FF)V
    .registers 5

    const/high16 v0, 0x43870000    # 270.0f

    const/4 v1, 0x0

    .line 1
    invoke-virtual {p0, p1, p2, v0, v1}, Lc/a/a/a/l0/o;->a(FFFF)V

    return-void
.end method

.method public final c()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/l0/o;->f:F

    return v0
.end method

.method public final c(F)V
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/l0/o;->f:F

    return-void
.end method

.method public d()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/l0/o;->c:F

    return v0
.end method

.method public final d(F)V
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/l0/o;->c:F

    return-void
.end method

.method public e()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/l0/o;->d:F

    return v0
.end method

.method public final e(F)V
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/l0/o;->d:F

    return-void
.end method

.method public f()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/l0/o;->a:F

    return v0
.end method

.method public final f(F)V
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/l0/o;->a:F

    return-void
.end method

.method public g()F
    .registers 2

    .line 1
    iget v0, p0, Lc/a/a/a/l0/o;->b:F

    return v0
.end method

.method public final g(F)V
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/l0/o;->b:F

    return-void
.end method
