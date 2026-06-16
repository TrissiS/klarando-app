.class public Lc/a/a/a/l0/h$a;
.super Ljava/lang/Object;
.source "MaterialShapeDrawable.java"

# interfaces
.implements Lc/a/a/a/l0/n$b;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/l0/h;-><init>(Lc/a/a/a/l0/h$c;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lc/a/a/a/l0/h;


# direct methods
.method public constructor <init>(Lc/a/a/a/l0/h;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/l0/h$a;->a:Lc/a/a/a/l0/h;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public a(Lc/a/a/a/l0/o;Landroid/graphics/Matrix;I)V
    .registers 7

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h$a;->a:Lc/a/a/a/l0/h;

    invoke-static {v0}, Lc/a/a/a/l0/h;->a(Lc/a/a/a/l0/h;)Ljava/util/BitSet;

    move-result-object v0

    add-int/lit8 v1, p3, 0x4

    invoke-virtual {p1}, Lc/a/a/a/l0/o;->a()Z

    move-result v2

    invoke-virtual {v0, v1, v2}, Ljava/util/BitSet;->set(IZ)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/h$a;->a:Lc/a/a/a/l0/h;

    invoke-static {v0}, Lc/a/a/a/l0/h;->c(Lc/a/a/a/l0/h;)[Lc/a/a/a/l0/o$g;

    move-result-object v0

    invoke-virtual {p1, p2}, Lc/a/a/a/l0/o;->a(Landroid/graphics/Matrix;)Lc/a/a/a/l0/o$g;

    move-result-object p1

    aput-object p1, v0, p3

    return-void
.end method

.method public b(Lc/a/a/a/l0/o;Landroid/graphics/Matrix;I)V
    .registers 6

    .line 1
    iget-object v0, p0, Lc/a/a/a/l0/h$a;->a:Lc/a/a/a/l0/h;

    invoke-static {v0}, Lc/a/a/a/l0/h;->a(Lc/a/a/a/l0/h;)Ljava/util/BitSet;

    move-result-object v0

    invoke-virtual {p1}, Lc/a/a/a/l0/o;->a()Z

    move-result v1

    invoke-virtual {v0, p3, v1}, Ljava/util/BitSet;->set(IZ)V

    .line 2
    iget-object v0, p0, Lc/a/a/a/l0/h$a;->a:Lc/a/a/a/l0/h;

    invoke-static {v0}, Lc/a/a/a/l0/h;->b(Lc/a/a/a/l0/h;)[Lc/a/a/a/l0/o$g;

    move-result-object v0

    invoke-virtual {p1, p2}, Lc/a/a/a/l0/o;->a(Landroid/graphics/Matrix;)Lc/a/a/a/l0/o$g;

    move-result-object p1

    aput-object p1, v0, p3

    return-void
.end method
