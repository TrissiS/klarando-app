.class public Lb/l/d/f;
.super Ljava/lang/Object;
.source "FragmentController.java"


# instance fields
.field public final a:Lb/l/d/h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lb/l/d/h<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lb/l/d/h;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/h<",
            "*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    iput-object p1, p0, Lb/l/d/f;->a:Lb/l/d/h;

    return-void
.end method

.method public static a(Lb/l/d/h;)Lb/l/d/f;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lb/l/d/h<",
            "*>;)",
            "Lb/l/d/f;"
        }
    .end annotation

    .line 1
    new-instance v0, Lb/l/d/f;

    const-string v1, "callbacks == null"

    invoke-static {p0, v1}, Lb/h/l/h;->a(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Lb/l/d/h;

    invoke-direct {v0, p0}, Lb/l/d/f;-><init>(Lb/l/d/h;)V

    return-object v0
.end method


# virtual methods
.method public a(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;
    .registers 6

    .line 3
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->C()Landroid/view/LayoutInflater$Factory2;

    move-result-object v0

    .line 4
    invoke-interface {v0, p1, p2, p3, p4}, Landroid/view/LayoutInflater$Factory2;->onCreateView(Landroid/view/View;Ljava/lang/String;Landroid/content/Context;Landroid/util/AttributeSet;)Landroid/view/View;

    move-result-object p1

    return-object p1
.end method

.method public a()V
    .registers 2

    .line 8
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->g()V

    return-void
.end method

.method public a(Landroid/content/res/Configuration;)V
    .registers 3

    .line 10
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroid/content/res/Configuration;)V

    return-void
.end method

.method public a(Landroid/os/Parcelable;)V
    .registers 4

    .line 5
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    instance-of v1, v0, Lb/n/t;

    if-eqz v1, :cond_c

    .line 6
    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroid/os/Parcelable;)V

    return-void

    .line 7
    :cond_c
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Your FragmentHostCallback must implement ViewModelStoreOwner to call restoreSaveState(). Call restoreAllState()  if you\'re still using retainNestedNonConfig()."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public a(Landroid/view/Menu;)V
    .registers 3

    .line 13
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroid/view/Menu;)V

    return-void
.end method

.method public a(Landroidx/fragment/app/Fragment;)V
    .registers 4

    .line 2
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v1, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v1, v0, v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Lb/l/d/h;Lb/l/d/e;Landroidx/fragment/app/Fragment;)V

    return-void
.end method

.method public a(Z)V
    .registers 3

    .line 9
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Z)V

    return-void
.end method

.method public a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z
    .registers 4

    .line 11
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1, p2}, Landroidx/fragment/app/FragmentManager;->a(Landroid/view/Menu;Landroid/view/MenuInflater;)Z

    move-result p1

    return p1
.end method

.method public a(Landroid/view/MenuItem;)Z
    .registers 3

    .line 12
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->a(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public b()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->i()V

    return-void
.end method

.method public b(Z)V
    .registers 3

    .line 2
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->b(Z)V

    return-void
.end method

.method public b(Landroid/view/Menu;)Z
    .registers 3

    .line 3
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->b(Landroid/view/Menu;)Z

    move-result p1

    return p1
.end method

.method public b(Landroid/view/MenuItem;)Z
    .registers 3

    .line 4
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0, p1}, Landroidx/fragment/app/FragmentManager;->b(Landroid/view/MenuItem;)Z

    move-result p1

    return p1
.end method

.method public c()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->j()V

    return-void
.end method

.method public d()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->l()V

    return-void
.end method

.method public e()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->m()V

    return-void
.end method

.method public f()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->o()V

    return-void
.end method

.method public g()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->p()V

    return-void
.end method

.method public h()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->q()V

    return-void
.end method

.method public i()Z
    .registers 3

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/FragmentManager;->d(Z)Z

    move-result v0

    return v0
.end method

.method public j()Landroidx/fragment/app/FragmentManager;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    return-object v0
.end method

.method public k()V
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->K()V

    return-void
.end method

.method public l()Landroid/os/Parcelable;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/l/d/f;->a:Lb/l/d/h;

    iget-object v0, v0, Lb/l/d/h;->k:Landroidx/fragment/app/FragmentManager;

    invoke-virtual {v0}, Landroidx/fragment/app/FragmentManager;->N()Landroid/os/Parcelable;

    move-result-object v0

    return-object v0
.end method
