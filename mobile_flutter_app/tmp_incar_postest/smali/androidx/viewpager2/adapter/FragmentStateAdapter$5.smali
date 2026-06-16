.class public Landroidx/viewpager2/adapter/FragmentStateAdapter$5;
.super Ljava/lang/Object;
.source "FragmentStateAdapter.java"

# interfaces
.implements Lb/n/f;


# instance fields
.field public final synthetic a:Landroid/os/Handler;

.field public final synthetic b:Ljava/lang/Runnable;


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 4

    .line 1
    sget-object v0, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    if-ne p2, v0, :cond_12

    .line 2
    iget-object p2, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$5;->a:Landroid/os/Handler;

    iget-object v0, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$5;->b:Ljava/lang/Runnable;

    invoke-virtual {p2, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 3
    invoke-interface {p1}, Lb/n/h;->a()Lb/n/e;

    move-result-object p1

    invoke-virtual {p1, p0}, Lb/n/e;->b(Lb/n/g;)V

    :cond_12
    return-void
.end method
