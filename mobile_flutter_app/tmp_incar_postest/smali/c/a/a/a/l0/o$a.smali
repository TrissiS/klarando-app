.class public Lc/a/a/a/l0/o$a;
.super Lc/a/a/a/l0/o$g;
.source "ShapePath.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/l0/o;->a(Landroid/graphics/Matrix;)Lc/a/a/a/l0/o$g;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic b:Ljava/util/List;

.field public final synthetic c:Landroid/graphics/Matrix;


# direct methods
.method public constructor <init>(Lc/a/a/a/l0/o;Ljava/util/List;Landroid/graphics/Matrix;)V
    .registers 4

    .line 1
    iput-object p2, p0, Lc/a/a/a/l0/o$a;->b:Ljava/util/List;

    iput-object p3, p0, Lc/a/a/a/l0/o$a;->c:Landroid/graphics/Matrix;

    invoke-direct {p0}, Lc/a/a/a/l0/o$g;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Matrix;Lc/a/a/a/k0/a;ILandroid/graphics/Canvas;)V
    .registers 7

    .line 1
    iget-object p1, p0, Lc/a/a/a/l0/o$a;->b:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc/a/a/a/l0/o$g;

    .line 2
    iget-object v1, p0, Lc/a/a/a/l0/o$a;->c:Landroid/graphics/Matrix;

    invoke-virtual {v0, v1, p2, p3, p4}, Lc/a/a/a/l0/o$g;->a(Landroid/graphics/Matrix;Lc/a/a/a/k0/a;ILandroid/graphics/Canvas;)V

    goto :goto_6

    :cond_18
    return-void
.end method
