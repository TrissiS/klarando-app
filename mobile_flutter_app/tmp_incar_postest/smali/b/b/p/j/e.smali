.class public Lb/b/p/j/e;
.super Ljava/lang/Object;
.source "ListMenuPresenter.java"

# interfaces
.implements Lb/b/p/j/m;
.implements Landroid/widget/AdapterView$OnItemClickListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lb/b/p/j/e$a;
    }
.end annotation


# instance fields
.field public h:Landroid/content/Context;

.field public i:Landroid/view/LayoutInflater;

.field public j:Lb/b/p/j/g;

.field public k:Landroidx/appcompat/view/menu/ExpandedMenuView;

.field public l:I

.field public m:I

.field public n:I

.field public o:Lb/b/p/j/m$a;

.field public p:Lb/b/p/j/e$a;

.field public q:I


# direct methods
.method public constructor <init>(II)V
    .registers 3

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    iput p1, p0, Lb/b/p/j/e;->n:I

    .line 6
    iput p2, p0, Lb/b/p/j/e;->m:I

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;I)V
    .registers 4

    const/4 v0, 0x0

    .line 1
    invoke-direct {p0, p2, v0}, Lb/b/p/j/e;-><init>(II)V

    .line 2
    iput-object p1, p0, Lb/b/p/j/e;->h:Landroid/content/Context;

    .line 3
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lb/b/p/j/e;->i:Landroid/view/LayoutInflater;

    return-void
.end method


# virtual methods
.method public a()I
    .registers 2

    .line 28
    iget v0, p0, Lb/b/p/j/e;->q:I

    return v0
.end method

