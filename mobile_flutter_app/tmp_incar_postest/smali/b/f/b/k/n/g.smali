.class public Lb/f/b/k/n/g;
.super Lb/f/b/k/n/f;
.source "DimensionDependency.java"


# instance fields
.field public m:I


# direct methods
.method public constructor <init>(Lb/f/b/k/n/m;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Lb/f/b/k/n/f;-><init>(Lb/f/b/k/n/m;)V

    .line 2
    instance-of p1, p1, Lb/f/b/k/n/j;

    if-eqz p1, :cond_c

    .line 3
    sget-object p1, Lb/f/b/k/n/f$a;->HORIZONTAL_DIMENSION:Lb/f/b/k/n/f$a;

    iput-object p1, p0, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    goto :goto_10

    .line 4
    :cond_c
    sget-object p1, Lb/f/b/k/n/f$a;->VERTICAL_DIMENSION:Lb/f/b/k/n/f$a;

    iput-object p1, p0, Lb/f/b/k/n/f;->e:Lb/f/b/k/n/f$a;

    :goto_10
    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/f/b/k/n/f;->j:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lb/f/b/k/n/f;->j:Z

    .line 3
    iput p1, p0, Lb/f/b/k/n/f;->g:I

    .line 4
    iget-object p1, p0, Lb/f/b/k/n/f;->k:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_10
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_20

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb/f/b/k/n/d;

    .line 5
    invoke-interface {v0, v0}, Lb/f/b/k/n/d;->a(Lb/f/b/k/n/d;)V

    goto :goto_10

    :cond_20
    return-void
.end method
