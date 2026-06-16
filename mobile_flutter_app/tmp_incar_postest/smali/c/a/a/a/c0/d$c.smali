.class public Lc/a/a/a/c0/d$c;
.super Lc/a/a/a/m/g;
.source "FloatingActionButtonImpl.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lc/a/a/a/c0/d;->a(Lc/a/a/a/m/h;FFF)Landroid/animation/AnimatorSet;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic d:Lc/a/a/a/c0/d;


# direct methods
.method public constructor <init>(Lc/a/a/a/c0/d;)V
    .registers 2

    .line 1
    iput-object p1, p0, Lc/a/a/a/c0/d$c;->d:Lc/a/a/a/c0/d;

    invoke-direct {p0}, Lc/a/a/a/m/g;-><init>()V

    return-void
.end method


# virtual methods
.method public a(FLandroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;
    .registers 5

    .line 1
    iget-object v0, p0, Lc/a/a/a/c0/d$c;->d:Lc/a/a/a/c0/d;

    invoke-static {v0, p1}, Lc/a/a/a/c0/d;->a(Lc/a/a/a/c0/d;F)F

    .line 2
    invoke-super {p0, p1, p2, p3}, Lc/a/a/a/m/g;->a(FLandroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic evaluate(FLjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4

    .line 1
    check-cast p2, Landroid/graphics/Matrix;

    check-cast p3, Landroid/graphics/Matrix;

    invoke-virtual {p0, p1, p2, p3}, Lc/a/a/a/c0/d$c;->a(FLandroid/graphics/Matrix;Landroid/graphics/Matrix;)Landroid/graphics/Matrix;

    move-result-object p1

    return-object p1
.end method
