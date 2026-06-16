.class public Landroidx/fragment/app/FragmentActivity$c;
.super Lb/l/d/h;
.source "FragmentActivity.java"

# interfaces
.implements Lb/n/t;
.implements Lb/a/c;
.implements Lb/a/e/d;
.implements Lb/l/d/m;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/fragment/app/FragmentActivity;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lb/l/d/h<",
        "Landroidx/fragment/app/FragmentActivity;",
        ">;",
        "Lb/n/t;",
        "Lb/a/c;",
        "Lb/a/e/d;",
        "Lb/l/d/m;"
    }
.end annotation


# instance fields
.field public final synthetic l:Landroidx/fragment/app/FragmentActivity;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/FragmentActivity;)V
    .registers 2

    .line 1
    iput-object p1, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    .line 2
    invoke-direct {p0, p1}, Lb/l/d/h;-><init>(Landroidx/fragment/app/FragmentActivity;)V

    return-void
.end method


# virtual methods
.method public a(I)Landroid/view/View;
    .registers 3

    .line 4
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0, p1}, Landroid/app/Activity;->findViewById(I)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public a()Lb/n/e;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    iget-object v0, v0, Landroidx/fragment/app/FragmentActivity;->q:Lb/n/i;

    return-object v0
.end method

.method public a(Landroidx/fragment/app/FragmentManager;Landroidx/fragment/app/Fragment;)V
    .registers 3

    .line 3
    iget-object p1, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p1, p2}, Landroidx/fragment/app/FragmentActivity;->a(Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment;)Z
    .registers 2

    .line 2
    iget-object p1, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->isFinishing()Z

    move-result p1

    xor-int/lit8 p1, p1, 0x1

    return p1
.end method

.method public b()Landroidx/activity/OnBackPressedDispatcher;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->b()Landroidx/activity/OnBackPressedDispatcher;

    move-result-object v0

    return-object v0
.end method

.method public d()Lb/a/e/c;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->d()Lb/a/e/c;

    move-result-object v0

    return-object v0
.end method

.method public e()Z
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    if-eqz v0, :cond_10

    .line 2
    invoke-virtual {v0}, Landroid/view/Window;->peekDecorView()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_10

    const/4 v0, 0x1

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    return v0
.end method

.method public g()Lb/n/s;
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/activity/ComponentActivity;->g()Lb/n/s;

    move-result-object v0

    return-object v0
.end method

.method public j()Landroidx/fragment/app/FragmentActivity;
    .registers 2

    .line 2
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    return-object v0
.end method

.method public bridge synthetic j()Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0}, Landroidx/fragment/app/FragmentActivity$c;->j()Landroidx/fragment/app/FragmentActivity;

    move-result-object v0

    return-object v0
.end method

.method public k()Landroid/view/LayoutInflater;
    .registers 3

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getLayoutInflater()Landroid/view/LayoutInflater;

    move-result-object v0

    iget-object v1, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0, v1}, Landroid/view/LayoutInflater;->cloneInContext(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    return-object v0
.end method

.method public l()V
    .registers 2

    .line 1
    iget-object v0, p0, Landroidx/fragment/app/FragmentActivity$c;->l:Landroidx/fragment/app/FragmentActivity;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentActivity;->p()V

    return-void
.end method
