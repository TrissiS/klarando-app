.class public Lc/a/a/a/l0/o$d;
.super Lc/a/a/a/l0/o$f;
.source "ShapePath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/l0/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "d"
.end annotation


# static fields
.field public static final h:Landroid/graphics/RectF;


# instance fields
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

.field public g:F
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation
.end field


# direct methods
.method public static constructor <clinit>()V
    .registers 1

    .line 1
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    sput-object v0, Lc/a/a/a/l0/o$d;->h:Landroid/graphics/RectF;

    return-void
.end method

.method public constructor <init>(FFFF)V
    .registers 5

    .line 1
    invoke-direct {p0}, Lc/a/a/a/l0/o$f;-><init>()V

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/o$d;->b(F)V

    .line 3
    invoke-virtual {p0, p2}, Lc/a/a/a/l0/o$d;->f(F)V

    .line 4
    invoke-virtual {p0, p3}, Lc/a/a/a/l0/o$d;->c(F)V

    .line 5
    invoke-virtual {p0, p4}, Lc/a/a/a/l0/o$d;->a(F)V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/l0/o$d;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->b()F

    move-result p0

    return p0
.end method

.method public static synthetic a(Lc/a/a/a/l0/o$d;F)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/o$d;->d(F)V

    return-void
.end method

.method public static synthetic b(Lc/a/a/a/l0/o$d;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->f()F

    move-result p0

    return p0
.end method

.method public static synthetic b(Lc/a/a/a/l0/o$d;F)V
    .registers 2

    .line 2
    invoke-virtual {p0, p1}, Lc/a/a/a/l0/o$d;->e(F)V

    return-void
.end method

.method public static synthetic c(Lc/a/a/a/l0/o$d;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->c()F

    move-result p0

    return p0
.end method

.method public static synthetic d(Lc/a/a/a/l0/o$d;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->a()F

    move-result p0

    return p0
.end method

.method public static synthetic e(Lc/a/a/a/l0/o$d;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->d()F

    move-result p0

    return p0
.end method

.method public static synthetic f(Lc/a/a/a/l0/o$d;)F
    .registers 1

    .line 1
    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->e()F

    move-result p0

    return p0
.end method


# virtual methods
.method public final a()F
    .registers 2

    .line 9
    iget v0, p0, Lc/a/a/a/l0/o$d;->e:F

    return v0
.end method

.method public final a(F)V
    .registers 2

    .line 10
    iput p1, p0, Lc/a/a/a/l0/o$d;->e:F

    return-void
.end method

.method public a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V
    .registers 8

    .line 3
    iget-object v0, p0, Lc/a/a/a/l0/o$f;->a:Landroid/graphics/Matrix;

    .line 4
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 5
    invoke-virtual {p2, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 6
    sget-object v0, Lc/a/a/a/l0/o$d;->h:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->b()F

    move-result v1

    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->f()F

    move-result v2

    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->c()F

    move-result v3

    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->a()F

    move-result v4

    invoke-virtual {v0, v1, v2, v3, v4}, Landroid/graphics/RectF;->set(FFFF)V

    .line 7
    sget-object v0, Lc/a/a/a/l0/o$d;->h:Landroid/graphics/RectF;

    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->d()F

    move-result v1

    invoke-virtual {p0}, Lc/a/a/a/l0/o$d;->e()F

    move-result v2

    const/4 v3, 0x0

    invoke-virtual {p2, v0, v1, v2, v3}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FFZ)V

    .line 8
    invoke-virtual {p2, p1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    return-void
.end method

.method public final b()F
    .registers 2

    .line 3
    iget v0, p0, Lc/a/a/a/l0/o$d;->b:F

    return v0
.end method

.method public final b(F)V
    .registers 2

    .line 4
    iput p1, p0, Lc/a/a/a/l0/o$d;->b:F

    return-void
.end method

.method public final c()F
    .registers 2

    .line 2
    iget v0, p0, Lc/a/a/a/l0/o$d;->d:F

    return v0
.end method

.method public final c(F)V
    .registers 2

    .line 3
    iput p1, p0, Lc/a/a/a/l0/o$d;->d:F

    return-void
.end method

.method public final d()F
    .registers 2

    .line 2
    iget v0, p0, Lc/a/a/a/l0/o$d;->f:F

    return v0
.end method

.method public final d(F)V
    .registers 2

    .line 3
    iput p1, p0, Lc/a/a/a/l0/o$d;->f:F

    return-void
.end method

.method public final e()F
    .registers 2

    .line 2
    iget v0, p0, Lc/a/a/a/l0/o$d;->g:F

    return v0
.end method

.method public final e(F)V
    .registers 2

    .line 3
    iput p1, p0, Lc/a/a/a/l0/o$d;->g:F

    return-void
.end method

.method public final f()F
    .registers 2

    .line 2
    iget v0, p0, Lc/a/a/a/l0/o$d;->c:F

    return v0
.end method

.method public final f(F)V
    .registers 2

    .line 3
    iput p1, p0, Lc/a/a/a/l0/o$d;->c:F

    return-void
.end method
