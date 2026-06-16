.class public Lc/a/a/a/l0/o$b;
.super Lc/a/a/a/l0/o$g;
.source "ShapePath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lc/a/a/a/l0/o;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "b"
.end annotation


# instance fields
.field public final b:Lc/a/a/a/l0/o$d;


# direct methods
.method public constructor <init>(Lc/a/a/a/l0/o$d;)V
    .registers 2

    .line 1
    invoke-direct {p0}, Lc/a/a/a/l0/o$g;-><init>()V

    .line 2
    iput-object p1, p0, Lc/a/a/a/l0/o$b;->b:Lc/a/a/a/l0/o$d;

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Matrix;Lc/a/a/a/k0/a;ILandroid/graphics/Canvas;)V
    .registers 13

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/o$b;->b:Lc/a/a/a/l0/o$d;

    invoke-static {v0}, Lc/a/a/a/l0/o$d;->e(Lc/a/a/a/l0/o$d;)F

    move-result v6

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/o$b;->b:Lc/a/a/a/l0/o$d;

    invoke-static {v0}, Lc/a/a/a/l0/o$d;->f(Lc/a/a/a/l0/o$d;)F

    move-result v7

    .line 3
    new-instance v4, Landroid/graphics/RectF;

    iget-object v0, p0, Lc/a/a/a/l0/o$b;->b:Lc/a/a/a/l0/o$d;

    .line 4
    invoke-static {v0}, Lc/a/a/a/l0/o$d;->a(Lc/a/a/a/l0/o$d;)F

    move-result v0

    iget-object v1, p0, Lc/a/a/a/l0/o$b;->b:Lc/a/a/a/l0/o$d;

    invoke-static {v1}, Lc/a/a/a/l0/o$d;->b(Lc/a/a/a/l0/o$d;)F

    move-result v1

    iget-object v2, p0, Lc/a/a/a/l0/o$b;->b:Lc/a/a/a/l0/o$d;

    invoke-static {v2}, Lc/a/a/a/l0/o$d;->c(Lc/a/a/a/l0/o$d;)F

    move-result v2

    iget-object v3, p0, Lc/a/a/a/l0/o$b;->b:Lc/a/a/a/l0/o$d;

    invoke-static {v3}, Lc/a/a/a/l0/o$d;->d(Lc/a/a/a/l0/o$d;)F

    move-result v3

    invoke-direct {v4, v0, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    move-object v1, p2

    move-object v2, p4

    move-object v3, p1

    move v5, p3

    .line 5
    invoke-virtual/range {v1 .. v7}, Lc/a/a/a/k0/a;->a(Landroid/graphics/Canvas;Landroid/graphics/Matrix;Landroid/graphics/RectF;IFF)V

    return-void
.end method
