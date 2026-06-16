.class public Lb/l/d/u;
.super Ljava/lang/Object;
.source "FragmentViewLifecycleOwner.java"

# interfaces
.implements Lb/q/c;
.implements Lb/n/t;


# instance fields
.field public final h:Lb/n/s;

.field public i:Lb/n/i;

.field public j:Lb/q/b;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/Fragment;Lb/n/s;)V
    .registers 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 p1, 0x0

    .line 2
    iput-object p1, p0, Lb/l/d/u;->i:Lb/n/i;

    .line 3
    iput-object p1, p0, Lb/l/d/u;->j:Lb/q/b;

    .line 4
    iput-object p2, p0, Lb/l/d/u;->h:Lb/n/s;

    return-void
.end method


# virtual methods
.method public a()Lb/n/e;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/l/d/u;->d()V

    .line 2
    iget-object v0, p0, Lb/l/d/u;->i:Lb/n/i;

    return-object v0
.end method

.method public a(Landroid/os/Bundle;)V
    .registers 3

    .line 5
    iget-object v0, p0, Lb/l/d/u;->j:Lb/q/b;

    invoke-virtual {v0, p1}, Lb/q/b;->a(Landroid/os/Bundle;)V

    return-void
.end method

.method public a(Lb/n/e$b;)V
    .registers 3

    .line 4
    iget-object v0, p0, Lb/l/d/u;->i:Lb/n/i;

    invoke-virtual {v0, p1}, Lb/n/i;->a(Lb/n/e$b;)V

    return-void
.end method

.method public a(Lb/n/e$c;)V
    .registers 3

    .line 3
    iget-object v0, p0, Lb/l/d/u;->i:Lb/n/i;

    invoke-virtual {v0, p1}, Lb/n/i;->d(Lb/n/e$c;)V

    return-void
.end method

.method public b(Landroid/os/Bundle;)V
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/u;->j:Lb/q/b;

    invoke-virtual {v0, p1}, Lb/q/b;->b(Landroid/os/Bundle;)V

    return-void
.end method

.method public c()Landroidx/savedstate/SavedStateRegistry;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/l/d/u;->d()V

    .line 2
    iget-object v0, p0, Lb/l/d/u;->j:Lb/q/b;

    invoke-virtual {v0}, Lb/q/b;->a()Landroidx/savedstate/SavedStateRegistry;

    move-result-object v0

    return-object v0
.end method

.method public d()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/u;->i:Lb/n/i;

    if-nez v0, :cond_11

    .line 2
    new-instance v0, Lb/n/i;

    invoke-direct {v0, p0}, Lb/n/i;-><init>(Lb/n/h;)V

    iput-object v0, p0, Lb/l/d/u;->i:Lb/n/i;

    .line 3
    invoke-static {p0}, Lb/q/b;->a(Lb/q/c;)Lb/q/b;

    move-result-object v0

    iput-object v0, p0, Lb/l/d/u;->j:Lb/q/b;

    :cond_11
    return-void
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/u;->i:Lb/n/i;

    if-eqz v0, :cond_6

    const/4 v0, 0x1

    goto :goto_7

    :cond_6
    const/4 v0, 0x0

    :goto_7
    return v0
.end method

.method public g()Lb/n/s;
    .registers 2

    .line 1
    invoke-virtual {p0}, Lb/l/d/u;->d()V

    .line 2
    iget-object v0, p0, Lb/l/d/u;->h:Lb/n/s;

    return-object v0
.end method
