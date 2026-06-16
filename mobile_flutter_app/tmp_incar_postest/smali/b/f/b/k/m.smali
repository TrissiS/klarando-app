.class public Lb/f/b/k/m;
.super Lb/f/b/k/e;
.source "WidgetContainer.java"


# instance fields
.field public D0:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/e;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 1
    invoke-direct {p0}, Lb/f/b/k/e;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    return-void
.end method


# virtual methods
.method public H()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 2
    invoke-super {p0}, Lb/f/b/k/e;->H()V

    return-void
.end method

.method public J()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "Lb/f/b/k/e;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    return-object v0
.end method

.method public K()V
    .registers 5

    .line 1
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    if-nez v0, :cond_5

    return-void

    .line 2
    :cond_5
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_20

    .line 3
    iget-object v2, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    .line 4
    instance-of v3, v2, Lb/f/b/k/m;

    if-eqz v3, :cond_1d

    .line 5
    check-cast v2, Lb/f/b/k/m;

    invoke-virtual {v2}, Lb/f/b/k/m;->K()V

    :cond_1d
    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_20
    return-void
.end method

.method public L()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public a(Lb/f/b/c;)V
    .registers 5

    .line 6
    invoke-super {p0, p1}, Lb/f/b/k/e;->a(Lb/f/b/c;)V

    .line 7
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1a

    .line 8
    iget-object v2, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lb/f/b/k/e;

    .line 9
    invoke-virtual {v2, p1}, Lb/f/b/k/e;->a(Lb/f/b/c;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_a

    :cond_1a
    return-void
.end method

.method public a(Lb/f/b/k/e;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 2
    invoke-virtual {p1}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    if-eqz v0, :cond_14

    .line 3
    invoke-virtual {p1}, Lb/f/b/k/e;->t()Lb/f/b/k/e;

    move-result-object v0

    check-cast v0, Lb/f/b/k/m;

    .line 4
    invoke-virtual {v0, p1}, Lb/f/b/k/m;->c(Lb/f/b/k/e;)V

    .line 5
    :cond_14
    invoke-virtual {p1, p0}, Lb/f/b/k/e;->b(Lb/f/b/k/e;)V

    return-void
.end method

.method public c(Lb/f/b/k/e;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/f/b/k/m;->D0:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Lb/f/b/k/e;->b(Lb/f/b/k/e;)V

    return-void
.end method
