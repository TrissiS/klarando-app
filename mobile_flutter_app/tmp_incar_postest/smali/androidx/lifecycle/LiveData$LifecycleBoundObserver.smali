.class public Landroidx/lifecycle/LiveData$LifecycleBoundObserver;
.super Landroidx/lifecycle/LiveData$c;
.source "LiveData.java"

# interfaces
.implements Lb/n/f;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/lifecycle/LiveData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "LifecycleBoundObserver"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroidx/lifecycle/LiveData<",
        "TT;>.c;",
        "Lb/n/f;"
    }
.end annotation


# instance fields
.field public final e:Lb/n/h;

.field public final synthetic f:Landroidx/lifecycle/LiveData;


# direct methods
.method public constructor <init>(Landroidx/lifecycle/LiveData;Lb/n/h;Lb/n/n;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/n/h;",
            "Lb/n/n<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->f:Landroidx/lifecycle/LiveData;

    .line 2
    invoke-direct {p0, p1, p3}, Landroidx/lifecycle/LiveData$c;-><init>(Landroidx/lifecycle/LiveData;Lb/n/n;)V

    .line 3
    iput-object p2, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->e:Lb/n/h;

    return-void
.end method


# virtual methods
.method public a()V
    .registers 2

    .line 6
    iget-object v0, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->e:Lb/n/h;

    invoke-interface {v0}, Lb/n/h;->a()Lb/n/e;

    move-result-object v0

    invoke-virtual {v0, p0}, Lb/n/e;->b(Lb/n/g;)V

    return-void
.end method

.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 4

    .line 1
    iget-object p1, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->e:Lb/n/h;

    invoke-interface {p1}, Lb/n/h;->a()Lb/n/e;

    move-result-object p1

    invoke-virtual {p1}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object p1

    .line 2
    sget-object p2, Lb/n/e$c;->DESTROYED:Lb/n/e$c;

    if-ne p1, p2, :cond_16

    .line 3
    iget-object p1, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->f:Landroidx/lifecycle/LiveData;

    iget-object p2, p0, Landroidx/lifecycle/LiveData$c;->a:Lb/n/n;

    invoke-virtual {p1, p2}, Landroidx/lifecycle/LiveData;->b(Lb/n/n;)V

    return-void

    :cond_16
    const/4 p2, 0x0

    :goto_17
    if-eq p2, p1, :cond_2e

    .line 4
    invoke-virtual {p0}, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->b()Z

    move-result p2

    invoke-virtual {p0, p2}, Landroidx/lifecycle/LiveData$c;->a(Z)V

    .line 5
    iget-object p2, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->e:Lb/n/h;

    invoke-interface {p2}, Lb/n/h;->a()Lb/n/e;

    move-result-object p2

    invoke-virtual {p2}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object p2

    move-object v0, p2

    move-object p2, p1

    move-object p1, v0

    goto :goto_17

    :cond_2e
    return-void
.end method

.method public b()Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->e:Lb/n/h;

    invoke-interface {v0}, Lb/n/h;->a()Lb/n/e;

    move-result-object v0

    invoke-virtual {v0}, Lb/n/e;->a()Lb/n/e$c;

    move-result-object v0

    sget-object v1, Lb/n/e$c;->STARTED:Lb/n/e$c;

    invoke-virtual {v0, v1}, Lb/n/e$c;->isAtLeast(Lb/n/e$c;)Z

    move-result v0

    return v0
.end method

.method public g(Lb/n/h;)Z
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/lifecycle/LiveData$LifecycleBoundObserver;->e:Lb/n/h;

    if-ne v0, p1, :cond_6

    const/4 p1, 0x1

    goto :goto_7

    :cond_6
    const/4 p1, 0x0

    :goto_7
    return p1
.end method
