.class public final Lb/w/c/b;
.super Landroidx/viewpager2/widget/ViewPager2$i;
.source "CompositeOnPageChangeCallback.java"


# instance fields
.field public final a:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Landroidx/viewpager2/widget/ViewPager2$i;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(I)V
    .registers 3

    .line 1
    invoke-direct {p0}, Landroidx/viewpager2/widget/ViewPager2$i;-><init>()V

    .line 2
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(I)V

    iput-object v0, p0, Lb/w/c/b;->a:Ljava/util/List;

    return-void
.end method


# virtual methods
.method public a(I)V
    .registers 4

    .line 5
    :try_start_0
    iget-object v0, p0, Lb/w/c/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/viewpager2/widget/ViewPager2$i;

    .line 6
    invoke-virtual {v1, p1}, Landroidx/viewpager2/widget/ViewPager2$i;->a(I)V
    :try_end_15
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_15} :catch_17

    goto :goto_6

    :cond_16
    return-void

    :catch_17
    move-exception p1

    .line 7
    invoke-virtual {p0, p1}, Lb/w/c/b;->a(Ljava/util/ConcurrentModificationException;)V

    const/4 p1, 0x0

    throw p1
.end method

.method public a(IFI)V
    .registers 6

    .line 2
    :try_start_0
    iget-object v0, p0, Lb/w/c/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/viewpager2/widget/ViewPager2$i;

    .line 3
    invoke-virtual {v1, p1, p2, p3}, Landroidx/viewpager2/widget/ViewPager2$i;->a(IFI)V
    :try_end_15
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_15} :catch_17

    goto :goto_6

    :cond_16
    return-void

    :catch_17
    move-exception p1

    .line 4
    invoke-virtual {p0, p1}, Lb/w/c/b;->a(Ljava/util/ConcurrentModificationException;)V

    const/4 p1, 0x0

    throw p1
.end method

.method public a(Landroidx/viewpager2/widget/ViewPager2$i;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/w/c/b;->a:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a(Ljava/util/ConcurrentModificationException;)V
    .registers 4

    .line 8
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Adding and removing callbacks during dispatch to callbacks is not supported"

    invoke-direct {v0, v1, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method public b(I)V
    .registers 4

    .line 1
    :try_start_0
    iget-object v0, p0, Lb/w/c/b;->a:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroidx/viewpager2/widget/ViewPager2$i;

    .line 2
    invoke-virtual {v1, p1}, Landroidx/viewpager2/widget/ViewPager2$i;->b(I)V
    :try_end_15
    .catch Ljava/util/ConcurrentModificationException; {:try_start_0 .. :try_end_15} :catch_17

    goto :goto_6

    :cond_16
    return-void

    :catch_17
    move-exception p1

    .line 3
    invoke-virtual {p0, p1}, Lb/w/c/b;->a(Ljava/util/ConcurrentModificationException;)V

    const/4 p1, 0x0

    throw p1
.end method
