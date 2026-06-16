.class public Lc/a/a/a/l0/d;
.super Ljava/lang/Object;
.source "CornerTreatment.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lc/a/a/a/l0/o;FFF)V
    .registers 5

    const p0, 0x0

    throw p0
.end method

.method public a(Lc/a/a/a/l0/o;FFLandroid/graphics/RectF;Lc/a/a/a/l0/c;)V
    .registers 6

    .line 1
    invoke-interface {p5, p4}, Lc/a/a/a/l0/c;->a(Landroid/graphics/RectF;)F

    move-result p4

    invoke-virtual {p0, p1, p2, p3, p4}, Lc/a/a/a/l0/d;->a(Lc/a/a/a/l0/o;FFF)V

    return-void
.end method