.method public a(Landroid/view/ViewGroup;)Lb/b/p/j/n;
    .registers 5

    .line 11
    iget-object v0, p0, Lb/b/p/j/e;->k:Landroidx/appcompat/view/menu/ExpandedMenuView;

    if-nez v0, :cond_28

    .line 12
    iget-object v0, p0, Lb/b/p/j/e;->i:Landroid/view/LayoutInflater;

    sget v1, Lb/b/g;->abc_expanded_menu_layout:I

    const/4 v2, 0x0

    invoke-virtual {v0, v1, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/view/menu/ExpandedMenuView;

    iput-object p1, p0, Lb/b/p/j/e;->k:Landroidx/appcompat/view/menu/ExpandedMenuView;

    .line 13
    iget-object p1, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    if-nez p1, :cond_1c

    .line 14
    new-instance p1, Lb/b/p/j/e$a;

    invoke-direct {p1, p0}, Lb/b/p/j/e$a;-><init>(Lb/b/p/j/e;)V

    iput-object p1, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    .line 15
    :cond_1c
    iget-object p1, p0, Lb/b/p/j/e;->k:Landroidx/appcompat/view/menu/ExpandedMenuView;

    iget-object v0, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    invoke-virtual {p1, v0}, Landroid/widget/ListView;->setAdapter(Landroid/widget/ListAdapter;)V

    .line 16
    iget-object p1, p0, Lb/b/p/j/e;->k:Landroidx/appcompat/view/menu/ExpandedMenuView;

    invoke-virtual {p1, p0}, Landroid/widget/ListView;->setOnItemClickListener(Landroid/widget/AdapterView$OnItemClickListener;)V

    .line 17
    :cond_28
    iget-object p1, p0, Lb/b/p/j/e;->k:Landroidx/appcompat/view/menu/ExpandedMenuView;

    return-object p1
.end method

.method public a(Landroid/content/Context;Lb/b/p/j/g;)V
    .registers 5

    .line 1
    iget v0, p0, Lb/b/p/j/e;->m:I

    if-eqz v0, :cond_14

    .line 2
    new-instance v0, Landroid/view/ContextThemeWrapper;

    iget v1, p0, Lb/b/p/j/e;->m:I

    invoke-direct {v0, p1, v1}, Landroid/view/ContextThemeWrapper;-><init>(Landroid/content/Context;I)V

    iput-object v0, p0, Lb/b/p/j/e;->h:Landroid/content/Context;

    .line 3
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lb/b/p/j/e;->i:Landroid/view/LayoutInflater;

    goto :goto_24

    .line 4
    :cond_14
    iget-object v0, p0, Lb/b/p/j/e;->h:Landroid/content/Context;

    if-eqz v0, :cond_24

    .line 5
    iput-object p1, p0, Lb/b/p/j/e;->h:Landroid/content/Context;

    .line 6
    iget-object v0, p0, Lb/b/p/j/e;->i:Landroid/view/LayoutInflater;

    if-nez v0, :cond_24

    .line 7
    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p1

    iput-object p1, p0, Lb/b/p/j/e;->i:Landroid/view/LayoutInflater;

    .line 8
    :cond_24
    :goto_24
    iput-object p2, p0, Lb/b/p/j/e;->j:Lb/b/p/j/g;

    .line 9
    iget-object p1, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    if-eqz p1, :cond_2d

    .line 10
    invoke-virtual {p1}, Lb/b/p/j/e$a;->notifyDataSetChanged()V

    :cond_2d
    return-void
.end method

.method public a(Landroid/os/Bundle;)V
    .registers 3

    const-string v0, "android:menu:list"

    .line 26
    invoke-virtual {p1, v0}, Landroid/os/Bundle;->getSparseParcelableArray(Ljava/lang/String;)Landroid/util/SparseArray;

    move-result-object p1

    if-eqz p1, :cond_d

    .line 27
    iget-object v0, p0, Lb/b/p/j/e;->k:Landroidx/appcompat/view/menu/ExpandedMenuView;

    invoke-virtual {v0, p1}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    :cond_d
    return-void
.end method

.method public a(Landroid/os/Parcelable;)V
    .registers 2

    .line 29
    check-cast p1, Landroid/os/Bundle;

    invoke-virtual {p0, p1}, Lb/b/p/j/e;->a(Landroid/os/Bundle;)V

    return-void
.end method

.method public a(Lb/b/p/j/g;Z)V
    .registers 4

    .line 24
    iget-object v0, p0, Lb/b/p/j/e;->o:Lb/b/p/j/m$a;

    if-eqz v0, :cond_7

    .line 25
    invoke-interface {v0, p1, p2}, Lb/b/p/j/m$a;->a(Lb/b/p/j/g;Z)V

    :cond_7
    return-void
.end method

.method public a(Lb/b/p/j/m$a;)V
    .registers 2

    .line 19
    iput-object p1, p0, Lb/b/p/j/e;->o:Lb/b/p/j/m$a;

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 18
    iget-object p1, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    if-eqz p1, :cond_7

    invoke-virtual {p1}, Lb/b/p/j/e$a;->notifyDataSetChanged()V

    :cond_7
    return-void
.end method

.method public a(Lb/b/p/j/g;Lb/b/p/j/i;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public a(Lb/b/p/j/r;)Z
    .registers 4

    .line 20
    invoke-virtual {p1}, Lb/b/p/j/g;->hasVisibleItems()Z

    move-result v0

    if-nez v0, :cond_8

    const/4 p1, 0x0

    return p1

    .line 21
    :cond_8
    new-instance v0, Lb/b/p/j/h;

    invoke-direct {v0, p1}, Lb/b/p/j/h;-><init>(Lb/b/p/j/g;)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lb/b/p/j/h;->a(Landroid/os/IBinder;)V

    .line 22
    iget-object v0, p0, Lb/b/p/j/e;->o:Lb/b/p/j/m$a;

    if-eqz v0, :cond_18

    .line 23
    invoke-interface {v0, p1}, Lb/b/p/j/m$a;->a(Lb/b/p/j/g;)Z

    :cond_18
    const/4 p1, 0x1

    return p1
.end method

.method public b()Landroid/widget/ListAdapter;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    if-nez v0, :cond_b

    .line 2
    new-instance v0, Lb/b/p/j/e$a;

    invoke-direct {v0, p0}, Lb/b/p/j/e$a;-><init>(Lb/b/p/j/e;)V

    iput-object v0, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    .line 3
    :cond_b
    iget-object v0, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    return-object v0
.end method

.method public b(Landroid/os/Bundle;)V
    .registers 4

    .line 4
    new-instance v0, Landroid/util/SparseArray;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 5
    iget-object v1, p0, Lb/b/p/j/e;->k:Landroidx/appcompat/view/menu/ExpandedMenuView;

    if-eqz v1, :cond_c

    .line 6
    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    :cond_c
    const-string v1, "android:menu:list"

    .line 7
    invoke-virtual {p1, v1, v0}, Landroid/os/Bundle;->putSparseParcelableArray(Ljava/lang/String;Landroid/util/SparseArray;)V

    return-void
.end method

.method public b(Lb/b/p/j/g;Lb/b/p/j/i;)Z
    .registers 3

    const/4 p1, 0x0

    return p1
.end method

.method public c()Z
    .registers 2

    const/4 v0, 0x0

    return v0
.end method

.method public d()Landroid/os/Parcelable;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/e;->k:Landroidx/appcompat/view/menu/ExpandedMenuView;

    if-nez v0, :cond_6

    const/4 v0, 0x0

    return-object v0

    .line 2
    :cond_6
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 3
    invoke-virtual {p0, v0}, Lb/b/p/j/e;->b(Landroid/os/Bundle;)V

    return-object v0
.end method

.method public onItemClick(Landroid/widget/AdapterView;Landroid/view/View;IJ)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/widget/AdapterView<",
            "*>;",
            "Landroid/view/View;",
            "IJ)V"
        }
    .end annotation

    .line 1
    iget-object p1, p0, Lb/b/p/j/e;->j:Lb/b/p/j/g;

    iget-object p2, p0, Lb/b/p/j/e;->p:Lb/b/p/j/e$a;

    invoke-virtual {p2, p3}, Lb/b/p/j/e$a;->getItem(I)Lb/b/p/j/i;

    move-result-object p2

    const/4 p3, 0x0

    invoke-virtual {p1, p2, p0, p3}, Lb/b/p/j/g;->a(Landroid/view/MenuItem;Lb/b/p/j/m;I)Z

    return-void
.end method
