.class public Landroidx/viewpager2/adapter/FragmentStateAdapter$2;
.super Ljava/lang/Object;
.source "FragmentStateAdapter.java"

# interfaces
.implements Lb/n/f;


# instance fields
.field public final synthetic a:Lb/w/b/b;

.field public final synthetic b:Lb/w/b/a;


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 3

    .line 1
    iget-object p2, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$2;->b:Lb/w/b/a;

    invoke-virtual {p2}, Lb/w/b/a;->g()Z

    move-result p2

    if-eqz p2, :cond_9

    return-void

    .line 2
    :cond_9
    invoke-interface {p1}, Lb/n/h;->a()Lb/n/e;

    move-result-object p1

    invoke-virtual {p1, p0}, Lb/n/e;->b(Lb/n/g;)V

    .line 3
    iget-object p1, p0, Landroidx/viewpager2/adapter/FragmentStateAdapter$2;->a:Lb/w/b/b;

    invoke-virtual {p1}, Lb/w/b/b;->C()Landroid/widget/FrameLayout;

    const/4 p1, 0x0

    throw p1
.end method
