.class public Lb/b/p/j/f;
.super Landroid/widget/BaseAdapter;
.source "MenuAdapter.java"


# instance fields
.field public h:Lb/b/p/j/g;

.field public i:I

.field public j:Z

.field public final k:Z

.field public final l:Landroid/view/LayoutInflater;

.field public final m:I


# direct methods
.method public constructor <init>(Lb/b/p/j/g;Landroid/view/LayoutInflater;ZI)V
    .registers 6

    .line 1
    invoke-direct {p0}, Landroid/widget/BaseAdapter;-><init>()V

    const/4 v0, -0x1

    .line 2
    iput v0, p0, Lb/b/p/j/f;->i:I

    .line 3
    iput-boolean p3, p0, Lb/b/p/j/f;->k:Z

    .line 4
    iput-object p2, p0, Lb/b/p/j/f;->l:Landroid/view/LayoutInflater;

    .line 5
    iput-object p1, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    .line 6
    iput p4, p0, Lb/b/p/j/f;->m:I

    .line 7
    invoke-virtual {p0}, Lb/b/p/j/f;->a()V

    return-void
.end method


# virtual methods
.method public a()V
    .registers 6

    .line 2
    iget-object v0, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->f()Lb/b/p/j/i;

    move-result-object v0

    if-eqz v0, :cond_23

    .line 3
    iget-object v1, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    invoke-virtual {v1}, Lb/b/p/j/g;->j()Ljava/util/ArrayList;

    move-result-object v1

    .line 4
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_13
    if-ge v3, v2, :cond_23

    .line 5
    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lb/b/p/j/i;

    if-ne v4, v0, :cond_20

    .line 6
    iput v3, p0, Lb/b/p/j/f;->i:I

    return-void

    :cond_20
    add-int/lit8 v3, v3, 0x1

    goto :goto_13

    :cond_23
    const/4 v0, -0x1

    .line 7
    iput v0, p0, Lb/b/p/j/f;->i:I

    return-void
.end method

.method public a(Z)V
    .registers 2

    .line 1
    iput-boolean p1, p0, Lb/b/p/j/f;->j:Z

    return-void
.end method

.method public b()Lb/b/p/j/g;
    .registers 2

    .line 1
    iget-object v0, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    return-object v0
.end method

.method public getCount()I
    .registers 3

    .line 1
    iget-boolean v0, p0, Lb/b/p/j/f;->k:Z

    if-eqz v0, :cond_b

    .line 2
    iget-object v0, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->j()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_11

    :cond_b
    iget-object v0, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v0

    .line 3
    :goto_11
    iget v1, p0, Lb/b/p/j/f;->i:I

    if-gez v1, :cond_1a

    .line 4
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    return v0

    .line 5
    :cond_1a
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public getItem(I)Lb/b/p/j/i;
    .registers 4

    .line 2
    iget-boolean v0, p0, Lb/b/p/j/f;->k:Z

    if-eqz v0, :cond_b

    .line 3
    iget-object v0, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->j()Ljava/util/ArrayList;

    move-result-object v0

    goto :goto_11

    :cond_b
    iget-object v0, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    invoke-virtual {v0}, Lb/b/p/j/g;->n()Ljava/util/ArrayList;

    move-result-object v0

    .line 4
    :goto_11
    iget v1, p0, Lb/b/p/j/f;->i:I

    if-ltz v1, :cond_19

    if-lt p1, v1, :cond_19

    add-int/lit8 p1, p1, 0x1

    .line 5
    :cond_19
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lb/b/p/j/i;

    return-object p1
.end method

.method public bridge synthetic getItem(I)Ljava/lang/Object;
    .registers 2

    .line 1
    invoke-virtual {p0, p1}, Lb/b/p/j/f;->getItem(I)Lb/b/p/j/i;

    move-result-object p1

    return-object p1
.end method

.method public getItemId(I)J
    .registers 4

    int-to-long v0, p1

    return-wide v0
.end method

.method public getView(ILandroid/view/View;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 9

    const/4 v0, 0x0

    if-nez p2, :cond_b

    .line 1
    iget-object p2, p0, Lb/b/p/j/f;->l:Landroid/view/LayoutInflater;

    iget v1, p0, Lb/b/p/j/f;->m:I

    invoke-virtual {p2, v1, p3, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p2

    .line 2
    :cond_b
    invoke-virtual {p0, p1}, Lb/b/p/j/f;->getItem(I)Lb/b/p/j/i;

    move-result-object p3

    invoke-virtual {p3}, Lb/b/p/j/i;->getGroupId()I

    move-result p3

    add-int/lit8 v1, p1, -0x1

    if-ltz v1, :cond_20

    .line 3
    invoke-virtual {p0, v1}, Lb/b/p/j/f;->getItem(I)Lb/b/p/j/i;

    move-result-object v1

    invoke-virtual {v1}, Lb/b/p/j/i;->getGroupId()I

    move-result v1

    goto :goto_21

    :cond_20
    move v1, p3

    .line 4
    :goto_21
    move-object v2, p2

    check-cast v2, Landroidx/appcompat/view/menu/ListMenuItemView;

    iget-object v3, p0, Lb/b/p/j/f;->h:Lb/b/p/j/g;

    .line 5
    invoke-virtual {v3}, Lb/b/p/j/g;->o()Z

    move-result v3

    const/4 v4, 0x1

    if-eqz v3, :cond_31

    if-eq p3, v1, :cond_31

    const/4 p3, 0x1

    goto :goto_32

    :cond_31
    const/4 p3, 0x0

    :goto_32
    invoke-virtual {v2, p3}, Landroidx/appcompat/view/menu/ListMenuItemView;->setGroupDividerEnabled(Z)V

    .line 6
    move-object p3, p2

    check-cast p3, Lb/b/p/j/n$a;

    .line 7
    iget-boolean v1, p0, Lb/b/p/j/f;->j:Z

    if-eqz v1, :cond_3f

    .line 8
    invoke-virtual {v2, v4}, Landroidx/appcompat/view/menu/ListMenuItemView;->setForceShowIcon(Z)V

    .line 9
    :cond_3f
    invoke-virtual {p0, p1}, Lb/b/p/j/f;->getItem(I)Lb/b/p/j/i;

    move-result-object p1

    invoke-interface {p3, p1, v0}, Lb/b/p/j/n$a;->a(Lb/b/p/j/i;I)V

    return-object p2
.end method

.method public notifyDataSetChanged()V
    .registers 1

    .line 1
    invoke-virtual {p0}, Lb/b/p/j/f;->a()V

    .line 2
    invoke-super {p0}, Landroid/widget/BaseAdapter;->notifyDataSetChanged()V

    return-void
.end method
