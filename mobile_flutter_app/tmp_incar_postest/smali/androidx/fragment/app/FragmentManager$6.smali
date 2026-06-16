.class public Landroidx/fragment/app/FragmentManager$6;
.super Ljava/lang/Object;
.source "FragmentManager.java"

# interfaces
.implements Lb/n/f;


# instance fields
.field public final synthetic a:Ljava/lang/String;

.field public final synthetic b:Lb/l/d/n;

.field public final synthetic c:Lb/n/e;

.field public final synthetic d:Landroidx/fragment/app/FragmentManager;


# virtual methods
.method public a(Lb/n/h;Lb/n/e$b;)V
    .registers 5

    .line 1
    sget-object p1, Lb/n/e$b;->ON_START:Lb/n/e$b;

    if-ne p2, p1, :cond_22

    .line 2
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager$6;->d:Landroidx/fragment/app/FragmentManager;

    invoke-static {p1}, Landroidx/fragment/app/FragmentManager;->a(Landroidx/fragment/app/FragmentManager;)Ljava/util/Map;

    move-result-object p1

    iget-object v0, p0, Landroidx/fragment/app/FragmentManager$6;->a:Ljava/lang/String;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/os/Bundle;

    if-eqz p1, :cond_22

    .line 3
    iget-object v0, p0, Landroidx/fragment/app/FragmentManager$6;->b:Lb/l/d/n;

    iget-object v1, p0, Landroidx/fragment/app/FragmentManager$6;->a:Ljava/lang/String;

    invoke-interface {v0, v1, p1}, Lb/l/d/n;->a(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 4
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager$6;->d:Landroidx/fragment/app/FragmentManager;

    iget-object v0, p0, Landroidx/fragment/app/FragmentManager$6;->a:Ljava/lang/String;

    invoke-virtual {p1, v0}, Landroidx/fragment/app/FragmentManager;->a(Ljava/lang/String;)V

    .line 5
    :cond_22
    sget-object p1, Lb/n/e$b;->ON_DESTROY:Lb/n/e$b;

    if-ne p2, p1, :cond_36

    .line 6
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager$6;->c:Lb/n/e;

    invoke-virtual {p1, p0}, Lb/n/e;->b(Lb/n/g;)V

    .line 7
    iget-object p1, p0, Landroidx/fragment/app/FragmentManager$6;->d:Landroidx/fragment/app/FragmentManager;

    invoke-static {p1}, Landroidx/fragment/app/FragmentManager;->b(Landroidx/fragment/app/FragmentManager;)Ljava/util/Map;

    move-result-object p1

    iget-object p2, p0, Landroidx/fragment/app/FragmentManager$6;->a:Ljava/lang/String;

    invoke-interface {p1, p2}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_36
    return-void
.end method
