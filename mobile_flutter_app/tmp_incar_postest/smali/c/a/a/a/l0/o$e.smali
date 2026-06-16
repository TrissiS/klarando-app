.class public Lc/a/a/a/l0/o$e;
.super Lc/a/a/a/l0/o$f;
.source "ShapePath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/l0/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "e"
.end annotation


# instance fields
.field public b:F

.field public c:F


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Lc/a/a/a/l0/o$f;-><init>()V

    return-void
.end method

.method public static synthetic a(Lc/a/a/a/l0/o$e;)F
    .registers 1

    .line 1
    iget p0, p0, Lc/a/a/a/l0/o$e;->b:F

    return p0
.end method

.method public static synthetic a(Lc/a/a/a/l0/o$e;F)F
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/l0/o$e;->b:F

    return p1
.end method

.method public static synthetic b(Lc/a/a/a/l0/o$e;)F
    .registers 1

    .line 1
    iget p0, p0, Lc/a/a/a/l0/o$e;->c:F

    return p0
.end method

.method public static synthetic b(Lc/a/a/a/l0/o$e;F)F
    .registers 2

    .line 2
    iput p1, p0, Lc/a/a/a/l0/o$e;->c:F

    return p1
.end method


# virtual methods
.method public a(Landroid/graphics/Matrix;Landroid/graphics/Path;)V
    .registers 5

    .line 3
    iget-object v0, p0, Lc/a/a/a/l0/o$f;->a:Landroid/graphics/Matrix;

    .line 4
    invoke-virtual {p1, v0}, Landroid/graphics/Matrix;->invert(Landroid/graphics/Matrix;)Z

    .line 5
    invoke-virtual {p2, v0}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    .line 6
    iget v0, p0, Lc/a/a/a/l0/o$e;->b:F

    iget v1, p0, Lc/a/a/a/l0/o$e;->c:F

    invoke-virtual {p2, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 7
    invoke-virtual {p2, p1}, Landroid/graphics/Path;->transform(Landroid/graphics/Matrix;)V

    return-void
.end method
