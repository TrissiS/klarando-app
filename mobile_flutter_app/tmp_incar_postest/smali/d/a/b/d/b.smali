.class public abstract Ld/a/b/d/b;
.super Ld/a/a/c;
.source "AppAdapter.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ld/a/a/c<",
        "Ld/a/a/c<",
        "*>.e;>;"
    }
.end annotation


# instance fields
.field public q:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .registers 2

    .line 1
    invoke-direct {p0, p1}, Ld/a/a/c;-><init>(Landroid/content/Context;)V

    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ld/a/b/d/b;->q:Ljava/util/List;

    .line 2
    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView$g;->f()V

    return-void
.end method

.method public b()I
    .registers 2

    .line 1
    invoke-virtual {p0}, Ld/a/b/d/b;->h()I

    move-result v0

    return v0
.end method

.method public e(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TT;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ld/a/b/d/b;->q:Ljava/util/List;

    if-nez v0, :cond_6

    const/4 p1, 0x0

    return-object p1

    .line 2
    :cond_6
    invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public h()I
    .registers 2

    .line 1
    iget-object v0, p0, Ld/a/b/d/b;->q:Ljava/util/List;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return v0

    .line 2
    :cond_6
    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    return v0
.end method
