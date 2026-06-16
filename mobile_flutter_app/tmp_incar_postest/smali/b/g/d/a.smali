.class public final Lb/g/d/a;
.super Ljava/lang/Object;
.source "DirectedAcyclicGraph.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field public final a:Lb/h/l/e;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/h/l/e<",
            "Ljava/util/ArrayList<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final b:Lb/e/g;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/e/g<",
            "TT;",
            "Ljava/util/ArrayList<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public final c:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final d:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    new-instance v0, Lb/h/l/f;

    const/16 v1, 0xa

    invoke-direct {v0, v1}, Lb/h/l/f;-><init>(I)V

    iput-object v0, p0, Lb/g/d/a;->a:Lb/h/l/e;

    .line 3
    new-instance v0, Lb/e/g;

    invoke-direct {v0}, Lb/e/g;-><init>()V

    iput-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    .line 4
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lb/g/d/a;->c:Ljava/util/ArrayList;

    .line 5
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Lb/g/d/a;->d:Ljava/util/HashSet;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 4

    .line 9
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0}, Lb/e/g;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_19

    .line 10
    iget-object v2, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v2, v1}, Lb/e/g;->e(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/ArrayList;

    if-eqz v2, :cond_16

    .line 11
    invoke-virtual {p0, v2}, Lb/g/d/a;->a(Ljava/util/ArrayList;)V

    :cond_16
    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    .line 12
    :cond_19
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0}, Lb/e/g;->clear()V

    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    .line 2
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    const/4 v1, 0x0

    invoke-virtual {v0, p1, v1}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_e
    return-void
.end method

.method public a(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;TT;)V"
        }
    .end annotation

    .line 3
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0, p2}, Lb/e/g;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_27

    .line 4
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_23

    .line 5
    invoke-virtual {p0}, Lb/g/d/a;->b()Ljava/util/ArrayList;

    move-result-object v0

    .line 6
    iget-object v1, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v1, p1, v0}, Lb/e/g;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    :cond_23
    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 8
    :cond_27
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "All nodes must be present in the graph before being added as an edge"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ljava/util/ArrayList<",
            "TT;>;",
            "Ljava/util/HashSet<",
            "TT;>;)V"
        }
    .end annotation

    .line 13
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    .line 14
    :cond_7
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    .line 15
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 16
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-eqz v0, :cond_2b

    const/4 v1, 0x0

    .line 17
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_1f
    if-ge v1, v2, :cond_2b

    .line 18
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3, p2, p3}, Lb/g/d/a;->a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_1f

    .line 19
    :cond_2b
    invoke-virtual {p3, p1}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 20
    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    .line 21
    :cond_32
    new-instance p1, Ljava/lang/RuntimeException;

    const-string p2, "This graph contains cyclic dependencies"

    invoke-direct {p1, p2}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final a(Ljava/util/ArrayList;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/ArrayList<",
            "TT;>;)V"
        }
    .end annotation

    .line 22
    invoke-virtual {p1}, Ljava/util/ArrayList;->clear()V

    .line 23
    iget-object v0, p0, Lb/g/d/a;->a:Lb/h/l/e;

    invoke-interface {v0, p1}, Lb/h/l/e;->a(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()Ljava/util/ArrayList;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lb/g/d/a;->a:Lb/h/l/e;

    invoke-interface {v0}, Lb/h/l/e;->a()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/ArrayList;

    if-nez v0, :cond_f

    .line 3
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    :cond_f
    return-object v0
.end method

.method public b(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->containsKey(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public c()Ljava/util/ArrayList;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ArrayList<",
            "TT;>;"
        }
    .end annotation

    .line 2
    iget-object v0, p0, Lb/g/d/a;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 3
    iget-object v0, p0, Lb/g/d/a;->d:Ljava/util/HashSet;

    invoke-virtual {v0}, Ljava/util/HashSet;->clear()V

    .line 4
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0}, Lb/e/g;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_11
    if-ge v1, v0, :cond_23

    .line 5
    iget-object v2, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v2, v1}, Lb/e/g;->c(I)Ljava/lang/Object;

    move-result-object v2

    iget-object v3, p0, Lb/g/d/a;->c:Ljava/util/ArrayList;

    iget-object v4, p0, Lb/g/d/a;->d:Ljava/util/HashSet;

    invoke-virtual {p0, v2, v3, v4}, Lb/g/d/a;->a(Ljava/lang/Object;Ljava/util/ArrayList;Ljava/util/HashSet;)V

    add-int/lit8 v1, v1, 0x1

    goto :goto_11

    .line 6
    :cond_23
    iget-object v0, p0, Lb/g/d/a;->c:Ljava/util/ArrayList;

    return-object v0
.end method

.method public c(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/List;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0, p1}, Lb/e/g;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/List;

    return-object p1
.end method

.method public d(Ljava/lang/Object;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0}, Lb/e/g;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_2d

    .line 2
    iget-object v3, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v3, v2}, Lb/e/g;->e(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_2a

    .line 3
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2a

    if-nez v1, :cond_21

    .line 4
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 5
    :cond_21
    iget-object v3, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v3, v2}, Lb/e/g;->c(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2a
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_2d
    return-object v1
.end method

.method public e(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v0}, Lb/e/g;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :goto_8
    if-ge v2, v0, :cond_1f

    .line 2
    iget-object v3, p0, Lb/g/d/a;->b:Lb/e/g;

    invoke-virtual {v3, v2}, Lb/e/g;->e(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_1c

    .line 3
    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_1c

    const/4 p1, 0x1

    return p1

    :cond_1c
    add-int/lit8 v2, v2, 0x1

    goto :goto_8

    :cond_1f
    return v1
.end method
